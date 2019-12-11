defmodule Chapter1_6Test do
  use ExUnit.Case
  use ExUnitProperties

  describe "matrix swap algorithm" do
    property "should preserve the size of the matrix" do
      check all(
              n <- StreamData.positive_integer(),
              matrix <-
                StreamData.integer()
                |> StreamData.list_of(length: n)
                |> StreamData.list_of(length: n)
            ) do
        rotated = Crack.Chapter1_6.start(matrix)
        assert Enum.count(rotated) === n
        assert Enum.all?(rotated, &(Enum.count(&1) === n))
      end
    end
  end
end
