defmodule LangfuseSdk.Generated.PromptMeta do
  @moduledoc """
  Provides struct and type for a PromptMeta
  """

  @type t :: %__MODULE__{
          labels: [String.t()],
          lastConfig: map,
          lastUpdatedAt: DateTime.t(),
          name: String.t(),
          tags: [String.t()],
          versions: [integer]
        }

  defstruct [:labels, :lastConfig, :lastUpdatedAt, :name, :tags, :versions]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      labels: [string: :generic],
      lastConfig: :map,
      lastUpdatedAt: {:string, :date_time},
      name: {:string, :generic},
      tags: [string: :generic],
      versions: [:integer]
    ]
  end
end
