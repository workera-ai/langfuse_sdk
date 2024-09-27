import Config

config :oapi_generator,
  default: [
    output: [
      base_module: LangfuseSdk.Generated,
      default_client: LangfuseSdk.Support.Client,
      location: "lib/langfuse_sdk",
      operation_subdirectory: "generated/operations/",
      schema_subdirectory: "generated/schemas/"
    ]
  ]

config :oapi_generator, :langfuse,
  username: "pk-lf-ae8994df-48d8-47b7-a10a-9be2c18593fb",
  password: "sk-lf-b1607d92-ae27-4bf9-8523-9483889575df",
  endpoint: "http://localhost:4001"

if Mix.env() == :test do
end
