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
          parent_observation_id: String.t() | nil,
          start_time: DateTime.t() | nil,
          status_message: String.t() | nil,
          trace_id: String.t() | nil,
          version: String.t() | nil
        }

  defstruct [
    :input,
    :level,
    :metadata,
    :name,
    :output,
    :parent_observation_id,
    :start_time,
    :status_message,
    :trace_id,
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
      parent_observation_id: {:string, :generic},
      start_time: {:string, :date_time},
      status_message: {:string, :generic},
      trace_id: {:string, :generic},
      version: {:string, :generic}
    ]
  end
end
