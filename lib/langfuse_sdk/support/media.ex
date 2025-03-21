defmodule LangfuseSdk.Support.Media do
  require Logger

  def replace_image_urls(generation) do
    generation_map = Map.from_struct(generation)

    generation_map
    |> maybe_process(:input)
    |> maybe_process(:output)
    |> LangfuseSdk.Tracing.Generation.new()
  end

  defp maybe_process(generation_map, key) do
    case generation_map[key] do
      content when is_list(content) ->
        update_in(generation_map, [key], &process_content_list(&1, generation_map, key))

      _ ->
        generation_map
    end
  end

  defp process_content_list(content_list, generation_map, key) do
    Enum.map(content_list, &process_content_item(&1, generation_map, key))
  end

  defp process_content_item(%{"content" => content} = content_item, generation_map, key)
       when is_list(content) do
    update_in(content_item, ["content"], &process_content_entries(&1, generation_map, key))
  end

  defp process_content_item(content_item, _generation_map, _key), do: content_item

  defp process_content_entries(content_entries, generation_map, key) do
    Enum.map(content_entries, &process_entry(&1, generation_map, key))
  end

  defp process_entry(
         %{"type" => "image_url", "image_url" => %{"url" => url}} = entry,
         generation_map,
         key
       ) do
    decode_info = decode_info(url)

    media_token =
      get_media_token(
        generation_map.trace_id,
        generation_map.id,
        Atom.to_string(key),
        decode_info
      )

    put_in(entry, ["image_url", "url"], media_token)
  end

  defp process_entry(entry, _generation_map, _key), do: entry

  defp decode_info(data_uri) do
    [metadata_str, base64_str] = String.split(data_uri, ",", parts: 2)

    content_type =
      metadata_str
      |> String.replace_prefix("data:", "")
      |> String.replace_suffix(";base64", "")

    clean_base64 =
      base64_str
      |> String.trim()
      |> String.replace(~r/\s/, "")

    image_bytes = Base.decode64!(clean_base64)
    content_length = byte_size(image_bytes)

    sha256_digest = :crypto.hash(:sha256, image_bytes)
    sha256_b64 = Base.encode64(sha256_digest)

    %{
      content_type: content_type,
      content_length: content_length,
      sha2_56_hash: sha256_b64,
      image_bytes: image_bytes
    }
  end

  defp get_media_token(trace_id, observation_id, field, metadata) do
    request = %{
      "contentLength" => metadata.content_length,
      "contentType" => metadata.content_type,
      "field" => field,
      "observationId" => observation_id,
      "sha256Hash" => metadata.sha2_56_hash,
      "traceId" => trace_id
    }

    {_res, response} = LangfuseSdk.Generated.Media.media_get_upload_url(request)
    Logger.info("Got upload URL: #{inspect(response)}")

    if response["uploadUrl"] == nil do
      "@@@langfuseMedia:type=#{metadata.content_type}|id=#{response["mediaId"]}|source=base64_data_uri@@@"
    else
      {_res, aws_response} =
        [
          url: response["uploadUrl"],
          body: metadata.image_bytes,
          retry: :transient,
          headers: %{
            "Content-Type" => metadata.content_type,
            "x-amz-checksum-sha256" => metadata.sha2_56_hash
          }
        ]
        |> Req.new()
        |> Req.put()

      Logger.info("Uploaded image: #{inspect(aws_response)}")

      media_patch_request =
        LangfuseSdk.Generated.Media.media_patch(response["mediaId"], %{
          "uploadedAt" =>
            DateTime.utc_now()
            |> DateTime.to_iso8601(),
          "uploadHttpStatus" => 200,
          "uploadHttpError" => nil,
          "uploadTimeMs" => nil
        })

      Logger.info("Patched media: #{inspect(media_patch_request)}")

      "@@@langfuseMedia:type=#{metadata.content_type}|id=#{response["mediaId"]}|source=base64_data_uri@@@"
    end
  end
end
