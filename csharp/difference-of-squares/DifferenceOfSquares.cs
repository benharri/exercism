using System.Linq;

public static class DifferenceOfSquares
{
    public static int CalculateSquareOfSum(int max)
    {
        var sum = Enumerable.Range(1, max).Sum();
        return sum * sum;
    }

    public static int CalculateSumOfSquares(int max) =>
        Enumerable.Range(1, max).Sum(i => i * i);

    public static int CalculateDifferenceOfSquares(int max) =>
        CalculateSquareOfSum(max) - CalculateSumOfSquares(max);
}