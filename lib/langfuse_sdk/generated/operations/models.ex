defmodule LangfuseSdk.Generated.Models do
  @moduledoc """
  Provides API endpoints related to models
  """

  @default_client LangfuseSdk.Support.Client

  @doc """
  post `/api/public/models`

  Create a model
  """
  @spec models_create(LangfuseSdk.Generated.CreateModelRequest.t(), keyword) ::
          {:ok, LangfuseSdk.Generated.Model.t()} | {:error, map}
  def models_create(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {LangfuseSdk.Generated.Models, :models_create},
      url: "/api/public/models",
      body: body,
      method: :post,
      request: [{"application/json", {LangfuseSdk.Generated.CreateModelRequest, :t}}],
      response: [
        {200, {LangfuseSdk.Generated.Model, :t}},
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
  delete `/api/public/models/{id}`

  Delete a model. Cannot delete models managed by Langfuse. You can create your own definition with the same modelName to override the definition though.
  """
  @spec models_delete(String.t(), keyword) :: :ok | {:error, map}
  def models_delete(id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id],
      call: {LangfuseSdk.Generated.Models, :models_delete},
      url: "/api/public/models/#{id}",
      method: :delete,
      response: [{204, :null}, {400, :map}, {401, :map}, {403, :map}, {404, :map}, {405, :map}],
      opts: opts
    })
  end

  @doc """
  get `/api/public/models/{id}`

  Get a model
  """
  @spec models_get(String.t(), keyword) :: {:ok, LangfuseSdk.Generated.Model.t()} | {:error, map}
  def models_get(id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id],
      call: {LangfuseSdk.Generated.Models, :models_get},
      url: "/api/public/models/#{id}",
      method: :get,
      response: [
        {200, {LangfuseSdk.Generated.Model, :t}},
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
  get `/api/public/models`

  Get all models

  ## Options

    * `page`: page number, starts at 1
    * `limit`: limit of items per page

  """
  @spec models_list(keyword) :: {:ok, LangfuseSdk.Generated.PaginatedModels.t()} | {:error, map}
  def models_list(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:limit, :page])

    client.request(%{
      args: [],
      call: {LangfuseSdk.Generated.Models, :models_list},
      url: "/api/public/models",
      method: :get,
      query: query,
      response: [
        {200, {LangfuseSdk.Generated.PaginatedModels, :t}},
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
