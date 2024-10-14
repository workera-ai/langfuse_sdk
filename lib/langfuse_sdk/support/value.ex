defmodule LangfuseSdk.Support.Value do
  @moduledoc false
  def force_new(struct, key, value) do
    Map.update!(struct, key, fn
      nil -> value
      other -> other
    end)
  end
end
