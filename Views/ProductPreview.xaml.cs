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
using database = ForksnSpoons.database;

namespace ForksnSpoons.Views
{
    /// <summary>
    /// Interaction logic for ProductPreview.xaml
    /// </summary>
    public partial class ProductPreview : Window
    {
        public database.Product product { get; set; }
        public string photoSource {  get; set; }
        public Visibility CanOrder { get
            {
                return (App.user != null ? Visibility.Visible : Visibility.Hidden);
            } 
        }
        public ProductPreview()
        {
            InitializeComponent();
        }
        public ProductPreview(database.Product product)
        {
            this.product = product;
            this.photoSource = "../Resources/" + (product.PhotoPath ?? "placeholder.jpeg");
            DataContext = this;
            InitializeComponent();
        }

        private void OrderHandler(object sender, RoutedEventArgs e)
        {
            MessageBox.Show(product.GetType().Name);
        }

        private void ExitHandler(object sender, RoutedEventArgs e)
        {
            Close();
        }
    }
}
