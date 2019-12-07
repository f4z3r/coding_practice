defmodule Crack.Chapter1_4 do
  @moduledoc """
  1.4 Anagrams:

  Write a method to decide if two strings are anagrams or not.
  """

  @doc """
  Checks if two strings are anagrams.

      iex> Crack.Chapter1_4.start("hello", "olelh")
      true

      iex> Crack.Chapter1_4.start("arg", "?")
      false

      iex> Crack.Chapter1_4.start("jakob beckmann", "manja bbocenkk")
      true

      iex> Crack.Chapter1_4.start("hello", "")
      false

      iex> Crack.Chapter1_4.start("holla", "hello")
      false

  """
  def start(str1, str2) when is_binary(str1) and is_binary(str2) do
    chars_1 = str1 |> String.graphemes |> Enum.sort
    chars_2 = str2 |> String.graphemes |> Enum.sort
    chars_1 === chars_2
  end
end
