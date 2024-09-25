defmodule LangfuseSdk.Generated.Usage do
  @moduledoc """
  Provides struct and type for a Usage
  """

  @type t :: %__MODULE__{
          input: integer | nil,
          inputCost: number | nil,
          output: integer | nil,
          outputCost: number | nil,
          total: integer | nil,
          totalCost: number | nil,
          unit: String.t() | nil
        }

  defstruct [:input, :inputCost, :output, :outputCost, :total, :totalCost, :unit]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      input: :integer,
      inputCost: :number,
      output: :integer,
      outputCost: :number,
      total: :integer,
      totalCost: :number,
      unit: {:enum, ["CHARACTERS", "TOKENS", "MILLISECONDS", "SECONDS", "IMAGES", "REQUESTS"]}
    ]
  end
end
