defmodule LangfuseSdk.Generated.ScoreConfig do
  @moduledoc """
  Provides struct and type for a ScoreConfig
  """

  @type t :: %__MODULE__{
          categories: [LangfuseSdk.Generated.ConfigCategory.t()] | nil,
          created_at: DateTime.t(),
          data_type: String.t(),
          description: String.t() | nil,
          id: String.t(),
          is_archived: boolean,
          max_value: number | nil,
          min_value: number | nil,
          name: String.t(),
          project_id: String.t(),
          updated_at: DateTime.t()
        }

  defstruct [
    :categories,
    :created_at,
    :data_type,
    :description,
    :id,
    :is_archived,
    :max_value,
    :min_value,
    :name,
    :project_id,
    :updated_at
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      categories: [{LangfuseSdk.Generated.ConfigCategory, :t}],
      created_at: {:string, :date_time},
      data_type: {:enum, ["NUMERIC", "BOOLEAN", "CATEGORICAL"]},
      description: {:string, :generic},
      id: {:string, :generic},
      is_archived: :boolean,
      max_value: :number,
      min_value: :number,
      name: {:string, :generic},
      project_id: {:string, :generic},
      updated_at: {:string, :date_time}
    ]
  end
end
