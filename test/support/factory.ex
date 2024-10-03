defmodule LangfuseSdk.Factory do
  def trace_data do
    %{
      name: Faker.Lorem.word(),
      input: Faker.Lorem.paragraph(),
      output: Faker.Lorem.paragraph(),
      tags: Faker.Lorem.words()
    }
  end

  def event_data do
    %{
      name: Faker.Lorem.word(),
      input: Faker.Lorem.paragraph(),
      output: Faker.Lorem.paragraph()
    }
  end

  def span_data do
    %{
      name: Faker.Lorem.word(),
      input: Faker.Lorem.paragraph(),
      output: Faker.Lorem.paragraph()
    }
  end

  def generation_data do
    %{
      name: Faker.Lorem.word(),
      input: Faker.Lorem.paragraph(),
      output: Faker.Lorem.paragraph(),
      model: "gpt-4"
    }
  end

  def score_data(trace_id) do
    %{
      trace_id: trace_id,
      name: Faker.Lorem.word(),
      value: Faker.random_uniform(),
      data_type: "NUMERIC"
    }
  end
end
