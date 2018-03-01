defmodule SecretHandshake do
  use Bitwise, only_operators: true
  @doc """
  Determine the actions of a secret handshake based on the binary
  representation of the given `code`.

  If the following bits are set, include the corresponding action in your list
  of commands, in order from lowest to highest.

  1 = wink
  10 = double blink
  100 = close your eyes
  1000 = jump

  10000 = Reverse the order of the operations in the secret handshake
  """
  @codes [
    {0b1000, "jump"},
    {0b100, "close your eyes"},
    {0b10, "double blink"},
    {0b1, "wink"},
  ]
  @reverse_bit 0b10000
  @spec commands(code :: integer) :: list(String.t())
  def commands(code) do
    shake = Enum.reduce(@codes, [], fn({key, op}, acc) ->
      if (code &&& key) > 0, do: [op | acc], else: acc
    end)
    if (code &&& @reverse_bit) > 0, do: Enum.reverse(shake), else: shake
  end
end

