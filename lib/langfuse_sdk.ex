defmodule LangfuseSdk do
  @moduledoc """
  This module provides a set of functions for dealing with the Langfuse API.
  It exposes create and update functions that will correclty map the provided
  struct to the underlyning event format the Langfuse API can ingest.
  """

  @doc """
  Creates a single item (trace or observation).

  ## Examples

      trace = LangfuseSdk.Tracing.Trace.new(%{...})
      {:ok, ^id} = LangfuseSdk.create(trace)

      event = LangfuseSdk.Tracing.Event.new(%{...})
      {:ok, ^id} = LangfuseSdk.create(event)

      span = LangfuseSdk.Tracing.Span.new(%{...})
      {:ok, ^id} = LangfuseSdk.create(span)

      generation = LangfuseSdk.Tracing.Generation.new(%{...})
      {:ok, ^id} = LangfuseSdk.create(generation)

      score = LangfuseSdk.Tracing.Score.new(%{...})
      {:ok, ^id} = LangfuseSdk.create(score)
  """
  def create(item)

  def create(%LangfuseSdk.Tracing.Trace{} = trace) do
    trace_event = LangfuseSdk.Ingestor.to_event(trace, :create)
    LangfuseSdk.Ingestor.ingest_payload(trace_event)
  end

  def create(%LangfuseSdk.Tracing.Event{} = event) do
    updated_event = LangfuseSdk.Support.Media.replace_media(event, :event)
    event_event = LangfuseSdk.Ingestor.to_event(updated_event, :create)
    LangfuseSdk.Ingestor.ingest_payload(event_event)
  end

  def create(%LangfuseSdk.Tracing.Span{} = span) do
    span_event = LangfuseSdk.Ingestor.to_event(span, :create)
    LangfuseSdk.Ingestor.ingest_payload(span_event)
  end

  def create(%LangfuseSdk.Tracing.Generation{} = generation) do
    updated_generation = LangfuseSdk.Support.Media.replace_media(generation, :generation)
    generation_event = LangfuseSdk.Ingestor.to_event(updated_generation, :create)
    LangfuseSdk.Ingestor.ingest_payload(generation_event)
  end

  def create(%LangfuseSdk.Tracing.Score{} = score) do
    score_event = LangfuseSdk.Ingestor.to_event(score, :create)
    LangfuseSdk.Ingestor.ingest_payload(score_event)
  end

  @doc """
  Updates multiple items in a single call.
  Accepts a list of items that will be converted Langfuse API create events in a single batch.
  Batch sizes are limited to 3.5 MB in total. You need to adjust the number of items per batch accordingly.
  """
  def create_many(items) do
    items
    |> Enum.map(&LangfuseSdk.Ingestor.to_event(&1, :create))
    |> LangfuseSdk.Ingestor.ingest_payload()
  end

  @doc """
  Updates a single item (trace or observation).

  ## Examples

      trace = LangfuseSdk.Tracing.Trace.new(%{...})
      updated_trace = %{trace | name: "updated"}
      {:ok, trace_id} = LangfuseSdk.update(updated_trace)

      event = LangfuseSdk.Tracing.Event.new(%{...})
      updated_event = %{event | name: "updated"}
      {:ok, event_id} = LangfuseSdk.update(updated_event)

      span = LangfuseSdk.Tracing.Span.new(%{...})
      updated_span = %{span | name: "updated"}
      {:ok, span_id} = LangfuseSdk.update(span)

      generation = LangfuseSdk.Tracing.Generation.new(%{...})
      updated_generation = %{generation | name: "updated"}
      {:ok, generation_id} = LangfuseSdk.update(updated_generation)

      score = LangfuseSdk.Tracing.Score.new(%{...})
      updated_score = %{score | name: "updated"}
      {:ok, score_id} = LangfuseSdk.update(score)
  """
  def update(item)

  def update(%LangfuseSdk.Tracing.Span{} = span) do
    span_event = LangfuseSdk.Ingestor.to_event(span, :update)
    LangfuseSdk.Ingestor.ingest_payload(span_event)
  end

  def update(%LangfuseSdk.Tracing.Event{} = event) do
    updated_event = LangfuseSdk.Support.Media.replace_media(event, :event)
    event_event = LangfuseSdk.Ingestor.to_event(updated_event, :update)
    LangfuseSdk.Ingestor.ingest_payload(event_event)
  end

  def update(%LangfuseSdk.Tracing.Generation{} = generation) do
    updated_generation = LangfuseSdk.Support.Media.replace_media(generation, :generation)
    generation_event = LangfuseSdk.Ingestor.to_event(updated_generation, :update)
    LangfuseSdk.Ingestor.ingest_payload(generation_event)
  end

  def update(%LangfuseSdk.Tracing.Score{} = score) do
    score_event = LangfuseSdk.Ingestor.to_event(score, :update)
    LangfuseSdk.Ingestor.ingest_payload(score_event)
  end

  @doc """
  Get a list of traces.

  ## Params

  Check the [official API docs](https://api.reference.langfuse.com/#get-/api/public/traces) for the available params.

  ## Example

      LangfuseSdk.list_traces()
      {:ok, [%LangfuseSdk.Generated.TraceWithDetail{}]}

  """
  def list_traces(params \\ %{}) do
    # Always cast inbound params while the casing issue is not resolved.
    # See: https://github.com/aj-foster/open-api-generator/issues/73.

    opts = LangfuseSdk.Tracing.Trace.cast_params(params, :list)

    result = LangfuseSdk.Generated.Trace.trace_list(opts)
    with {:ok, body} <- result, do: {:ok, Map.fetch!(body, :data)}
  end

  @doc """
  Get a specific trace.
  Accepts the unique langfuse identifier of a trace.

  ## Example

    LangfuseSdk.get_trace(id)
    {:ok, trace}

  """
  def get_trace(trace_id) do
    LangfuseSdk.Generated.Trace.trace_get(trace_id)
  end

  @doc """
  Get Projects associated with API key

  ## Example

    LangfuseSdk.list_projects()
    {:ok, [%LangfuseSdk.Generated.Project{}]}

  """
  def list_projects() do
    result = LangfuseSdk.Generated.Projects.projects_get()
    with {:ok, body} <- result, do: {:ok, Map.fetch!(body, :data)}
  end
end
