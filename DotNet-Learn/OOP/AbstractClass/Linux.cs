using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace OOP.AbstractClass;

public class Linux: OS
{
    public override void Security()
    {
        Console.WriteLine("More secure compared to Windows");
    }
    public override void Cost()
    {
        Console.WriteLine("Free of cost");
    }
}
