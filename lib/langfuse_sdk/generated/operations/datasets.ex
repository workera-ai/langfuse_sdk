defmodule LangfuseSdk.Generated.Datasets do
  @moduledoc """
  Provides API endpoints related to datasets
  """

  @default_client LangfuseSdk.Support.Client

  @doc """
  post `/api/public/v2/datasets`

  Create a dataset
  """
  @spec datasets_create(LangfuseSdk.Generated.CreateDatasetRequest.t(), keyword) ::
          {:ok, LangfuseSdk.Generated.Dataset.t()} | {:error, map}
  def datasets_create(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {LangfuseSdk.Generated.Datasets, :datasets_create},
      url: "/api/public/v2/datasets",
      body: body,
      method: :post,
      request: [{"application/json", {LangfuseSdk.Generated.CreateDatasetRequest, :t}}],
      response: [
        {200, {LangfuseSdk.Generated.Dataset, :t}},
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
  delete `/api/public/datasets/{datasetName}/runs/{runName}`

  Delete a dataset run and all its run items. This action is irreversible.
  """
  @spec datasets_delete_run(String.t(), String.t(), keyword) ::
          {:ok, LangfuseSdk.Generated.DeleteDatasetRunResponse.t()} | {:error, map}
  def datasets_delete_run(datasetName, runName, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [datasetName: datasetName, runName: runName],
      call: {LangfuseSdk.Generated.Datasets, :datasets_delete_run},
      url: "/api/public/datasets/#{datasetName}/runs/#{runName}",
      method: :delete,
      response: [
        {200, {LangfuseSdk.Generated.DeleteDatasetRunResponse, :t}},
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
  get `/api/public/v2/datasets/{datasetName}`

  Get a dataset
  """
  @spec datasets_get(String.t(), keyword) ::
          {:ok, LangfuseSdk.Generated.Dataset.t()} | {:error, map}
  def datasets_get(datasetName, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [datasetName: datasetName],
      call: {LangfuseSdk.Generated.Datasets, :datasets_get},
      url: "/api/public/v2/datasets/#{datasetName}",
      method: :get,
      response: [
        {200, {LangfuseSdk.Generated.Dataset, :t}},
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
  get `/api/public/datasets/{datasetName}/runs/{runName}`

  Get a dataset run and its items
  """
  @spec datasets_get_run(String.t(), String.t(), keyword) ::
          {:ok, LangfuseSdk.Generated.DatasetRunWithItems.t()} | {:error, map}
  def datasets_get_run(datasetName, runName, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [datasetName: datasetName, runName: runName],
      call: {LangfuseSdk.Generated.Datasets, :datasets_get_run},
      url: "/api/public/datasets/#{datasetName}/runs/#{runName}",
      method: :get,
      response: [
        {200, {LangfuseSdk.Generated.DatasetRunWithItems, :t}},
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
  get `/api/public/datasets/{datasetName}/runs`

  Get dataset runs

  ## Options

    * `page`: page number, starts at 1
    * `limit`: limit of items per page

  """
  @spec datasets_get_runs(String.t(), keyword) ::
          {:ok, LangfuseSdk.Generated.PaginatedDatasetRuns.t()} | {:error, map}
  def datasets_get_runs(datasetName, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:limit, :page])

    client.request(%{
      args: [datasetName: datasetName],
      call: {LangfuseSdk.Generated.Datasets, :datasets_get_runs},
      url: "/api/public/datasets/#{datasetName}/runs",
      method: :get,
      query: query,
      response: [
        {200, {LangfuseSdk.Generated.PaginatedDatasetRuns, :t}},
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
  get `/api/public/v2/datasets`

  Get all datasets

  ## Options

    * `page`: page number, starts at 1
    * `limit`: limit of items per page

  """
  @spec datasets_list(keyword) ::
          {:ok, LangfuseSdk.Generated.PaginatedDatasets.t()} | {:error, map}
  def datasets_list(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:limit, :page])

    client.request(%{
      args: [],
      call: {LangfuseSdk.Generated.Datasets, :datasets_list},
      url: "/api/public/v2/datasets",
      method: :get,
      query: query,
      response: [
        {200, {LangfuseSdk.Generated.PaginatedDatasets, :t}},
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
