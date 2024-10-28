using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Threading.Tasks;
using System.Windows;
using ForksnSpoons.database;
namespace ForksnSpoons
{
    /// <summary>
    /// Логика взаимодействия для App.xaml
    /// </summary>
    public partial class App : Application
    {
        public static User user;
        public static bool login(String login, String password)
        {
            User user = Database.context.User.Where(u => u.Login == login & u.Password == password).First();
            if (user != null)
            {
                App.user = user;
                return true;
            }
            else
            {
                return false;
            }
        }
    }
}
