defmodule LangfuseSdk.Generated.DeleteAnnotationQueueItemResponse do
  @moduledoc """
  Provides struct and type for a DeleteAnnotationQueueItemResponse
  """

  @type t :: %__MODULE__{message: String.t(), success: boolean}

  defstruct [:message, :success]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [message: {:string, :generic}, success: :boolean]
  end
end
