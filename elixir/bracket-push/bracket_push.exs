defmodule BracketPush do
  @doc """
  Checks that all the brackets and braces in the string are matched correctly, and nested correctly
  """
  @spec check_brackets(String.t()) :: boolean
  def check_brackets(str) do
    check(String.graphemes(str), [])
  end

  String.graphemes("{}()[]<>")
  |> Enum.chunk_every(2)
  |> Enum.each(fn pair ->
    [o, c] = pair
    defp check([unquote(o) | tail], stack), do: check(tail, [unquote(o) | stack])
    defp check([unquote(c) | tail], [unquote(o) | stack]), do: check(tail, stack)
    defp check([unquote(c) | _], _), do: false
  end)

  defp check([_head | tail], stack), do: check(tail, stack)
  defp check([], []), do: true
  defp check([], _), do: false
end
