defmodule LangfuseSdk.GeneratedTest do
  @moduledoc """
  Asserts that all generated code returns the correct translated structure.
  """
  use ExUnit.Case

  describe "LangfuseSdk.Generated.Health" do
    test "health_health" do
      assert {:ok, %LangfuseSdk.Generated.HealthResponse{}} =
               LangfuseSdk.Generated.Health.health_health()
    end
  end

  describe "LangfuseSdk.Generated.Ingestion" do
    test "ingestion_batch" do
      payload = LangfuseSdk.PayloadFixtures.ingestion_batch()

      # We are currently matching on a map instead of %LangfuseSdk.Generated.IngestionResponse{}
      # because the OpenAPI spec for this endpoint is wrongfully returning 201 instead of 200.
      # When we can't map the proper result type we return the raw value instead.

      assert {:ok, %{"errors" => []}} =
               LangfuseSdk.Generated.Ingestion.ingestion_batch(payload)
    end
  end

  describe "LangfuseSdk.Generated.Trace" do
    test "trace_list" do
      assert {:ok, %LangfuseSdk.Generated.Traces{}} =
               LangfuseSdk.Generated.Trace.trace_list()
    end
  end
end
