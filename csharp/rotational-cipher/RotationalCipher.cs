using System.Text;

public static class RotationalCipher
{
    public static string Rotate(string text, int shiftKey)
    {
        StringBuilder result = new(text.Length);
        foreach (var c in text)
        {
            if (!char.IsLetter(c)) {result.Append(c);continue;}
            var d = char.IsUpper(c) ? 'A' : 'a';
            result.Append((char)((((c + shiftKey) - d) % 26) + d));
        }
        return result.ToString();
    }
}