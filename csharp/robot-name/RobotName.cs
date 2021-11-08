using System;
using System.Collections.Generic;

public class Robot
{
    private static readonly HashSet<string> _usedNames = new();
    private readonly Random _rand;
    public string Name { get; set; }

    public Robot()
    {
        _rand = new();
        Reset();
    }

    public void Reset()
    {
        var name = GenerateRandomName();
        while (!_usedNames.Add(name))
            name = GenerateRandomName();

        Name = name;
    }

    private string GenerateRandomName() =>
        $"{Convert.ToChar(_rand.Next(65, 91))}{Convert.ToChar(_rand.Next(65, 91))}{_rand.Next(0, 9)}{_rand.Next(0, 9)}{_rand.Next(0, 9)}";
}