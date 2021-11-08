using System;
using System.Collections.Generic;

public class CircularBuffer<T>
{
    private readonly int _size;
    private readonly Queue<T> _buffer;

    public CircularBuffer(int capacity)
    {
        _size = capacity;
        _buffer = new Queue<T>(capacity);
    }

    public T Read() => _buffer.Dequeue();

    public void Write(T value)
    {
        if (_buffer.Count >= _size)
            throw new InvalidOperationException();

        _buffer.Enqueue(value);
    }

    public void Overwrite(T value)
    {
        if (_buffer.Count >= _size)
            _buffer.Dequeue();

        _buffer.Enqueue(value);
    }

    public void Clear() => _buffer.Clear();
}