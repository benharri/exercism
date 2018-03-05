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
    string
    |> String.graphemes()
    |> Enum.chunk_by(& &1)
    |> Enum.map_join(fn e ->
      if length(e) < 2, do: List.first(e), else: "#{length(e)}#{List.first(e)}"
    end)
  end

  @spec decode(String.t()) :: String.t()
  def decode(string) do
    Regex.replace(~r/([0-9]+)(.)/, string, fn _, num, letter ->
      num
      |> String.to_integer()
      |> (&String.duplicate(letter, &1)).()
    end)
  end
end
