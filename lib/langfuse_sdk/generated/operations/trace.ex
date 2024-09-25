defmodule LangfuseSdk.Generated.Trace do
  @moduledoc """
  Provides API endpoints related to trace
  """

  @default_client LangfuseSdk.Support.Client

  @doc """
  get `/api/public/traces/{traceId}`

  Get a specific trace
  """
  @spec trace_get(String.t(), keyword) ::
          {:ok, LangfuseSdk.Generated.TraceWithFullDetails.t()} | {:error, map}
  def trace_get(traceId, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [traceId: traceId],
      call: {LangfuseSdk.Generated.Trace, :trace_get},
      url: "/api/public/traces/#{traceId}",
      method: :get,
      response: [
        {200, {LangfuseSdk.Generated.TraceWithFullDetails, :t}},
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
  get `/api/public/traces`

  Get list of traces

  ## Options

    * `page`: Page number, starts at 1
    * `limit`: Limit of items per page. If you encounter api issues due to too large page sizes, try to reduce the limit.
    * `userId`
    * `name`
    * `sessionId`
    * `fromTimestamp`: Optional filter to only include traces with a trace.timestamp on or after a certain datetime (ISO 8601)
    * `toTimestamp`: Optional filter to only include traces with a trace.timestamp before a certain datetime (ISO 8601)
    * `orderBy`: Format of the string [field].[asc/desc]. Fields: id, timestamp, name, userId, release, version, public, bookmarked, sessionId. Example: timestamp.asc
    * `tags`: Only traces that include all of these tags will be returned.
    * `version`: Optional filter to only include traces with a certain version.
    * `release`: Optional filter to only include traces with a certain release.

  """
  @spec trace_list(keyword) :: {:ok, LangfuseSdk.Generated.Traces.t()} | {:error, map}
  def trace_list(opts \\ []) do
    client = opts[:client] || @default_client

    query =
      Keyword.take(opts, [
        :fromTimestamp,
        :limit,
        :name,
        :orderBy,
        :page,
        :release,
        :sessionId,
        :tags,
        :toTimestamp,
        :userId,
        :version
      ])

    client.request(%{
      args: [],
      call: {LangfuseSdk.Generated.Trace, :trace_list},
      url: "/api/public/traces",
      method: :get,
      query: query,
      response: [
        {200, {LangfuseSdk.Generated.Traces, :t}},
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
