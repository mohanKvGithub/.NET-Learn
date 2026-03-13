using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace OOP.AbstractClass;

public class Windows: OS
{
    public override void Security()
    {
        Console.WriteLine("Less Secured compared to Linux");   
    }
    public override void Cost()
    {
        Console.WriteLine("Needs to pay yearly");
    }
}
