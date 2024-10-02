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
      output: Faker.Lorem.paragraph()
    }
  end
end
