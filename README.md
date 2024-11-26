# Langfuse SDK

**NOTE:** This is an **unofficial** Langfuse SDK client for Elixir, developed and maintained by [Workera](https://workera.ai/).

[Langfuse](https://github.com/langfuse/langfuse) is an open-source platform that helps teams efficiently debug, analyze, and optimize large language model (LLM) applications by providing detailed execution insights.
You can read the API documentation over here: <https://api.reference.langfuse.com/>.

## Installation

Add Langfuse to your `mix.exs` dependencies:

```elixir
def deps do
  [
    {:langfuse_sdk, "> 0.0"}
  ]
end
```

Fetch the dependency with:

```shell
mix deps.get
```

## Configuration

In your `config/config.exs`, set the following:

```elixir
config :langfuse_sdk,
  host: System.get_env("LANGFUSE_HOST"),
  secret_key: System.get_env("LANGFUSE_SECRET_KEY"),
  public_key: System.get_env("LANGFUSE_PUBLIC_KEY"),
```

You can find the secret and public key in the `organizations` setting in Langfuse.

## Usage

Pseudo-code that shows how to start create traces in Langfuse.

```elixir
defmodule MyApp do
  alias LangfuseSdk.Tracing.Generation
  alias LangfuseSdk.Tracing.Event
  alias LangfuseSdk.Tracing.Trace
  
  def start_listener(context) do
    # Create a langfuse event
    trace = Trace.new(%{
      name: "my-trace",
      id: "unique-id",
      user_id: context.user_id,
      metadata: %{}
    })

    {:ok, data} = LangfuseSdk.create(trace)
  end

  def received_event(event, context) do
    # Create a Langfuse event
    %{name: event.name, trace_id: context.trace_id}
    |> Event.new()
    |> LangfuseSdk.create()

    open_ai_call_with_traces(event, context)
  end

  defp open_ai_call_with_traces(event, context) do
    # Create a langfuse observation
    generation =
      Generation.new(%{
        name: context.generation_name,
        input: event.data,
        trace_id: context.trace_id,
        model: context.model,
        metadata: %{response_format: context.response_format},
        completion_start_time: DateTime.utc_now()
      })

    LangfuseSdk.create(generation)

    # Execute the OpenAI call
    response = OpenAIClient.chat_completion(
      model: context.model,
      messages: event.data,
      response_format: context.response_format)

    # Update the Langfuse trace with the result
    LangfuseSdk.update(%{
      generation
      | end_time: DateTime.utc_now(), output: %{role: "assistant", output: parse_output(response)}
    })

    :ok
  end
end
```

## Development

### OpenAPI code generation and syncing

[Langfuse APIs](https://api.reference.langfuse.com/) are following the OpenAPI specifications, which has been used to generate the SDK code using the [open-api-generator](https://github.com/aj-foster/open-api-generator) library.
The generated code lives inside the [generated](lib/langfuse_sdk/generated/) folder.

> Running this command is only recommended to update the generate code because it may introduce incompatibilities in the current API implementation.

Run `mix sdk.build` to regenerete the API. This command will download the latest version of the OpenAPI YAML specification and generate the correspondent code to match the API spec.

## Contributing

Contributions are welcome! Fork the repo and submit a pull request. For major changes, open an issue to discuss them first.

## License

MIT License. See the [LICENSE](LICENSE) file for details.
