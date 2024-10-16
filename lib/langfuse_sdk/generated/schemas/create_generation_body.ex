defmodule LangfuseSdk.Generated.CreateGenerationBody do
  @moduledoc """
  Provides struct and type for a CreateGenerationBody
  """

  @type t :: %__MODULE__{end_time: DateTime.t() | nil}

  defstruct [:end_time]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [end_time: {:string, :date_time}]
  end
end
