defmodule LangfuseSdk.Support.Client do
  @moduledoc """
  This module is not automatically generate!!!
  This module contains request client used by the generated operations.
  """

  alias LangfuseSdk.Support.Translator

  def request(opts) do
    # TODO: Get from application env
    endpoint = "http://localhost:4001"

    url = build_url(endpoint, opts.url)
    req = Req.new(url: url, method: opts.method)

    case Req.request(req) do
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

  defp build_url(endpoint, path) do
    endpoint
    |> URI.parse()
    |> Map.put(:path, path)
    |> to_string()
  end
end
