defmodule Sublist do
  @doc """
  Returns whether the first list is a sublist or a superlist of the second list
  and if not whether it is equal or unequal to the second list.
  """
  def compare(a, b) do
    cond do
      a === b ->
        :equal

      length(a) == length(b) && a !== b ->
        :unequal

      is_sublist?(a, b) ->
        :superlist

      is_sublist?(b, a) ->
        :sublist

      true ->
        :unequal
    end
  end

  defp is_sublist?(_, []), do: true
  defp is_sublist?([], _), do: false

  defp is_sublist?(a = [head | rest], b) do
    if head === hd(b) && Enum.take(a, Enum.count(b)) == b do
      true
    else
      is_sublist?(rest, b)
    end
  end
end
