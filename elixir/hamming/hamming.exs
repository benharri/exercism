defmodule Hamming do
  @doc """
  Returns number of differences between two strands of DNA, known as the Hamming Distance.

  ## Examples

  iex> Hamming.hamming_distance('AAGTCATA', 'TAGCGATC')
  {:ok, 4}
  """
  @spec hamming_distance([char], [char]) :: non_neg_integer
  def hamming_distance(s1, s2) when length(s1) != length(s2) do
    {:error, "Lists must be the same length"}
  end

  def hamming_distance(s1, s2) do
    {:ok, Enum.count(0..length(s1), &(Enum.at(s1, &1) != Enum.at(s2, &1)))}
  end
end
