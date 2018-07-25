defmodule SumOfMultiples do
  @doc """
  Adds up all numbers from 1 to a given end number that are multiples of the factors provided.
  """
  @spec to(non_neg_integer, [non_neg_integer]) :: non_neg_integer
  def to(limit, factors) do
    1..limit
    |> Stream.filter(&(&1 != limit and multipled_by?(&1, factors)))
    |> Enum.sum()
  end

  defp multipled_by?(n, factors) do
    Enum.any?(factors, &(rem(n, &1) == 0))
  end
end
