defmodule Scrabble do
  @doc """
  Calculate the scrabble score for the word.
  """
  @spec score(String.t()) :: non_neg_integer
  def score(word) do
    word
    |> String.graphemes()
    |> Enum.reduce(0, &(score_of_letter(&1) + &2))
  end


  defp score_of_letter(l), do: l |> String.upcase() |> _score_of_letter()
  defp _score_of_letter(l) when l in ~w(A E I O U L N R S T), do: 1
  defp _score_of_letter(l) when l in ~w(D G), do: 2
  defp _score_of_letter(l) when l in ~w(B C M P), do: 3
  defp _score_of_letter(l) when l in ~w(F H V W Y), do: 4
  defp _score_of_letter(l) when l in ~w(K), do: 5
  defp _score_of_letter(l) when l in ~w(J X), do: 8
  defp _score_of_letter(l) when l in ~w(Q Z), do: 10
  defp _score_of_letter(_), do: 0
end
