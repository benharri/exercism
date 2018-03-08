defmodule SumOfMultiples do
  @doc """
  Adds up all numbers from 1 to a given end number that are multiples of the factors provided.
  """
  @spec to(non_neg_integer, [non_neg_integer]) :: non_neg_integer
  def to(limit, factors) do
    0..(limit - 1)
    |> Enum.filter(fn c -> Enum.any?(factors, fn m -> rem(c, m) == 0 end) end)
    |> Enum.sum()
  end
end
