defmodule Mix.Tasks.Spec.Sync do
  use Mix.Task

  @url "https://cloud.langfuse.com/generated/api/openapi.yml"
  @spec_path "openapi.yml"

  def run(_args) do
    {:ok, _} = Application.ensure_all_started(:req)
    Req.get!(@url, raw: true, into: File.stream!(@spec_path, [:write]))
  end
end
