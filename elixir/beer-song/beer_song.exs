defmodule BeerSong do
  @doc """
  Get a single verse of the beer song
  """
  @spec verse(integer) :: String.t()
  def verse(number) do
    """
    #{String.capitalize(bottle_num(number))} of beer on the wall, #{bottle_num(number)} of beer.
    #{action(number)}, #{bottle_num(number - 1)} of beer on the wall.
    """
  end

  defp bottle_num(num) do
    case num do
      1 -> "1 bottle"
      0 -> "no more bottles"
      n when n < 0 -> "99 bottles"
      _ -> "#{num} bottles"
    end
  end

  defp action(num) do
    if num == 0 do
      "Go to the store and buy some more"
    else
      article = if num == 1, do: "it", else: "one"
      "Take #{article} down and pass it around"
    end
  end

  @doc """
  Get the entire beer song for a given range of numbers of bottles.
  """
  @spec lyrics(Range.t()) :: String.t()
  def lyrics(range \\ 99..0) do
    range
    |> Enum.map(&verse/1)
    |> Enum.join("\n")
  end
end
