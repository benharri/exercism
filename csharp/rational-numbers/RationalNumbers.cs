using System;

public static class RealNumberExtension
{
    public static double Expreal(this int n, RationalNumber r) => Math.Pow(n, r);
}

public struct RationalNumber
{
    private readonly int num;
    private readonly int den;

    public RationalNumber(int numerator, int denominator)
    {
        var gcd = GreatestCommonDivisor(numerator, denominator);
        num = numerator / gcd;
        den = denominator / gcd;
    }

    public static RationalNumber operator +(RationalNumber r1, RationalNumber r2) =>
        new((r1.num * r2.den) + (r2.num * r1.den), r1.den * r2.den);

    public static RationalNumber operator -(RationalNumber r1, RationalNumber r2) =>
        new((r1.num * r2.den) - (r2.num * r1.den), r1.den * r2.den);

    public static RationalNumber operator *(RationalNumber r1, RationalNumber r2) =>
        new(r1.num * r2.num, r1.den * r2.den);

    public static RationalNumber operator /(RationalNumber r1, RationalNumber r2) =>
        new(r1.num * r2.den, r1.den * r2.num);

    public RationalNumber Abs() =>
        new(Math.Abs(num), Math.Abs(den));

    public RationalNumber Reduce() => this;

    public RationalNumber Exprational(int power) =>
        new((int)Math.Pow(num, power), (int)Math.Pow(den, power));

    public static int GreatestCommonDivisor(int a, int b) =>
        b == 0 ? a : GreatestCommonDivisor(b, a % b);

    public static implicit operator double(RationalNumber r) =>
        (double) r.num / r.den;
}