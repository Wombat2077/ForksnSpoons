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
using System.Windows.Shapes;
using db = ForksnSpoons.database;
namespace ForksnSpoons.Views
{
    /// <summary>
    /// Логика взаимодействия для ProductsView.xaml
    /// </summary>
    public partial class ProductsView : Window
    {
        public ProductsView()
        {
            InitializeComponent();
            tbkUsername.Text = App.user.fullName;
            dtgProducts.ItemsSource = db.Database.context.Product.ToList();
        }
    }
}
