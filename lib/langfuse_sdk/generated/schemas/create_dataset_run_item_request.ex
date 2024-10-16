defmodule LangfuseSdk.Generated.CreateDatasetRunItemRequest do
  @moduledoc """
  Provides struct and type for a CreateDatasetRunItemRequest
  """

  @type t :: %__MODULE__{
          dataset_item_id: String.t(),
          metadata: map | nil,
          observation_id: String.t() | nil,
          run_description: String.t() | nil,
          run_name: String.t(),
          trace_id: String.t() | nil
        }

  defstruct [:dataset_item_id, :metadata, :observation_id, :run_description, :run_name, :trace_id]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      dataset_item_id: {:string, :generic},
      metadata: :map,
      observation_id: {:string, :generic},
      run_description: {:string, :generic},
      run_name: {:string, :generic},
      trace_id: {:string, :generic}
    ]
  end
end
