using System;

public static class RealNumberExtension
{
    public static double Expreal(this int realNumber, RationalNumber r) =>
        Math.Pow(realNumber, r.AsDouble());
}

public struct RationalNumber
{
    private int _numerator;
    private int _denominator;

    public RationalNumber(int numerator, int denominator)
    {
        _numerator = numerator;
        _denominator = denominator;

        if (_denominator < 0)
        {
            _numerator = -_numerator;
            _denominator = -_denominator;
        }
    }

    public override string ToString() => $"{_numerator} / {_denominator}";

    public static RationalNumber operator +(RationalNumber r1, RationalNumber r2) =>
        new(r1._numerator * r2._denominator + r2._numerator * r1._denominator, r1._denominator * r2._denominator);

    public static RationalNumber operator -(RationalNumber r1, RationalNumber r2) =>
        r1 with { _numerator = -r1._numerator } + r2;

    public static RationalNumber operator *(RationalNumber r1, RationalNumber r2) =>
        new(r1._numerator * r2._numerator, r1._denominator * r2._denominator);

    public static RationalNumber operator /(RationalNumber r1, RationalNumber r2) =>
        new(r1._numerator * r2._denominator, r1._denominator * r2._numerator);

    public RationalNumber Abs() =>
        new(Math.Abs(_numerator), Math.Abs(_denominator));

    public RationalNumber Reduce()
    {
        var gcd = GreatestCommonDivisor(_numerator, _denominator);
        return new(_numerator / gcd, _denominator / gcd);
    }

    public RationalNumber Exprational(int power) =>
        new((int)Math.Pow(_numerator, power), (int)Math.Pow(_denominator, power));

    public double Expreal(int baseNumber) =>
        Math.Pow(Math.Pow(baseNumber, _numerator), 1d / _denominator);
    
    public static int GreatestCommonDivisor(int a, int b) =>
        b == 0 ? a : GreatestCommonDivisor(b, a % b);

    public double AsDouble() =>
        _numerator / (double)_denominator;
}