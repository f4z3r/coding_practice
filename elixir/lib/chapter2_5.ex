defmodule Crack.Chapter2_5 do
  @moduledoc """
  2.5 Circular List:

  Given a circular linked list, implement an algorithm which returns the node at
  the beginning of the loop.

  ## Definition
  Circular linked list: A (corrupt) linked list in which a node's next pointer
  points to an earlier node, so as to make a loop in the linked list.

  ## Example
  Input: A -> B -> C -> D -> E -> C (the same C as earlier)
  Output: C
  """

  @doc """
  This is not possible using Elixir as far as I know. Creating true cyclic lists
  (i.e. not just faking it using streams) is not possible. The following
  proposes a solution using streams.

      iex> stream = Stream.concat(1..3, Stream.cycle([4, 5, 6]))
      iex> Crack.Chapter2_5.start(stream)
      4

      iex> stream = Stream.concat(1..100, Stream.cycle([101, 102, 103]))
      iex> Crack.Chapter2_5.start(stream)
      101

      iex> stream = Stream.cycle([101, 102, 103])
      iex> Crack.Chapter2_5.start(stream)
      101

      iex> stream = Stream.concat(1..100, Stream.repeatedly(fn -> 101 end))
      iex> Crack.Chapter2_5.start(stream)
      101


  """
  def start(stream) do
    [{{_, _}, result}] =
      stream
      |> Stream.take_every(2)
      |> Stream.zip(stream)
      |> Stream.drop(1)
      |> Stream.drop_while(fn {a, b} -> a !== b end)
      |> Stream.zip(stream)
      |> Stream.drop_while(fn {{_, b}, c} -> b !== c end)
      |> Enum.take(1)

    result
  end
end
