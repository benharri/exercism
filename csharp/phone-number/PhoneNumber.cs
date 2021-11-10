using System;
using System.Linq;

public class PhoneNumber
{
    public static string Clean(string phoneNumber)
    {
        var clean = phoneNumber.TrimStart('+').TrimStart('1').Replace("(", "").Replace(")", "").Replace("-", "").Replace(".", "").Replace(" ", "");
        return clean.StartsWith('1') || clean.StartsWith('0') || clean.Any(char.IsLetter) || clean[3] == '0' || clean[3] == '1' || clean.Length < 10 || clean.Length > 11 || clean.Length == 11 && !clean.StartsWith('1')
            ? throw new ArgumentException(phoneNumber)
            : clean;
    }
}