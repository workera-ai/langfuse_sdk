defmodule LangfuseSdk.Generated.SDKLogBody do
  @moduledoc """
  Provides struct and type for a SDKLogBody
  """

  @type t :: %__MODULE__{log: map}

  defstruct [:log]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [log: :map]
  end
end
