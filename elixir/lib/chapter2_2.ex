defmodule Crack.Chapter2_2 do
  @moduledoc """
  2.2 n-th last:

  Implement an algorithm to find the nth to last element of a singly linked list.
  """

  @doc """
  Finds the n-th last element of a linked list.

       iex> list = [1, 2, 3, 4, 5, 6, 7, 8, 9, 0]
       iex> Crack.Chapter2_2.start(list, 3)
       8

       iex> list = [1, 2, 3, 4, 5, 6, 7, 8, 9, 0]
       iex> Crack.Chapter2_2.start(list, 10)
       1

       iex> list = [1, 2, 3, 4, 5, 6, 7, 8, 9, 0]
       iex> Crack.Chapter2_2.start(list, 0)
       0

       iex> list = [1]
       iex> Crack.Chapter2_2.start(list, 0)
       1

       iex> list = [1, 2, 3, 4, 5, 6, 7, 8, 9, 0]
       iex> Crack.Chapter2_2.start(list, 2000)
       1

  """
  def start(list, n) when is_integer(n) and n > -1 do
    advanced = advance_by(list, n)
    parallel_advance(list, advanced)
  end

  defp advance_by(list, 0), do: list

  defp advance_by([], _), do: []

  defp advance_by([_ | tail], n), do: advance_by(tail, n - 1)

  defp parallel_advance([head], [_]), do: head

  defp parallel_advance([head | _], []), do: head

  defp parallel_advance([_ | tail1], [_ | tail2]), do: parallel_advance(tail1, tail2)
end
