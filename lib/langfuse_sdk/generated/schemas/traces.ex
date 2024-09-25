defmodule LangfuseSdk.Generated.Traces do
  @moduledoc """
  Provides struct and type for a Traces
  """

  @type t :: %__MODULE__{
          data: [LangfuseSdk.Generated.TraceWithDetails.t()],
          meta: LangfuseSdk.Generated.UtilsMetaResponse.t()
        }

  defstruct [:data, :meta]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      data: [{LangfuseSdk.Generated.TraceWithDetails, :t}],
      meta: {LangfuseSdk.Generated.UtilsMetaResponse, :t}
    ]
  end
end
