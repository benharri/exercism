<?php

declare(strict_types=1);

class Tournament
{
    public function __construct()
    {
        $this->teams = [];
    }

    public function tally(string $scores) : string
    {
        foreach (explode(PHP_EOL, $scores) as $game)
        {
            [$t1, $t2, $outcome] = explode(';', $game);
            if (count($split) < 3) continue;
            $team1 = $this->teams[$t1] ?? ["Team" => $t1, "MP" => 0, "P" => 0, "W" => 0, "L" => 0, "D" => 0];
            $team2 = $this->teams[$t2] ?? ["Team" => $t2, "MP" => 0, "P" => 0, "W" => 0, "L" => 0, "D" => 0];

            $team1["MP"]++;
            $team2["MP"]++;

            switch ($outcome)
            {
                case "win":
                    $team1["P"] += 3;
                    $team1["W"]++;
                    $team2["L"]++;
                    break;
                case "loss":
                    $team2["P"] += 3;
                    $team2["W"]++;
                    $team1["L"]++;
                    break;
                case "draw":
                    $team1["P"]++;
                    $team2["P"]++;
                    $team1["D"]++;
                    $team2["D"]++;
                    break;
            }

            $this->teams[$t1] = $team1;
            $this->teams[$t2] = $team2;
        }

        array_multisort(array_column($this->teams, 'P'), SORT_DESC,
                        array_column($this->teams, 'Team', SORT_ASC),
                        $this->teams);

        $result[] = "Team                           | MP |  W |  D |  L |  P";

        foreach ($this->teams as $t)
        {
            $result[] = sprintf("%-30s | %2d | %2d | %2d | %2d | %2d",
                $t["Team"], $t["MP"], $t["W"], $t["D"], $t["L"], $t["P"]);
        }

        return implode(PHP_EOL, $result);
    }
}
