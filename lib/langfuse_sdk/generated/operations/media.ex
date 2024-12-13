defmodule LangfuseSdk.Generated.Media do
  @moduledoc """
  Provides API endpoints related to media
  """

  @default_client LangfuseSdk.Support.Client

  @doc """
  get `/api/public/media/{mediaId}`

  Get a media record
  """
  @spec media_get(String.t(), keyword) ::
          {:ok, LangfuseSdk.Generated.GetMediaResponse.t()} | {:error, map}
  def media_get(mediaId, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [mediaId: mediaId],
      call: {LangfuseSdk.Generated.Media, :media_get},
      url: "/api/public/media/#{mediaId}",
      method: :get,
      response: [
        {200, {LangfuseSdk.Generated.GetMediaResponse, :t}},
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
  post `/api/public/media`

  Get a presigned upload URL for a media record
  """
  @spec media_get_upload_url(LangfuseSdk.Generated.GetMediaUploadUrlRequest.t(), keyword) ::
          {:ok, LangfuseSdk.Generated.GetMediaUploadUrlResponse.t()} | {:error, map}
  def media_get_upload_url(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {LangfuseSdk.Generated.Media, :media_get_upload_url},
      url: "/api/public/media",
      body: body,
      method: :post,
      request: [{"application/json", {LangfuseSdk.Generated.GetMediaUploadUrlRequest, :t}}],
      response: [
        {200, {LangfuseSdk.Generated.GetMediaUploadUrlResponse, :t}},
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
  patch `/api/public/media/{mediaId}`

  Patch a media record
  """
  @spec media_patch(String.t(), LangfuseSdk.Generated.PatchMediaBody.t(), keyword) ::
          :ok | {:error, map}
  def media_patch(mediaId, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [mediaId: mediaId, body: body],
      call: {LangfuseSdk.Generated.Media, :media_patch},
      url: "/api/public/media/#{mediaId}",
      body: body,
      method: :patch,
      request: [{"application/json", {LangfuseSdk.Generated.PatchMediaBody, :t}}],
      response: [{204, :null}, {400, :map}, {401, :map}, {403, :map}, {404, :map}, {405, :map}],
      opts: opts
    })
  end
end
