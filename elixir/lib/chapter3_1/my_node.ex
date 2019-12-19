defmodule Crack.Chapter3_1.MyNode do
  alias Crack.Chapter3_1.MyNode
  @enforce_keys [:data, :prev]
  defstruct data: 0,
            prev: -1

  @typedoc """
  A simple node with data and a pointer.
  """
  @type t(data) :: %MyNode{data: data, prev: integer}

  @doc """
  Creates a new node.
  """
  @spec new(any, integer) :: MyNode.t()
  def new(data, prev) do
    %MyNode{data: data, prev: prev}
  end
end
