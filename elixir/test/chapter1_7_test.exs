defmodule Chapter1_7Test do
  use ExUnit.Case
  use ExUnitProperties

  describe "matrix zeroing algorithm" do
    property "should preserve the size of the matrix" do
      check all(
              rows <- StreamData.integer(1..100),
              cols <- StreamData.integer(1..100),
              matrix <-
                StreamData.integer()
                |> StreamData.list_of(length: cols)
                |> StreamData.list_of(length: rows)
            ) do
        zeroed = Crack.Chapter1_7.start(matrix)
        assert Enum.count(zeroed) === rows
        assert Enum.all?(zeroed, &(Enum.count(&1) === cols))
      end
    end
  end
end
