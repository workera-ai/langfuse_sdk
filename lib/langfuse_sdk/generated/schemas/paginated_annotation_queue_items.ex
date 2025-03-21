defmodule LangfuseSdk.Generated.PaginatedAnnotationQueueItems do
  @moduledoc """
  Provides struct and type for a PaginatedAnnotationQueueItems
  """

  @type t :: %__MODULE__{
          data: [LangfuseSdk.Generated.AnnotationQueueItem.t()],
          meta: LangfuseSdk.Generated.UtilsMetaResponse.t()
        }

  defstruct [:data, :meta]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      data: [{LangfuseSdk.Generated.AnnotationQueueItem, :t}],
      meta: {LangfuseSdk.Generated.UtilsMetaResponse, :t}
    ]
  end
end
