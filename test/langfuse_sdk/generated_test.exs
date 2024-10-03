defmodule LangfuseSdk.GeneratedTest do
  use ExUnit.Case

  describe "endpoints responses are properly translated" do
    test "health_health" do
      assert {:ok, %LangfuseSdk.Generated.HealthResponse{}} =
               LangfuseSdk.Generated.Health.health_health()
    end

    test "ingestion_batch" do
      payload = LangfuseSdk.PayloadFixtures.ingestion_batch()

      # We are currently matching on a map instead of %LangfuseSdk.Generated.IngestionResponse{}
      # because the OpenAPI spec for this endpoint is wrongfully returning 201 instead of 200.
      # When we can't map the proper result type we return the raw value instead.

      assert {:ok, %{"errors" => []}} =
               LangfuseSdk.Generated.Ingestion.ingestion_batch(payload)
    end
  end
end
