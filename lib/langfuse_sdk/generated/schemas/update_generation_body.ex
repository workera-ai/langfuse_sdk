defmodule LangfuseSdk.Generated.UpdateGenerationBody do
  @moduledoc """
  Provides struct and type for a UpdateGenerationBody
  """

  @type t :: %__MODULE__{endTime: DateTime.t() | nil}

  defstruct [:endTime]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [endTime: {:string, :date_time}]
  end
end
