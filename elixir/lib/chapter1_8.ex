defmodule Crack.Chapter1_8 do
  @moduledoc """
  1.8 String rotation:

  Assume you have a method isSubstring which checks if one word is a substring
  of another Given two strings, s1 and s2, write code to check if s2 is a
  rotation of s1 using only one call to isSubstring (i.e. “waterbottle” is a
  rotation of “erbottlewat”).
  """

  @doc """
  Check if a string is a rotation of another.

       iex> Crack.Chapter1_8.start("waterbottle", "erbottlewat")
       true

       iex> Crack.Chapter1_8.start("waterbottl", "erbottlewat")
       false

       iex> Crack.Chapter1_8.start("abba", "baab")
       true

       iex> Crack.Chapter1_8.start("dog", "cat")
       false

       iex> Crack.Chapter1_8.start("catcat", "cat")
       false

  """
  def start(str1, str2) when is_binary(str1) and is_binary(str2) do
    if String.length(str1) === String.length(str2) do
      is_substring? = &String.contains?/2
      concat = str1 <> str1
      is_substring?.(concat, str2)
    else
      false
    end
  end
end
