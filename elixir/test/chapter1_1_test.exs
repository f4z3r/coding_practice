defmodule Chapter1_1Test do
  use ExUnit.Case
  doctest Crack.Chapter1_1

  test "work on empty string" do
    assert Crack.Chapter1_1.start ""
  end

  test "positive example" do
    assert not Crack.Chapter1_1.start "hello"
  end

  test "negative example" do
    assert Crack.Chapter1_1.start "abcdefg?!-"
  end

  test "supports graphemes" do
    assert Crack.Chapter1_1.start "áéíć"
  end
end
