defmodule LangfuseSdk.Generated.DatasetItem do
  @moduledoc """
  Provides struct and type for a DatasetItem
  """

  @type t :: %__MODULE__{
          created_at: DateTime.t(),
          dataset_id: String.t(),
          dataset_name: String.t(),
          expected_output: map | nil,
          id: String.t(),
          input: map | nil,
          metadata: map | nil,
          source_observation_id: String.t() | nil,
          source_trace_id: String.t() | nil,
          status: String.t(),
          updated_at: DateTime.t()
        }

  defstruct [
    :created_at,
    :dataset_id,
    :dataset_name,
    :expected_output,
    :id,
    :input,
    :metadata,
    :source_observation_id,
    :source_trace_id,
    :status,
    :updated_at
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      created_at: {:string, :date_time},
      dataset_id: {:string, :generic},
      dataset_name: {:string, :generic},
      expected_output: :map,
      id: {:string, :generic},
      input: :map,
      metadata: :map,
      source_observation_id: {:string, :generic},
      source_trace_id: {:string, :generic},
      status: {:enum, ["ACTIVE", "ARCHIVED"]},
      updated_at: {:string, :date_time}
    ]
  end
end
