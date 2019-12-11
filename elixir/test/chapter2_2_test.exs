defmodule Chapter2_2Test do
  use ExUnit.Case
  use ExUnitProperties

  describe "n-th last element finder algorithm" do
    property "should always return an integer contained in the list" do
      check all(
              list <- StreamData.list_of(StreamData.integer(), min_length: 1),
              length = Enum.count(list),
              nth = div(length, 3)
            ) do
        assert Crack.Chapter2_2.start(list, nth) in list
      end
    end

    property "should always return the first element when passed the length of the list" do
      check all(
              list <- StreamData.list_of(StreamData.integer(), min_length: 1),
              length = Enum.count(list),
              [head | _] = list
            ) do
        assert Crack.Chapter2_2.start(list, length) === head
      end
    end
  end
end
