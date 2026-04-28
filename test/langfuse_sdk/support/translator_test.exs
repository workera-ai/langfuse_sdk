defmodule LangfuseSdk.Support.TranslatorTest do
  use ExUnit.Case, async: true

  alias LangfuseSdk.Support.Translator

  describe "translate/2" do
    test "passes through nil type" do
      assert Translator.translate(nil, %{"foo" => "bar"}) == %{"foo" => "bar"}
    end

    test "passes through :map" do
      assert Translator.translate(:map, %{"a" => 1}) == %{"a" => 1}
    end

    test "passes through {:string, :generic}" do
      assert Translator.translate({:string, :generic}, "hello") == "hello"
    end

    test "passes through :boolean" do
      assert Translator.translate(:boolean, true) == true
    end

    test "parses :integer from string" do
      assert Translator.translate(:integer, "42") == 42
    end

    test "passes through :integer when already integer" do
      assert Translator.translate(:integer, 42) == 42
    end

    test "parses {:string, :date_time}" do
      assert Translator.translate({:string, :date_time}, "2024-01-15T10:30:00") ==
               ~N[2024-01-15 10:30:00]
    end

    test "delegates list type to inner type" do
      assert Translator.translate([:integer], "100") == 100
    end

    test "raises for unknown type" do
      assert_raise RuntimeError, ~r/Response translation not implemented/, fn ->
        Translator.translate(:unknown, "value")
      end
    end

    @enum_values ["NUMERIC", "BOOLEAN", "CATEGORICAL"]

    test "passes through enum string values" do
      assert Translator.translate({:enum, @enum_values}, "NUMERIC") == "NUMERIC"
      assert Translator.translate({:enum, @enum_values}, "BOOLEAN") == "BOOLEAN"
      assert Translator.translate({:enum, @enum_values}, "CATEGORICAL") == "CATEGORICAL"
    end

    test "raises when enum value is not in the allowed list" do
      assert_raise RuntimeError, ~r/Response translation not implemented/, fn ->
        Translator.translate({:enum, @enum_values}, "UNKNOWN")
      end
    end

    test "raises on nil enum value when nil is not in the allowed list" do
      assert_raise RuntimeError, ~r/Response translation not implemented/, fn ->
        Translator.translate({:enum, @enum_values}, nil)
      end
    end

    test "delegates list of enum to inner enum" do
      assert Translator.translate([{:enum, @enum_values}], "NUMERIC") == "NUMERIC"
    end

    test "passes through integer :number" do
      assert Translator.translate(:number, 42) == 42
    end

    test "passes through float :number" do
      assert Translator.translate(:number, 3.14) == 3.14
    end

    test "passes through nil :number" do
      assert Translator.translate(:number, nil) == nil
    end

    test "parses integer-shaped string as integer for :number" do
      assert Translator.translate(:number, "42") === 42
    end

    test "parses negative integer-shaped string as integer for :number" do
      assert Translator.translate(:number, "-7") === -7
    end

    test "parses float-shaped string as float for :number" do
      assert Translator.translate(:number, "3.14") === 3.14
    end

    test "parses negative float-shaped string as float for :number" do
      assert Translator.translate(:number, "-0.5") === -0.5
    end

    test "parses scientific-notation string as float for :number" do
      assert Translator.translate(:number, "1.5e2") === 1.5e2
    end

    test "passes through unparseable string for :number" do
      assert Translator.translate(:number, "not-a-number") == "not-a-number"
    end

    test "delegates list of :number to inner type with integer string" do
      assert Translator.translate([:number], "10") === 10
    end

    test "delegates list of :number to inner type with float string" do
      assert Translator.translate([:number], "1.5") === 1.5
    end

    test "delegates list of :number to inner type with raw float" do
      assert Translator.translate([:number], 1.5) == 1.5
    end
  end

  describe "translate/2 with module structs containing :enum and :number fields" do
    test "translates a ScoreConfig with :enum and :number fields" do
      body = %{
        "id" => "cfg_1",
        "name" => "score-1",
        "createdAt" => "2024-01-15T10:30:00",
        "updatedAt" => "2024-01-15T10:30:00",
        "projectId" => "proj_1",
        "dataType" => "NUMERIC",
        "isArchived" => false,
        "minValue" => 0.0,
        "maxValue" => 1.0,
        "categories" => [],
        "description" => nil
      }

      result = Translator.translate({LangfuseSdk.Generated.ScoreConfig, :t}, body)

      assert %LangfuseSdk.Generated.ScoreConfig{data_type: "NUMERIC"} = result
      assert result.min_value == 0.0
      assert result.max_value == 1.0
    end
  end
end
