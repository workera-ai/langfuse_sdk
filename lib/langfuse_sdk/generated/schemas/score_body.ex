defmodule LangfuseSdk.Generated.ScoreBody do
  @moduledoc """
  Provides struct and type for a ScoreBody
  """

  @type t :: %__MODULE__{
          comment: String.t() | nil,
          config_id: String.t() | nil,
          data_type: String.t() | nil,
          id: String.t() | nil,
          name: String.t(),
          observation_id: String.t() | nil,
          trace_id: String.t(),
          value: number | String.t()
        }

  defstruct [:comment, :config_id, :data_type, :id, :name, :observation_id, :trace_id, :value]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      comment: {:string, :generic},
      config_id: {:string, :generic},
      data_type: {:enum, ["NUMERIC", "BOOLEAN", "CATEGORICAL"]},
      id: {:string, :generic},
      name: {:string, :generic},
      observation_id: {:string, :generic},
      trace_id: {:string, :generic},
      value: {:union, [:number, string: :generic]}
    ]
  end
end
