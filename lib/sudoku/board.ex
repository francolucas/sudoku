defmodule Sudoku.Board do
  def new do
    map_keys()
  end

  defp map_keys(board \\ %{}, row \\ 0, column \\ 0)

  defp map_keys(board, _row, 9) do
    board
  end

  defp map_keys(board, 9, column) do
    map_keys(board, 0, column + 1)
  end

  defp map_keys(board, row, column) do
    Map.put(board, String.to_atom("r#{row}c#{column}"), nil)
    |> map_keys(row + 1, column)
  end
end
