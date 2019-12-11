defmodule Chapter2_3Test do
  use ExUnit.Case

  describe "Impossible algorithm" do
    test "should raise an exception" do
      assert_raise RuntimeError, fn ->
        Crack.Chapter2_3.start("")
      end
    end
  end
end
