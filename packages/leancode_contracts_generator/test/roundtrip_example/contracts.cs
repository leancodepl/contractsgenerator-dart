using System.Collections.Generic;
using LeanCode.Contracts;

public enum Priority
{
    Low,
    High,
}

public class Day<T>
{
    public T Value { get; set; }
}

public class Week<T>
{
    public Day<T> Monday { get; set; }
}

public class Box<T>
{
    public List<T> Items { get; set; }
}

public class Report
{
    public Box<Priority> ByPriority { get; set; }
    public Box<Box<Priority>> Nested { get; set; }
    public Week<Priority> Plan { get; set; }
}
