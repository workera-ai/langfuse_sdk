defmodule LangfuseSdk.Support.Client do
  @moduledoc """
  This module is not automatically generate!!!
  This module contains request client used by the generated operations.
  """

  alias LangfuseSdk.Support.Translator

  @config Application.compile_env(:oapi_generator, :langfuse) |> Map.new()

  def request(opts) do
    endpoint = @config.endpoint
    url = build_url(endpoint, opts.url)

    # Add Basic Auth header
    headers = [{"Authorization", basic_auth_header()}, {"Content-Type", "application/json"}]

    # Ensure the body is encoded as JSON
    json_body = Jason.encode!(opts.body)

    # Build and send the request with headers and JSON body
    req = Req.new(url: url, method: opts.method, headers: headers, body: json_body)

    res = Req.request(req)

    case res do
      {:ok, %{status: status, body: nil}} when status < 300 ->
        {:error, {status, nil}}

      {:ok, %{status: status, body: body}} when status < 300 ->
        {:ok, Translator.translate(status, opts.response, body)}

      {:ok, %{status: status, body: body}} ->
        {:error, {status, Map.fetch!(body, "message")}}

      {:error, %{reason: reason}} ->
        {:error, reason}
    end
  end

  # Helper function to build the URL
  defp build_url(endpoint, path) do
    endpoint
    |> URI.parse()
    |> Map.put(:path, path)
    |> to_string()
  end

  # Helper function to generate the Basic Auth header
  defp basic_auth_header() do
    username = @config.username
    password = @config.password
    encoded = Base.encode64("#{username}:#{password}")
    "Basic " <> encoded
  end
end
