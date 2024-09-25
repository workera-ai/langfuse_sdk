defmodule LangfuseSdk.Generated.IngestionError do
  @moduledoc """
  Provides struct and type for a IngestionError
  """

  @type t :: %__MODULE__{
          error: map | nil,
          id: String.t(),
          message: String.t() | nil,
          status: integer
        }

  defstruct [:error, :id, :message, :status]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [error: :map, id: {:string, :generic}, message: {:string, :generic}, status: :integer]
  end
end
