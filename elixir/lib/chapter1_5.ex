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
  def start(str) when is_binary(str), do: replace_spaces(str)

  defp replace_spaces(<<>>), do: <<>>

  defp replace_spaces(<<head::utf8, tail::binary>>) do
    case head do
      ?\s -> <<?%, ?2, ?0::utf8, replace_spaces(tail)::binary>>
      _ -> <<head::utf8, replace_spaces(tail)::binary>>
    end
  end
end
