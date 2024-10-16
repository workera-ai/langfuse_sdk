defmodule LangfuseSdk.Generated.PromptMeta do
  @moduledoc """
  Provides struct and type for a PromptMeta
  """

  @type t :: %__MODULE__{
          labels: [String.t()],
          last_config: map,
          last_updated_at: DateTime.t(),
          name: String.t(),
          tags: [String.t()],
          versions: [integer]
        }

  defstruct [:labels, :last_config, :last_updated_at, :name, :tags, :versions]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      labels: [string: :generic],
      last_config: :map,
      last_updated_at: {:string, :date_time},
      name: {:string, :generic},
      tags: [string: :generic],
      versions: [:integer]
    ]
  end
end
