defmodule Crack.Chapter1_7 do
  @moduledoc """
  1.7 Matrix 0ing:

  Write an algorithm such that if an element of an MxN matrix is 0, its entire
  row and column is set to 0.
  """

  @doc """
  Turn rows and columns contains 0s into 0s.

      iex> matrix = [
      ...>   [1, 1, 1, 0],
      ...>   [1, 1, 1, 1],
      ...>   [1, 1, 1, 1],
      ...>   [0, 1, 1, 1]]
      [[1, 1, 1, 0], [1, 1, 1, 1], [1, 1, 1, 1], [0, 1, 1, 1]]
      iex> Crack.Chapter1_7.start(matrix)
      [[0, 0, 0, 0],
       [0, 1, 1, 0],
       [0, 1, 1, 0],
       [0, 0, 0, 0]]

       iex> matrix = [[0]]
       [[0]]
       iex> Crack.Chapter1_7.start(matrix)
       [[0]]

       iex> matrix = [[1]]
       [[1]]
       iex> Crack.Chapter1_7.start(matrix)
       [[1]]

       iex> matrix = [
       ...>   [1, 1, 1, 1, 1],
       ...>   [1, 1, 1, 1, 1],
       ...>   [1, 1, 0, 1, 1],
       ...>   [1, 1, 1, 1, 1],
       ...>   [1, 1, 1, 1, 1]]
       [[1, 1, 1, 1, 1],[1, 1, 1, 1, 1], [1, 1, 0, 1, 1], [1, 1, 1, 1, 1],
       [1, 1, 1, 1, 1]]
       iex> Crack.Chapter1_7.start(matrix)
       [[1, 1, 0, 1, 1],
        [1, 1, 0, 1, 1],
        [0, 0, 0, 0, 0],
        [1, 1, 0, 1, 1],
        [1, 1, 0, 1, 1]]

        iex> matrix = []
        []
        iex> Crack.Chapter1_7.start(matrix)
        []

        iex> matrix = [[1, 1, 1, 0, 1]]
        [[1, 1, 1, 0, 1]]
        iex> Crack.Chapter1_7.start(matrix)
        [[0, 0, 0, 0, 0]]

        iex> matrix = [
        ...>   [1, 1],
        ...>   [1, 1],
        ...>   [1, 0],
        ...>   [1, 1],
        ...>   [0, 1]]
        [[1, 1], [1, 1], [1, 0], [1, 1], [0, 1]]
        iex> Crack.Chapter1_7.start(matrix)
        [[0, 0],
         [0, 0],
         [0, 0],
         [0, 0],
         [0, 0]]


  > Note this is probably absolutely terrible in terms of performance. But I
    quite like this solution for some reason.

  """
  def start(matrix) do
    zero_rows =
      matrix
      |> Enum.map(&contains_zeros?/1)

    zero_cols =
      matrix
      |> transpose()
      |> Enum.map(&contains_zeros?/1)

    matrix
    |> Enum.zip(zero_rows)
    |> Enum.map(&replace_zeros/1)
    |> transpose()
    |> Enum.zip(zero_cols)
    |> Enum.map(&replace_zeros/1)
    |> transpose()
  end

  defp transpose(matrix) do
    matrix
    |> Enum.zip()
    |> Enum.map(&Tuple.to_list/1)
  end

  defp contains_zeros?(list) do
    Enum.any?(list, &(&1 === 0))
  end

  defp replace_zeros({list, false}), do: list

  defp replace_zeros({[], true}), do: []

  defp replace_zeros({[_ | tail], true}), do: [0 | replace_zeros({tail, true})]
end
