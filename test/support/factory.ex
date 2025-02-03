defmodule LangfuseSdk.Factory do
  @moduledoc false
  def trace_data do
    %{
      name: Faker.Lorem.word(),
      input: Faker.Lorem.paragraph(),
      output: Faker.Lorem.paragraph(),
      tags: Faker.Lorem.words(),
      session_id: Faker.UUID.v4()
    }
  end

  def event_data(trace_id \\ nil) do
    %{
      trace_id: trace_id,
      name: Faker.Lorem.word(),
      input: Faker.Lorem.paragraph(),
      output: Faker.Lorem.paragraph()
    }
  end

  def span_data(trace_id \\ nil) do
    %{
      trace_id: trace_id,
      name: Faker.Lorem.word(),
      input: Faker.Lorem.paragraph(),
      output: Faker.Lorem.paragraph()
    }
  end

  def generation_data(trace_id \\ nil) do
    %{
      trace_id: trace_id,
      name: Faker.Lorem.word(),
      input: Faker.Lorem.paragraph(),
      output: Faker.Lorem.paragraph(),
      model: "gpt-4"
    }
  end

  def generation_with_image_data(trace_id \\ nil) do
    # Load image data from the file
    image_data = File.read!("test/support/image-base64-encoded.txt")

    %{
      trace_id: trace_id,
      name: Faker.Lorem.word(),
      input: [
        %{
          "role" => "user",
          "content" => [
            %{"text" => "Answer", "type" => "text"},
            %{"image_url" => %{"url" => image_data}, "type" => "image_url"}
          ]
        }
      ],
      output: Faker.Lorem.paragraph(),
      model: "gpt-4-o"
    }
  end

  def score_data(trace_id \\ nil) do
    %{
      trace_id: trace_id,
      name: Faker.Lorem.word(),
      value: Faker.random_uniform(),
      data_type: "NUMERIC"
    }
  end
end
