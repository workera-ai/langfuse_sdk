import Config

if Mix.env() == :dev do
  config :oapi_generator,
    default: [
      field_casing: :snake,
      output: [
        base_module: LangfuseSdk.Generated,
        default_client: LangfuseSdk.Support.Client,
        location: "lib/langfuse_sdk",
        operation_subdirectory: "generated/operations/",
        schema_subdirectory: "generated/schemas/"
      ]
    ]
end

if Mix.env() in [:dev, :test] do
  config :langfuse_sdk,
    host: "http://localhost:4001",
    secret_key: System.get_env("LANGFUSE_SECRET_KEY"),
    public_key: System.get_env("LANGFUSE_PUBLIC_KEY")
end
