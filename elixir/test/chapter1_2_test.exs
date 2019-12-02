defmodule Chapter1_2Test do
  use ExUnit.Case
  doctest Crack.Chapter1_2

  test "works on empty string" do
    assert Crack.Chapter1_2.start("") == ""
  end

  test "test on simple string" do
    assert Crack.Chapter1_2.start("cba") == "abc"
  end

  test "supports graphemes" do
    assert Crack.Chapter1_2.start("èbá") == "ábè"
  end
end
