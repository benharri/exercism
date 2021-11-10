using System;

public static class TelemetryBuffer
{
    public static byte[] ToBuffer(long reading)
    {
        var result = new byte[9];
        var bytesOfReading = BitConverter.GetBytes(reading);
        sbyte size = reading switch
        {
            > uint.MaxValue or < int.MinValue => -8,
            > int.MaxValue => 4,
            > ushort.MaxValue or < short.MinValue => -4,
            >= 0 => 2,
            >= short.MinValue => -2
        };
        Array.Resize(ref bytesOfReading, Math.Abs(size));

        result[0] = (byte)size;
        bytesOfReading.CopyTo(result, 1);
        return result;
    }

    public static long FromBuffer(byte[] buffer) =>
        (sbyte)buffer[0] switch
        {
            -8 => BitConverter.ToInt64(buffer, 1),
            4 => BitConverter.ToUInt32(buffer, 1),
            -4 => BitConverter.ToInt32(buffer, 1),
            2 => BitConverter.ToUInt16(buffer, 1),
            -2 => BitConverter.ToInt16(buffer, 1),
            _ => 0
        };
}
