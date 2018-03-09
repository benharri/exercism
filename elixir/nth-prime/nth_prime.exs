defmodule Prime do
  @doc """
  Generates the nth prime.
  """
  @spec nth(non_neg_integer) :: non_neg_integer
  def nth(count) when count > 0 do
    Stream.iterate(1, &(&1 + 1))
    |> Stream.filter(&prime?/1)
    |> Enum.at(count - 1)
  end

  defp prime?(n) do
    case n do
      _n when n <= 1 ->
        false

      2 ->
        true

      _ ->
        2..round(:math.sqrt(n))
        |> Enum.filter(&(rem(n, &1) == 0))
        |> Enum.empty?()
    end
  end
end
