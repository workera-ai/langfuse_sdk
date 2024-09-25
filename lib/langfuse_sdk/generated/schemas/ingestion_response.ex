defmodule LangfuseSdk.Generated.IngestionResponse do
  @moduledoc """
  Provides struct and type for a IngestionResponse
  """

  @type t :: %__MODULE__{
          errors: [LangfuseSdk.Generated.IngestionError.t()],
          successes: [LangfuseSdk.Generated.IngestionSuccess.t()]
        }

  defstruct [:errors, :successes]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      errors: [{LangfuseSdk.Generated.IngestionError, :t}],
      successes: [{LangfuseSdk.Generated.IngestionSuccess, :t}]
    ]
  end
end
