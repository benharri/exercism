using System;

public class SpiralMatrix
{
    public static int[,] GetMatrix(int size)
    {
        var m = new int[size, size];
        int x = 0, y = 0, min = 0, max = size - 1;
        
        for (var i = 1; i <= size * size; i++)
        {
            // fill array with index
            m[y, x] = i;

            // update coordinates
            if (y == max && x != min)          x--;
            else if (x == max)                 y++;
            else if (y == min)                 x++;
            else if (x == min && y != min + 1) y--;
            else
            {
                max--; min++; x++;
            }
        }
    
        return m;
    }
}
