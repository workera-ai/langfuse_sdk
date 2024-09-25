defmodule LangfuseSdk.Generated.Scores do
  @moduledoc """
  Provides struct and type for a Scores
  """

  @type t :: %__MODULE__{data: [map], meta: LangfuseSdk.Generated.UtilsMetaResponse.t()}

  defstruct [:data, :meta]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [data: [:map], meta: {LangfuseSdk.Generated.UtilsMetaResponse, :t}]
  end
end
