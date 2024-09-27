defmodule LangfuseSdk.Support.Translator do
  @moduledoc """
  Most of the response translation code is currently hardcoded, but the original library
  has a stack implementation that takes that into consideration how to properly parse
  every response type. We might want to take a look at how the client works so we can
  avoid coupling our implementation with the automatically generated code:
  https://github.com/aj-foster/open-api-github/blob/main/lib/github/client.ex
  """

  def translate(status, types, content) do
    do_translate(Map.fetch!(Map.new(types), status), content)
  end

  defp do_translate(:map, content), do: content

  defp do_translate({LangfuseSdk.Generated.HealthResponse, _}, content) do
    %LangfuseSdk.Generated.HealthResponse{status: content["status"], version: content["version"]}
  end

  defp do_translate({LangfuseSdk.Generated.IngestionResponse, _}, content) do
    %LangfuseSdk.Generated.IngestionResponse{
      errors: content["errors"],
      successes: content["successes"]
    }
  end

  defp do_translate(type, _content),
    do: raise("Response translation not implemented: #{inspect(type)}")
end
