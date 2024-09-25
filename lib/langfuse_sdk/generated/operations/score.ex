defmodule LangfuseSdk.Generated.Score do
  @moduledoc """
  Provides API endpoints related to score
  """

  @default_client LangfuseSdk.Support.Client

  @doc """
  post `/api/public/scores`

  Create a score
  """
  @spec score_create(LangfuseSdk.Generated.CreateScoreRequest.t(), keyword) ::
          {:ok, LangfuseSdk.Generated.CreateScoreResponse.t()} | {:error, map}
  def score_create(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {LangfuseSdk.Generated.Score, :score_create},
      url: "/api/public/scores",
      body: body,
      method: :post,
      request: [{"application/json", {LangfuseSdk.Generated.CreateScoreRequest, :t}}],
      response: [
        {200, {LangfuseSdk.Generated.CreateScoreResponse, :t}},
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
  delete `/api/public/scores/{scoreId}`

  Delete a score
  """
  @spec score_delete(String.t(), keyword) :: :ok | {:error, map}
  def score_delete(scoreId, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [scoreId: scoreId],
      call: {LangfuseSdk.Generated.Score, :score_delete},
      url: "/api/public/scores/#{scoreId}",
      method: :delete,
      response: [{204, :null}, {400, :map}, {401, :map}, {403, :map}, {404, :map}, {405, :map}],
      opts: opts
    })
  end

  @doc """
  get `/api/public/scores`

  Get a list of scores

  ## Options

    * `page`: Page number, starts at 1.
    * `limit`: Limit of items per page. If you encounter api issues due to too large page sizes, try to reduce the limit.
    * `userId`: Retrieve only scores with this userId associated to the trace.
    * `name`: Retrieve only scores with this name.
    * `fromTimestamp`: Optional filter to only include scores created on or after a certain datetime (ISO 8601)
    * `toTimestamp`: Optional filter to only include scores created before a certain datetime (ISO 8601)
    * `source`: Retrieve only scores from a specific source.
    * `operator`: Retrieve only scores with <operator> value.
    * `value`: Retrieve only scores with <operator> value.
    * `scoreIds`: Comma-separated list of score IDs to limit the results to.
    * `configId`: Retrieve only scores with a specific configId.
    * `dataType`: Retrieve only scores with a specific dataType.

  """
  @spec score_get(keyword) :: {:ok, LangfuseSdk.Generated.Scores.t()} | {:error, map}
  def score_get(opts \\ []) do
    client = opts[:client] || @default_client

    query =
      Keyword.take(opts, [
        :configId,
        :dataType,
        :fromTimestamp,
        :limit,
        :name,
        :operator,
        :page,
        :scoreIds,
        :source,
        :toTimestamp,
        :userId,
        :value
      ])

    client.request(%{
      args: [],
      call: {LangfuseSdk.Generated.Score, :score_get},
      url: "/api/public/scores",
      method: :get,
      query: query,
      response: [
        {200, {LangfuseSdk.Generated.Scores, :t}},
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
  get `/api/public/scores/{scoreId}`

  Get a score
  """
  @spec score_get_by_id(String.t(), keyword) :: {:ok, map} | {:error, map}
  def score_get_by_id(scoreId, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [scoreId: scoreId],
      call: {LangfuseSdk.Generated.Score, :score_get_by_id},
      url: "/api/public/scores/#{scoreId}",
      method: :get,
      response: [{200, :map}, {400, :map}, {401, :map}, {403, :map}, {404, :map}, {405, :map}],
      opts: opts
    })
  end
end
