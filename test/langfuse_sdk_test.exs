defmodule LangfuseSdkTest do
  use ExUnit.Case

  describe "LangfuseSdk" do
    test "create traces" do
      trace_data = LangfuseSdk.Factory.trace_data()

      %{id: id} = trace = LangfuseSdk.Tracing.Trace.new(trace_data)
      assert {:ok, ^id} = LangfuseSdk.create(trace)
    end

    test "list traces" do
      trace_data = LangfuseSdk.Factory.trace_data()
      trace = LangfuseSdk.Tracing.Trace.new(trace_data)

      {:ok, id} = LangfuseSdk.create(trace)
      {:ok, traces} = LangfuseSdk.list_traces()

      trace = Enum.find(traces, fn trace -> trace.id == id end)
      assert %LangfuseSdk.Generated.TraceWithDetails{} = trace
    end

    test "list traces with opts" do
      trace_data = LangfuseSdk.Factory.trace_data()
      trace = LangfuseSdk.Tracing.Trace.new(trace_data)

      {:ok, _id} = LangfuseSdk.create(trace)
      {:ok, traces} = LangfuseSdk.list_traces(session_id: trace.session_id)

      assert Enum.all?(traces, fn t -> t.session_id == trace.session_id end)
    end

    test "get trace" do
      trace_data = LangfuseSdk.Factory.trace_data()
      trace = LangfuseSdk.Tracing.Trace.new(trace_data)

      {:ok, id} = LangfuseSdk.create(trace)

      assert {:ok, %{"id" => ^id}} = LangfuseSdk.get_trace(id)
    end

    test "create events" do
      event_data = LangfuseSdk.Factory.event_data()
      %{id: id} = event = LangfuseSdk.Tracing.Event.new(event_data)

      assert {:ok, ^id} = LangfuseSdk.create(event)
    end

    test "create/update spans" do
      span_data = LangfuseSdk.Factory.span_data()
      %{id: id} = span = LangfuseSdk.Tracing.Span.new(span_data)

      assert {:ok, ^id} = LangfuseSdk.create(span)
      assert {:ok, ^id} = LangfuseSdk.update(%{span | name: "updated-span"})
    end

    test "create/update generations" do
      generation_data = LangfuseSdk.Factory.generation_data()
      %{id: id} = generation = LangfuseSdk.Tracing.Generation.new(generation_data)

      assert {:ok, ^id} = LangfuseSdk.create(generation)
      assert {:ok, ^id} = LangfuseSdk.update(%{generation | name: "updated-generation"})
    end

    test "create scores" do
      trace_data = LangfuseSdk.Factory.trace_data()
      trace = LangfuseSdk.Tracing.Trace.new(trace_data)

      score_data = LangfuseSdk.Factory.score_data(trace.id)
      %{id: id} = score = LangfuseSdk.Tracing.Score.new(score_data)

      assert {:ok, ^id} = LangfuseSdk.create(score)
    end

    test "create many" do
      trace_data = LangfuseSdk.Factory.trace_data()
      trace = LangfuseSdk.Tracing.Trace.new(trace_data)

      event_data = LangfuseSdk.Factory.event_data(trace.id)
      event = LangfuseSdk.Tracing.Event.new(event_data)

      span_data = LangfuseSdk.Factory.span_data(trace.id)
      span = LangfuseSdk.Tracing.Span.new(span_data)

      generation_data = LangfuseSdk.Factory.generation_data(trace.id)
      generation = LangfuseSdk.Tracing.Generation.new(generation_data)

      score_data = LangfuseSdk.Factory.score_data(trace.id)
      score = LangfuseSdk.Tracing.Score.new(score_data)

      items = [trace, event, span, score, generation]

      assert {:ok, ids} = LangfuseSdk.create_many(items)

      assert trace.id in ids
      assert event.id in ids
      assert span.id in ids
      assert generation.id in ids
      assert score.id in ids
    end
  end
end
