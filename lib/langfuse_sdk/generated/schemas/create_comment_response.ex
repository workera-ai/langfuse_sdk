defmodule LangfuseSdk.Generated.CreateCommentResponse do
  @moduledoc """
  Provides struct and type for a CreateCommentResponse
  """

  @type t :: %__MODULE__{id: String.t()}

  defstruct [:id]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [id: {:string, :generic}]
  end
end
