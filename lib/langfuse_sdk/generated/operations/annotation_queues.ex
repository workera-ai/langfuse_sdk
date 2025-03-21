defmodule LangfuseSdk.Generated.AnnotationQueues do
  @moduledoc """
  Provides API endpoints related to annotation queues
  """

  @default_client LangfuseSdk.Support.Client

  @doc """
  post `/api/public/annotation-queues/{queueId}/items`

  Add an item to an annotation queue
  """
  @spec annotation_queues_create_queue_item(
          String.t(),
          LangfuseSdk.Generated.CreateAnnotationQueueItemRequest.t(),
          keyword
        ) :: {:ok, LangfuseSdk.Generated.AnnotationQueueItem.t()} | {:error, map}
  def annotation_queues_create_queue_item(queueId, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [queueId: queueId, body: body],
      call: {LangfuseSdk.Generated.AnnotationQueues, :annotation_queues_create_queue_item},
      url: "/api/public/annotation-queues/#{queueId}/items",
      body: body,
      method: :post,
      request: [
        {"application/json", {LangfuseSdk.Generated.CreateAnnotationQueueItemRequest, :t}}
      ],
      response: [
        {200, {LangfuseSdk.Generated.AnnotationQueueItem, :t}},
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
  delete `/api/public/annotation-queues/{queueId}/items/{itemId}`

  Remove an item from an annotation queue
  """
  @spec annotation_queues_delete_queue_item(String.t(), String.t(), keyword) ::
          {:ok, LangfuseSdk.Generated.DeleteAnnotationQueueItemResponse.t()} | {:error, map}
  def annotation_queues_delete_queue_item(queueId, itemId, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [queueId: queueId, itemId: itemId],
      call: {LangfuseSdk.Generated.AnnotationQueues, :annotation_queues_delete_queue_item},
      url: "/api/public/annotation-queues/#{queueId}/items/#{itemId}",
      method: :delete,
      response: [
        {200, {LangfuseSdk.Generated.DeleteAnnotationQueueItemResponse, :t}},
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
  get `/api/public/annotation-queues/{queueId}`

  Get an annotation queue by ID
  """
  @spec annotation_queues_get_queue(String.t(), keyword) ::
          {:ok, LangfuseSdk.Generated.AnnotationQueue.t()} | {:error, map}
  def annotation_queues_get_queue(queueId, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [queueId: queueId],
      call: {LangfuseSdk.Generated.AnnotationQueues, :annotation_queues_get_queue},
      url: "/api/public/annotation-queues/#{queueId}",
      method: :get,
      response: [
        {200, {LangfuseSdk.Generated.AnnotationQueue, :t}},
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
  get `/api/public/annotation-queues/{queueId}/items/{itemId}`

  Get a specific item from an annotation queue
  """
  @spec annotation_queues_get_queue_item(String.t(), String.t(), keyword) ::
          {:ok, LangfuseSdk.Generated.AnnotationQueueItem.t()} | {:error, map}
  def annotation_queues_get_queue_item(queueId, itemId, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [queueId: queueId, itemId: itemId],
      call: {LangfuseSdk.Generated.AnnotationQueues, :annotation_queues_get_queue_item},
      url: "/api/public/annotation-queues/#{queueId}/items/#{itemId}",
      method: :get,
      response: [
        {200, {LangfuseSdk.Generated.AnnotationQueueItem, :t}},
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
  get `/api/public/annotation-queues/{queueId}/items`

  Get items for a specific annotation queue

  ## Options

    * `status`: Filter by status
    * `page`: page number, starts at 1
    * `limit`: limit of items per page

  """
  @spec annotation_queues_list_queue_items(String.t(), keyword) ::
          {:ok, LangfuseSdk.Generated.PaginatedAnnotationQueueItems.t()} | {:error, map}
  def annotation_queues_list_queue_items(queueId, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:limit, :page, :status])

    client.request(%{
      args: [queueId: queueId],
      call: {LangfuseSdk.Generated.AnnotationQueues, :annotation_queues_list_queue_items},
      url: "/api/public/annotation-queues/#{queueId}/items",
      method: :get,
      query: query,
      response: [
        {200, {LangfuseSdk.Generated.PaginatedAnnotationQueueItems, :t}},
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
  get `/api/public/annotation-queues`

  Get all annotation queues

  ## Options

    * `page`: page number, starts at 1
    * `limit`: limit of items per page

  """
  @spec annotation_queues_list_queues(keyword) ::
          {:ok, LangfuseSdk.Generated.PaginatedAnnotationQueues.t()} | {:error, map}
  def annotation_queues_list_queues(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:limit, :page])

    client.request(%{
      args: [],
      call: {LangfuseSdk.Generated.AnnotationQueues, :annotation_queues_list_queues},
      url: "/api/public/annotation-queues",
      method: :get,
      query: query,
      response: [
        {200, {LangfuseSdk.Generated.PaginatedAnnotationQueues, :t}},
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
  patch `/api/public/annotation-queues/{queueId}/items/{itemId}`

  Update an annotation queue item
  """
  @spec annotation_queues_update_queue_item(
          String.t(),
          String.t(),
          LangfuseSdk.Generated.UpdateAnnotationQueueItemRequest.t(),
          keyword
        ) :: {:ok, LangfuseSdk.Generated.AnnotationQueueItem.t()} | {:error, map}
  def annotation_queues_update_queue_item(queueId, itemId, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [queueId: queueId, itemId: itemId, body: body],
      call: {LangfuseSdk.Generated.AnnotationQueues, :annotation_queues_update_queue_item},
      url: "/api/public/annotation-queues/#{queueId}/items/#{itemId}",
      body: body,
      method: :patch,
      request: [
        {"application/json", {LangfuseSdk.Generated.UpdateAnnotationQueueItemRequest, :t}}
      ],
      response: [
        {200, {LangfuseSdk.Generated.AnnotationQueueItem, :t}},
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
