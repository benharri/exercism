using System;

public class Clock
{
    private const int MinutesInDay = 24 * 60;
    private readonly int DisplayHours, DisplayMinutes, TotalMins;

    public Clock(int h, int m)
    {
        TotalMins = (h * 60 + m) % MinutesInDay;
        if (TotalMins < 0)
            TotalMins += MinutesInDay;
        DisplayHours = Math.DivRem(TotalMins, 60, out DisplayMinutes);
    }

    public Clock Add(int m) => new(0, TotalMins + m);
    public Clock Subtract(int m) => Add(-m);

    public override string ToString() => $"{DisplayHours:00}:{DisplayMinutes:00}";
    public override bool Equals(object obj) => ToString().Equals(obj.ToString());
    public override int GetHashCode() => TotalMins;
}
