defmodule PigLatin do
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
  @vowels ["a", "e", "i", "o", "u", "xr", "yt"]
  @clusters ["ch", "sh", "qu", "sq", "th", "pl"]
  @triple_clusters ["thr", "sch", "squ", "str"]

  @spec translate(phrase :: String.t()) :: String.t()
  def translate(phrase) do
    phrase
    |> String.split()
    |> Enum.map(fn w ->
      cond do
        String.starts_with?(w, @vowels) ->
          "#{w}ay"

        String.starts_with?(w, @triple_clusters) ->
          {first, rest} = String.split_at(w, 3)
          "#{rest}#{first}ay"

        String.starts_with?(w, @clusters) ->
          {first, rest} = String.split_at(w, 2)
          "#{rest}#{first}ay"

        true ->
          {first, rest} = String.split_at(w, 1)
          "#{rest}#{first}ay"
      end
    end)
    |> Enum.join(" ")
  end
end
