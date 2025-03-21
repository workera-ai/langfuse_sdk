defmodule LangfuseSdk.Generated.Session do
  @moduledoc """
  Provides struct and type for a Session
  """

  @type t :: %__MODULE__{
          created_at: DateTime.t(),
          environment: String.t() | nil,
          id: String.t(),
          project_id: String.t()
        }

  defstruct [:created_at, :environment, :id, :project_id]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      created_at: {:string, :date_time},
      environment: {:string, :generic},
      id: {:string, :generic},
      project_id: {:string, :generic}
    ]
  end
end
