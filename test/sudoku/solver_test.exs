defmodule Sudoku.SolverTest do
  use ExUnit.Case

  alias Sudoku.{Board, Solver}

  @initialize_easy %{
    0 => %{
      0 => 5,
      1 => 3,
      2 => 8,
      4 => 9,
      5 => 1,
      6 => 4,
      7 => 6,
      8 => 2
    },
    1 => %{
      0 => 1,
      1 => 4,
      2 => 7,
      3 => 2,
      4 => 5,
      5 => 8,
      7 => 3,
      8 => 6
    }
  }

  describe "Solver.solve/1" do
    test "fill the only one missing number in the row" do
      board_solved =
        Board.new()
        |> Map.merge(@initialize_easy, fn _, board, initialize -> Map.merge(board, initialize) end)
        |> Solver.solve()

      assert 7 == board_solved[0][3]
      assert 9 == board_solved[1][6]
    end
  end
end
