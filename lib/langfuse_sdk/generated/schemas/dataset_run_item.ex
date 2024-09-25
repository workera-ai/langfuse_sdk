defmodule LangfuseSdk.Generated.DatasetRunItem do
  @moduledoc """
  Provides struct and type for a DatasetRunItem
  """

  @type t :: %__MODULE__{
          createdAt: DateTime.t(),
          datasetItemId: String.t(),
          datasetRunId: String.t(),
          datasetRunName: String.t(),
          id: String.t(),
          observationId: String.t() | nil,
          traceId: String.t(),
          updatedAt: DateTime.t()
        }

  defstruct [
    :createdAt,
    :datasetItemId,
    :datasetRunId,
    :datasetRunName,
    :id,
    :observationId,
    :traceId,
    :updatedAt
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      createdAt: {:string, :date_time},
      datasetItemId: {:string, :generic},
      datasetRunId: {:string, :generic},
      datasetRunName: {:string, :generic},
      id: {:string, :generic},
      observationId: {:string, :generic},
      traceId: {:string, :generic},
      updatedAt: {:string, :date_time}
    ]
  end
end
