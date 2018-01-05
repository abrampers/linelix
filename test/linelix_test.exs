defmodule LinelixTest do
  use ExUnit.Case
  doctest Linelix

  test "greets the world" do
    assert Linelix.hello() == :world
  end
end
