defmodule LangfuseSdk.Generated.Ingestion do
  @moduledoc """
  Provides API endpoint related to ingestion
  """

  @default_client LangfuseSdk.Support.Client

  @doc """
  post `/api/public/ingestion`

  Batched ingestion for Langfuse Tracing.
  If you want to use tracing via the API, such as to build your own Langfuse client implementation, this is the only API route you need to implement.

  Within each batch, there can be multiple events.
  Each event has a type, an id, a timestamp, metadata and a body.
  Internally, we refer to this as the "event envelope" as it tells us something about the event but not the trace.
  We use the event id within this envelope to deduplicate messages to avoid processing the same event twice, i.e. the event id should be unique per request.
  The event.body.id is the ID of the actual trace and will be used for updates and will be visible within the Langfuse App.
  I.e. if you want to update a trace, you'd use the same body id, but separate event IDs.

  Notes:
  - Introduction to data model: https://langfuse.com/docs/tracing-data-model
  - Batch sizes are limited to 3.5 MB in total. You need to adjust the number of events per batch accordingly.
  - The API does not return a 4xx status code for input errors. Instead, it responds with a 207 status code, which includes a list of the encountered errors.
  """
  @spec ingestion_batch(map, keyword) ::
          {:ok, LangfuseSdk.Generated.IngestionResponse.t()} | {:error, map}
  def ingestion_batch(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {LangfuseSdk.Generated.Ingestion, :ingestion_batch},
      url: "/api/public/ingestion",
      body: body,
      method: :post,
      request: [{"application/json", :map}],
      response: [
        {201, {LangfuseSdk.Generated.IngestionResponse, :t}},
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
