defmodule LangfuseSdk.Generated.DatasetRunWithItems do
  @moduledoc """
  Provides struct and type for a DatasetRunWithItems
  """

  @type t :: %__MODULE__{
          createdAt: DateTime.t() | nil,
          datasetId: String.t() | nil,
          datasetName: String.t() | nil,
          description: String.t() | nil,
          id: String.t() | nil,
          metadata: map | nil,
          name: String.t() | nil,
          updatedAt: DateTime.t() | nil
        }

  defstruct [
    :createdAt,
    :datasetId,
    :datasetName,
    :description,
    :id,
    :metadata,
    :name,
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
      description: {:string, :generic},
      id: {:string, :generic},
      metadata: :map,
      name: {:string, :generic},
      updatedAt: {:string, :date_time}
    ]
  end
end
