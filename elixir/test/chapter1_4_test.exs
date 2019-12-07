defmodule Chapter1_4Test do
  use ExUnit.Case
  doctest Crack.Chapter1_4

  test "work on empty string" do
    assert Crack.Chapter1_4.start("", "")
  end
end
