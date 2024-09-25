defmodule LangfuseSdk.Generated.CreateScoreConfigRequest do
  @moduledoc """
  Provides struct and type for a CreateScoreConfigRequest
  """

  @type t :: %__MODULE__{
          categories: [LangfuseSdk.Generated.ConfigCategory.t()] | nil,
          dataType: String.t(),
          description: String.t() | nil,
          maxValue: number | nil,
          minValue: number | nil,
          name: String.t()
        }

  defstruct [:categories, :dataType, :description, :maxValue, :minValue, :name]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      categories: [{LangfuseSdk.Generated.ConfigCategory, :t}],
      dataType: {:enum, ["NUMERIC", "BOOLEAN", "CATEGORICAL"]},
      description: {:string, :generic},
      maxValue: :number,
      minValue: :number,
      name: {:string, :generic}
    ]
  end
end
