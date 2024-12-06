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
namespace ForksnSpoons.Views
{
    /// <summary>
    /// Логика взаимодействия для ProductsView.xaml
    /// </summary>
    public partial class ProductsView : Window
    {
        List<ToggleButton> toggleButtons;
        public ProductsView()
        {
            InitializeComponent();
            tbkUsername.Text = App.user?.fullName ?? "Гость";
            dtgProducts.ItemsSource = db.Database.context.Product.ToList().ConvertAll(i => new mProduct(i)); //TODO: динамическое обновление

            if (App.user?.Role != Roles.Manager & App.user?.Role != Roles.Administrator) 
            {
                ButtonColumnHeader.HeaderTemplate = null;
            }
        }

        private void ToProductWindow(object sender, RoutedEventArgs e)
        {
            database.Product product = dtgProducts.SelectedItem as database.Product;
           
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
            dtgProducts.ItemsSource = db.Database.context.Product.ToList();
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
        private bool? TripleToggle(object sender, RoutedEventArgs e)
        {
            ToggleButton button = sender as ToggleButton;
            switch (button.IsChecked)
            {
                case true:
                    button.IsChecked = false;
                break;
                case false:
                    button.IsChecked = null;
                break;
                case null:
                    button.IsChecked = true;
                break;
            }
            return button.IsChecked;
        }
        private void dtgSortName(object sender, RoutedEventArgs e)
        {
            ListSortDirection? SortDirection;
            switch (TripleToggle(sender, e))
            {
                case true:
                    SortDirection = ListSortDirection.Ascending; break;
                case false:
                    SortDirection = ListSortDirection.Descending; break;
                default:
                    SortDirection = null; break;
            }
            dtgSort("Name", SortDirection);
        }

        private void dtgSortManufacturer(object sender, RoutedEventArgs e)
        {
            ListSortDirection? SortDirection;
            switch (TripleToggle(sender, e))
            {
                case true:
                    SortDirection = ListSortDirection.Ascending; break;
                case false:
                    SortDirection = ListSortDirection.Descending; break;
                default:
                    SortDirection = null; break;
            }
            dtgSort("Manufacturer", SortDirection);
        }
       
        private void dtgSortCost(object sender, RoutedEventArgs e)
        {
            ListSortDirection? SortDirection;
            switch (TripleToggle(sender, e))
            {
                case true:
                    SortDirection = ListSortDirection.Ascending; break;
                case false:
                    SortDirection = ListSortDirection.Descending; break;
                default:
                    SortDirection = null; break;
            }
            dtgSort("Cost", SortDirection);
        }
        private void dtgSort(string Column, ListSortDirection? SortDirection)
        {

            //reseting previous sort
            ICollectionView view = CollectionViewSource.GetDefaultView(dtgProducts.ItemsSource);
            if (view != null)
            {
                view.SortDescriptions.Clear();
                foreach (DataGridColumn column in dtgProducts.Columns)
                {
                    column.SortDirection = null;
                }
            }

        }
    }
}
