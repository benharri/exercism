defmodule ListOps do
  @doc """
  so apparently you can build the rest of these
  functions with *just* `reduce`... neat!
  """
  @type acc :: any
  @spec reduce(list, acc, (any, acc -> acc)) :: acc
  def reduce([], acc, _f), do: acc
  def reduce([h | t], acc, f), do: reduce(t, f.(h, acc), f)

  @spec count(list) :: non_neg_integer
  def count(l) do
    reduce(l, 0, fn _, acc -> acc + 1 end)
  end

  @spec reverse(list) :: list
  def reverse(l) do
    reduce(l, [], &[&1 | &2])
  end

  @spec map(list, (any -> any)) :: list
  def map(l, f) do
    reduce(reverse(l), [], &[f.(&1) | &2])
  end

  @spec filter(list, (any -> as_boolean(term))) :: list
  def filter(l, f) do
    reduce(reverse(l), [], fn x, acc ->
      if f.(x), do: [x | acc], else: acc
    end)
  end

  @spec append(list, list) :: list
  def append(a, b) do
    reduce(reverse(a), b, &[&1 | &2])
  end

  @spec concat([[any]]) :: [any]
  def concat(ll) do
    reduce(reverse(ll), [], &append(&1, &2))
  end
end
