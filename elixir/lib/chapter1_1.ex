defmodule Crack.Chapter1_1 do
  @moduledoc """
  1.1 Is Unique:

  Implement an algorithm to determine if a string has all unique characters.
  What if you cannot use additional data structures?
  """

  @doc """
  Check string for uniqueness of all characters.

      iex> Crack.Chapter1_1.start("")
      true

      iex> Crack.Chapter1_1.start("abc")
      true

      iex> Crack.Chapter1_1.start("abca")
      false

      iex> Crack.Chapter1_1.start("qwfpgjluy;arstdhneiozxcvbkm,.")
      true

      iex> Crack.Chapter1_1.start("qwfpgjluy;arstdhneizxcvbkm,./q")
      false

  """
  def start(""), do: true

  def start(str), do: not has_duplicate?(str)

  defp has_duplicate?(str) do
    str
    |> String.graphemes()
    |> Enum.sort()
    |> has_adjacent_duplicates?()
  end

  defp has_adjacent_duplicates?([]), do: false

  defp has_adjacent_duplicates?([a, a | _]), do: true

  defp has_adjacent_duplicates?([_ | tail]), do: has_adjacent_duplicates?(tail)
end
