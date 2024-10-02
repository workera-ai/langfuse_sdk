defmodule LangfuseSdk.Tracer.Score do
  @moduledoc """
  This module contains functions to handle scores:
  https://langfuse.com/docs/sdk/typescript/guide#score
  """

  alias __MODULE__
  alias LangfuseSdk.Tracer.Trace

  defstruct [
    :name,
    :value,
    :comment,
    :trace_id,
    :observation_id
  ]

  def new(%Trace{} = trace, name, value, opts \\ []) do
    Score
    |> struct!(opts)
    |> Map.put(:name, name)
    |> Map.put(:value, value)
    |> Map.put(:trace_id, trace.id)
  end
end
