defmodule LangfuseSdk.Generated.CreateCommentRequest do
  @moduledoc """
  Provides struct and type for a CreateCommentRequest
  """

  @type t :: %__MODULE__{
          author_user_id: String.t() | nil,
          content: String.t(),
          object_id: String.t(),
          object_type: String.t(),
          project_id: String.t()
        }

  defstruct [:author_user_id, :content, :object_id, :object_type, :project_id]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      author_user_id: {:string, :generic},
      content: {:string, :generic},
      object_id: {:string, :generic},
      object_type: {:string, :generic},
      project_id: {:string, :generic}
    ]
  end
end
