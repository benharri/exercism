using System;
using System.Linq;

public static class ArmstrongNumbers
{
    public static bool IsArmstrongNumber(int number)
    {
        var digits = number.ToString().Select(digit => int.Parse(digit.ToString())).ToList();
        var num_digits = digits.Count;
        var sum = 0;
        foreach (var digit in digits)
            sum += (int) Math.Pow(digit, num_digits);
        return number == sum;
    }
}
