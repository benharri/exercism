using System;

abstract class Character
{
    private readonly string CharacterType;

    protected Character(string characterType) => CharacterType = characterType;

    public abstract int DamagePoints(Character target);

    public virtual bool Vulnerable()
    {
        throw new NotImplementedException("Please implement the Character.Vulnerable() method");
    }

    public override string ToString() => $"Character is a {CharacterType}";
}

class Warrior : Character
{
    public Warrior() : base("Warrior")
    {
    }

    public override bool Vulnerable() => false;

    public override int DamagePoints(Character target) => target.Vulnerable() ? 10 : 6;
}

class Wizard : Character
{
    private bool vulnerable;

    public Wizard() : base("Wizard") => vulnerable = true;

    public override bool Vulnerable() => vulnerable;

    public override int DamagePoints(Character target) => vulnerable ? 3 : 12;

    public void PrepareSpell() => vulnerable = false;
}
