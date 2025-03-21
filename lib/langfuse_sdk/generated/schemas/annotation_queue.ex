defmodule LangfuseSdk.Generated.AnnotationQueue do
  @moduledoc """
  Provides struct and type for a AnnotationQueue
  """

  @type t :: %__MODULE__{
          created_at: DateTime.t(),
          description: String.t() | nil,
          id: String.t(),
          name: String.t(),
          score_config_ids: [String.t()],
          updated_at: DateTime.t()
        }

  defstruct [:created_at, :description, :id, :name, :score_config_ids, :updated_at]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      created_at: {:string, :date_time},
      description: {:string, :generic},
      id: {:string, :generic},
      name: {:string, :generic},
      score_config_ids: [string: :generic],
      updated_at: {:string, :date_time}
    ]
  end
end
