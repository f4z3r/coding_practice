defmodule Crack.Chapter1_5 do
  @moduledoc """
  1.5 Replace Spaces

  Write a method to replace all spaces in a string with '%20'.
  """

  @doc """
  Replace all spaces with '%20'.

      iex> Crack.Chapter1_5.start("Jakob Beckmann")
      "Jakob%20Beckmann"

      iex> Crack.Chapter1_5.start(" ")
      "%20"

      iex> Crack.Chapter1_5.start("   ")
      "%20%20%20"

      iex> Crack.Chapter1_5.start("Jakob")
      "Jakob"

      iex> Crack.Chapter1_5.start("https://github.com/jakobbeckmann/some windows file lol")
      "https://github.com/jakobbeckmann/some%20windows%20file%20lol"

  """
  def start(str) when is_binary(str) do
    str
    |> String.graphemes()
    |> replace_spaces()
    |> String.Chars.to_string()
  end

  defp replace_spaces([]), do: []

  defp replace_spaces([head | tail]) do
    case head do
      " " -> ["%", "2", "0" | replace_spaces(tail)]
      _ -> [head | replace_spaces(tail)]
    end
  end
end
