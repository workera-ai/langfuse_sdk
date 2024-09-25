defmodule LangfuseSdk.Generated.Dataset do
  @moduledoc """
  Provides struct and type for a Dataset
  """

  @type t :: %__MODULE__{
          createdAt: DateTime.t(),
          description: String.t() | nil,
          id: String.t(),
          metadata: map | nil,
          name: String.t(),
          projectId: String.t(),
          updatedAt: DateTime.t()
        }

  defstruct [:createdAt, :description, :id, :metadata, :name, :projectId, :updatedAt]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      createdAt: {:string, :date_time},
      description: {:string, :generic},
      id: {:string, :generic},
      metadata: :map,
      name: {:string, :generic},
      projectId: {:string, :generic},
      updatedAt: {:string, :date_time}
    ]
  end
end
