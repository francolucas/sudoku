defmodule Sudoku.Board do
  def new do
    new_map()
    |> new_map()
  end

  defp new_map(value \\ nil) do
    Enum.into(0..8, %{}, &{&1, value})
  end
end
