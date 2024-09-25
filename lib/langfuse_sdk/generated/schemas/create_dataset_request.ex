defmodule LangfuseSdk.Generated.CreateDatasetRequest do
  @moduledoc """
  Provides struct and type for a CreateDatasetRequest
  """

  @type t :: %__MODULE__{description: String.t() | nil, metadata: map | nil, name: String.t()}

  defstruct [:description, :metadata, :name]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [description: {:string, :generic}, metadata: :map, name: {:string, :generic}]
  end
end
