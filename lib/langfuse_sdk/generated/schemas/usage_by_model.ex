defmodule LangfuseSdk.Generated.UsageByModel do
  @moduledoc """
  Provides struct and type for a UsageByModel
  """

  @type t :: %__MODULE__{
          count_observations: integer,
          count_traces: integer,
          input_usage: integer,
          model: String.t() | nil,
          output_usage: integer,
          total_cost: number,
          total_usage: integer
        }

  defstruct [
    :count_observations,
    :count_traces,
    :input_usage,
    :model,
    :output_usage,
    :total_cost,
    :total_usage
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      count_observations: :integer,
      count_traces: :integer,
      input_usage: :integer,
      model: {:string, :generic},
      output_usage: :integer,
      total_cost: :number,
      total_usage: :integer
    ]
  end
end
