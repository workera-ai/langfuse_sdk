defmodule LangfuseSdkTest do
  use ExUnit.Case

  describe "LangfuseSdk" do
    test "traces" do
      trace_data = LangfuseSdk.Factory.trace_data()
      %{id: id} = trace = LangfuseSdk.Tracing.Trace.new(trace_data)
      assert {:ok, ^id} = LangfuseSdk.create(trace)
    end

    test "events" do
      event_data = LangfuseSdk.Factory.event_data()
      %{id: id} = event = LangfuseSdk.Tracing.Event.new(event_data)
      assert {:ok, ^id} = LangfuseSdk.create(event)
    end

    test "spans" do
      span_data = LangfuseSdk.Factory.span_data()
      %{id: id} = span = LangfuseSdk.Tracing.Span.new(span_data)
      assert {:ok, ^id} = LangfuseSdk.create(span)
      assert {:ok, ^id} = LangfuseSdk.update(%{span | name: "updated-span"})
    end

    test "generations" do
      generation_data = LangfuseSdk.Factory.generation_data()
      %{id: id} = generation = LangfuseSdk.Tracing.Generation.new(generation_data)
      assert {:ok, ^id} = LangfuseSdk.create(generation)
      assert {:ok, ^id} = LangfuseSdk.update(%{generation | name: "updated-generation"})
    end

    test "scores" do
      trace_data = LangfuseSdk.Factory.trace_data()
      trace = LangfuseSdk.Tracing.Trace.new(trace_data)
      score_data = LangfuseSdk.Factory.score_data(trace.id)
      %{id: id} = score = LangfuseSdk.Tracing.Score.new(score_data)
      assert {:ok, ^id} = LangfuseSdk.create(score)
    end
  end
end
