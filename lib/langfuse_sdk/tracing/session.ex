defmodule LangfuseSdk.Tracing.Session do
  @moduledoc """
  This module handles every entity associated with a LangFuse session.
  Traces and observations (events, spans and generations) are flattened
  because we handle them using distributed traces. This means that instead
  of storing traces with the nested observations (hierarchically), each observation
  gets assigned the proper `trace_id` when its logged (the last one added to the session).
  """

  alias __MODULE__

  alias LangfuseSdk.Tracing.Event
  alias LangfuseSdk.Tracing.Generation
  alias LangfuseSdk.Tracing.Span
  alias LangfuseSdk.Tracing.Trace
  alias LangfuseSdk.Support.Value

  defstruct [:id, traces: [], events: [], spans: [], generations: []]

  def new(id), do: %Session{id: id}

  def parent_trace(%Session{traces: []}), do: nil
  def parent_trace(%Session{traces: [trace | _]}), do: trace

  def add_trace(%Session{} = session, %Trace{} = trace) do
    trace = %{trace | session_id: session.id}
    Map.update!(session, :traces, &[trace | &1])
  end

  def add_event(%Session{} = session, %Event{} = event) do
    Map.update!(session, :events, &[event | &1])
  end

  def add_span(%Session{} = session, %Span{} = span) do
    Map.update!(session, :spans, &[span | &1])
  end

  def add_generation(%Session{} = session, %Generation{} = generation) do
    Map.update!(session, :generations, &[generation | &1])
  end

  def update_trace(%Session{} = session, new) do
    update_entity(session, :traces, new)
  end

  def update_event(%Session{} = session, new) do
    update_entity(session, :events, new)
  end

  def update_span(%Session{} = session, new) do
    update_entity(session, :spans, new)
  end

  def update_generation(%Session{} = session, new) do
    update_entity(session, :generations, new)
  end

  def nest_observation(%Session{} = session, observation) do
    put_parent_trace_id(observation, session)
  end

  defp put_parent_trace_id(observation, session) do
    parent_id = get_in(parent_trace(session).id)
    Value.force_new(observation, :trace_id, parent_id)
  end

  defp update_entity(%Session{} = session, key, new) do
    %{id: new_id} = new

    Map.update!(session, key, fn entities ->
      Enum.map(entities, fn
        %{id: ^new_id} -> new
        entity -> entity
      end)
    end)
  end
end
