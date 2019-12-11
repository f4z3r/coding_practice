defmodule Crack.Chapter2_3 do
  @moduledoc """
  2.3 Node deletion:

  Implement an algorithm to delete a node in the middle of a single linked list,
  given only access to that node.

  ## Example

  Input: the node 'c' from the linked list a -> b -> c -> d -> e
  Output: nothing is returned, but the new linked list looks like
  a -> b -> d -> e
  """

  @doc """
  As far as I know, this question is not possible in languages having only
  immutable data types. In order to answer this question, one needs to modify
  the node that is given to the question, while preseving the pointer to the
  node. Essentially it forces a side effect in the form of a modification of a
  list passed by reference to the function. This is not possible to perform in
  elixir.
  """
  def start(_node) do
    raise "Not possible"
  end
end
