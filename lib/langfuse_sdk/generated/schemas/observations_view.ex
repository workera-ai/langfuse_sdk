defmodule LangfuseSdk.Generated.ObservationsView do
  @moduledoc """
  Provides struct and type for a ObservationsView
  """

  @type t :: %__MODULE__{
          completion_start_time: DateTime.t() | nil,
          cost_details: LangfuseSdk.Generated.ObservationsViewCostDetails.t() | nil,
          end_time: DateTime.t() | nil,
          environment: String.t() | nil,
          id: String.t() | nil,
          input: map | nil,
          level: String.t() | nil,
          metadata: map | nil,
          model: String.t() | nil,
          model_parameters: LangfuseSdk.Generated.ObservationsViewModelParameters.t() | nil,
          name: String.t() | nil,
          output: map | nil,
          parent_observation_id: String.t() | nil,
          prompt_id: String.t() | nil,
          start_time: DateTime.t() | nil,
          status_message: String.t() | nil,
          trace_id: String.t() | nil,
          type: String.t() | nil,
          usage: LangfuseSdk.Generated.Usage.t() | nil,
          usage_details: LangfuseSdk.Generated.ObservationsViewUsageDetails.t() | nil,
          version: String.t() | nil
        }

  defstruct [
    :completion_start_time,
    :cost_details,
    :end_time,
    :environment,
    :id,
    :input,
    :level,
    :metadata,
    :model,
    :model_parameters,
    :name,
    :output,
    :parent_observation_id,
    :prompt_id,
    :start_time,
    :status_message,
    :trace_id,
    :type,
    :usage,
    :usage_details,
    :version
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      completion_start_time: {:string, :date_time},
      cost_details: {LangfuseSdk.Generated.ObservationsViewCostDetails, :t},
      end_time: {:string, :date_time},
      environment: {:string, :generic},
      id: {:string, :generic},
      input: :map,
      level: {:enum, ["DEBUG", "DEFAULT", "WARNING", "ERROR"]},
      metadata: :map,
      model: {:string, :generic},
      model_parameters: {LangfuseSdk.Generated.ObservationsViewModelParameters, :t},
      name: {:string, :generic},
      output: :map,
      parent_observation_id: {:string, :generic},
      prompt_id: {:string, :generic},
      start_time: {:string, :date_time},
      status_message: {:string, :generic},
      trace_id: {:string, :generic},
      type: {:string, :generic},
      usage: {LangfuseSdk.Generated.Usage, :t},
      usage_details: {LangfuseSdk.Generated.ObservationsViewUsageDetails, :t},
      version: {:string, :generic}
    ]
  end
end
