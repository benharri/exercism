using System;
using System.Linq;

public static class Bob
{
    public static string Response(string statement)
    {
        if (string.IsNullOrWhiteSpace(statement))
            return "Fine. Be that way!";
        if (statement.Any(Char.IsLetter) && statement.Where(Char.IsLetter).All(Char.IsUpper))
            if (statement.Contains("?"))
                return "Calm down, I know what I'm doing!";
            else
                return "Whoa, chill out!";
        if (statement.Trim().EndsWith("?"))
            return "Sure.";

        return "Whatever.";
    }
}