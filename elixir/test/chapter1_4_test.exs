defmodule Chapter1_4Test do
  use ExUnit.Case
  use ExUnitProperties

  describe "anagram algorithm" do
    test "should work on empty string" do
      assert Crack.Chapter1_4.start("", "")
    end

    property "should work on reversed strings" do
      check all(
              str <- StreamData.string(:ascii),
              reversed = String.reverse(str)
            ) do
        assert Crack.Chapter1_4.start(str, reversed)
      end
    end

    property "should never work on strings of different length" do
      check all(
              str1 <- StreamData.string(:ascii),
              str2 <- StreamData.string(:ascii),
              String.length(str1) !== String.length(str2)
            ) do
        refute Crack.Chapter1_4.start(str1, str2)
      end
    end
  end
end
