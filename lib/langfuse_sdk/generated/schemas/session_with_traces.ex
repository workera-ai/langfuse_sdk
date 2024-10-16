defmodule LangfuseSdk.Generated.SessionWithTraces do
  @moduledoc """
  Provides struct and type for a SessionWithTraces
  """

  @type t :: %__MODULE__{
          created_at: DateTime.t() | nil,
          id: String.t() | nil,
          project_id: String.t() | nil
        }

  defstruct [:created_at, :id, :project_id]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [created_at: {:string, :date_time}, id: {:string, :generic}, project_id: {:string, :generic}]
  end
end
