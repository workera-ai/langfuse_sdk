defmodule LangfuseSdk.Generated.GetMediaUploadUrlResponse do
  @moduledoc """
  Provides struct and type for a GetMediaUploadUrlResponse
  """

  @type t :: %__MODULE__{media_id: String.t(), upload_url: String.t() | nil}

  defstruct [:media_id, :upload_url]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [media_id: {:string, :generic}, upload_url: {:string, :generic}]
  end
end
