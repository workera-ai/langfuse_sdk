defmodule LangfuseSdk.Generated.ObservationsView do
  @moduledoc """
  Provides struct and type for a ObservationsView
  """

  @type t :: %__MODULE__{
          completionStartTime: DateTime.t() | nil,
          endTime: DateTime.t() | nil,
          id: String.t() | nil,
          input: map | nil,
          level: String.t() | nil,
          metadata: map | nil,
          model: String.t() | nil,
          modelParameters: LangfuseSdk.Generated.ObservationsViewModelParameters.t() | nil,
          name: String.t() | nil,
          output: map | nil,
          parentObservationId: String.t() | nil,
          promptId: String.t() | nil,
          startTime: DateTime.t() | nil,
          statusMessage: String.t() | nil,
          traceId: String.t() | nil,
          type: String.t() | nil,
          usage: LangfuseSdk.Generated.Usage.t() | nil,
          version: String.t() | nil
        }

  defstruct [
    :completionStartTime,
    :endTime,
    :id,
    :input,
    :level,
    :metadata,
    :model,
    :modelParameters,
    :name,
    :output,
    :parentObservationId,
    :promptId,
    :startTime,
    :statusMessage,
    :traceId,
    :type,
    :usage,
    :version
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      completionStartTime: {:string, :date_time},
      endTime: {:string, :date_time},
      id: {:string, :generic},
      input: :map,
      level: {:enum, ["DEBUG", "DEFAULT", "WARNING", "ERROR"]},
      metadata: :map,
      model: {:string, :generic},
      modelParameters: {LangfuseSdk.Generated.ObservationsViewModelParameters, :t},
      name: {:string, :generic},
      output: :map,
      parentObservationId: {:string, :generic},
      promptId: {:string, :generic},
      startTime: {:string, :date_time},
      statusMessage: {:string, :generic},
      traceId: {:string, :generic},
      type: {:string, :generic},
      usage: {LangfuseSdk.Generated.Usage, :t},
      version: {:string, :generic}
    ]
  end
end
