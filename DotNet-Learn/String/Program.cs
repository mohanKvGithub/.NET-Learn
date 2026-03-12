//String Creation
string name = "John Doe";
Console.WriteLine($"Name (string variable): {name}");

//String Concatenation
name += " Jr.";
Console.WriteLine($"Concatenation : {name}");

//String Interpolation
Console.WriteLine($"Interpolated String: Hello, {name}!");

//string substring
name = "Hello, World!";
Console.WriteLine($"substring of from index 7 to 12 in '{name}' is '{name.Substring(7,6)}'");

//String Comparison
string str1 = "Hello";
string str2 = "hello";
Console.WriteLine($"String comparison (case sensitive) {str1} == {str2} : {str1 == str2}");
