defmodule LangfuseSdk.Generated.Health do
  @moduledoc """
  Provides API endpoint related to health
  """

  @default_client LangfuseSdk.Support.Client

  @doc """
  get `/api/public/health`

  Check health of API and database
  """
  @spec health_health(keyword) :: {:ok, LangfuseSdk.Generated.HealthResponse.t()} | {:error, map}
  def health_health(opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [],
      call: {LangfuseSdk.Generated.Health, :health_health},
      url: "/api/public/health",
      method: :get,
      response: [
        {200, {LangfuseSdk.Generated.HealthResponse, :t}},
        {400, :map},
        {401, :map},
        {403, :map},
        {404, :map},
        {405, :map},
        {503, :null}
      ],
      opts: opts
    })
  end
end
