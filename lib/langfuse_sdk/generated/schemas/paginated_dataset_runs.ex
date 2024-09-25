defmodule LangfuseSdk.Generated.PaginatedDatasetRuns do
  @moduledoc """
  Provides struct and type for a PaginatedDatasetRuns
  """

  @type t :: %__MODULE__{
          data: [LangfuseSdk.Generated.DatasetRun.t()],
          meta: LangfuseSdk.Generated.UtilsMetaResponse.t()
        }

  defstruct [:data, :meta]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      data: [{LangfuseSdk.Generated.DatasetRun, :t}],
      meta: {LangfuseSdk.Generated.UtilsMetaResponse, :t}
    ]
  end
end
