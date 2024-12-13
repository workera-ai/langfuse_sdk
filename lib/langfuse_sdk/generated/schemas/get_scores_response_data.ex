defmodule LangfuseSdk.Generated.GetScoresResponseData do
  @moduledoc """
  Provides struct and types for a GetScoresResponseData
  """

  @type t :: %__MODULE__{
          data_type: String.t(),
          trace: LangfuseSdk.Generated.GetScoresResponseTraceData.t() | nil
        }

  defstruct [:data_type, :trace]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      data_type: {:enum, ["BOOLEAN", "CATEGORICAL", "NUMERIC"]},
      trace: {LangfuseSdk.Generated.GetScoresResponseTraceData, :t}
    ]
  end
end
