defmodule LangfuseSdk.Generated.Comments do
  @moduledoc """
  Provides API endpoints related to comments
  """

  @default_client LangfuseSdk.Support.Client

  @doc """
  post `/api/public/comments`

  Create a comment. Comments may be attached to different object types (trace, observation, session, prompt).
  """
  @spec comments_create(LangfuseSdk.Generated.CreateCommentRequest.t(), keyword) ::
          {:ok, LangfuseSdk.Generated.CreateCommentResponse.t()} | {:error, map}
  def comments_create(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {LangfuseSdk.Generated.Comments, :comments_create},
      url: "/api/public/comments",
      body: body,
      method: :post,
      request: [{"application/json", {LangfuseSdk.Generated.CreateCommentRequest, :t}}],
      response: [
        {200, {LangfuseSdk.Generated.CreateCommentResponse, :t}},
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
  get `/api/public/comments`

  Get all comments

  ## Options

    * `page`: Page number, starts at 1.
    * `limit`: Limit of items per page. If you encounter api issues due to too large page sizes, try to reduce the limit
    * `objectType`: Filter comments by object type (trace, observation, session, prompt).
    * `objectId`: Filter comments by object id. If objectType is not provided, an error will be thrown.
    * `authorUserId`: Filter comments by author user id.

  """
  @spec comments_get(keyword) ::
          {:ok, LangfuseSdk.Generated.GetCommentsResponse.t()} | {:error, map}
  def comments_get(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:authorUserId, :limit, :objectId, :objectType, :page])

    client.request(%{
      args: [],
      call: {LangfuseSdk.Generated.Comments, :comments_get},
      url: "/api/public/comments",
      method: :get,
      query: query,
      response: [
        {200, {LangfuseSdk.Generated.GetCommentsResponse, :t}},
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
  get `/api/public/comments/{commentId}`

  Get a comment by id
  """
  @spec comments_get_by_id(String.t(), keyword) ::
          {:ok, LangfuseSdk.Generated.Comment.t()} | {:error, map}
  def comments_get_by_id(commentId, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [commentId: commentId],
      call: {LangfuseSdk.Generated.Comments, :comments_get_by_id},
      url: "/api/public/comments/#{commentId}",
      method: :get,
      response: [
        {200, {LangfuseSdk.Generated.Comment, :t}},
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
