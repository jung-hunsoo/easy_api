defmodule EasyApi.Plug.Cache do
  @moduledoc """
  Caching module
  """

  use Plug.Builder
  import Plug.Conn

  plug :fetch_cached

  def fetch_cached(conn, opts) do
    cache_key = "#{conn.request_path}?#{conn.query_string}"

    case Cachex.get(:easy_api_cache, cache_key) do
      {:ok, nil} ->
        Cachex.put(:easy_api_cache, cache_key, "cached response")
        conn
      {:ok, response} ->
        conn
    end
  end
end
