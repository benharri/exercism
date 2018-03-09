defmodule Anagram do
  @doc """
  Returns all candidates that are anagrams of, but not equal to, 'base'.
  """
  @spec match(String.t(), [String.t()]) :: [String.t()]
  def match(base, candidates) do
    b = String.downcase(base)

    Enum.filter(candidates, fn w ->
      w = String.downcase(w)

      Enum.sort(String.graphemes(w)) == Enum.sort(String.graphemes(b)) &&
        String.length(b) == String.length(w) && b != w
    end)
  end
end
