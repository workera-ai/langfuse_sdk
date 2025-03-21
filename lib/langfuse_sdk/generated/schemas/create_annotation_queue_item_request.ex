defmodule LangfuseSdk.Generated.CreateAnnotationQueueItemRequest do
  @moduledoc """
  Provides struct and type for a CreateAnnotationQueueItemRequest
  """

  @type t :: %__MODULE__{object_id: String.t(), object_type: String.t(), status: String.t() | nil}

  defstruct [:object_id, :object_type, :status]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      object_id: {:string, :generic},
      object_type: {:enum, ["TRACE", "OBSERVATION"]},
      status: {:enum, ["PENDING", "COMPLETED"]}
    ]
  end
end
