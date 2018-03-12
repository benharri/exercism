using System.Collections.Generic;
using System.Linq;

public class School
{
    private Dictionary<int, List<string>> roster = new Dictionary<int, List<string>>();

    public void Add(string student, int grade)
    {
        if (roster.ContainsKey(grade))
            roster[grade].Add(student);
        else
            roster.Add(grade, new List<string> {student});
    }

    public IEnumerable<string> Roster()
        => roster.Keys
            .OrderBy(g => g)
            .SelectMany(g => Grade(g))
            .ToList();

    public IEnumerable<string> Grade(int grade)
        => roster.ContainsKey(grade)
            ? roster[grade].OrderBy(g => g).ToList()
            : new List<string>();
}
