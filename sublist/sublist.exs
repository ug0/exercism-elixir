defmodule Sublist do
  @doc """
  Returns whether the first list is a sublist or a superlist of the second list
  and if not whether it is equal or unequal to the second list.
  """
  def compare(l1, l2) when length(l1) < length(l2), do: compare(l1, l2, :sublist)
  def compare(l1, l2) when length(l1) > length(l2), do: compare(l2, l1, :superlist)
  def compare(l1, l2), do: compare(l1, l2, :equal)

  defp compare(l, l, guess), do: guess
  defp compare(l1, l2, _guess) when length(l1) == length(l2), do: :unequal

  defp compare(l1, l2 = [h | t], guess) when length(l1) < length(l2) do
    if l1 === Enum.slice(l2, 0, length(l1)) do
      guess
    else
      compare(l1, t, guess)
    end
  end
end
