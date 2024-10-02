defmodule LangfuseSdk.PayloadFixtures do
  @moduledoc false

  def ingestion_batch() do
    metadata = %{}
    trace_id = Faker.UUID.v4()
    timestamp = Faker.DateTime.backward(1)

    %{
      metadata: %{},
      batch: [
        %{
          id: trace_id,
          timestamp: timestamp,
          type: "trace-create",
          metadata: %{},
          body: %{
            id: trace_id,
            input: Faker.Lorem.sentences(),
            name: Faker.Lorem.word(),
            output: Faker.Lorem.sentences(),
            public: true,
            version: "1",
            metadata: metadata,
            userId: Faker.UUID.v4(),
            sessionId: Faker.UUID.v4(),
            release: "1",
            tags: []
          }
        }
      ]
    }
  end
end
