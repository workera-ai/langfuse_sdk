defmodule LangfuseSdk.Generated.Session do
  @moduledoc """
  Provides struct and type for a Session
  """

  @type t :: %__MODULE__{createdAt: DateTime.t(), id: String.t(), projectId: String.t()}

  defstruct [:createdAt, :id, :projectId]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [createdAt: {:string, :date_time}, id: {:string, :generic}, projectId: {:string, :generic}]
  end
end
