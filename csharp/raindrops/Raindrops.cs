using System;
using System.Linq;
using System.Text;

public static class Raindrops
{
    public static string Convert(int number)
    {
        var s = new StringBuilder();
        if (number % 3 == 0)
            s.Append("Pling");
        if (number % 5 == 0)
            s.Append("Plang");
        if (number % 7 == 0)
            s.Append("Plong");
        if (new [] {3, 5, 7}.All(n => number % n != 0))
            s.Append(number);
        return s.ToString();
    }
}