defmodule LangfuseSdk.Tracing.Score do
  @moduledoc """
  This module contains functions to handle scores:
  https://langfuse.com/docs/sdk/typescript/guide#score
  """

  alias __MODULE__
  alias LangfuseSdk.Support.Value

  defstruct [
    :id,
    :name,
    :value,
    :comment,
    :metadata,
    :timestamp,
    :trace_id,
    :observation_id,
    :data_type,
    :config_id
  ]

  def new(opts \\ []) do
    Score
    |> struct!(opts)
    |> Value.force_new(:id, UUID.uuid4())
    |> Value.force_new(:timestamp, DateTime.utc_now())
  end
end
