using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace OOP.AbstractClass;

public class Android: OS
{
    public override void Security()
    {
        Console.WriteLine("More secured compared to windows");
    }
    public override void Cost()
    {
        Console.WriteLine("Free of cost");
    }
}
