defmodule LangfuseSdk.Generated.ScoreConfig do
  @moduledoc """
  Provides struct and type for a ScoreConfig
  """

  @type t :: %__MODULE__{
          categories: [LangfuseSdk.Generated.ConfigCategory.t()] | nil,
          createdAt: DateTime.t(),
          dataType: String.t(),
          description: String.t() | nil,
          id: String.t(),
          isArchived: boolean,
          maxValue: number | nil,
          minValue: number | nil,
          name: String.t(),
          projectId: String.t(),
          updatedAt: DateTime.t()
        }

  defstruct [
    :categories,
    :createdAt,
    :dataType,
    :description,
    :id,
    :isArchived,
    :maxValue,
    :minValue,
    :name,
    :projectId,
    :updatedAt
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      categories: [{LangfuseSdk.Generated.ConfigCategory, :t}],
      createdAt: {:string, :date_time},
      dataType: {:enum, ["NUMERIC", "BOOLEAN", "CATEGORICAL"]},
      description: {:string, :generic},
      id: {:string, :generic},
      isArchived: :boolean,
      maxValue: :number,
      minValue: :number,
      name: {:string, :generic},
      projectId: {:string, :generic},
      updatedAt: {:string, :date_time}
    ]
  end
end
