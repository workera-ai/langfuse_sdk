defmodule LangfuseSdk.Generated.DatasetItem do
  @moduledoc """
  Provides struct and type for a DatasetItem
  """

  @type t :: %__MODULE__{
          createdAt: DateTime.t(),
          datasetId: String.t(),
          datasetName: String.t(),
          expectedOutput: map | nil,
          id: String.t(),
          input: map | nil,
          metadata: map | nil,
          sourceObservationId: String.t() | nil,
          sourceTraceId: String.t() | nil,
          status: String.t(),
          updatedAt: DateTime.t()
        }

  defstruct [
    :createdAt,
    :datasetId,
    :datasetName,
    :expectedOutput,
    :id,
    :input,
    :metadata,
    :sourceObservationId,
    :sourceTraceId,
    :status,
    :updatedAt
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      createdAt: {:string, :date_time},
      datasetId: {:string, :generic},
      datasetName: {:string, :generic},
      expectedOutput: :map,
      id: {:string, :generic},
      input: :map,
      metadata: :map,
      sourceObservationId: {:string, :generic},
      sourceTraceId: {:string, :generic},
      status: {:enum, ["ACTIVE", "ARCHIVED"]},
      updatedAt: {:string, :date_time}
    ]
  end
end
