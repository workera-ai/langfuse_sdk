defmodule LangfuseSdk.Generated.DailyMetricsDetails do
  @moduledoc """
  Provides struct and type for a DailyMetricsDetails
  """

  @type t :: %__MODULE__{
          countObservations: integer,
          countTraces: integer,
          date: String.t(),
          totalCost: number,
          usage: [LangfuseSdk.Generated.UsageByModel.t()]
        }

  defstruct [:countObservations, :countTraces, :date, :totalCost, :usage]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      countObservations: :integer,
      countTraces: :integer,
      date: {:string, :generic},
      totalCost: :number,
      usage: [{LangfuseSdk.Generated.UsageByModel, :t}]
    ]
  end
end
