defmodule LangfuseSdk.Generated.PatchMediaBody do
  @moduledoc """
  Provides struct and type for a PatchMediaBody
  """

  @type t :: %__MODULE__{
          upload_http_error: String.t() | nil,
          upload_http_status: integer,
          upload_time_ms: integer | nil,
          uploaded_at: DateTime.t()
        }

  defstruct [:upload_http_error, :upload_http_status, :upload_time_ms, :uploaded_at]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      upload_http_error: {:string, :generic},
      upload_http_status: :integer,
      upload_time_ms: :integer,
      uploaded_at: {:string, :date_time}
    ]
  end
end
