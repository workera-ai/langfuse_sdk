defmodule LangfuseSdk.MixProject do
  use Mix.Project

  def project do
    [
      app: :langfuse_sdk,
      version: "0.1.0",
      elixir: "~> 1.17",
      elixirc_paths: elixirc_paths(Mix.env()),
      start_permanent: Mix.env() == :prod,
      aliases: aliases(),
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(_), do: ["lib"]

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:oapi_generator, "~> 0.2.0", only: :dev, runtime: false},
      {:req, "~> 0.4 or ~> 0.5"},
      {:elixir_uuid, "~> 1.2"},
      {:faker, "~> 0.18.0", only: :test},
      {:inflex, "~> 2.1"}
    ]
  end

  defp aliases do
    [
      "sdk.build": ["spec.sync", "api.gen default openapi.yml"]
    ]
  end
end
