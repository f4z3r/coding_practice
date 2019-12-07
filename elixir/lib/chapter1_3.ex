defmodule Crack.Chapter1_3 do
  @moduledoc """
  1.3 Remove Duplicates

  Desginan algorithm and write code to remove the duplciate characters in a
  string without using any additional buffer. NOTE: One or two additional
  variables are fine. An extra copy of the array is not.

  FOLLOW UP
  Write the test cases for this method.
  """

  @doc """
  Remove duplicate characters of a string while only keeping the first
  occurence.

      iex> Crack.Chapter1_3.start(":")
      ":"

      iex> Crack.Chapter1_3.start("abcde")
      "abcde"

      iex> Crack.Chapter1_3.start("abababababaa")
      "ab"

      iex> Crack.Chapter1_3.start("abacccdddeabcad")
      "abcde"

  """
  def start(""), do: ""

  def start(str) do
    str
    |> String.graphemes()
    |> remove_dups_from(String.at(str, 0), [])
    |> List.to_string()
  end

  defp remove_dups_from([], char, beginning) do
    case char in beginning do
      true -> beginning
      false -> beginning ++ [char]
    end
  end

  defp remove_dups_from([head | tail], char, beginning) do
    case char in beginning do
      true -> remove_dups_from(tail, head, beginning)
      false -> remove_dups_from(tail, head, beginning ++ [char])
    end
  end
end
