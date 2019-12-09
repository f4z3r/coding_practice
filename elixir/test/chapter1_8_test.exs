defmodule Chapter1_8Test do
  use ExUnit.Case
  use ExUnitProperties

  describe "string rotation algorithm" do
    property "should return true on two flipped strings" do
      check all(
              comp1 <- StreamData.string(:ascii, min_length: 1),
              comp2 <- StreamData.string(:ascii),
              str1 = comp1 <> comp2,
              str2 = comp2 <> comp1
            ) do
        assert Crack.Chapter1_8.start(str1, str2)
      end
    end
  end
end
