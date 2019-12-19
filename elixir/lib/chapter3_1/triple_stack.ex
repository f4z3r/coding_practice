defmodule Crack.Chapter3_1.TripleStack do
  @moduledoc """
  Describe how you could use a single array to implement three stacks.
  """

  alias Crack.Chapter3_1.MyNode
  alias Crack.Chapter3_1.TripleStack

  defstruct buffer: [],
            stack_pointers: %{first: -1, second: -1, third: -1}

  @typedoc """
  Defines a triple stack.
  """
  @type t :: %TripleStack{buffer: list, stack_pointers: list}

  @doc """
  Pushes to a stack.

     iex> alias Crack.Chapter3_1.TripleStack
     iex> s1 = %TripleStack{}
     iex> TripleStack.is_empty?(s1, :first)
     true
     iex> s1 = TripleStack.push(s1, :first, 101)
     iex> s1 = TripleStack.push(s1, :third, 301)
     iex> TripleStack.is_empty?(s1, :first)
     false
     iex> {_, val} = TripleStack.pop(s1, :first)
     iex> val
     101

  """
  @spec push(TripleStack.t(), atom, integer) :: TripleStack.t()
  def push(triple_stack, stack_num, value) do
    node = %MyNode{data: value, prev: triple_stack.stack_pointers[stack_num]}
    free = find_free(triple_stack.buffer)
    push_to_index(triple_stack, stack_num, node, free)
  end

  defp push_to_index(triple_stack, stack_num, node, nil) do
    index = length(triple_stack.buffer)
    new_buffer = triple_stack.buffer ++ [node]
    pointers = %{triple_stack.stack_pointers | stack_num => index}

    %TripleStack{
      buffer: new_buffer,
      stack_pointers: pointers
    }
  end

  defp push_to_index(triple_stack, stack_num, node, index) do
    new_buffer = List.replace_at(triple_stack.buffer, index, node)
    pointers = %{triple_stack.stack_pointers | stack_num => index}

    %TripleStack{
      buffer: new_buffer,
      stack_pointers: pointers
    }
  end

  @doc """
  Pop a value from some stack. Returns both a new triplet stack and the value
  popped from specified stack.

      iex> alias Crack.Chapter3_1.TripleStack
      iex> s1 = %TripleStack{}
      iex> s1 = TripleStack.push(s1, :first, 101)
      iex> s1 = TripleStack.push(s1, :first, 102)
      iex> s1 = TripleStack.push(s1, :first, 103)
      iex> s1 = TripleStack.push(s1, :first, 104)
      iex> s1 = TripleStack.push(s1, :second, 201)
      iex> {s2, val} = TripleStack.pop(s1, :first)
      iex> val
      104
      iex> {s3, val} = TripleStack.pop(s2, :second)
      iex> val
      201
      iex> {_, val} = TripleStack.pop(s3, :first)
      iex> val
      103

  """
  @spec pop(TripleStack.t(), atom) :: tuple
  def pop(triple_stack, stack_num) do
    index = triple_stack.stack_pointers[stack_num]
    pop_at_index(triple_stack, stack_num, index)
  end

  defp pop_at_index(triple_stack, _stack_num, -1) do
    {triple_stack, nil}
  end

  defp pop_at_index(triple_stack, stack_num, index) do
    node = Enum.at(triple_stack.buffer, index)
    new_buffer = List.replace_at(triple_stack.buffer, index, nil)
    pointers = %{triple_stack.stack_pointers | stack_num => node.prev}

    {
      %TripleStack{
        buffer: new_buffer,
        stack_pointers: pointers
      },
      node.data
    }
  end

  @doc """
  Peek the top of a stack. Does not remove the element.

      iex> alias Crack.Chapter3_1.TripleStack
      iex> s1 = %TripleStack{}
      iex> s1 = TripleStack.push(s1, :first, 101)
      iex> s1 = TripleStack.push(s1, :third, 301)
      iex> TripleStack.peek(s1, :first)
      101
      iex> {_, val} = TripleStack.pop(s1, :first)
      iex> val
      101

  """
  @spec peek(TripleStack.t(), atom) :: integer
  def peek(triple_stack, stack_num) do
    Enum.at(triple_stack.buffer, triple_stack.stack_pointers[stack_num]).data
  end

  @doc """
  Checks if a stack is empty.

      iex> alias Crack.Chapter3_1.TripleStack
      iex> s1 = %TripleStack{}
      iex> TripleStack.is_empty?(s1, :first)
      true
      iex> TripleStack.is_empty?(s1, :second)
      true
      iex> TripleStack.is_empty?(s1, :third)
      true
      iex> s1 = TripleStack.push(s1, :first, 101)
      iex> s1 = TripleStack.push(s1, :third, 301)
      iex> TripleStack.is_empty?(s1, :first)
      false
      iex> TripleStack.is_empty?(s1, :second)
      true
      iex> TripleStack.is_empty?(s1, :third)
      false
      iex> {s2, _} = TripleStack.pop(s1, :first)
      iex> TripleStack.is_empty?(s2, :first)
      true

  """
  @spec is_empty?(TripleStack.t(), atom) :: atom
  def is_empty?(triple_stack, stack_num) do
    triple_stack.stack_pointers[stack_num] === -1
  end

  defp find_free(buffer), do: Enum.find_index(buffer, fn x -> !x end)
end
