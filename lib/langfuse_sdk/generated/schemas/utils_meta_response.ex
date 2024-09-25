defmodule LangfuseSdk.Generated.UtilsMetaResponse do
  @moduledoc """
  Provides struct and type for a UtilsMetaResponse
  """

  @type t :: %__MODULE__{limit: integer, page: integer, totalItems: integer, totalPages: integer}

  defstruct [:limit, :page, :totalItems, :totalPages]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [limit: :integer, page: :integer, totalItems: :integer, totalPages: :integer]
  end
end
