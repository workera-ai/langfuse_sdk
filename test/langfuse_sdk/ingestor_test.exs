defmodule LangfuseSdk.IngestorTest do
  use ExUnit.Case, async: true

  alias LangfuseSdk.Ingestor
  alias LangfuseSdk.Tracing.Generation

  describe "to_event/2 for a Generation" do
    test "omits usageDetails/costDetails when not set" do
      generation = Generation.new(%{name: "translation", model: "claude"})

      %{"body" => body} = Ingestor.to_event(generation, :update)

      refute Map.has_key?(body, "usageDetails")
      refute Map.has_key?(body, "costDetails")
    end

    test "includes usageDetails/costDetails when set" do
      generation =
        Generation.new(%{
          name: "translation",
          model: "claude",
          usage_details: %{
            "input" => 5000,
            "output" => 120,
            "cache_read_input_tokens" => 4096,
            "cache_creation_input_tokens" => 0,
            "total" => 5120
          },
          cost_details: %{"input" => 0.0012, "output" => 0.0009, "total" => 0.0021}
        })

      %{"body" => body} = Ingestor.to_event(generation, :update)

      assert body["usageDetails"]["input"] == 5000
      assert body["usageDetails"]["cache_read_input_tokens"] == 4096
      assert body["costDetails"]["total"] == 0.0021
    end

    test "still emits the legacy usage object alongside the details" do
      generation =
        Generation.new(%{
          name: "translation",
          usage: %{"input" => 5000, "output" => 120, "total" => 5120, "unit" => "TOKENS"},
          usage_details: %{"input" => 5000}
        })

      %{"body" => body} = Ingestor.to_event(generation, :create)

      assert body["usage"]["unit"] == "TOKENS"
      assert body["usageDetails"]["input"] == 5000
    end
  end
end
