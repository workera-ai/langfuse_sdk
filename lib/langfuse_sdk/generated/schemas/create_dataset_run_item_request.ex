defmodule LangfuseSdk.Generated.CreateDatasetRunItemRequest do
  @moduledoc """
  Provides struct and type for a CreateDatasetRunItemRequest
  """

  @type t :: %__MODULE__{
          datasetItemId: String.t(),
          metadata: map | nil,
          observationId: String.t() | nil,
          runDescription: String.t() | nil,
          runName: String.t(),
          traceId: String.t() | nil
        }

  defstruct [:datasetItemId, :metadata, :observationId, :runDescription, :runName, :traceId]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      datasetItemId: {:string, :generic},
      metadata: :map,
      observationId: {:string, :generic},
      runDescription: {:string, :generic},
      runName: {:string, :generic},
      traceId: {:string, :generic}
    ]
  end
end
