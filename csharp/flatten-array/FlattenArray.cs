using System.Collections;

public static class FlattenArray
{
    public static IEnumerable Flatten(IEnumerable input)
    {
        foreach (var element in input)
        {
            if (element is null) continue;
            if (element is IEnumerable)
                foreach (var nestedElement in Flatten(element as IEnumerable))
                    yield return nestedElement;
            else
                yield return element;
        }
    }
}