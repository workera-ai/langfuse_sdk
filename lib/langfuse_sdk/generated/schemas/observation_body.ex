defmodule LangfuseSdk.Generated.ObservationBody do
  @moduledoc """
  Provides struct and type for a ObservationBody
  """

  @type t :: %__MODULE__{
          completion_start_time: DateTime.t() | nil,
          end_time: DateTime.t() | nil,
          id: String.t() | nil,
          input: map | nil,
          level: String.t() | nil,
          metadata: map | nil,
          model: String.t() | nil,
          model_parameters: LangfuseSdk.Generated.ObservationBodyModelParameters.t() | nil,
          name: String.t() | nil,
          output: map | nil,
          parent_observation_id: String.t() | nil,
          start_time: DateTime.t() | nil,
          status_message: String.t() | nil,
          trace_id: String.t() | nil,
          type: String.t(),
          usage: LangfuseSdk.Generated.Usage.t() | nil,
          version: String.t() | nil
        }

  defstruct [
    :completion_start_time,
    :end_time,
    :id,
    :input,
    :level,
    :metadata,
    :model,
    :model_parameters,
    :name,
    :output,
    :parent_observation_id,
    :start_time,
    :status_message,
    :trace_id,
    :type,
    :usage,
    :version
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      completion_start_time: {:string, :date_time},
      end_time: {:string, :date_time},
      id: {:string, :generic},
      input: :map,
      level: {:enum, ["DEBUG", "DEFAULT", "WARNING", "ERROR"]},
      metadata: :map,
      model: {:string, :generic},
      model_parameters: {LangfuseSdk.Generated.ObservationBodyModelParameters, :t},
      name: {:string, :generic},
      output: :map,
      parent_observation_id: {:string, :generic},
      start_time: {:string, :date_time},
      status_message: {:string, :generic},
      trace_id: {:string, :generic},
      type: {:enum, ["SPAN", "GENERATION", "EVENT"]},
      usage: {LangfuseSdk.Generated.Usage, :t},
      version: {:string, :generic}
    ]
  end
end
