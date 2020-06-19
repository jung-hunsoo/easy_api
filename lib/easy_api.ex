defmodule EasyApi do
  @moduledoc """
  Documentation for EasyApi.
  """

  use Application

  @doc """
  Hello world.

  ## Examples

      iex> EasyApi.hello()
      :world

  """
  def hello do
    :world
  end

  def load_spec(filename \\ "api_spec.yaml") do
    {:ok, spec} = YamlElixir.read_from_file(filename)
    :persistent_term.put(EasyApi.Spec, Map.get(spec, "paths"))
  end

  def start(_type, _args) do
    children = [
      %{
        id: :easy_api_cache_id,
        start: {Cachex, :start_link, [:easy_api_cache, [limit: 1_000]]}
      }
    ]
    opts = [strategy: :one_for_one, name: EasyApi]

    Supervisor.start_link(children, opts)
  end

  defp app_env(key, default), do: Application.get_env(:easy_api, key, default)
end
