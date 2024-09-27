defmodule LangfuseSdk.Tracer.Span do
  @moduledoc """
  This module contains functions to handle spans:
  https://langfuse.com/docs/sdk/typescript/guide#span
  """

  alias __MODULE__
  alias LangfuseSdk.Support.Value

  defstruct [
    :id,
    :start_time,
    :end_time,
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
    Span
    |> struct!(opts)
    |> Value.force_new(:id, UUID.uuid4())
    |> Value.force_new(:timestamp, DateTime.utc_now())
  end
end
