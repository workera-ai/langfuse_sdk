defmodule LangfuseSdk.Generated.DailyMetricsDetails do
  @moduledoc """
  Provides struct and type for a DailyMetricsDetails
  """

  @type t :: %__MODULE__{
          count_observations: integer,
          count_traces: integer,
          date: Date.t(),
          total_cost: number,
          usage: [LangfuseSdk.Generated.UsageByModel.t()]
        }

  defstruct [:count_observations, :count_traces, :date, :total_cost, :usage]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      count_observations: :integer,
      count_traces: :integer,
      date: {:string, :date},
      total_cost: :number,
      usage: [{LangfuseSdk.Generated.UsageByModel, :t}]
    ]
  end
end
