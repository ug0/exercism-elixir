defmodule Sublist do
  @doc """
  Returns whether the first list is a sublist or a superlist of the second list
  and if not whether it is equal or unequal to the second list.
  """
  def compare(a, b) do
    cond do
      a == b            -> :equal
      is_sublist?(a, b) -> :sublist
      is_sublist?(b, a) -> :superlist
      true              -> :unequal
    end
  end

  defp is_sublist?(_, []), do: false
  defp is_sublist?(a, b = [_h | t]), do: head_match?(a, b) || is_sublist?(a, t)

  defp head_match?([], _), do: true
  defp head_match?([h | t1], [h | t2]), do: head_match?(t1, t2)
  defp head_match?(_, _), do: false
end
