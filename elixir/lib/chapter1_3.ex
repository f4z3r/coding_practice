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

  def start(str) when is_binary(str) do
    <<head::utf8, _::binary>> = str
    remove_dups_from(str, head, <<>>)
  end

  defp remove_dups_from(<<>>, char, beginning) do
    if contains?(beginning, char) do
      beginning
    else
      <<beginning::binary, char::utf8>>
    end
  end

  defp remove_dups_from(<<head::utf8, tail::binary>>, char, beginning) do
    if contains?(beginning, char) do
      remove_dups_from(tail, head, beginning)
    else
      remove_dups_from(tail, head, <<beginning::binary, char::utf8>>)
    end
  end

  defp contains?(<<>>, _), do: false

  defp contains?(<<head::utf8, _::binary>>, head), do: true

  defp contains?(<<_::utf8, tail::binary>>, char), do: contains?(tail, char)
end
