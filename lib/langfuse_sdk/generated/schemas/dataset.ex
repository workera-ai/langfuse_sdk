defmodule LangfuseSdk.Generated.Dataset do
  @moduledoc """
  Provides struct and type for a Dataset
  """

  @type t :: %__MODULE__{
          created_at: DateTime.t(),
          description: String.t() | nil,
          id: String.t(),
          metadata: map | nil,
          name: String.t(),
          project_id: String.t(),
          updated_at: DateTime.t()
        }

  defstruct [:created_at, :description, :id, :metadata, :name, :project_id, :updated_at]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      created_at: {:string, :date_time},
      description: {:string, :generic},
      id: {:string, :generic},
      metadata: :map,
      name: {:string, :generic},
      project_id: {:string, :generic},
      updated_at: {:string, :date_time}
    ]
  end
end
