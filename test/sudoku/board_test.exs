defmodule Sudoku.BoardTest do
  use ExUnit.Case

  alias Sudoku.Board

  describe "Board.new/0" do
    test "correct board size" do
      board = Board.new()
      # Number of rows
      assert 9 == Kernel.map_size(board)
      # Number of columsn
      assert [9] == board |> Map.values() |> Enum.map(&Kernel.map_size/1) |> Enum.uniq()
    end

    test "empty values" do
      assert [] ==
               Board.new()
               |> Map.values()
               |> Enum.map(&Map.values/1)
               |> List.flatten()
               |> Enum.filter(&(!is_nil(&1)))
    end

    test "correct keys" do
      keys = [0, 1, 2, 3, 4, 5, 6, 7, 8]
      board = Board.new()
      # Rows
      assert keys == Map.keys(board)
      # Columns
      assert keys ==
               board |> Map.values() |> Enum.map(&Map.keys/1) |> Enum.uniq() |> List.flatten()
    end
  end
end
