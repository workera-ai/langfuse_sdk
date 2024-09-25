defmodule LangfuseSdk.Generated.CreateModelRequest do
  @moduledoc """
  Provides struct and type for a CreateModelRequest
  """

  @type t :: %__MODULE__{
          inputPrice: number | nil,
          matchPattern: String.t(),
          modelName: String.t(),
          outputPrice: number | nil,
          startDate: String.t() | nil,
          tokenizerConfig: map | nil,
          tokenizerId: String.t() | nil,
          totalPrice: number | nil,
          unit: String.t()
        }

  defstruct [
    :inputPrice,
    :matchPattern,
    :modelName,
    :outputPrice,
    :startDate,
    :tokenizerConfig,
    :tokenizerId,
    :totalPrice,
    :unit
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      inputPrice: :number,
      matchPattern: {:string, :generic},
      modelName: {:string, :generic},
      outputPrice: :number,
      startDate: {:string, :generic},
      tokenizerConfig: :map,
      tokenizerId: {:string, :generic},
      totalPrice: :number,
      unit: {:enum, ["CHARACTERS", "TOKENS", "MILLISECONDS", "SECONDS", "IMAGES", "REQUESTS"]}
    ]
  end
end
