defmodule LangfuseSdk.Support.Translator do
  @moduledoc """
  This module's purpose is to automatically translate each response type from the generated API.
  It exposes a single function called `translate` that receives the type and the value to parse.
  """

  def translate(nil, body), do: body
  def translate(:map, body), do: body
  def translate({:string, :generic}, body), do: body
  def translate(:boolean, body), do: body
  def translate(:integer, body) when is_binary(body), do: String.to_integer(body)
  def translate(:integer, body), do: body
  def translate({:string, :date_time}, body), do: NaiveDateTime.from_iso8601!(body)

  def translate({LangfuseSdk.Generated.TraceWithFullDetails, :t}, body) do
    body
  end

  # Explicitly match on `:t` so we can make easly distringuish between raw values
  # and modules / structs. This is mainly necessary to safely call `__fields__/1`.
  def translate({module, :t}, body) do
    fields = module.__fields__(:t)

    translated =
      Map.new(fields, fn
        {field, {module, type}} ->
          item = body[to_string(field)]
          translated = translate({module, type}, item)
          {field, translated}

        {field, [{module, type}]} ->
          items = body[to_string(field)]
          translated = Enum.map(items, &translate({module, type}, &1))
          {field, translated}

        {field, type} ->
          item = body[to_string(field)]
          translated = translate(type, item)
          {field, translated}
      end)

    struct!(module, translated)
  end

  def translate(type, _body), do: raise("Response translation not implemented: #{inspect(type)}")
end
