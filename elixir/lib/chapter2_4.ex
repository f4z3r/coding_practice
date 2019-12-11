defmodule Crack.Chapter2_4 do
  @moduledoc """
  2.4 Number lists:

  You have two numbers represented by a linked list, where each node contains a single digit. The
  digits are stored in reverse order, such that the 1's digit is at the head of the list. Write a
  function that adds the two numbers and returns the sum as a linked list.

  ## Example

  Input (3 -> 1 -> 5), (5 -> 9 -> 2)
  Ouput (8 -> 0 -> 8)
  """

  @doc """
  Sum two numbers represented as linked lists.

      iex> num1 = [3, 1, 5]
      iex> num2 = [5, 9, 2]
      iex> Crack.Chapter2_4.start(num1, num2)
      [8, 0, 8]

      iex> num1 = []
      iex> num2 = []
      iex> Crack.Chapter2_4.start(num1, num2)
      []

      iex> num1 = [1, 1, 1]
      iex> num2 = [0, 0, 0, 1]
      iex> Crack.Chapter2_4.start(num1, num2)
      [1, 1, 1, 1]

      iex> num1 = [0, 0, 9]
      iex> num2 = [0, 0, 9]
      iex> Crack.Chapter2_4.start(num1, num2)
      [0, 0, 8, 1]

  """
  def start(num1, num2) do
    add(num1, num2, 0, [])
  end

  defp add([], [], 0, acc), do: acc

  defp add([], [], carry, acc), do: add([0], [0], carry, acc)

  defp add([], list, carry, acc), do: add([0], list, carry, acc)

  defp add(list, [], carry, acc), do: add([0], list, carry, acc)

  defp add([h1 | t1], [h2 | t2], carry, acc) do
    sum = h1 + h2 + carry
    add(t1, t2, div(sum, 10), acc ++ [rem(sum, 10)])
  end
end
