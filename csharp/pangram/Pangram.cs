using System.Linq;

public static class Pangram
{
    public static bool IsPangram(string input) =>
        Enumerable.Range('a', 26).All(l => input.ToLower().Contains((char)l));
}
