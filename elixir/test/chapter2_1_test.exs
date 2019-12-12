defmodule Chapter2_1Test do
  use ExUnit.Case
  use ExUnitProperties

  describe "list duplicate removal algorithm" do
    property "should never return a longer list than provided" do
      check all(
              list <- StreamData.list_of(StreamData.integer()),
              length = Enum.count(list)
            ) do
        assert list |> Crack.Chapter2_1.start() |> Enum.count() <= length
      end
    end

    property "should not return any non-unique elements" do
      check all(list <- StreamData.list_of(StreamData.integer())) do
        result = Crack.Chapter2_1.start(list)
        assert Enum.uniq(result) === result
      end
    end
  end
end
