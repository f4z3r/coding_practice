defmodule Crack.Chapter1_6 do
  @moduledoc """
  1.6 Matrix Swap:

  Given an image represented by an NxN matrix, where at each pixel in the image
  is 4 bytes, write a method to rotate the image by 90 degrees.
  """

  @doc """
  Rotate any square matrix by 90 degrees.

      iex> matrix = [
      ...>   [1, 2, 3, 4],
      ...>   [1, 2, 3, 4],
      ...>   [1, 2, 3, 4],
      ...>   [1, 2, 3, 4]]
      iex> Crack.Chapter1_6.start(matrix)
      [[1, 1, 1, 1],
       [2, 2, 2, 2],
       [3, 3, 3, 3],
       [4, 4, 4, 4]]

      iex> matrix = [[1]]
      iex> Crack.Chapter1_6.start(matrix)
      [[1]]

      iex> matrix = []
      iex> Crack.Chapter1_6.start(matrix)
      []

  """
  def start(matrix) do
    matrix
    |> Enum.zip()
    |> Enum.map(&Tuple.to_list/1)
  end
end
