defmodule LangfuseSdk.Generated.Prompts do
  @moduledoc """
  Provides API endpoints related to prompts
  """

  @default_client LangfuseSdk.Support.Client

  @doc """
  post `/api/public/v2/prompts`

  Create a new version for the prompt with the given `name`
  """
  @spec prompts_create(map, keyword) :: {:ok, map} | {:error, map}
  def prompts_create(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {LangfuseSdk.Generated.Prompts, :prompts_create},
      url: "/api/public/v2/prompts",
      body: body,
      method: :post,
      request: [{"application/json", :map}],
      response: [{200, :map}, {400, :map}, {401, :map}, {403, :map}, {404, :map}, {405, :map}],
      opts: opts
    })
  end

  @doc """
  get `/api/public/v2/prompts/{promptName}`

  Get a prompt

  ## Options

    * `version`: Version of the prompt to be retrieved.
    * `label`: Label of the prompt to be retrieved. Defaults to "production" if no label or version is set.

  """
  @spec prompts_get(String.t(), keyword) :: {:ok, map} | {:error, map}
  def prompts_get(promptName, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:label, :version])

    client.request(%{
      args: [promptName: promptName],
      call: {LangfuseSdk.Generated.Prompts, :prompts_get},
      url: "/api/public/v2/prompts/#{promptName}",
      method: :get,
      query: query,
      response: [{200, :map}, {400, :map}, {401, :map}, {403, :map}, {404, :map}, {405, :map}],
      opts: opts
    })
  end

  @doc """
  get `/api/public/v2/prompts`

  Get a list of prompt names with versions and labels

  ## Options

    * `name`
    * `label`
    * `tag`
    * `page`: page number, starts at 1
    * `limit`: limit of items per page
    * `fromUpdatedAt`: Optional filter to only include prompt versions created/updated on or after a certain datetime (ISO 8601)
    * `toUpdatedAt`: Optional filter to only include prompt versions created/updated before a certain datetime (ISO 8601)

  """
  @spec prompts_list(keyword) ::
          {:ok, LangfuseSdk.Generated.PromptMetaListResponse.t()} | {:error, map}
  def prompts_list(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:fromUpdatedAt, :label, :limit, :name, :page, :tag, :toUpdatedAt])

    client.request(%{
      args: [],
      call: {LangfuseSdk.Generated.Prompts, :prompts_list},
      url: "/api/public/v2/prompts",
      method: :get,
      query: query,
      response: [
        {200, {LangfuseSdk.Generated.PromptMetaListResponse, :t}},
        {400, :map},
        {401, :map},
        {403, :map},
        {404, :map},
        {405, :map}
      ],
      opts: opts
    })
  end
end
