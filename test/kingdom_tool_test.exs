defmodule KingdomToolTest do
  use ExUnit.Case
  doctest KingdomTool

  test "greets the world" do
    assert KingdomTool.hello() == :world
  end
end
