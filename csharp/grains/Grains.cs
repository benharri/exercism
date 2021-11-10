using System;

public static class Grains
{
    public static ulong Square(int n) =>
        n < 1 || n > 64 
            ? throw new ArgumentOutOfRangeException() 
            : (ulong)Math.Pow(2, n - 1);

    public static ulong Total()
    {
        var total = 0ul;
        for (int i = 1; i <= 64; i++)
        {
            total += Square(i);
        }
        return total;
    }
}