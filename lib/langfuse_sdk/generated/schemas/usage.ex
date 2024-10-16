defmodule LangfuseSdk.Generated.Usage do
  @moduledoc """
  Provides struct and type for a Usage
  """

  @type t :: %__MODULE__{
          input: integer | nil,
          input_cost: number | nil,
          output: integer | nil,
          output_cost: number | nil,
          total: integer | nil,
          total_cost: number | nil,
          unit: String.t() | nil
        }

  defstruct [:input, :input_cost, :output, :output_cost, :total, :total_cost, :unit]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      input: :integer,
      input_cost: :number,
      output: :integer,
      output_cost: :number,
      total: :integer,
      total_cost: :number,
      unit: {:enum, ["CHARACTERS", "TOKENS", "MILLISECONDS", "SECONDS", "IMAGES", "REQUESTS"]}
    ]
  end
end
