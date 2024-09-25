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

if Mix.env() == :test do
end
