using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net.NetworkInformation;
using System.Threading.Tasks;
using System.Windows;
using Database = ForksnSpoons.database.Database;
using dbUser = ForksnSpoons.database.User;
using ForksnSpoons.Models;
namespace ForksnSpoons
{
    /// <summary>
    /// Логика взаимодействия для App.xaml
    /// </summary>
    public partial class App : Application
    {
        public static mUser user;
        public static bool login(String login, String password)
        {
            dbUser user = (dbUser)Database.context.User.Where(u => u.Login == login & u.Password == password).FirstOrDefault();

            if (user != null)
            {
                App.user = new mUser(user);
                return true;
            }
            else
            {
                return false;
            }
        }
        public static void startup()
        {
            Database.context.User.Take(0).FirstOrDefault();
            
        }
       
    }
}
