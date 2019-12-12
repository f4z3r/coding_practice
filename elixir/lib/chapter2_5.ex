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
  (i.e. not just faking it using streams) is not possible.
  """
  def start(_node) do
    raise "Not possible"
  end
end
