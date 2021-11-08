using System;
using System.Collections.Generic;
using System.Linq;

[Flags]
public enum Allergen
{
    Eggs = 1,
    Peanuts = 2,
    Shellfish = 4,
    Strawberries = 8,
    Tomatoes = 16,
    Chocolate = 32,
    Pollen = 64,
    Cats = 128,
}

public class Allergies
{
    private readonly Allergen _allergen;

    public Allergies(int mask) => 
        _allergen = (Allergen)mask;

    public bool IsAllergicTo(Allergen allergen) =>
        (_allergen & allergen) == allergen;

    public Allergen[] List() =>
        Enum.GetValues(typeof(Allergen)).Cast<Allergen>().Where(a => (_allergen & a) == a).ToArray();
}