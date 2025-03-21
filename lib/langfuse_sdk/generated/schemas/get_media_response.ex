defmodule LangfuseSdk.Generated.GetMediaResponse do
  @moduledoc """
  Provides struct and type for a GetMediaResponse
  """

  @type t :: %__MODULE__{
          content_length: integer,
          content_type: String.t(),
          media_id: String.t(),
          uploaded_at: DateTime.t(),
          url: String.t(),
          url_expiry: String.t()
        }

  defstruct [:content_length, :content_type, :media_id, :uploaded_at, :url, :url_expiry]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      content_length: :integer,
      content_type: {:string, :generic},
      media_id: {:string, :generic},
      uploaded_at: {:string, :date_time},
      url: {:string, :generic},
      url_expiry: {:string, :generic}
    ]
  end
end
