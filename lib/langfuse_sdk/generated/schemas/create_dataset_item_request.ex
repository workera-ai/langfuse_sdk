defmodule LangfuseSdk.Generated.CreateDatasetItemRequest do
  @moduledoc """
  Provides struct and type for a CreateDatasetItemRequest
  """

  @type t :: %__MODULE__{
          dataset_name: String.t(),
          expected_output: map | nil,
          id: String.t() | nil,
          input: map | nil,
          metadata: map | nil,
          source_observation_id: String.t() | nil,
          source_trace_id: String.t() | nil,
          status: String.t() | nil
        }

  defstruct [
    :dataset_name,
    :expected_output,
    :id,
    :input,
    :metadata,
    :source_observation_id,
    :source_trace_id,
    :status
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      dataset_name: {:string, :generic},
      expected_output: :map,
      id: {:string, :generic},
      input: :map,
      metadata: :map,
      source_observation_id: {:string, :generic},
      source_trace_id: {:string, :generic},
      status: {:enum, ["ACTIVE", "ARCHIVED"]}
    ]
  end
end
