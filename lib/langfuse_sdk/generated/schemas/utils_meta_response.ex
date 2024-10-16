defmodule LangfuseSdk.Generated.UtilsMetaResponse do
  @moduledoc """
  Provides struct and type for a UtilsMetaResponse
  """

  @type t :: %__MODULE__{
          limit: integer,
          page: integer,
          total_items: integer,
          total_pages: integer
        }

  defstruct [:limit, :page, :total_items, :total_pages]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [limit: :integer, page: :integer, total_items: :integer, total_pages: :integer]
  end
end
