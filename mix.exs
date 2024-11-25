defmodule LangfuseSdk.MixProject do
  use Mix.Project

  @version "0.0.1"
  @url "https://github.com/workera-ai/langfuse_sdk"

  def project do
    [
      app: :langfuse_sdk,
      version: @version,
      elixir: "~> 1.17",
      elixirc_paths: elixirc_paths(Mix.env()),
      start_permanent: Mix.env() == :prod,
      aliases: aliases(),
      deps: deps(),
      package: package(),
      docs: docs(),
      description: description()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  defp description do
    """
    Langfuse SDK
    """
  end

  defp package do
    [
      licesense: ["MIT"],
      links: %{"GitHub" => @url},
      files: ~w(lib mix.exs README.md LICENSE)
    ]
  end

  defp docs do
    [
      source_ref: "v#{@version}",
      main: "README",
      canonical: "http://hexdocs.pm/langfuse_sdk",
      source_url: @url,
      extras: ["README.md": [filename: "README"]]
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
      {:inflex, "~> 2.1"},
      {:ex_doc, ">= 0.0.0", only: :dev, runtime: false}
    ]
  end

  defp aliases do
    [
      "sdk.build": ["spec.sync", "api.gen default openapi.yml"]
    ]
  end
end
