defmodule LangfuseSdk.Generated.DatasetItems do
  @moduledoc """
  Provides API endpoints related to dataset items
  """

  @default_client LangfuseSdk.Support.Client

  @doc """
  post `/api/public/dataset-items`

  Create a dataset item
  """
  @spec dataset_items_create(LangfuseSdk.Generated.CreateDatasetItemRequest.t(), keyword) ::
          {:ok, LangfuseSdk.Generated.DatasetItem.t()} | {:error, map}
  def dataset_items_create(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {LangfuseSdk.Generated.DatasetItems, :dataset_items_create},
      url: "/api/public/dataset-items",
      body: body,
      method: :post,
      request: [{"application/json", {LangfuseSdk.Generated.CreateDatasetItemRequest, :t}}],
      response: [
        {200, {LangfuseSdk.Generated.DatasetItem, :t}},
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
  delete `/api/public/dataset-items/{id}`

  Delete a dataset item and all its run items. This action is irreversible.
  """
  @spec dataset_items_delete(String.t(), keyword) ::
          {:ok, LangfuseSdk.Generated.DeleteDatasetItemResponse.t()} | {:error, map}
  def dataset_items_delete(id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id],
      call: {LangfuseSdk.Generated.DatasetItems, :dataset_items_delete},
      url: "/api/public/dataset-items/#{id}",
      method: :delete,
      response: [
        {200, {LangfuseSdk.Generated.DeleteDatasetItemResponse, :t}},
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
  get `/api/public/dataset-items/{id}`

  Get a dataset item
  """
  @spec dataset_items_get(String.t(), keyword) ::
          {:ok, LangfuseSdk.Generated.DatasetItem.t()} | {:error, map}
  def dataset_items_get(id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id],
      call: {LangfuseSdk.Generated.DatasetItems, :dataset_items_get},
      url: "/api/public/dataset-items/#{id}",
      method: :get,
      response: [
        {200, {LangfuseSdk.Generated.DatasetItem, :t}},
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
  get `/api/public/dataset-items`

  Get dataset items

  ## Options

    * `datasetName`
    * `sourceTraceId`
    * `sourceObservationId`
    * `page`: page number, starts at 1
    * `limit`: limit of items per page

  """
  @spec dataset_items_list(keyword) ::
          {:ok, LangfuseSdk.Generated.PaginatedDatasetItems.t()} | {:error, map}
  def dataset_items_list(opts \\ []) do
    client = opts[:client] || @default_client

    query =
      Keyword.take(opts, [:datasetName, :limit, :page, :sourceObservationId, :sourceTraceId])

    client.request(%{
      args: [],
      call: {LangfuseSdk.Generated.DatasetItems, :dataset_items_list},
      url: "/api/public/dataset-items",
      method: :get,
      query: query,
      response: [
        {200, {LangfuseSdk.Generated.PaginatedDatasetItems, :t}},
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
