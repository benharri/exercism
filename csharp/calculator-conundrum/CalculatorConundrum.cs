using System;

public static class SimpleCalculator
{
    public static string Calculate(int operand1, int operand2, string operation)
    {
        int result;
        try
        {
            result = operation switch
            {
                "+"  => operand1 + operand2,
                "*"  => operand1 * operand2,
                "/"  => operand1 / operand2,
                ""   => throw new ArgumentException(nameof(operation)),
                null => throw new ArgumentNullException(nameof(operation)),
                _    => throw new ArgumentOutOfRangeException(operation)
            };
        }
        catch (DivideByZeroException)
        {
            return "Division by zero is not allowed.";
        }

        return $"{operand1} {operation} {operand2} = {result}";
    }
}
