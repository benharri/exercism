using System;

public static class BinarySearch
{
    public static int Find(int[] input, int value)
    {
        var i = Array.BinarySearch(input, value);
        return i < 0 ? -1 : i;
    }
}