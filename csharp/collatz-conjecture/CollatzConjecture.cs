using System;

public static class CollatzConjecture
{
    // If n is even, divide n by 2 to get n / 2.
    // If n is odd, multiply n by 3 and add 1 to get 3n + 1.
    public static int Steps(int number)
    {
        if (number < 1) throw new ArgumentException();
        int cnt = 0;
        while (number != 1) {
            number = number % 2 == 0 ? number / 2 : 3 * number + 1;
            cnt ++;
        }
        return cnt;
    }
}
