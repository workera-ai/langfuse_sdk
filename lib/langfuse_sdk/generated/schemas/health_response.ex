defmodule LangfuseSdk.Generated.HealthResponse do
  @moduledoc """
  Provides struct and type for a HealthResponse
  """

  @type t :: %__MODULE__{status: String.t(), version: String.t()}

  defstruct [:status, :version]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [status: {:string, :generic}, version: {:string, :generic}]
  end
end
