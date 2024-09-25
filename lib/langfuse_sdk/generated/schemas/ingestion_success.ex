defmodule LangfuseSdk.Generated.IngestionSuccess do
  @moduledoc """
  Provides struct and type for a IngestionSuccess
  """

  @type t :: %__MODULE__{id: String.t(), status: integer}

  defstruct [:id, :status]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [id: {:string, :generic}, status: :integer]
  end
end
