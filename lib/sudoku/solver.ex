defmodule Sudoku.Solver do
  @possible_numbers [1, 2, 3, 4, 5, 6, 7, 8, 9]

  def solve(%{} = board) do
    board
    |> solve_rows()
    |> solve_columns()
    |> solve_nonets()
  end

  defp solve_rows(board) do
    board |> Enum.map(fn {row, columns} -> {row, solve_row(columns)} end) |> Enum.into(%{})
  end

  # So far it only solves rows with only one missing value
  defp solve_row(columns) do
    values = Map.values(columns)
    difference = @possible_numbers -- (values |> Enum.filter(&(!is_nil(&1))))

    case length(difference) do
      1 ->
        columns
        |> Enum.map(fn {key, value} ->
          {key, (is_nil(value) && List.first(difference)) || value}
        end)
        |> Enum.into(%{})

      _ ->
        columns
    end
  end

  defp solve_columns(board), do: board

  defp solve_nonets(board), do: board
end
