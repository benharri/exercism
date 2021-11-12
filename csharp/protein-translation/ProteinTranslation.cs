using System;
using System.Collections.Generic;
using System.Linq;

public static class ProteinTranslation
{
    public static string[] Proteins(string strand) =>
        strand.Chunk(3).Select(p => p switch
        {
            "AUG" => "Methionine",
            "UUU" or "UUC" => "Phenylalanine",
            "UUA" or "UUG" => "Leucine",
            "UCU" or "UCC" or "UCA" or "UCG" => "Serine",
            "UAU" or "UAC" => "Tyrosine",
            "UGU" or "UGC" => "Cysteine",
            "UGG" => "Tryptophan",
            "UAA" or "UAG" or "UGA" => "",
            _ => throw new ArgumentOutOfRangeException(nameof(strand))
        }).TakeWhile(p => p != "").ToArray();

    public static IEnumerable<string> Chunk(this string s, int chunkSize) =>
        Enumerable.Range(0, s.Length / chunkSize)
            .Select(i => s.Substring(i * chunkSize, chunkSize));
}
