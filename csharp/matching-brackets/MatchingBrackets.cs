using System;
using System.Collections.Generic;

public static class MatchingBrackets
{
    private static readonly Dictionary<char, char> Brackets = new()
    {
        { '(', ')' },
        { '[', ']' },
        { '{', '}' }
    };

    public static bool IsPaired(string input)
    {
        var open = new Stack<char>();

        foreach (var c in input)
            if (Brackets.ContainsKey(c))
                open.Push(c);
            else if (Brackets.ContainsValue(c))
            {
                if (open.Count == 0 || c != Brackets[open.Peek()])
                    return false;
                
                open.Pop();
            }

        return open.Count == 0;
    }
}
