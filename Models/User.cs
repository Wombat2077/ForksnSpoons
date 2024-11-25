using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using dbUser = ForksnSpoons.database.User;
namespace ForksnSpoons.Models
{
    public  class mUser : dbUser
    {
        public mUser(dbUser user)
        {
            Id = user.Id;
            Login = user.Login;
            Password = user.Password;
            Surname = user.Surname;
            Name = user.Name;
            Patronymic = user.Patronymic;
            Role = (Roles)user.Role;
        }
        public new Roles Role;
        public string fullName
        {
            get
            {
                string name = $"{this.Surname} {this.Name}";
                if(this.Patronymic != null)
                {
                    name += " " + this.Patronymic;
                }
                return name;
            }
        }
    }
}
