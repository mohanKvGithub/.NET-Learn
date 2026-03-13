
using OOP.AbstractClass;

Console.WriteLine("################################################################################################");

//Abstract Class
Console.WriteLine("\nAbstract Class Example 1:\n");

TV samsung = new Samsung();
TV lg = new LG();
Console.WriteLine($"Samsung TV Color Rating:{samsung.ColorRating()}");
Console.WriteLine($"LG TV Color Rating:{lg.ColorRating()}");

Console.WriteLine("\nAbstract Class Example 2:\n");

OS android = new Android();
OS windows = new Windows();
OS linux = new Linux();

Console.WriteLine("Android OS:");
android.RunFeatures();
Console.WriteLine("Windows OS:");
windows.RunFeatures();
Console.WriteLine("Linux OS:");
linux.RunFeatures();

Console.WriteLine("################################################################################################");