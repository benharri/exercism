defmodule Tournament do
  defmodule Stat do
    defstruct mp: 0, w: 0, d: 0, l: 0, p: 0
  end

  @doc """
  Given `input` lines representing two teams and whether the first of them won,
  lost, or reached a draw, separated by semicolons, calculate the statistics
  for each team's number of games played, won, drawn, lost, and total points
  for the season, and return a nicely-formatted string table.

  A win earns a team 3 points, a draw earns 1 point, and a loss earns nothing.

  Order the outcome by most total points for the season, and settle ties by
  listing the teams in alphabetical order.
  """
  @spec tally(input :: list(String.t())) :: String.t()
  def tally(input) do
    import String, only: [pad_trailing: 2, pad_leading: 2]

    input
    |> Enum.map(&String.split(&1, ";"))
    |> Enum.filter(&(length(&1) == 3 && Enum.at(&1, 2) in ["win", "loss", "draw"]))
    |> Enum.reduce(%{}, fn [team1, team2, outcome], acc ->
      acc
      |> Map.put(team1, stats(Map.get(acc, team1, %Stat{}), outcome))
      |> Map.put(team2, stats(Map.get(acc, team2, %Stat{}), opposite_outcome(outcome)))
    end)
    |> Enum.sort_by(fn {name, hist} -> {-hist.p, name} end)
    |> Enum.reduce("Team                           | MP |  W |  D |  L |  P", fn {name, hist}, acc ->
      acc <>
        "\n" <>
        Enum.join(
          [
            pad_trailing(name, 30),
            pad_leading(to_string(hist.mp), 2),
            pad_leading(to_string(hist.w), 2),
            pad_leading(to_string(hist.d), 2),
            pad_leading(to_string(hist.l), 2),
            pad_leading(to_string(hist.p), 2)
          ],
          " | "
        )
    end)
  end

  defp stats(team, "win"), do: %{team | mp: team.mp + 1, w: team.w + 1, p: team.p + 3}
  defp stats(team, "loss"), do: %{team | mp: team.mp + 1, l: team.l + 1}
  defp stats(team, "draw"), do: %{team | mp: team.mp + 1, d: team.d + 1, p: team.p + 1}

  defp opposite_outcome(outcome) do
    case outcome do
      "win" -> "loss"
      "loss" -> "win"
      "draw" -> "draw"
    end
  end
end
