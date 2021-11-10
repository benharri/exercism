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
    private readonly List<string> roster;
    private readonly string row1;
    private readonly string row2;

    private static readonly IDictionary<char, Plant> PlantCodesToPlants = new Dictionary<char, Plant>
    {
        { 'V', Plant.Violets },
        { 'R', Plant.Radishes },
        { 'C', Plant.Clover },
        { 'G', Plant.Grass }
    };

    public KindergartenGarden(string diagram)
    {
        var plants = diagram.Split('\n');
        row1 = plants[0]; row2 = plants[1];

        roster = new List<string>
        {
            "Alice", "Bob", "Charlie", "David",
            "Eve", "Fred", "Ginny", "Harriet",
            "Ileana", "Joseph", "Kincaid", "Larry"
        };
    }

    public IEnumerable<Plant> Plants(string student)
    {
        var i = 2 * roster.IndexOf(student);
        var plants = new List<Plant>();
        plants.AddRange(row1[i..(i + 2)].Select(p => PlantCodesToPlants[p]));
        plants.AddRange(row2[i..(i + 2)].Select(p => PlantCodesToPlants[p]));
        return plants;
    }
}