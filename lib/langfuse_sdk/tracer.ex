defmodule LangfuseSdk.Tracer do
  use GenServer

  # TODO LIST:
  # Inspiration taken from: https://langfuse.com/docs/sdk/typescript/guide
  # - Handle GenServer termination (send observations collected so far + error trace)
  # - Implement GenServer shutdown function for clients to manually send observations and terminate

  require Logger

  defguard is_data(value) when is_map(value) or is_list(value)

  def start_link(opts \\ []) do
    Process.flag(:trap_exit, true)
    GenServer.start_link(__MODULE__, opts, hibernate_after: :timer.minutes(5))
  end

  def create_trace(tracer_pid, data) when is_data(data) do
    GenServer.call(tracer_pid, {:create_trace, data})
  end

  def create_event(tracer_pid, data) when is_data(data) do
    GenServer.call(tracer_pid, {:create_event, data})
  end

  def create_span(tracer_pid, data) when is_data(data) do
    GenServer.call(tracer_pid, {:create_span, data})
  end

  def create_generation(tracer_pid, data) when is_data(data) do
    GenServer.call(tracer_pid, {:create_generation, data})
  end

  def create_score(tracer_pid, data) when is_data(data) do
    GenServer.call(tracer_pid, {:create_score, data})
  end

  def update_trace(tracer_pid, fun) when is_function(fun, 1) do
    GenServer.cast(tracer_pid, {:update_trace, fun})
  end

  def update_event(tracer_pid, fun) when is_function(fun, 1) do
    GenServer.cast(tracer_pid, {:update_event, fun})
  end

  def update_span(tracer_pid, fun) when is_function(fun, 1) do
    GenServer.cast(tracer_pid, {:update_span, fun})
  end

  def update_generation(tracer_pid, fun) when is_function(fun, 1) do
    GenServer.cast(tracer_pid, {:update_generation, fun})
  end

  def get_session(tracer_pid) do
    GenServer.call(tracer_pid, :get_session)
  end

  def shutdown(tracer_pid) do
    GenServer.call(tracer_pid, :shutdown)
  end

  @impl true
  def init(opts) do
    release = Keyword.get(opts, :release)
    request_timeout = Keyword.get(opts, :request_timeout)
    session_id = Keyword.get(opts, :session_id, UUID.uuid4())

    session = LangfuseSdk.Tracer.Session.new(session_id)

    {:ok,
     %{
       release: release,
       request_timeout: request_timeout,
       session: session
     }}
  end

  @impl true
  def handle_call(:get_session, _from, state) do
    {:reply, state.session, state}
  end

  @impl true
  def handle_call({:create_trace, data}, _from, state) do
    trace = LangfuseSdk.Tracer.Trace.new(state.session, data)
    session = LangfuseSdk.Tracer.Session.add_trace(state.session, trace)
    {:reply, trace, %{state | session: session}}
  end

  @impl true
  def handle_call({:create_event, data}, _from, state) do
    event = LangfuseSdk.Tracer.Event.new(data)
    event = LangfuseSdk.Tracer.Session.nest_observation(state.session, event)
    session = LangfuseSdk.Tracer.Session.add_event(state.session, event)
    {:reply, event, %{state | session: session}}
  end

  @impl true
  def handle_call({:create_span, data}, _from, state) do
    span = LangfuseSdk.Tracer.Span.new(data)
    span = LangfuseSdk.Tracer.Session.nest_observation(state.session, span)
    session = LangfuseSdk.Tracer.Session.add_span(state.session, span)
    {:reply, span, %{state | session: session}}
  end

  @impl true
  def handle_call({:create_generation, data}, _from, state) do
    generation = LangfuseSdk.Tracer.Generation.new(data)
    generation = LangfuseSdk.Tracer.Session.nest_observation(state.session, generation)
    session = LangfuseSdk.Tracer.Session.add_generation(state.session, generation)
    {:reply, generation, %{state | session: session}}
  end

  @impl true
  def handle_call(:shutdown, _from, state) do
    LangfuseSdk.Ingestion.ingest_traces(state.session)
    LangfuseSdk.Ingestion.ingest_events(state.session)
    LangfuseSdk.Ingestion.ingest_spans(state.session)
    LangfuseSdk.Ingestion.ingest_generations(state.session)

    {:stop, :normal, state.session, state}
  end

  @impl true
  def handle_cast({:update_trace, fun}, state) do
    session = LangfuseSdk.Tracer.Session.update_trace(state.session, fun)
    {:noreply, %{state | session: session}}
  end

  @impl true
  def handle_cast({:update_event, fun}, state) do
    session = LangfuseSdk.Tracer.Session.update_event(state.session, fun)
    {:noreply, %{state | session: session}}
  end

  @impl true
  def handle_cast({:update_span, fun}, state) do
    session = LangfuseSdk.Tracer.Session.update_span(state.session, fun)
    {:noreply, %{state | session: session}}
  end

  @impl true
  def handle_cast({:update_generation, fun}, state) do
    session = LangfuseSdk.Tracer.Session.update_generation(state.session, fun)
    {:noreply, %{state | session: session}}
  end

  @impl true
  def terminate(_reason, _state) do
    Logger.info("Terminating #{inspect(__MODULE__)}")
  end
end
