defmodule LangfuseSdk.IngestionTest do
  use ExUnit.Case

  alias LangfuseSdk.Tracer
  alias LangfuseSdk.Tracer.Session

  describe "ingestion" do
    test "shutdown" do
      {:ok, pid} = Tracer.start_link()

      Tracer.create_trace(pid, LangfuseSdk.Factory.trace_data())
      Tracer.create_event(pid, LangfuseSdk.Factory.event_data())
      Tracer.create_span(pid, LangfuseSdk.Factory.span_data())
      Tracer.create_generation(pid, LangfuseSdk.Factory.generation_data())
      Tracer.create_span(pid, LangfuseSdk.Factory.span_data())
      Tracer.create_generation(pid, LangfuseSdk.Factory.generation_data())
      Tracer.create_span(pid, LangfuseSdk.Factory.span_data())
      Tracer.create_generation(pid, LangfuseSdk.Factory.generation_data())
      Tracer.create_event(pid, LangfuseSdk.Factory.event_data())

      assert %Session{} = Tracer.shutdown(pid)
      refute Process.alive?(pid)
    end
  end
end
