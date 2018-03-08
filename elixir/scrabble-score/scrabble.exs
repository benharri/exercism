defmodule Scrabble do
  @doc """
  Calculate the scrabble score for the word.
  """
  @spec score(String.t()) :: non_neg_integer
  def score(word) do
    word
    |> String.upcase()
    |> String.to_charlist()
    |> Enum.reduce(0, fn c, acc -> acc + letter_score(c) end)
  end

  defp letter_score(letter) do
    case letter do
      c when c in [?A, ?E, ?I, ?O, ?U, ?L, ?N, ?R, ?S, ?T] ->
        1

      c when c in [?D, ?G] ->
        2

      c when c in [?B, ?C, ?M, ?P] ->
        3

      c when c in [?F, ?H, ?V, ?W, ?Y] ->
        4

      c when c in [?K] ->
        5

      c when c in [?J, ?X] ->
        8

      c when c in [?Q, ?Z] ->
        10

      _ ->
        0
    end
  end
end
