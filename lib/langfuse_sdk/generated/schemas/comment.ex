defmodule LangfuseSdk.Generated.Comment do
  @moduledoc """
  Provides struct and type for a Comment
  """

  @type t :: %__MODULE__{
          author_user_id: String.t() | nil,
          content: String.t(),
          created_at: DateTime.t(),
          id: String.t(),
          object_id: String.t(),
          object_type: String.t(),
          project_id: String.t(),
          updated_at: DateTime.t()
        }

  defstruct [
    :author_user_id,
    :content,
    :created_at,
    :id,
    :object_id,
    :object_type,
    :project_id,
    :updated_at
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      author_user_id: {:string, :generic},
      content: {:string, :generic},
      created_at: {:string, :date_time},
      id: {:string, :generic},
      object_id: {:string, :generic},
      object_type: {:enum, ["TRACE", "OBSERVATION", "SESSION", "PROMPT"]},
      project_id: {:string, :generic},
      updated_at: {:string, :date_time}
    ]
  end
end
