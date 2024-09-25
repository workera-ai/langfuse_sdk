defmodule LangfuseSdk.Generated.CreateDatasetItemRequest do
  @moduledoc """
  Provides struct and type for a CreateDatasetItemRequest
  """

  @type t :: %__MODULE__{
          datasetName: String.t(),
          expectedOutput: map | nil,
          id: String.t() | nil,
          input: map | nil,
          metadata: map | nil,
          sourceObservationId: String.t() | nil,
          sourceTraceId: String.t() | nil,
          status: String.t() | nil
        }

  defstruct [
    :datasetName,
    :expectedOutput,
    :id,
    :input,
    :metadata,
    :sourceObservationId,
    :sourceTraceId,
    :status
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      datasetName: {:string, :generic},
      expectedOutput: :map,
      id: {:string, :generic},
      input: :map,
      metadata: :map,
      sourceObservationId: {:string, :generic},
      sourceTraceId: {:string, :generic},
      status: {:enum, ["ACTIVE", "ARCHIVED"]}
    ]
  end
end
