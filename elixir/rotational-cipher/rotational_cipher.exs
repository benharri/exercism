defmodule RotationalCipher do
  @doc """
  Given a plaintext and amount to shift by, return a rotated string.

  Example:
  iex> RotationalCipher.rotate("Attack at dawn", 13)
  "Nggnpx ng qnja"
  """
  @spec rotate(text :: String.t(), shift :: integer) :: String.t()
  def rotate(text, shift) do
    for <<c <- text>>, into: "" do
      if Regex.match?(~r/[a-zA-Z]/, <<c>>) do
        <<rem(c + shift, 26) + ?z>>
      else
        <<c>>
      end
    end
  end
end
