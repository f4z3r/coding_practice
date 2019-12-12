defmodule Chapter2_5Test do
  use ExUnit.Case

  describe "Impossible algorithm" do
    test "should raise an exception" do
      assert_raise RuntimeError, fn ->
        Crack.Chapter2_5.start("")
      end
    end
  end
end
