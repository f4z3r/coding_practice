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

  def start(str) when is_binary(str), do: reverse(str)

  defp reverse(<<>>), do: <<>>

  defp reverse(<<head::utf8, tail::binary>>) do
    <<reverse(tail)::binary, head::utf8>>
  end
end
