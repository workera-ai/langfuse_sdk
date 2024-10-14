defmodule LangfuseSdk.Tracing.Trace do
  @moduledoc """
  This module contains functions to handle traces:
  https://langfuse.com/docs/sdk/typescript/guide#trace
  """

  alias __MODULE__
  alias LangfuseSdk.Support.Value

  defstruct [
    :id,
    :name,
    :input,
    :output,
    :metadata,
    :user_id,
    :version,
    :timestamp,
    :tags,
    :public,
    :session_id,
    :parent_observation_id
  ]

  def new(opts \\ []) do
    Trace
    |> struct!(opts)
    |> Value.force_new(:id, UUID.uuid4())
    |> Value.force_new(:timestamp, DateTime.utc_now())
    |> Value.force_new(:public, false)
  end
end