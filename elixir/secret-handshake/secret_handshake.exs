defmodule SecretHandshake do
  import Bitwise

  @doc """
  Determine the actions of a secret handshake based on the binary
  representation of the given `code`.

  If the following bits are set, include the corresponding action in your list
  of commands, in order from lowest to highest.

  1 = wink
  10 = double blink
  100 = close your eyes
  1000 = jump

  10000 = Reverse the order of the operations in the secret handshake
  """
  @spec commands(code :: integer) :: list(String.t())
  def commands(code) do
    []
    |> (fn acc -> if (code &&& 1) == 1, do: ["wink" | acc], else: acc end).()
    |> (fn acc -> if (code &&& 2) == 2, do: ["double blink" | acc], else: acc end).()
    |> (fn acc -> if (code &&& 4) == 4, do: ["close your eyes" | acc], else: acc end).()
    |> (fn acc -> if (code &&& 8) == 8, do: ["jump" | acc], else: acc end).()
    |> (fn acc -> if (code &&& 16) == 16, do: acc, else: Enum.reverse(acc) end).()
  end
end
