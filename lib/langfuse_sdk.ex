defmodule LangfuseSdk do
  @moduledoc false
  alias LangfuseSdk.Generated.Ingestion

  def create_trace(
        %{
          name: name,
          input: input,
          output: output,
          user_id: user_id,
          session_id: session_id
        } = trace_data
      ) do
    tags = Map.get(trace_data, :tags, [])

    trace_id = UUID.uuid4()
    metadata = Map.get(trace_data, :metadata, "UNKNOWN")

    trace = %{
      metadata: metadata,
      batch: [
        %{
          id: trace_id,
          timestamp: DateTime.utc_now() |> DateTime.to_iso8601(),
          type: "trace-create",
          metadata: metadata,
          body: %{
            id: trace_id,
            input: input,
            name: name,
            output: output,
            public: true,
            version: "1",
            metadata: metadata,
            userId: user_id,
            sessionId: session_id,
            release: "1",
            tags: tags
          }
        }
      ]
    }

    Ingestion.ingestion_batch(trace)
  end

  def create_score(
        trace_id,
        name,
        value,
        comment
      ) do
    score_id = UUID.uuid4()

    score = %{
      metadata: "UNKNOWN",
      batch: [
        %{
          id: score_id,
          timestamp: DateTime.utc_now() |> DateTime.to_iso8601(),
          type: "score-create",
          body: %{
            id: score_id,
            traceId: trace_id,
            name: name,
            value: value,
            comment: comment
          }
        }
      ]
    }

    Ingestion.ingestion_batch(score)
  end
end
