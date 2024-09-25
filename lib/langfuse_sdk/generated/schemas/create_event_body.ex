defmodule LangfuseSdk.Generated.CreateEventBody do
  @moduledoc """
  Provides struct and type for a CreateEventBody
  """

  @type t :: %__MODULE__{
          input: map | nil,
          level: String.t() | nil,
          metadata: map | nil,
          name: String.t() | nil,
          output: map | nil,
          parentObservationId: String.t() | nil,
          startTime: DateTime.t() | nil,
          statusMessage: String.t() | nil,
          traceId: String.t() | nil,
          version: String.t() | nil
        }

  defstruct [
    :input,
    :level,
    :metadata,
    :name,
    :output,
    :parentObservationId,
    :startTime,
    :statusMessage,
    :traceId,
    :version
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      input: :map,
      level: {:enum, ["DEBUG", "DEFAULT", "WARNING", "ERROR"]},
      metadata: :map,
      name: {:string, :generic},
      output: :map,
      parentObservationId: {:string, :generic},
      startTime: {:string, :date_time},
      statusMessage: {:string, :generic},
      traceId: {:string, :generic},
      version: {:string, :generic}
    ]
  end
end
