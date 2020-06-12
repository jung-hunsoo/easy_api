defmodule EasyApi do
  @moduledoc """
  Documentation for EasyApi.
  """

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
end
