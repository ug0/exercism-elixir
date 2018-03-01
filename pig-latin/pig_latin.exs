defmodule PigLatin do
  @one_letter_constants ~w(b c d f g h j k l m n p q r s t v w x y z)
  @two_letters_constants ~w(qu th thr sch)
  @two_letters_vowels ~w(yt xr)

  @doc """
  Given a `phrase`, translate it a word at a time to Pig Latin.

  Words beginning with consonants should have the consonant moved to the end of
  the word, followed by "ay".

  Words beginning with vowels (aeiou) should have "ay" added to the end of the
  word.

  Some groups of letters are treated like consonants, including "ch", "qu",
  "squ", "th", "thr", and "sch".

  Some groups are treated like vowels, including "yt" and "xr".
  """
  @spec translate(phrase :: String.t()) :: String.t()
  def translate(phrase) do
    phrase
    |> String.split()
    |> Stream.map(&(_translate(&1, "")))
    |> Enum.join(" ")
  end

  defp _translate(phrase = <<char::binary-2, _::binary>>, tail) when char in @two_letters_vowels do
    phrase <> tail <> "ay"
  end

  defp _translate(<<char::binary-2, phrase::binary>>, tail) when char in @two_letters_constants do
    _translate(phrase, tail <> char)
  end

  defp _translate(<<char::binary-1, phrase::binary>>, tail) when char in @one_letter_constants do
    _translate(phrase, tail <> char)
  end

  defp _translate(phrase, tail), do: phrase <> tail <> "ay"
end

