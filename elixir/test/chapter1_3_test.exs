defmodule Chapter1_3Test do
  use ExUnit.Case
  use ExUnitProperties

  describe "duplicate removal algorithm" do
    test "should work on empty strings" do
      assert Crack.Chapter1_3.start("") == ""
    end

    test "should work on simple example" do
      assert Crack.Chapter1_3.start("aaaabcadbae") == "abcde"
    end

    property "should never increase length" do
      check all(
              str <- StreamData.string(:ascii),
              str_length = String.length(str)
            ) do
        assert Crack.Chapter1_3.start(str) |> String.length() <= str_length
      end
    end
  end
end
