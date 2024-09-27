defmodule LangfuseSdk.Ingestion do
  require Logger

  alias LangfuseSdk.Generated.Ingestion
  alias LangfuseSdk.Tracer.Trace
  alias LangfuseSdk.Tracer.Event
  alias LangfuseSdk.Tracer.Span
  alias LangfuseSdk.Tracer.Generation
  alias LangfuseSdk.Tracer.Session

  def ingest_traces(%Session{traces: traces}) do
    traces
    |> Enum.map(&to_event/1)
    |> ingest_payload_events()
  end

  def ingest_events(%Session{events: events}) do
    events
    |> Enum.map(&to_event/1)
    |> ingest_payload_events()
  end

  def ingest_spans(%Session{spans: spans}) do
    spans
    |> Enum.map(&to_event/1)
    |> ingest_payload_events()
  end

  def ingest_generations(%Session{generations: generations}) do
    generations
    |> Enum.map(&to_event/1)
    |> ingest_payload_events()
  end

  defp to_event(%Trace{} = trace) do
    %{
      "type" => "trace-create",
      "id" => trace.id,
      "timestamp" => trace.timestamp,
      "metadata" => trace.metadata,
      "body" => %{
        "id" => trace.id,
        "timestamp" => trace.timestamp,
        "name" => trace.name,
        "userId" => trace.user_id,
        "input" => trace.input,
        "output" => trace.output,
        "sessionId" => trace.session_id,
        "release" => nil,
        "version" => trace.version,
        "metadata" => trace.metadata,
        "tags" => trace.tags,
        "public" => trace.public
      }
    }
  end

  defp to_event(%Event{} = event) do
    %{
      "type" => "event-create",
      "id" => event.id,
      "timestamp" => event.timestamp,
      "metadata" => event.metadata,
      "body" => %{
        "traceId" => event.trace_id,
        "name" => event.name,
        "startTime" => event.start_time,
        "metadata" => event.metadata,
        "input" => event.input,
        "output" => event.output,
        "level" => event.level,
        "statusMessage" => event.status_message,
        "parentObservationId" => event.parent_observation_id,
        "version" => event.version,
        "id" => event.id
      }
    }
  end

  defp to_event(%Span{} = span) do
    %{
      "type" => "span-create",
      "id" => span.id,
      "timestamp" => span.timestamp,
      "metadata" => span.metadata,
      "body" => %{
        "traceId" => span.trace_id,
        "name" => span.name,
        "startTime" => span.start_time,
        "metadata" => span.metadata,
        "input" => span.input,
        "output" => span.output,
        "level" => span.level,
        "statusMessage" => span.status_message,
        "parentObservationId" => span.parent_observation_id,
        "version" => span.version,
        "id" => span.id,
        "endTime" => span.end_time
      }
    }
  end

  defp to_event(%Generation{} = generation) do
    %{
      "type" => "generation-create",
      "id" => generation.id,
      "timestamp" => generation.timestamp,
      "metadata" => generation.metadata,
      "body" => %{
        "traceId" => generation.trace_id,
        "name" => generation.name,
        "startTime" => generation.start_time,
        "metadata" => generation.metadata,
        "input" => generation.input,
        "output" => generation.output,
        "level" => generation.level,
        "statusMessage" => generation.status_message,
        "parentObservationId" => generation.parent_observation_id,
        "version" => generation.version,
        "id" => generation.id,
        "endTime" => generation.end_time,
        "completionStartTime" => generation.completion_start_time,
        "model" => generation.model,
        "modelParameters" => generation.model_parameters,
        "usage" => generation.usage
      }
    }
  end

  defp ingest_payload_events(items) do
    items
    |> Enum.chunk_every(10)
    |> Enum.each(fn batch ->
      payload = %{"metadata" => nil, "batch" => batch}
      Logger.info("Ingesting Langfuse batch... \n #{inspect(payload)}")
      Ingestion.ingestion_batch(payload)
    end)
  end
end
