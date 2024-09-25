defmodule LangfuseSdk.Generated.Projects do
  @moduledoc """
  Provides API endpoint related to projects
  """

  @default_client LangfuseSdk.Support.Client

  @doc """
  get `/api/public/projects`

  Get Project associated with API key
  """
  @spec projects_get(keyword) :: {:ok, map} | {:error, map}
  def projects_get(opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [],
      call: {LangfuseSdk.Generated.Projects, :projects_get},
      url: "/api/public/projects",
      method: :get,
      response: [
        {200, {LangfuseSdk.Generated.Projects, :t}},
        {400, :map},
        {401, :map},
        {403, :map},
        {404, :map},
        {405, :map}
      ],
      opts: opts
    })
  end

  @type t :: %__MODULE__{data: [LangfuseSdk.Generated.Project.t()]}

  defstruct [:data]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [data: [{LangfuseSdk.Generated.Project, :t}]]
  end
end
