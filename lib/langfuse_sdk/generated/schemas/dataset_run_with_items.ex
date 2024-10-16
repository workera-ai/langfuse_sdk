defmodule LangfuseSdk.Generated.DatasetRunWithItems do
  @moduledoc """
  Provides struct and type for a DatasetRunWithItems
  """

  @type t :: %__MODULE__{
          created_at: DateTime.t() | nil,
          dataset_id: String.t() | nil,
          dataset_name: String.t() | nil,
          description: String.t() | nil,
          id: String.t() | nil,
          metadata: map | nil,
          name: String.t() | nil,
          updated_at: DateTime.t() | nil
        }

  defstruct [
    :created_at,
    :dataset_id,
    :dataset_name,
    :description,
    :id,
    :metadata,
    :name,
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
      description: {:string, :generic},
      id: {:string, :generic},
      metadata: :map,
      name: {:string, :generic},
      updated_at: {:string, :date_time}
    ]
  end
end
