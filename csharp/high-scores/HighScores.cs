using System;
using System.Collections.Generic;
using System.Linq;

public class HighScores
{
    private readonly List<int> ScoreList;

    public HighScores(List<int> list) => ScoreList = list;

    public List<int> Scores() => ScoreList;

    public int Latest() => ScoreList.Last();

    public int PersonalBest() => ScoreList.Max();

    public List<int> PersonalTopThree() => ScoreList.OrderByDescending(x => x).Take(3).ToList();
}