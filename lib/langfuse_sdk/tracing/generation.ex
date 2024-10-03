defmodule LangfuseSdk.Tracing.Generation do
  @moduledoc """
  This module contains functions to handle generations:
  https://langfuse.com/docs/sdk/typescript/guide#generation
  """

  alias __MODULE__
  alias LangfuseSdk.Support.Value

  defstruct [
    :id,
    :name,
    :start_time,
    :completion_start_time,
    :end_time,
    :model,
    :model_parameters,
    :input,
    :output,
    :usage,
    :metadata,
    :level,
    :status_message,
    :version,
    :prompt,
    :timestamp,
    :trace_id,
    :parent_observation_id
  ]

  def new(opts \\ []) do
    Generation
    |> struct!(opts)
    |> Value.force_new(:id, UUID.uuid4())
    |> Value.force_new(:timestamp, DateTime.utc_now())
  end
end
