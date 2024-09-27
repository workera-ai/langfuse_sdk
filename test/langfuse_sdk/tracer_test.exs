defmodule LangfuseSdk.Tracing.TracerTest do
  use ExUnit.Case

  alias LangfuseSdk.Tracer
  alias LangfuseSdk.Tracer.Event
  alias LangfuseSdk.Tracer.Generation
  alias LangfuseSdk.Tracer.Session
  alias LangfuseSdk.Tracer.Span
  alias LangfuseSdk.Tracer.Trace

  describe "tracer client API" do
    test "create_trace/2" do
      {:ok, pid} = Tracer.start_link()

      data = %{name: "trace-name"}
      trace = Tracer.create_trace(pid, data)

      assert %Trace{name: "trace-name"} = trace
    end

    test "create_event/2" do
      {:ok, pid} = Tracer.start_link()

      data = %{name: "event-name"}
      event = Tracer.create_event(pid, data)

      assert %Event{name: "event-name"} = event
    end

    test "create_span/2" do
      {:ok, pid} = Tracer.start_link()

      data = %{name: "span-name"}
      span = Tracer.create_span(pid, data)

      assert %Span{name: "span-name"} = span
    end

    test "create_generation/2" do
      {:ok, pid} = Tracer.start_link()

      data = %{name: "generation-name"}
      generation = Tracer.create_generation(pid, data)

      assert %Generation{name: "generation-name"} = generation
    end

    test "update_trace/2" do
      {:ok, pid} = Tracer.start_link()

      data = %{name: "trace-name"}
      Tracer.create_trace(pid, data)
      :ok = Tracer.update_trace(pid, &Map.put(&1, :name, "updated-trace-name"))

      %Session{traces: [trace | _]} = Tracer.get_session(pid)

      assert %Trace{name: "updated-trace-name"} = trace
    end

    test "update_event/2" do
      {:ok, pid} = Tracer.start_link()

      data = %{name: "event-name"}
      Tracer.create_event(pid, data)
      :ok = Tracer.update_event(pid, &Map.put(&1, :name, "updated-event-name"))

      %Session{events: [event | _]} = Tracer.get_session(pid)

      assert %Event{name: "updated-event-name"} = event
    end

    test "update_span/2" do
      {:ok, pid} = Tracer.start_link()

      data = %{name: "span-name"}
      Tracer.create_span(pid, data)
      :ok = Tracer.update_span(pid, &Map.put(&1, :name, "updated-span-name"))

      %Session{spans: [span | _]} = Tracer.get_session(pid)

      assert %Span{name: "updated-span-name"} = span
    end

    test "update_generation/2" do
      {:ok, pid} = Tracer.start_link()

      data = %{name: "generation-name"}
      Tracer.create_generation(pid, data)
      :ok = Tracer.update_generation(pid, &Map.put(&1, :name, "updated-generation-name"))

      %Session{generations: [generation | _]} = Tracer.get_session(pid)

      assert %Generation{name: "updated-generation-name"} = generation
    end
  end

  describe "tracer automatic nesting" do
    {:ok, pid} = Tracer.start_link()

    Tracer.create_trace(pid, %{name: "trace-name"})
    Tracer.create_event(pid, %{name: "event-name"})
    Tracer.create_span(pid, %{name: "span-name"})
    Tracer.create_generation(pid, %{name: "observation-name"})

    %{
      traces: [trace],
      events: [event],
      spans: [span],
      generations: [generation]
    } =
      Tracer.get_session(pid)

    assert event.trace_id == trace.id
    assert event.parent_observation_id == trace.id

    assert span.trace_id == trace.id
    assert span.parent_observation_id == event.id

    assert generation.trace_id == trace.id
    assert generation.parent_observation_id == span.id
  end
end
