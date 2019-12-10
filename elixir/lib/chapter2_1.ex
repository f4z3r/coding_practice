defmodule Crack.Chapter2_1 do
  @moduledoc """
  2.1 List duplicates:

  Write code to remove duplicates from an unsorted linked list.

  FOLLOW UP
  How would you solve this problem if a temporary buffer is not allowed?
  """

  @doc """
  Removes duplicates from a sorted linked list.

      iex> list = Enum.sort([1, 2, 3, 4, 3, 2, 5])
      [1, 2, 2, 3, 3, 4, 5]
      iex> Crack.Chapter2_1.start(list)
      [1, 2, 3, 4, 5]

      iex> Crack.Chapter2_1.start([])
      []

      iex> Crack.Chapter2_1.start([1, 1, 1, 1])
      [1]

      iex> Crack.Chapter2_1.start([1, 2, 3, 4])
      [1, 2, 3, 4]

  """
  def start(list) do
    remove_dups(list, [])
  end

  defp remove_dups([h, h | tail], acc) do
    remove_dups([h | tail], acc)
  end

  defp remove_dups([h | tail], acc) do
    remove_dups(tail, acc ++ [h])
  end

  defp remove_dups([], acc), do: acc
end
