defmodule TwelveDays do
  @doc """
  Given a `number`, return the song's verse for that specific day, including
  all gifts for previous days in the same line.
  """
  @spec verse(number :: integer) :: String.t()
  def verse(number) do
    "On the #{num_to_word(number)} day of Christmas my true love gave to me, #{gifts_so_far(number)}"
  end

  @doc """
  Given a `starting_verse` and an `ending_verse`, return the verses for each
  included day, one per line.
  """
  @spec verses(starting_verse :: integer, ending_verse :: integer) :: String.t()
  def verses(starting_verse, ending_verse) do
    for n <- starting_verse..ending_verse do
      verse(n)
    end |> Enum.join("\n")
  end

  @doc """
  Sing all 12 verses, in order, one verse per line.
  """
  @spec sing():: String.t()
  def sing do
    verses(1, 12)
  end

  defp gifts_so_far(1) do
    "#{gift_on_day(1)}."
  end

  defp gifts_so_far(2) do
    "#{gift_on_day(2)}, and #{gift_on_day(1)}."
  end

  defp gifts_so_far(n) when is_integer(n) and n > 2 and n <= 12 do
    "#{gift_on_day(n)}, #{gifts_so_far(n - 1)}"
  end

  defp gift_on_day(1), do: "a Partridge in a Pear Tree"
  defp gift_on_day(2), do: "two Turtle Doves"
  defp gift_on_day(3), do: "three French Hens"
  defp gift_on_day(4), do: "four Calling Birds"
  defp gift_on_day(5), do: "five Gold Rings"
  defp gift_on_day(6), do: "six Geese-a-Laying"
  defp gift_on_day(7), do: "seven Swans-a-Swimming"
  defp gift_on_day(8), do: "eight Maids-a-Milking"
  defp gift_on_day(9), do: "nine Ladies Dancing"
  defp gift_on_day(10), do: "ten Lords-a-Leaping"
  defp gift_on_day(11), do: "eleven Pipers Piping"
  defp gift_on_day(12), do: "twelve Drummers Drumming"

  defp num_to_word(1), do: "first"
  defp num_to_word(2), do: "second"
  defp num_to_word(3), do: "third"
  defp num_to_word(4), do: "fourth"
  defp num_to_word(5), do: "fifth"
  defp num_to_word(6), do: "sixth"
  defp num_to_word(7), do: "seventh"
  defp num_to_word(8), do: "eighth"
  defp num_to_word(9), do: "ninth"
  defp num_to_word(10), do: "tenth"
  defp num_to_word(11), do: "eleventh"
  defp num_to_word(12), do: "twelfth"
end
