defmodule Matrix do
  defstruct matrix: nil

  @doc """
  Convert an `input` string, with rows separated by newlines and values
  separated by single spaces, into a `Matrix` struct.
  """
  @spec from_string(input :: String.t()) :: %Matrix{}
  def from_string(input) do
    matrix =
      input
      |> String.split("\n")
      |> Enum.map(&parse_row/1)
      %Matrix{matrix: matrix}
  end

  defp parse_row(row) do
    row
    |> String.split
    |> Enum.map(fn n -> elem(Integer.parse(n), 0) end)
  end

  @doc """
  Write the `matrix` out as a string, with rows separated by newlines and
  values separated by single spaces.
  """
  @spec to_string(matrix :: %Matrix{}) :: String.t()
  def to_string(%Matrix{matrix: matrix}) do
    matrix
    |> Stream.map(&(Enum.join(&1, " ")))
    |> Enum.join("\n")
  end

  @doc """
  Given a `matrix`, return its rows as a list of lists of integers.
  """
  @spec rows(matrix :: %Matrix{}) :: list(list(integer))
  def rows(%Matrix{matrix: matrix}), do: matrix

  @doc """
  Given a `matrix` and `index`, return the row at `index`.
  """
  @spec row(matrix :: %Matrix{}, index :: integer) :: list(integer)
  def row(%Matrix{matrix: matrix}, index), do: Enum.at(matrix, index)

  @doc """
  Given a `matrix`, return its columns as a list of lists of integers.
  """
  @spec columns(matrix :: %Matrix{}) :: list(list(integer))
  def columns(matrix), do: columns_stream(matrix) |> Enum.to_list

  @doc """
  Given a `matrix` and `index`, return the column at `index`.
  """
  @spec column(matrix :: %Matrix{}, index :: integer) :: list(integer)
  def column(matrix, index) do
    matrix
    |> columns_stream
    |> Enum.at(index)
  end

  defp columns_stream(%Matrix{matrix: matrix}) do
    matrix
    |> Stream.zip()
    |> Stream.map(&Tuple.to_list/1)
  end
end
