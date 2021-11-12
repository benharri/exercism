public static class Triangle
{
    public static bool IsScalene(double side1, double side2, double side3) =>
        side1 != side2 && side2 != side3 && side1 != side3
        && !IsDegenerate(side1, side2, side3);

    public static bool IsIsosceles(double side1, double side2, double side3) =>
        (side1 == side2 || side2 == side3 || side1 == side3)
        && !IsDegenerate(side1, side2, side3);

    public static bool IsEquilateral(double side1, double side2, double side3) =>
        side1 == side2 && side2 == side3
        && !IsDegenerate(side1, side2, side3);

    private static bool IsDegenerate(double side1, double side2, double side3) =>
        side1 == 0 || side2 == 0 || side3 == 0
        || (side1 >= side2 + side3) || (side2 >= side1 + side3) || (side3 >= side1 + side2);
}
