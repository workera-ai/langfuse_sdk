defmodule LangfuseSdk.Generated.GetScoresResponseTraceData do
  @moduledoc """
  Provides struct and type for a GetScoresResponseTraceData
  """

  @type t :: %__MODULE__{
          environment: String.t() | nil,
          tags: [String.t()] | nil,
          user_id: String.t() | nil
        }

  defstruct [:environment, :tags, :user_id]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [environment: {:string, :generic}, tags: [string: :generic], user_id: {:string, :generic}]
  end
end
