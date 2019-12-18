defmodule Chapter2_5Test do
  use ExUnit.Case

  describe "Cycle finder algorithm" do
    test "should work on pure cycles" do
      stream = Stream.cycle([101, 102, 103])
      assert Crack.Chapter2_5.start(stream) === 101
    end
  end
end
