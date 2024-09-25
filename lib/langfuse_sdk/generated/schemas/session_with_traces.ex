defmodule LangfuseSdk.Generated.SessionWithTraces do
  @moduledoc """
  Provides struct and type for a SessionWithTraces
  """

  @type t :: %__MODULE__{
          createdAt: DateTime.t() | nil,
          id: String.t() | nil,
          projectId: String.t() | nil
        }

  defstruct [:createdAt, :id, :projectId]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [createdAt: {:string, :date_time}, id: {:string, :generic}, projectId: {:string, :generic}]
  end
end
