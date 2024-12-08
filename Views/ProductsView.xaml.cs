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
using System.Xml.Serialization;
using System.Windows.Data;
using System.ComponentModel;
using System.Windows.Controls.Primitives;
using db = ForksnSpoons.database;
using ForksnSpoons.Models;
using System.Runtime.Remoting;
namespace ForksnSpoons.Views
{
    /// <summary>
    /// Логика взаимодействия для ProductsView.xaml
    /// </summary>
    public partial class ProductsView : Window
    {
        public  IEnumerable<mProduct> products { get; set; }
        private List<mProduct> _products;
        public ProductsView()
        {
            //setting window context
            List<string> sortStates = new List<string> { "Minus", "ChevronDown", "ChevronUp" };
         
            _products = db.Database.context.Product.ToList().ConvertAll(i => new mProduct(i));
            products = _products;
            DataContext = this;

            InitializeComponent();

            //setting states to sort button
            mtbCost.states = sortStates;
            mtbManufacturer.states = sortStates;
            mtbName.states = sortStates;
            //setting sortHandler
            mtbName.Click += SortHandler;
            mtbManufacturer.Click += SortHandler;
            mtbCost.Click += SortHandler;

            //Setting Other values and check rights
            tbkUsername.Text = App.user?.fullName ?? "Гость";
            if (App.user?.Role != Roles.Manager & App.user?.Role != Roles.Administrator) 
            {
                ButtonColumnHeader.HeaderTemplate = null;
            }
        }

        private void ToProductWindow(object sender, RoutedEventArgs e)
        {
            mProduct product = dtgProducts.SelectedItem as mProduct;
           
            if (App.user != null & App.user?.Role != Roles.Client)
            {
                ProductView view = new ProductView(product, this);
                view.Show();
            }
            else
            {
                ProductPreview view = new ProductPreview(product);
                view.Show();
            }
        }
        private void logout(object sender, RoutedEventArgs e)
        {
            App.logout(this);

        }
        private void dtgProducts_PreviewMouseWheel(object sender, MouseWheelEventArgs e)
        {
            //what we're doing here, is that we're invoking the "MouseWheel" event of the parent ScrollViewer.

            //first, we make the object with the event arguments (using the values from the current event)
            var args = new MouseWheelEventArgs(e.MouseDevice, e.Timestamp, e.Delta);

            //then we need to set the event that we're invoking.
            //the ScrollViewer control internally does the scrolling on MouseWheelEvent, so that's what we're going to use:
            args.RoutedEvent = ScrollViewer.MouseWheelEvent;

            //and finally, we raise the event on the parent ScrollViewer.
            ScrollPage.RaiseEvent(args);
        }
        private void Update(object sender= null, RoutedCommand e = null)
        {
            _products = db.Database.context.Product.ToList().ConvertAll(i => new mProduct(i));
            SearchHandler(null, null);
        }
        public void Update()
        {
            Update(null, null);
        }
        private void AddProductHandler(object sender, RoutedEventArgs e)
        {
            ProductView view = new ProductView(this);
            view.Show();
            
        }

        private void SearchHandler(object sender, TextChangedEventArgs e)
        {
           
           this.products = _products.Where(p => p.Name.ToLower().Contains(tbxSearchBox.Text.ToLower()) | 
                                                p.Manufacturer.Name.ToLower().Contains(tbxSearchBox.Text.ToLower())).ToList();
           dtgProducts.ItemsSource = products;
        }
        private void SortHandler(object sender, RoutedEventArgs e)
        {
            IOrderedEnumerable<mProduct> ordered;
            if(mtbName.State == "ChevronDown")
            {
                ordered = products.OrderByDescending(i => i.Name);
            }
            else if(mtbName.State == "ChevronUp")
            {
                ordered = products.OrderBy(i => i.Name);
            }
            else
            {
                ordered = products.OrderBy(i => 1);
            }
            if (mtbManufacturer.State == "ChevronDown")
            {
                ordered = ordered.ThenByDescending(i => i.Manufacturer.Name);
            }
            else if (mtbManufacturer.State == "ChevronUp")
            {
                ordered = ordered.ThenBy(i => i.Manufacturer.Name);
            }
            if (mtbCost.State == "ChevronDown")
            {
                ordered = ordered.ThenByDescending(i => i.Cost);
            }
            else if (mtbCost.State == "ChevronUp")
            {
                ordered = ordered.ThenBy(i => i.Cost);
            }
            dtgProducts.ItemsSource = ordered.ToList();
            
        }
    }
}
