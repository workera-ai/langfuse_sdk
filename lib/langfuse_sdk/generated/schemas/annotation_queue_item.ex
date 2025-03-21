defmodule LangfuseSdk.Generated.AnnotationQueueItem do
  @moduledoc """
  Provides struct and type for a AnnotationQueueItem
  """

  @type t :: %__MODULE__{
          completed_at: DateTime.t() | nil,
          created_at: DateTime.t(),
          id: String.t(),
          object_id: String.t(),
          object_type: String.t(),
          queue_id: String.t(),
          status: String.t(),
          updated_at: DateTime.t()
        }

  defstruct [
    :completed_at,
    :created_at,
    :id,
    :object_id,
    :object_type,
    :queue_id,
    :status,
    :updated_at
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      completed_at: {:string, :date_time},
      created_at: {:string, :date_time},
      id: {:string, :generic},
      object_id: {:string, :generic},
      object_type: {:enum, ["TRACE", "OBSERVATION"]},
      queue_id: {:string, :generic},
      status: {:enum, ["PENDING", "COMPLETED"]},
      updated_at: {:string, :date_time}
    ]
  end
end
