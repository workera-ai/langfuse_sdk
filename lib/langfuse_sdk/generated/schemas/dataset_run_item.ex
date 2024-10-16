defmodule LangfuseSdk.Generated.DatasetRunItem do
  @moduledoc """
  Provides struct and type for a DatasetRunItem
  """

  @type t :: %__MODULE__{
          created_at: DateTime.t(),
          dataset_item_id: String.t(),
          dataset_run_id: String.t(),
          dataset_run_name: String.t(),
          id: String.t(),
          observation_id: String.t() | nil,
          trace_id: String.t(),
          updated_at: DateTime.t()
        }

  defstruct [
    :created_at,
    :dataset_item_id,
    :dataset_run_id,
    :dataset_run_name,
    :id,
    :observation_id,
    :trace_id,
    :updated_at
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      created_at: {:string, :date_time},
      dataset_item_id: {:string, :generic},
      dataset_run_id: {:string, :generic},
      dataset_run_name: {:string, :generic},
      id: {:string, :generic},
      observation_id: {:string, :generic},
      trace_id: {:string, :generic},
      updated_at: {:string, :date_time}
    ]
  end
end
