defmodule Strain do
  @doc """
  Given a `list` of items and a function `fun`, return the list of items where
  `fun` returns true.

  Do not use `Enum.filter`.
  """
  @spec keep(list :: list(any), fun :: ((any) -> boolean)) :: list(any)
  def keep(list, fun) do
    []
    |> filter_list(list, fun)
    |> Enum.reverse
  end

  @doc """
  Given a `list` of items and a function `fun`, return the list of items where
  `fun` returns false.

  Do not use `Enum.reject`.
  """
  @spec discard(list :: list(any), fun :: ((any) -> boolean)) :: list(any)
  def discard(list, fun) do
    []
    |> filter_list(list, &(!fun.(&1)))
    |> Enum.reverse
  end

  defp filter_list(collection, [head | tail], fun) do
    if fun.(head) do
      filter_list([head | collection], tail, fun)
    else
      filter_list(collection, tail, fun)
    end
  end

  defp filter_list(collection, [], fun) do
    collection
  end
end
