defmodule LangfuseSdk do
  @moduledoc """
  This module provides a set of functions for dealing with the Langfuse API.
  It exposes create and update functions that will correclty map the provided
  struct to the underlyning event format the Langfuse API can ingest.

  ## Examples

      trace = LangfuseSdk.Tracing.Trace.new(%{...})
      {:ok, ^id} = LangfuseSdk.create(trace)

      event = LangfuseSdk.Tracing.Event.new(%{...})
      {:ok, ^id} = LangfuseSdk.create(event)

      span = LangfuseSdk.Tracing.Span.new(%{...})
      {:ok, ^id} = LangfuseSdk.create(span)

      generation = LangfuseSdk.Tracing.Generation.new(%{...})
      {:ok, ^id} = LangfuseSdk.create(generation)

      score = LangfuseSdk.Tracing.Score.new(%{...})
      {:ok, ^id} = LangfuseSdk.create(score)
  """
  require Logger

  def create(%LangfuseSdk.Tracing.Trace{} = trace) do
    trace_event = LangfuseSdk.Ingestor.to_event(trace, :create)
    LangfuseSdk.Ingestor.ingest_payload(trace_event)
  end

  def create(%LangfuseSdk.Tracing.Event{} = event) do
    event_event = LangfuseSdk.Ingestor.to_event(event, :create)
    LangfuseSdk.Ingestor.ingest_payload(event_event)
  end

  def create(%LangfuseSdk.Tracing.Span{} = span) do
    span_event = LangfuseSdk.Ingestor.to_event(span, :create)
    LangfuseSdk.Ingestor.ingest_payload(span_event)
  end

  def create(%LangfuseSdk.Tracing.Generation{} = generation) do
    dbg(generation)

    if is_list(generation.input) do
      images =
        generation.input
        |> Enum.filter(fn message -> is_list(message["content"]) end)
        |> Enum.flat_map(fn message -> message["content"] end)
        |> Enum.filter(fn content -> content["type"] == "image_url" end)
        |> Enum.map(fn content -> content["image_url"]["url"] end)

      dbg(images)

      images
      |> Enum.map(fn image ->
        # Strip the data URL prefix
        image = String.replace(image, ~r/^data:image\/png;base64,/, "")
        checksum = :crypto.hash(:sha256, image) |> Base.encode64()

        request = %LangfuseSdk.Generated.GetMediaUploadUrlRequest{
          trace_id: generation.trace_id,
          field: "input",
          content_type: "image/png",
          content_length: byte_size(image),
          sha2_56_hash: :crypto.hash(:sha256, image) |> Base.encode16()
        }

        url_result =
          LangfuseSdk.Generated.Media.media_get_upload_url(request)

        response =
          case url_result do
            {:ok, response} ->
              response

            {:error, error} ->
              dbg(error)
              nil
          end

        upload_result =
          LangfuseSdk.Support.Client.request(%{
            method: :put,
            url: response.uploadUrl,
            body: image,
            headers: %{
              "Content-Type" => "image/png",
              "x-amz-checksum-sha256" => checksum
            }
          })

        case upload_result do
          {:ok, _ok} -> dbg("Cool")
          {:error, error} -> dbg(error)
        end
      end)
    end

    generation_event = LangfuseSdk.Ingestor.to_event(generation, :create)
    LangfuseSdk.Ingestor.ingest_payload(generation_event)
  end

  def create(%LangfuseSdk.Tracing.Score{} = score) do
    score_event = LangfuseSdk.Ingestor.to_event(score, :create)
    LangfuseSdk.Ingestor.ingest_payload(score_event)
  end

  def create_many(items) do
    items
    |> Enum.map(&LangfuseSdk.Ingestor.to_event(&1, :create))
    |> LangfuseSdk.Ingestor.ingest_payload()
  end

  def update(%LangfuseSdk.Tracing.Span{} = span) do
    span_event = LangfuseSdk.Ingestor.to_event(span, :update)
    LangfuseSdk.Ingestor.ingest_payload(span_event)
  end

  def update(%LangfuseSdk.Tracing.Generation{} = generation) do
    generation_event = LangfuseSdk.Ingestor.to_event(generation, :update)
    LangfuseSdk.Ingestor.ingest_payload(generation_event)
  end

  def update(%LangfuseSdk.Tracing.Score{} = score) do
    score_event = LangfuseSdk.Ingestor.to_event(score, :update)
    LangfuseSdk.Ingestor.ingest_payload(score_event)
  end

  def list_traces(params \\ %{}) do
    # Always cast inbound params while the casing issue is not resolved.
    # See: https://github.com/aj-foster/open-api-generator/issues/73.

    opts = LangfuseSdk.Tracing.Trace.cast_params(params, :list)

    result = LangfuseSdk.Generated.Trace.trace_list(opts)
    with {:ok, body} <- result, do: {:ok, Map.fetch!(body, :data)}
  end

  def get_trace(trace_id) do
    LangfuseSdk.Generated.Trace.trace_get(trace_id)
  end
end
