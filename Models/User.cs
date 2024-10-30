using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using dbUser = ForksnSpoons.database.User;
namespace ForksnSpoons.Models
{
    public  class User : dbUser
    {
        public new Roles Role
        {
            get
            {
                return (Roles)base.Role;
            }
        }


        public string fullName
        {
            get
            {
                string name = this.Surname + this.Name;
                if(this.Patronymic != null)
                {
                    name += this.Patronymic;
                }
                return name;
            }
        }
    }
}
