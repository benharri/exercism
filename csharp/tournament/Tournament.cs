using System.Collections.Generic;
using System.IO;
using System.Linq;

public static class Tournament
{   
    public static void Tally(Stream inStream, Stream outStream)
    {
        var teams = new Dictionary<string, Team>();
        using var reader = new StreamReader(inStream);
        using var writer = new StreamWriter(outStream);

        while (reader.Peek() != -1)
        {
            var split = reader.ReadLine().Split(';');
            var team1 = teams.ContainsKey(split[0]) ? teams[split[0]] : new Team { Name = split[0] };
            var team2 = teams.ContainsKey(split[1]) ? teams[split[1]] : new Team { Name = split[1] };

            switch (split[2])
            {
                case "win":
                    team1.Points += 3;
                    team1.Won++;
                    team2.Lost++;
                    break;
                case "loss":
                    team2.Points += 3;
                    team1.Lost++;
                    team2.Won++;
                    break;
                case "draw":
                    team1.Points++;
                    team2.Points++;
                    team1.Drawn++;
                    team2.Drawn++;
                    break;
            }

            teams[split[0]] = team1;
            teams[split[1]] = team2;
        }

        var output = new List<string>(teams.Count + 1) { "Team                           | MP |  W |  D |  L |  P" };
        output.AddRange(teams.Values.OrderByDescending(t => t.Points).ThenBy(t => t.Name).Select(t => t.PrintRow()));
        writer.Write(string.Join('\n', output));
    }
}

public class Team
{
    public string Name { get; set; }
    public int Played => Won + Drawn + Lost;
    public int Won { get; set; }
    public int Drawn { get; set; }
    public int Lost { get; set; }
    public int Points { get; set; }
    public string PrintRow() =>
        $"{Name,-30} | {Played,2} | {Won,2} | {Drawn,2} | {Lost,2} | {Points,2}";
}