defmodule LangfuseSdk.Tracer.Event do
  @moduledoc """
  This module contains functions to handle events:
  https://langfuse.com/docs/sdk/typescript/guide#event
  """

  alias __MODULE__
  alias LangfuseSdk.Support.Value

  defstruct [
    :id,
    :start_time,
    :name,
    :metadata,
    :level,
    :status_message,
    :input,
    :output,
    :version,
    :timestamp,
    :trace_id,
    :parent_observation_id
  ]

  def new(opts \\ []) do
    Event
    |> struct!(opts)
    |> Value.force_new(:id, UUID.uuid4())
    |> Value.force_new(:timestamp, DateTime.utc_now())
  end
end
