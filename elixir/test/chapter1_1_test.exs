defmodule Chapter1_1Test do
  use ExUnit.Case
  use ExUnitProperties

  describe "algorithm on unique strings" do
    test "should work on empty string" do
      assert Crack.Chapter1_1.start("")
    end

    test "should work on strings containing punctuation" do
      assert Crack.Chapter1_1.start("abcdefg?!-")
    end

    test "should support graphemes" do
      assert Crack.Chapter1_1.start("áéíć")
    end
  end

  describe "algorithm on non-unique strings" do
    test "should work on simple example" do
      refute Crack.Chapter1_1.start("hello")
    end

    test "should work on example containg non adjacent duplicates" do
      refute Crack.Chapter1_1.start("!helo!")
    end

    property "repeated non empty string contains duplicates" do
      check all(
              a <- StreamData.string(:ascii, min_length: 1),
              str = a <> a
            ) do
        refute Crack.Chapter1_1.start(str)
      end
    end
  end
end
