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
using Microsoft.Extensions.Logging;

namespace ForksnSpoons
{
    /// <summary>
    /// Логика взаимодействия для App.xaml
    /// </summary>
    public partial class App : Application
    {
        public static mUser user;
        public static Logger logger;
        protected override void OnStartup(StartupEventArgs e)
        {
            
            base.OnStartup(e);
        }
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
        public static void logout(Window window)
        {
            App.user = null;
            MainWindow mainWindow = new MainWindow();
            mainWindow.Show();
            window.Close();
            
        }
        public static void startup()
        {
            ILoggerFactory factory = new LoggerFactory();
            App.logger = new Logger(factory.CreateLogger<App>());
            Database.context.User.Take(0).FirstOrDefault();
        }
       
    }
}
