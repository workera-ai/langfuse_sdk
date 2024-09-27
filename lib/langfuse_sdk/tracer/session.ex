defmodule LangfuseSdk.Tracer.Session do
  @moduledoc """
  This module handles every entity associated with a LangFuse session.
  Traces and observations (events, spans and generations) are flattened
  because we handle them using distributed traces. This means that instead
  of storing traces with the nested observations (hierarchically), each observation
  gets assigned the proper `trace_id` when its logged (the last one added to the session).
  """

  alias __MODULE__

  alias LangfuseSdk.Tracer.Event
  alias LangfuseSdk.Tracer.Generation
  alias LangfuseSdk.Tracer.Span
  alias LangfuseSdk.Tracer.Trace
  alias LangfuseSdk.Support.Value

  @derive {Inspect, except: [:__parent__]}
  defstruct [:__parent__, :id, traces: [], events: [], spans: [], generations: []]

  def new(id), do: %Session{id: id}

  def parent_trace(%Session{traces: []}), do: nil
  def parent_trace(%Session{traces: [trace | _]}), do: trace

  def parent_event(%Session{events: []}), do: nil
  def parent_event(%Session{events: [event | _]}), do: event

  def parent_span(%Session{spans: []}), do: nil
  def parent_span(%Session{spans: [span | _]}), do: span

  def parent_generation(%Session{generations: []}), do: nil
  def parent_generation(%Session{generations: [generation | _]}), do: generation

  def add_trace(%Session{} = session, %Trace{} = trace) do
    session
    |> Map.update!(:traces, &[trace | &1])
    |> Map.put(:__parent__, trace)
  end

  def update_trace(%Session{} = session, fun) do
    case parent_trace(session) do
      nil ->
        raise "No traces in the session"

      trace ->
        updated = fun.(trace)
        traces = [updated | tl(session.traces)]
        %{session | traces: traces}
    end
  end

  def add_event(%Session{} = session, %Event{} = event) do
    session
    |> Map.update!(:events, &[event | &1])
    |> Map.put(:__parent__, event)
  end

  def update_event(%Session{} = session, fun) do
    case parent_event(session) do
      nil ->
        raise "No events in the session"

      event ->
        updated = fun.(event)
        events = [updated | tl(session.events)]
        %{session | events: events}
    end
  end

  def add_span(%Session{} = session, %Span{} = span) do
    session
    |> Map.update!(:spans, &[span | &1])
    |> Map.put(:__parent__, span)
  end

  def update_span(%Session{} = session, fun) do
    case parent_span(session) do
      nil ->
        raise "No spans in the session"

      span ->
        updated = fun.(span)
        spans = [updated | tl(session.spans)]
        %{session | spans: spans}
    end
  end

  def add_generation(%Session{} = session, %Generation{} = generation) do
    session
    |> Map.update!(:generations, &[generation | &1])
    |> Map.put(:__parent__, generation)
  end

  def update_generation(%Session{} = session, fun) do
    case parent_generation(session) do
      nil ->
        raise "No generations in the session"

      generation ->
        updated = fun.(generation)
        generations = [updated | tl(session.generations)]
        %{session | generations: generations}
    end
  end

  def nest_observation(%Session{} = session, observation) do
    observation
    |> put_parent_trace_id(session)
    |> put_parent_observation_id(session)
  end

  defp put_parent_observation_id(observation, session) do
    parent_id = get_in(session.__parent__.id)
    Value.force_new(observation, :parent_observation_id, parent_id)
  end

  defp put_parent_trace_id(observation, session) do
    parent_id = get_in(parent_trace(session).id)
    Value.force_new(observation, :trace_id, parent_id)
  end
end
