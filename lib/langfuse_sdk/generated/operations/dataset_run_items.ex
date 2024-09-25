defmodule LangfuseSdk.Generated.DatasetRunItems do
  @moduledoc """
  Provides API endpoint related to dataset run items
  """

  @default_client LangfuseSdk.Support.Client

  @doc """
  post `/api/public/dataset-run-items`

  Create a dataset run item
  """
  @spec dataset_run_items_create(LangfuseSdk.Generated.CreateDatasetRunItemRequest.t(), keyword) ::
          {:ok, LangfuseSdk.Generated.DatasetRunItem.t()} | {:error, map}
  def dataset_run_items_create(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {LangfuseSdk.Generated.DatasetRunItems, :dataset_run_items_create},
      url: "/api/public/dataset-run-items",
      body: body,
      method: :post,
      request: [{"application/json", {LangfuseSdk.Generated.CreateDatasetRunItemRequest, :t}}],
      response: [
        {200, {LangfuseSdk.Generated.DatasetRunItem, :t}},
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
