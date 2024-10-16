defmodule LangfuseSdk.Generated.CreateScoreConfigRequest do
  @moduledoc """
  Provides struct and type for a CreateScoreConfigRequest
  """

  @type t :: %__MODULE__{
          categories: [LangfuseSdk.Generated.ConfigCategory.t()] | nil,
          data_type: String.t(),
          description: String.t() | nil,
          max_value: number | nil,
          min_value: number | nil,
          name: String.t()
        }

  defstruct [:categories, :data_type, :description, :max_value, :min_value, :name]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      categories: [{LangfuseSdk.Generated.ConfigCategory, :t}],
      data_type: {:enum, ["NUMERIC", "BOOLEAN", "CATEGORICAL"]},
      description: {:string, :generic},
      max_value: :number,
      min_value: :number,
      name: {:string, :generic}
    ]
  end
end
