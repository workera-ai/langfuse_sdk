defmodule LangfuseSdk.Ingestor do
  @moduledoc false
  alias LangfuseSdk.Generated.Ingestion
  alias LangfuseSdk.Tracing.Event
  alias LangfuseSdk.Tracing.Generation
  alias LangfuseSdk.Tracing.Score
  alias LangfuseSdk.Tracing.Span
  alias LangfuseSdk.Tracing.Trace

  require Logger

  def ingest_payload(items, metadata \\ nil) do
    payload = %{"metadata" => metadata, "batch" => List.wrap(items)}

    case Ingestion.ingestion_batch(payload) do
      {:ok, %{"errors" => [], "successes" => [success]}} ->
        {:ok, Map.fetch!(success, "id")}

      {:ok, %{"errors" => [], "successes" => success}} ->
        {:ok, Enum.map(success, &Map.fetch!(&1, "id"))}

      {:ok, %{"errors" => errors, "successes" => []}} ->
        error = get_in(errors, [Access.at!(0), "error"])
        {:error, Jason.decode!(error)}

      {:error, reason} ->
        {:error, reason}
    end
  end

  def to_event(%Trace{} = trace, operation) do
    %{
      "type" => event_type(Trace, operation),
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

  def to_event(%Event{} = event, operation) do
    %{
      "type" => event_type(Event, operation),
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

  def to_event(%Span{} = span, operation) do
    %{
      "type" => event_type(Span, operation),
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

  def to_event(%Generation{} = generation, operation) do
    %{
      "type" => event_type(Generation, operation),
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

  def to_event(%Score{} = score, operation) do
    %{
      "type" => event_type(Score, operation),
      "id" => score.id,
      "timestamp" => score.timestamp,
      "metadata" => score.metadata,
      "body" => %{
        "id" => score.id,
        "traceId" => score.trace_id,
        "name" => score.name,
        "value" => score.value,
        "observationId" => score.observation_id,
        "comment" => score.comment,
        "dataType" => score.data_type,
        "configId" => score.config_id
      }
    }
  end

  defp event_type(module, operation) do
    module
    |> Module.split()
    |> List.last()
    |> String.downcase()
    |> then(&"#{&1}-#{operation}")
  end
end
