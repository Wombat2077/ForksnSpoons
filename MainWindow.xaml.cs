using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;
//using ForksnSpoons.Views;
namespace ForksnSpoons
{
    /// <summary>
    /// Логика взаимодействия для MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        public MainWindow()
        {
            InitializeComponent();
            App.startup();
        }

        private void btnLoginHandler(object sender, RoutedEventArgs e)
        {
            //LoadingOverlay.Visibility = Visibility.Visible;
            bool IsLogined =  App.login(tbxLogin.Text, pbxPassword.Password);
            if (IsLogined)
            {
                switch ((Roles)App.user.Role) 
                {
                    case Roles.Administrator:
                        MessageBox.Show("administrator");
                        break;
                    case Roles.Manager:
                        MessageBox.Show("manager");
                        break;
                    case Roles.Client:
                        MessageBox.Show("client");
                        break;
                }
            }
            else
            {
                MessageBox.Show("Пользователь не найден"); //TODO toasts here cuz toasts is cool
            }
            //LoadingOverlay.Visibility = Visibility.Collapsed;
        }
    }
}
