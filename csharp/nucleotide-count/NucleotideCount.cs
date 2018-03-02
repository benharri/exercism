using System;
using System.Collections.Generic;
using System.Linq;

public class NucleotideCount
{
    private string _seq;
    private char[] keys = new[] {'A', 'C', 'G', 'T'};

    public NucleotideCount(string sequence)
    {
        _seq = sequence;
        if (_seq.Any(c => !keys.Contains(c))) throw new InvalidNucleotideException();
    }

    private int CountOne(char key)
        => _seq.Count(c => c == key);

    public IDictionary<char, int> NucleotideCounts
    {
        get
        {
            var c = new Dictionary<char, int>();
            foreach (var key in keys)
                c.Add(key, CountOne(key));
            return c;
        }
    }
}

public class InvalidNucleotideException : Exception { }
