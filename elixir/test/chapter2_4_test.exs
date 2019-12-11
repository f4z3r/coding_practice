defmodule Chapter2_4Test do
  use ExUnit.Case
  use ExUnitProperties

  describe "linked list number summation algorithm" do
    property "should sum numbers normally" do
      check all(
              num1 <- StreamData.positive_integer(),
              num2 <- StreamData.positive_integer(),
              num1_list = num1 |> Integer.digits() |> Enum.reverse(),
              num2_list = num2 |> Integer.digits() |> Enum.reverse(),
              sum_list = (num1 + num2) |> Integer.digits() |> Enum.reverse()
            ) do
        assert Crack.Chapter2_4.start(num1_list, num2_list) === sum_list
      end
    end
  end
end
