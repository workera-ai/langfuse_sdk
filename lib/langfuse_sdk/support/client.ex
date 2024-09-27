defmodule LangfuseSdk.Support.Client do
  @moduledoc """
  This module is not automatically generate!!!
  This module contains request client used by the generated operations.
  """

  @host Application.compile_env!(:langfuse_sdk, :host)

  alias LangfuseSdk.Support.Translator
  alias LangfuseSdk.Support.Auth

  def request(opts) do
    endpoint = build_endpoint(@host, opts.url)

    req_opts = [
      url: endpoint,
      method: opts.method,
      body: encode_body(opts[:body])
    ]

    case execute_request(req_opts) do
      {:ok, %{status: status, body: nil}} when status < 300 ->
        {:error, nil}

      {:ok, %{status: status, body: body}} when status < 300 ->
        lookup = Map.new(opts.response)
        result_type = Map.get(lookup, status)
        {:ok, Translator.translate(result_type, body)}

      {:ok, %{body: body}} ->
        {:error, Map.fetch!(body, "message")}

      {:error, %{reason: reason}} ->
        {:error, reason}
    end
  end

  # Ensure the body is encoded as JSON
  defp encode_body(nil), do: nil
  defp encode_body(body), do: Jason.encode!(body)

  defp execute_request(req_opts) do
    req_opts
    |> Req.new()
    |> Auth.put_auth_headers()
    |> Req.request()
  end

  # Helper function to build the URL
  defp build_endpoint(host, path) do
    host
    |> URI.parse()
    |> Map.put(:path, path)
    |> to_string()
  end
end
