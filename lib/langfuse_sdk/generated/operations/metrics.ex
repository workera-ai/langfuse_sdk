defmodule LangfuseSdk.Generated.Metrics do
  @moduledoc """
  Provides API endpoint related to metrics
  """

  @default_client LangfuseSdk.Support.Client

  @doc """
  get `/api/public/metrics/daily`

  Get daily metrics of the Langfuse project

  ## Options

    * `page`: page number, starts at 1
    * `limit`: limit of items per page
    * `traceName`: Optional filter by the name of the trace
    * `userId`: Optional filter by the userId associated with the trace
    * `tags`: Optional filter for metrics where traces include all of these tags
    * `fromTimestamp`: Optional filter to only include traces and observations on or after a certain datetime (ISO 8601)
    * `toTimestamp`: Optional filter to only include traces and observations before a certain datetime (ISO 8601)

  """
  @spec metrics_daily(keyword) :: {:ok, LangfuseSdk.Generated.DailyMetrics.t()} | {:error, map}
  def metrics_daily(opts \\ []) do
    client = opts[:client] || @default_client

    query =
      Keyword.take(opts, [:fromTimestamp, :limit, :page, :tags, :toTimestamp, :traceName, :userId])

    client.request(%{
      args: [],
      call: {LangfuseSdk.Generated.Metrics, :metrics_daily},
      url: "/api/public/metrics/daily",
      method: :get,
      query: query,
      response: [
        {200, {LangfuseSdk.Generated.DailyMetrics, :t}},
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
