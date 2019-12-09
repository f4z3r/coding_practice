defmodule Chapter1_5Test do
  use ExUnit.Case
  use ExUnitProperties

  describe "space replacing algorithm" do
    test "should work on empty string" do
      assert Crack.Chapter1_5.start("") === ""
    end

    property "should never decrease string length" do
      check all(
              str <- StreamData.string(:ascii),
              str_length = String.length(str)
            ) do
        assert Crack.Chapter1_5.start(str) |> String.length() >= str_length
      end
    end

    property "should contain '%20' if the string contained spaces" do
      check all(
              str1 <- StreamData.string(:ascii),
              str2 <- StreamData.string(:ascii),
              str = str1 <> " " <> str2
            ) do
        assert Crack.Chapter1_5.start(str) |> String.contains?("%20")
      end
    end
  end
end
