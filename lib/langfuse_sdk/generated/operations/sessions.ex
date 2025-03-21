defmodule LangfuseSdk.Generated.Sessions do
  @moduledoc """
  Provides API endpoints related to sessions
  """

  @default_client LangfuseSdk.Support.Client

  @doc """
  get `/api/public/sessions/{sessionId}`

  Get a session. Please note that `traces` on this endpoint are not paginated, if you plan to fetch large sessions, consider `GET /api/public/traces?sessionId=<sessionId>`
  """
  @spec sessions_get(String.t(), keyword) ::
          {:ok, LangfuseSdk.Generated.SessionWithTraces.t()} | {:error, map}
  def sessions_get(sessionId, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [sessionId: sessionId],
      call: {LangfuseSdk.Generated.Sessions, :sessions_get},
      url: "/api/public/sessions/#{sessionId}",
      method: :get,
      response: [
        {200, {LangfuseSdk.Generated.SessionWithTraces, :t}},
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
  get `/api/public/sessions`

  Get sessions

  ## Options

    * `page`: Page number, starts at 1
    * `limit`: Limit of items per page. If you encounter api issues due to too large page sizes, try to reduce the limit.
    * `fromTimestamp`: Optional filter to only include sessions created on or after a certain datetime (ISO 8601)
    * `toTimestamp`: Optional filter to only include sessions created before a certain datetime (ISO 8601)
    * `environment`: Optional filter for sessions where the environment is one of the provided values.

  """
  @spec sessions_list(keyword) ::
          {:ok, LangfuseSdk.Generated.PaginatedSessions.t()} | {:error, map}
  def sessions_list(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:environment, :fromTimestamp, :limit, :page, :toTimestamp])

    client.request(%{
      args: [],
      call: {LangfuseSdk.Generated.Sessions, :sessions_list},
      url: "/api/public/sessions",
      method: :get,
      query: query,
      response: [
        {200, {LangfuseSdk.Generated.PaginatedSessions, :t}},
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
