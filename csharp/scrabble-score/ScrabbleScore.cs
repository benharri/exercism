using System;
using System.Linq;

public static class ScrabbleScore
{
    public static int Score(string input) =>
        input.Select(Score).Sum();

    private static int Score(char c) =>
        char.ToLower(c) switch
        {
            'a' or 'e' or 'i' or 'o' or 'u' or 'l' or 'n' or 'r' or 's' or 't' => 1,
            'd' or 'g' => 2,
            'b' or 'c' or 'm' or 'p' => 3,
            'f' or 'h' or 'v' or 'w' or 'y' => 4,
            'k' => 5,
            'j' or 'x' => 8,
            'q' or 'z' => 10,
            _ => throw new ArgumentOutOfRangeException(nameof(c)),
        };
}