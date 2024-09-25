defmodule LangfuseSdk.Generated.ScoreConfigs do
  @moduledoc """
  Provides API endpoints related to score configs
  """

  @default_client LangfuseSdk.Support.Client

  @doc """
  post `/api/public/score-configs`

  Create a score configuration (config). Score configs are used to define the structure of scores
  """
  @spec score_configs_create(LangfuseSdk.Generated.CreateScoreConfigRequest.t(), keyword) ::
          {:ok, LangfuseSdk.Generated.ScoreConfig.t()} | {:error, map}
  def score_configs_create(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {LangfuseSdk.Generated.ScoreConfigs, :score_configs_create},
      url: "/api/public/score-configs",
      body: body,
      method: :post,
      request: [{"application/json", {LangfuseSdk.Generated.CreateScoreConfigRequest, :t}}],
      response: [
        {200, {LangfuseSdk.Generated.ScoreConfig, :t}},
        {400, :map},
        {401, :map},
        {403, :map},
        {404, :map},
        {405, :map}
      ],
      opts: opts
    })
  end

  @doc """
  get `/api/public/score-configs`

  Get all score configs

  ## Options

    * `page`: Page number, starts at 1.
    * `limit`: Limit of items per page. If you encounter api issues due to too large page sizes, try to reduce the limit

  """
  @spec score_configs_get(keyword) :: {:ok, map} | {:error, map}
  def score_configs_get(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:limit, :page])

    client.request(%{
      args: [],
      call: {LangfuseSdk.Generated.ScoreConfigs, :score_configs_get},
      url: "/api/public/score-configs",
      method: :get,
      query: query,
      response: [
        {200, {LangfuseSdk.Generated.ScoreConfigs, :t}},
        {400, :map},
        {401, :map},
        {403, :map},
        {404, :map},
        {405, :map}
      ],
      opts: opts
    })
  end

  @doc """
  get `/api/public/score-configs/{configId}`

  Get a score config
  """
  @spec score_configs_get_by_id(String.t(), keyword) ::
          {:ok, LangfuseSdk.Generated.ScoreConfig.t()} | {:error, map}
  def score_configs_get_by_id(configId, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [configId: configId],
      call: {LangfuseSdk.Generated.ScoreConfigs, :score_configs_get_by_id},
      url: "/api/public/score-configs/#{configId}",
      method: :get,
      response: [
        {200, {LangfuseSdk.Generated.ScoreConfig, :t}},
        {400, :map},
        {401, :map},
        {403, :map},
        {404, :map},
        {405, :map}
      ],
      opts: opts
    })
  end

  @type t :: %__MODULE__{
          data: [LangfuseSdk.Generated.ScoreConfig.t()],
          meta: LangfuseSdk.Generated.UtilsMetaResponse.t()
        }

  defstruct [:data, :meta]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      data: [{LangfuseSdk.Generated.ScoreConfig, :t}],
      meta: {LangfuseSdk.Generated.UtilsMetaResponse, :t}
    ]
  end
end
