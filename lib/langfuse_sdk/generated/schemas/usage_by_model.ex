defmodule LangfuseSdk.Generated.UsageByModel do
  @moduledoc """
  Provides struct and type for a UsageByModel
  """

  @type t :: %__MODULE__{
          countObservations: integer,
          countTraces: integer,
          inputUsage: integer,
          model: String.t() | nil,
          outputUsage: integer,
          totalCost: number,
          totalUsage: integer
        }

  defstruct [
    :countObservations,
    :countTraces,
    :inputUsage,
    :model,
    :outputUsage,
    :totalCost,
    :totalUsage
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      countObservations: :integer,
      countTraces: :integer,
      inputUsage: :integer,
      model: {:string, :generic},
      outputUsage: :integer,
      totalCost: :number,
      totalUsage: :integer
    ]
  end
end
