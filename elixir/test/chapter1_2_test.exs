defmodule Chapter1_2Test do
  use ExUnit.Case
  use ExUnitProperties

  describe "string reversal algorithm" do
    test "should work on empty string" do
      assert Crack.Chapter1_2.start("") == ""
    end

    test "should work on simple string" do
      assert Crack.Chapter1_2.start("cba") == "abc"
    end

    test "should support graphemes" do
      assert Crack.Chapter1_2.start("èbá") == "ábè"
    end

    property "should preserve length" do
      check all(
              str <- StreamData.string(:ascii),
              str_length = String.length(str)
            ) do
        assert Crack.Chapter1_2.start(str) |> String.length() === str_length
      end
    end
  end
end
