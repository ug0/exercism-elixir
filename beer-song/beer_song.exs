defmodule BeerSong do
  @total 99
  @doc """
  Get a single verse of the beer song
  """
  @spec verse(integer) :: String.t()
  def verse(number) when number in 0..@total do
    """
    #{beer_on_the_wall(number) |> String.capitalize()}, #{beer(number)}.
    #{take_one(number) |> String.capitalize()}, #{beer_on_the_wall(number - 1)}.
    """
  end

  @doc """
  Get the entire beer song for a given range of numbers of bottles.
  """
  @spec lyrics(Range.t()) :: String.t()
  def lyrics(range \\ @total..0) do
    # Your implementation here...
    range
    |> Stream.map(&verse/1)
    |> Enum.join("\n")
  end

  defp beer(-1), do: "#{@total} bottles of beer"
  defp beer(0), do: "no more bottles of beer"
  defp beer(1), do: "1 bottle of beer"
  defp beer(n), do: "#{n} bottles of beer"

  defp beer_on_the_wall(n), do: beer(n) <> " on the wall"

  defp take_one(0), do: "go to the store and buy some more"
  defp take_one(1), do: "take it down and pass it around"
  defp take_one(n), do: "take one down and pass it around"
end
