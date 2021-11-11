using System;
using System.Linq;

public enum Classification
{
    Perfect,
    Abundant,
    Deficient
}

public static class PerfectNumbers
{
    public static Classification Classify(int i)
    {
        if (i < 1) throw new ArgumentOutOfRangeException(nameof(i));

        var s = Enumerable.Range(1, (i + 1) / 2)
            .Where(div => div != i && i % div == 0)
            .Sum();

        return s < i ? Classification.Deficient : s > i ? Classification.Abundant : Classification.Perfect;
    }
}
