defmodule Roman do
  @romans [
    {"M", 1000},
    {"CM", 900},
    {"D", 500},
    {"CD", 400},
    {"C", 100},
    {"XC", 90},
    {"L", 50},
    {"XL", 40},
    {"X", 10},
    {"IX", 9},
    {"V", 5},
    {"IV", 4},
    {"I", 1}
  ]

  @doc """
  Convert the number to a roman number.
  """
  @spec numerals(pos_integer) :: String.t()
  def numerals(number) do
    numerals(@romans, number, "")
  end

  defp numerals(_romans, 0, res), do: res

  defp numerals([{_letter, number} | t], c, res) when c < number do
    numerals(t, c, res)
  end

  defp numerals([{letter, number} | _t] = list, c, res) do
    numerals(list, c - number, res <> letter)
  end
end
