defmodule LangfuseSdk.Generated.GetMediaUploadUrlRequest do
  @moduledoc """
  Provides struct and type for a GetMediaUploadUrlRequest
  """

  @type t :: %__MODULE__{
          content_length: integer,
          content_type: String.t(),
          field: String.t(),
          observation_id: String.t() | nil,
          sha2_56_hash: String.t(),
          trace_id: String.t()
        }

  defstruct [:content_length, :content_type, :field, :observation_id, :sha2_56_hash, :trace_id]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      content_length: :integer,
      content_type:
        {:enum,
         [
           "image/png",
           "image/jpeg",
           "image/jpg",
           "image/webp",
           "image/gif",
           "image/svg+xml",
           "image/tiff",
           "image/bmp",
           "audio/mpeg",
           "audio/mp3",
           "audio/wav",
           "audio/ogg",
           "audio/oga",
           "audio/aac",
           "audio/mp4",
           "audio/flac",
           "video/mp4",
           "video/webm",
           "text/plain",
           "text/html",
           "text/css",
           "text/csv",
           "application/pdf",
           "application/msword",
           "application/vnd.ms-excel",
           "application/zip",
           "application/json",
           "application/xml",
           "application/octet-stream"
         ]},
      field: {:string, :generic},
      observation_id: {:string, :generic},
      sha2_56_hash: {:string, :generic},
      trace_id: {:string, :generic}
    ]
  end
end
