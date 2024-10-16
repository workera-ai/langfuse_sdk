defmodule LangfuseSdk.Support.Value do
  @moduledoc false

  @doc """
  Forces a new value unless it already exists or its value is `nil`
  """
  def force_new(map, key, value) when is_map(map) do
    Map.update(map, key, value, fn
      nil -> value
      other -> other
    end)
  end

  @doc """
  Cast options used for the low level APIs and leve only non-nil keys.
  """
  def cast_params(params, permitted) do
    params = Enum.into(params, %{})

    key_or_alias = fn
      {key, alias} ->
        {key, params[key] || params[alias]}

      key ->
        {key, params[key]}
    end

    permitted
    |> Enum.map(&key_or_alias.(&1))
    |> Enum.reject(fn {_k, v} -> v == nil end)
    |> Enum.into([])
  end
end
