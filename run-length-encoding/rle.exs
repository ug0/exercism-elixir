defmodule RunLengthEncoder do
  @doc """
  Generates a string where consecutive elements are represented as a data value and count.
  "AABBBCCCC" => "2A3B4C"
  For this example, assume all input are strings, that are all uppercase letters.
  It should also be able to reconstruct the data into its original form.
  "2A3B4C" => "AABBBCCCC"
  """
  @spec encode(String.t()) :: String.t()
  def encode(string) do
    _encode(string, 1, "")
  end

  defp _encode("", _, str), do: str
  defp _encode(<<h::binary-1, h::binary-1, tail::binary>>, n, str), do: _encode(h <> tail, n+1, str)
  defp _encode(<<h::binary-1, tail::binary>>, 1, str), do: _encode(tail, 1, str <> h)
  defp _encode(<<h::binary-1, tail::binary>>, n, str), do: _encode(tail, 1, str <> Integer.to_string(n) <> h)

  @spec decode(String.t()) :: String.t()
  def decode(string) do
    _decode(Integer.parse(string), string)
  end

  defp _decode(:error, ""), do: ""
  defp _decode(:error, <<h::binary-1, tail::binary>>), do: h <> _decode(Integer.parse(tail), tail)
  defp _decode({n, <<h::binary-1, tail::binary>>}, _str), do: String.duplicate(h, n) <> _decode(Integer.parse(tail), tail)




  # another version of `encode` by converting to charlist
  @spec encode_alt(String.t()) :: String.t()
  def encode_alt(""), do: ""
  def encode_alt(string) do
    string
    |> String.to_charlist
    |> _encode_alt
    |> Enum.reverse
    |> List.to_string
  end

  defp _encode_alt(list) do
    _encode_alt(list, 1, [])
  end

  defp _encode_alt([head | []], 1, result), do: [head | result]
  defp _encode_alt([head | []], n, result), do: [head, Integer.to_charlist(n) | result]

  defp _encode_alt([head, head | tail], n, result) do
    _encode_alt([head | tail], n + 1, result)
  end

  defp _encode_alt([head | tail], 1, result) do
    _encode_alt(tail, 1, [head | result])
  end

  defp _encode_alt([head | tail], n, result) do
    _encode_alt(tail, 1, [head, Integer.to_charlist(n) | result])
  end
end
