defmodule LangfuseSdk.Generated.PromptVersion do
  @moduledoc """
  Provides API endpoint related to prompt version
  """

  @default_client LangfuseSdk.Support.Client

  @doc """
  patch `/api/public/v2/prompts/{name}/versions/{version}`

  Update labels for a specific prompt version
  """
  @spec prompt_version_update(String.t(), integer, map, keyword) :: {:ok, map} | {:error, map}
  def prompt_version_update(name, version, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [name: name, version: version, body: body],
      call: {LangfuseSdk.Generated.PromptVersion, :prompt_version_update},
      url: "/api/public/v2/prompts/#{name}/versions/#{version}",
      body: body,
      method: :patch,
      request: [{"application/json", :map}],
      response: [{200, :map}, {400, :map}, {401, :map}, {403, :map}, {404, :map}, {405, :map}],
      opts: opts
    })
  end
end
