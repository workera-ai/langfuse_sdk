defmodule LangfuseSdk.Generated.ConfigCategory do
  @moduledoc """
  Provides struct and type for a ConfigCategory
  """

  @type t :: %__MODULE__{label: String.t(), value: number}

  defstruct [:label, :value]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [label: {:string, :generic}, value: :number]
  end
end
