

namespace CSharp_Learn;

public class StringLearn
{
    public static void Run()
    {
        StringCreation();
        StringConcatenation();
        StringInterpolation();
        StringSubstring();
        StringComparison(); 
    }
    public static void StringCreation()
    {
        string name = "John Doe";
        Console.WriteLine($"Name (string variable): {name}");
    }

    public static void StringConcatenation()
    {
        string name = "John Doe";
        name += " Jr.";
        Console.WriteLine($"Concatenation: {name}");
    }

    public static void StringInterpolation()
    {
        string name = "John Doe Jr.";
        Console.WriteLine($"Interpolated String: Hello, {name}!");
    }

    public static void StringSubstring()
    {
        string name = "Hello, World!";
        Console.WriteLine($"Substring from index 7 to 12 in '{name}' is '{name.Substring(7, 6)}'");
    }

    public static void StringComparison()
    {
        string str1 = "Hello";
        string str2 = "hello";
        Console.WriteLine($"String comparison (case sensitive) {str1} == {str2} : {str1 == str2}");
    }
}
