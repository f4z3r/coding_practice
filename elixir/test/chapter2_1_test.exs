defmodule Chapter2_1Test do
  use ExUnit.Case
  use ExUnitProperties

  describe "list duplicate removal algorithm" do
    property "should never return a longer list than provided" do
      check all(
              list <- StreamData.list_of(StreamData.integer()),
              length = Enum.count(list),
              sorted = Enum.sort(list)
            ) do
        assert Enum.count(Crack.Chapter2_1.start(sorted)) <= length
      end
    end

    property "should also return a sorted list" do
      check all(
              list <- StreamData.list_of(StreamData.integer()),
              sorted = Enum.sort(list)
            ) do
        result = Crack.Chapter2_1.start(sorted)
        assert Enum.sort(result) === result
      end
    end

    property "should not return any non-unique elements" do
      check all(
              list <- StreamData.list_of(StreamData.integer()),
              sorted = Enum.sort(list)
            ) do
        result = Crack.Chapter2_1.start(sorted)
        assert Enum.uniq(result) === result
      end
    end
  end
end
