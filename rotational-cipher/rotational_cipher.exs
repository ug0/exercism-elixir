defmodule RotationalCipher do
  @doc """
  Given a plaintext and amount to shift by, return a rotated string.

  Example:
  iex> RotationalCipher.rotate("Attack at dawn", 13)
  "Nggnpx ng qnja"
  """
  @spec rotate(text :: String.t(), shift :: integer) :: String.t()
  def rotate(text, shift) when is_binary(text) do
    text
    |> String.to_charlist
    |> rotate(shift)
    |> List.to_string
  end

  @spec rotate(text :: List.t(), shift :: integer) :: List.t()
  def rotate(text, shift) when is_list(text) do
    text
    |> Enum.map(&rotate_char(&1, shift))
  end

  defp rotate_char(char, shift) when char in ?a..?z do
    ?a + rem(char + shift - ?a, 26)
  end

  defp rotate_char(char, shift) when char in ?A..?Z do
    ?A + rem(char + shift - ?A, 26)
  end

  defp rotate_char(char, _shift) do
    char
  end
end

