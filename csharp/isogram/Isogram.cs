using System.Linq;

public static class Isogram
{
    public static bool IsIsogram(string word)
    {
        var w = word.ToLower().Where(char.IsLetter).ToList();
        return w.Distinct().Count() == w.Count;
    }
}
