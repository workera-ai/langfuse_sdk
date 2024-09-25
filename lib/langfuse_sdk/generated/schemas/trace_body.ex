defmodule LangfuseSdk.Generated.TraceBody do
  @moduledoc """
  Provides struct and type for a TraceBody
  """

  @type t :: %__MODULE__{
          id: String.t() | nil,
          input: map | nil,
          metadata: map | nil,
          name: String.t() | nil,
          output: map | nil,
          public: boolean | nil,
          release: String.t() | nil,
          sessionId: String.t() | nil,
          tags: [String.t()] | nil,
          timestamp: DateTime.t() | nil,
          userId: String.t() | nil,
          version: String.t() | nil
        }

  defstruct [
    :id,
    :input,
    :metadata,
    :name,
    :output,
    :public,
    :release,
    :sessionId,
    :tags,
    :timestamp,
    :userId,
    :version
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      id: {:string, :generic},
      input: :map,
      metadata: :map,
      name: {:string, :generic},
      output: :map,
      public: :boolean,
      release: {:string, :generic},
      sessionId: {:string, :generic},
      tags: [string: :generic],
      timestamp: {:string, :date_time},
      userId: {:string, :generic},
      version: {:string, :generic}
    ]
  end
end
