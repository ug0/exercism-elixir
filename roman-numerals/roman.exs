defmodule Roman do
  @doc """
  Convert the number to a roman number.
  """

  @spec numerals(pos_integer) :: String.t()
  def numerals(number) when number in 0..3999 do
    number
    |> Integer.digits()
    |> Enum.reverse()
    |> Stream.with_index()
    |> Stream.map(fn {n, pos} -> present_num(n, pos) end)
    |> Enum.reverse()
    |> Enum.join()
  end

  defp present_num(0, _), do: ""

  defp present_num(n, 0) when n in 1..3, do: String.duplicate("I", n)
  defp present_num(n, 1) when n in 1..3, do: String.duplicate("X", n)
  defp present_num(n, 2) when n in 1..3, do: String.duplicate("C", n)
  defp present_num(n, 3) when n in 1..3, do: String.duplicate("M", n)
  defp present_num(5, 0), do: "V"
  defp present_num(5, 1), do: "L"
  defp present_num(5, 2), do: "D"

  defp present_num(4, pos), do: present_num(1, pos) <> present_num(5, pos)
  defp present_num(n, pos) when n in 6..8, do: present_num(5, pos) <> present_num(n - 5, pos)
  defp present_num(9, pos), do: present_num(1, pos) <> present_num(1, pos + 1)
end
