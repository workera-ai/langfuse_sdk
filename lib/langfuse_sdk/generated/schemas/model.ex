defmodule LangfuseSdk.Generated.Model do
  @moduledoc """
  Provides struct and type for a Model
  """

  @type t :: %__MODULE__{
          id: String.t(),
          input_price: number | nil,
          is_langfuse_managed: boolean,
          match_pattern: String.t(),
          model_name: String.t(),
          output_price: number | nil,
          start_date: DateTime.t() | nil,
          tokenizer_config: map | nil,
          tokenizer_id: String.t() | nil,
          total_price: number | nil,
          unit: String.t() | nil
        }

  defstruct [
    :id,
    :input_price,
    :is_langfuse_managed,
    :match_pattern,
    :model_name,
    :output_price,
    :start_date,
    :tokenizer_config,
    :tokenizer_id,
    :total_price,
    :unit
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      id: {:string, :generic},
      input_price: :number,
      is_langfuse_managed: :boolean,
      match_pattern: {:string, :generic},
      model_name: {:string, :generic},
      output_price: :number,
      start_date: {:string, :date_time},
      tokenizer_config: :map,
      tokenizer_id: {:string, :generic},
      total_price: :number,
      unit: {:enum, ["CHARACTERS", "TOKENS", "MILLISECONDS", "SECONDS", "IMAGES", "REQUESTS"]}
    ]
  end
end
