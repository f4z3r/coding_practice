defmodule Crack.Chapter1_3Test do
  use ExUnit.Case
  doctest Crack.Chapter1_3

  test "works on empty strings" do
    assert Crack.Chapter1_3.start("") == ""
  end

  test "positive example" do
    assert Crack.Chapter1_3.start("aaaabcadbae") == "abcde"
  end
end
