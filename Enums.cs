using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ForksnSpoons
{
    public enum Roles
    {
        Administrator = 1,
        Manager = 2,
        Client = 3,
    }
    public enum StatusCode 
    {
        Success,
        Fail,
        AccessDenied
    }

}
