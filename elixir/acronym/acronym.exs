defmodule Acronym do
  @doc """
  Generate an acronym from a string.
  "This is a string" => "TIAS"
  """
  @spec abbreviate(String.t()) :: String.t()
  def abbreviate(string) do
    string
    |> String.split(~r/(?=\p{Lu})|[ -]/iu, trim: true)
    |> Enum.map(fn w -> w |> String.first() |> String.upcase() end)
    |> Enum.join()
  end
end
