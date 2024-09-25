defmodule LangfuseSdk.Generated.CreateScoreRequest do
  @moduledoc """
  Provides struct and type for a CreateScoreRequest
  """

  @type t :: %__MODULE__{
          comment: String.t() | nil,
          configId: String.t() | nil,
          dataType: String.t() | nil,
          id: String.t() | nil,
          name: String.t(),
          observationId: String.t() | nil,
          traceId: String.t(),
          value: number | String.t()
        }

  defstruct [:comment, :configId, :dataType, :id, :name, :observationId, :traceId, :value]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      comment: {:string, :generic},
      configId: {:string, :generic},
      dataType: {:enum, ["NUMERIC", "BOOLEAN", "CATEGORICAL"]},
      id: {:string, :generic},
      name: {:string, :generic},
      observationId: {:string, :generic},
      traceId: {:string, :generic},
      value: {:union, [:number, string: :generic]}
    ]
  end
end
