defmodule Crack.Chapter1_2 do
  @moduledoc """
  1.2 C-String Rerversal:

  Write code to reverse a C-Style string. (C-String means that "abcd" is
  represented as five characters, including the null character.)
  """

  @doc """
  Reverse a C-Style string.

      iex> Crack.Chapter1_2.start("")
      ""

      iex> Crack.Chapter1_2.start("abba")
      "abba"

      iex> Crack.Chapter1_2.start("abcd")
      "dcba"

      iex> Crack.Chapter1_2.start("hello world!")
      "!dlrow olleh"

  """
  def start(""), do: ""

  def start(str) do
    str
    |> String.graphemes()
    |> reverse()
    |> List.to_string()
  end

  defp reverse([head]), do: [head]

  defp reverse([head | rest]) do
    reverse(rest) ++ [head]
  end
end
