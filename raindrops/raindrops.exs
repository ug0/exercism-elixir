defmodule Raindrops do
  @doc """
  Returns a string based on raindrop factors.

  - If the number contains 3 as a prime factor, output 'Pling'.
  - If the number contains 5 as a prime factor, output 'Plang'.
  - If the number contains 7 as a prime factor, output 'Plong'.
  - If the number does not contain 3, 5, or 7 as a prime factor,
    just pass the number's digits straight through.
  """
  @spec convert(pos_integer) :: String.t
  def convert(number) do
    ""
    |> append_string("Pling", rem(number, 3))
    |> append_string("Plang", rem(number, 5))
    |> append_string("Plong", rem(number, 7))
    |> final_check(number)
  end

  def append_string(origin, str, 0), do: origin <> str
  def append_string(origin, _str, _), do: origin
  def final_check("", num), do: to_string(num)
  def final_check(str, _), do: str
end
