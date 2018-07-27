defmodule Anagram do
  @doc """
  Returns all candidates that are anagrams of, but not equal to, 'base'.
  """
  @spec match(String.t(), [String.t()]) :: [String.t()]
  def match(base, candidates) do
    Enum.filter(candidates, fn cand ->
      word_match?(String.downcase(base), String.downcase(cand))
    end)
  end

  defp word_match?(word, word), do: false

  defp word_match?(base, word) do
    standardize(base) == standardize(word)
  end

  defp standardize(word) do
    word
    |> String.codepoints()
    |> Enum.sort()
  end
end
