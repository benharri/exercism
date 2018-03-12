using System;
using System.Collections.Generic;
using System.Linq;

public enum Plant
{
    Violets,
    Radishes,
    Clover,
    Grass
}

public class KindergartenGarden
{
    private List<string> roster;
    private Dictionary<string, List<Plant>> plants;

    private static readonly IDictionary<char, Plant> PlantCodesToPlants = new Dictionary<char, Plant>
    {
        { 'V', Plant.Violets },
        { 'R', Plant.Radishes },
        { 'C', Plant.Clover },
        { 'G', Plant.Grass }
    };

    public KindergartenGarden(string diagram)
    {
        roster = new List<string>
        {
            "Alice", "Bob", "Charlie", "David",
            "Eve", "Fred", "Ginny", "Harriet",
            "Ileana", "Joseph", "Kincaid", "Larry"
        };
        BuildFromDiagram(diagram);
    }

    public KindergartenGarden(string diagram, IEnumerable<string> students)
    {
        roster = students.ToList();
        BuildFromDiagram(diagram);
    }

    private void BuildFromDiagram(string diagram)
    {
        var rows = diagram.Split("\n");
        foreach (var student in roster)
        {

        }
    }

    public IEnumerable<Plant> Plants(string student)
    {
        throw new NotImplementedException("You need to implement this function.");
    }
}