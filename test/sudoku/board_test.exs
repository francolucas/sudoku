defmodule BoardTest do
  use ExUnit.Case

  alias Sudoku.Board

  describe "Board.new/0" do
    test "correct board size" do
      assert 81 == Board.new() |> Map.size()
    end

    test "empty values" do
      assert [] == Board.new() |> Enum.filter(fn {_, x} -> !is_nil(x) end)
    end
  end
end
