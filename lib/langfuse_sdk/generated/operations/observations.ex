defmodule LangfuseSdk.Generated.Observations do
  @moduledoc """
  Provides API endpoints related to observations
  """

  @default_client LangfuseSdk.Support.Client

  @doc """
  get `/api/public/observations/{observationId}`

  Get a observation
  """
  @spec observations_get(String.t(), keyword) ::
          {:ok, LangfuseSdk.Generated.ObservationsView.t()} | {:error, map}
  def observations_get(observationId, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [observationId: observationId],
      call: {LangfuseSdk.Generated.Observations, :observations_get},
      url: "/api/public/observations/#{observationId}",
      method: :get,
      response: [
        {200, {LangfuseSdk.Generated.ObservationsView, :t}},
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
  get `/api/public/observations`

  Get a list of observations

  ## Options

    * `page`: Page number, starts at 1.
    * `limit`: Limit of items per page. If you encounter api issues due to too large page sizes, try to reduce the limit.
    * `name`
    * `userId`
    * `type`
    * `traceId`
    * `parentObservationId`
    * `fromStartTime`: Retrieve only observations with a start_time or or after this datetime (ISO 8601).
    * `toStartTime`: Retrieve only observations with a start_time before this datetime (ISO 8601).
    * `version`: Optional filter to only include observations with a certain version.

  """
  @spec observations_get_many(keyword) ::
          {:ok, LangfuseSdk.Generated.ObservationsViews.t()} | {:error, map}
  def observations_get_many(opts \\ []) do
    client = opts[:client] || @default_client

    query =
      Keyword.take(opts, [
        :fromStartTime,
        :limit,
        :name,
        :page,
        :parentObservationId,
        :toStartTime,
        :traceId,
        :type,
        :userId,
        :version
      ])

    client.request(%{
      args: [],
      call: {LangfuseSdk.Generated.Observations, :observations_get_many},
      url: "/api/public/observations",
      method: :get,
      query: query,
      response: [
        {200, {LangfuseSdk.Generated.ObservationsViews, :t}},
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
