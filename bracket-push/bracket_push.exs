defmodule BracketPush do
  @opening_brackets '[({'
  @closing_brackets '])}'
  @brackets_map Stream.zip(@opening_brackets, @closing_brackets)
                |> Enum.reduce(%{}, fn {op, cl}, m -> Map.put(m, op, cl) end)

  @doc """
  Checks that all the brackets and braces in the string are matched correctly, and nested correctly
  """
  @spec check_brackets(String.t()) :: boolean
  def check_brackets(str) do
    _check_brackets(str, [])
  end

  defp _check_brackets("", []), do: true
  defp _check_brackets("", _), do: false
  defp _check_brackets(_, _, :abort), do: false

  defp _check_brackets(<<bracket::utf8, rest::binary>>, expecting_brackets)
       when bracket in @opening_brackets do
    _check_brackets(rest, [find_closing_bracket(bracket) | expecting_brackets])
  end

  defp _check_brackets(<<bracket::utf8, rest::binary>>, [bracket | bottom])
       when bracket in @closing_brackets do
    _check_brackets(rest, bottom)
  end

  defp _check_brackets(<<bracket::utf8, rest::binary>>, expecting_brackets)
       when bracket in @closing_brackets do
    _check_brackets(rest, expecting_brackets, :abort)
  end

  defp _check_brackets(<<_::utf8, rest::binary>>, expecting_brackets) do
    _check_brackets(rest, expecting_brackets)
  end

  defp find_closing_bracket(bracket) do
    Map.fetch!(@brackets_map, bracket)
  end
end
