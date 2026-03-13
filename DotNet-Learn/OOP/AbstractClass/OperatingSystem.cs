using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Intrinsics.Arm;
using System.Text;
using System.Threading.Tasks;

namespace OOP.AbstractClass;

public abstract class OS
{
    public abstract void Security();
    public abstract void Cost();

    public void RunFeatures()
    {
        Security();
        Cost();
    }
}
