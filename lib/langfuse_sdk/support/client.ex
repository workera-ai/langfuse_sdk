defmodule LangfuseSdk.Support.Client do
  @moduledoc """
  This module is not automatically generate!!!
  This module contains request client used by the generated operations.
  """

  alias LangfuseSdk.Support.Auth
  alias LangfuseSdk.Support.Translator

  def request(opts) do
    case execute_request(opts) do
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

  defp execute_request(%{method: :get} = opts) do
    endpoint = build_endpoint(opts.url)

    [
      url: endpoint,
      params: Map.get(opts, :query, [])
    ]
    |> Req.new()
    |> Auth.put_auth_headers()
    |> Req.get()
  end

  defp execute_request(%{method: :post} = opts) do
    endpoint = build_endpoint(opts.url)

    [
      url: endpoint,
      body: encode_body(opts[:body])
    ]
    |> Req.new()
    |> Auth.put_auth_headers()
    |> Req.post()
  end

  # Helper function to build the URL
  defp build_endpoint(path) do
    host = Application.fetch_env!(:langfuse_sdk, :host)

    host
    |> URI.parse()
    |> Map.put(:path, path)
    |> to_string()
  end

  # Ensure the body is encoded as JSON
  defp encode_body(nil), do: nil
  defp encode_body(body), do: Jason.encode!(body)
end
