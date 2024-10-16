defmodule LangfuseSdk.Generated.DatasetRun do
  @moduledoc """
  Provides struct and type for a DatasetRun
  """

  @type t :: %__MODULE__{
          created_at: DateTime.t(),
          dataset_id: String.t(),
          dataset_name: String.t(),
          description: String.t() | nil,
          id: String.t(),
          metadata: map | nil,
          name: String.t(),
          updated_at: DateTime.t()
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
