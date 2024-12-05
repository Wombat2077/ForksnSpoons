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
using ForksnSpoons.Views;
using ToastNotifications;
using ToastNotifications.Lifetime;
using ToastNotifications.Messages;
using ToastNotifications.Position;
namespace ForksnSpoons
{
    /// <summary>
    /// Логика взаимодействия для MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        Notifier notifier;
        public MainWindow()
        {
            InitializeComponent();
            this.notifier = new Notifier(cfg =>
            {
                cfg.PositionProvider = new WindowPositionProvider(
                    parentWindow: Application.Current.MainWindow,
                    corner: Corner.TopRight,
                    offsetX: 10,
                    offsetY: 10);

                cfg.LifetimeSupervisor = new TimeAndCountBasedLifetimeSupervisor(
                    notificationLifetime: TimeSpan.FromSeconds(3),
                    maximumNotificationCount: MaximumNotificationCount.FromCount(5));

                cfg.Dispatcher = Application.Current.Dispatcher;
            });
            App.startup();
        }

        private void btnLoginHandler(object sender, RoutedEventArgs e)
        {
            //LoadingOverlay.Visibility = Visibility.Visible;
            bool IsLogined =  App.login(tbxLogin.Text, pbxPassword.Password);
            if (IsLogined)
            {
                ProductsView productsView = new ProductsView();
                productsView.Show();
                notifier.Dispose();
                Close();
            }
            else
            {
                notifier.ShowError("Неправильное имя пользователя или пароль"); //TODO: toasts here cuz toasts is cool
            }
            //LoadingOverlay.Visibility = Visibility.Collapsed;
        }

        private void enterNotLoginHadler(object sender, RoutedEventArgs e)
        {
            ProductsView productsView = new ProductsView();
            productsView.Show();
            Close();
        }
    }
}
