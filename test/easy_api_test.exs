defmodule EasyApiTest do
  use ExUnit.Case
  doctest EasyApi

  test "greets the world" do
    assert EasyApi.hello() == :world
  end
end
