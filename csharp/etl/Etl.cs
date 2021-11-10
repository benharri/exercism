using System.Collections.Generic;
using System.Linq;

public static class Etl
{
    public static Dictionary<string, int> Transform(Dictionary<int, string[]> old)
    {
        Dictionary<string, int> result = new();
        foreach (var d in old)
        foreach (var l in d.Value.Select(v => v.ToLower()))
            result[l] = d.Key;

        return result;
    }
}