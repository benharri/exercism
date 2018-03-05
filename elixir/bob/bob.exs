defmodule Bob do
  def hey(input) do
    cond do
      String.trim(input) in [nil, ""] ->
        "Fine. Be that way!"

      Regex.match?(~r/[a-zA-Z]/, input) && input == String.upcase(input) ->
        if String.contains?(input, "?"),
          do: "Calm down, I know what I'm doing!",
          else: "Whoa, chill out!"

      input |> String.trim() |> String.ends_with?("?") ->
        "Sure."

      true ->
        "Whatever."
    end
  end
end
