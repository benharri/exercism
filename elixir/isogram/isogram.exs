defmodule Isogram do
  @doc """
  Determines if a word or sentence is an isogram
  """
  @spec isogram?(String.t()) :: boolean
  def isogram?(sentence) do
    letters = Regex.scan(~r/[a-z]/, String.downcase(sentence))
    Enum.uniq(letters) == letters
  end
end
