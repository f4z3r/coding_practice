defmodule Chapter1_5Test do
  use ExUnit.Case
  doctest Crack.Chapter1_5

  test "work on empty string" do
    assert Crack.Chapter1_5.start("") === ""
  end
end
