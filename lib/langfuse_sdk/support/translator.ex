defmodule LangfuseSdk.Support.Translator do
  @moduledoc """
  Most of the response translation code is currently hardcoded, but the original library
  has a stack implementation that takes into consideration how to properly parse every response type.
  We might want to take a look at how the client works so we can avoid coupling our implementation with
  the automatically generated code: https://github.com/aj-foster/open-api-github/blob/main/lib/github/client.ex
  """

  def translate(nil, body), do: body

  def translate(:map, body), do: body

  def translate({LangfuseSdk.Generated.HealthResponse, _}, body) do
    %LangfuseSdk.Generated.HealthResponse{status: body["status"], version: body["version"]}
  end

  def translate({LangfuseSdk.Generated.IngestionResponse, _}, body) do
    %LangfuseSdk.Generated.IngestionResponse{
      errors: body["errors"],
      successes: body["successes"]
    }
  end

  def translate(type, _body),
    do: raise("Response translation not implemented: #{inspect(type)}")
end
