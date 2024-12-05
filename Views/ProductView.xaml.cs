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
using db = ForksnSpoons.database.Database;
using ForksnSpoons.Models;
using ToastNotifications;
using ToastNotifications.Lifetime;
using ToastNotifications.Messages;
using ToastNotifications.Position;
using System.Data.Entity.Migrations;

namespace ForksnSpoons.Views
{
    /// <summary>
    /// Логика взаимодействия для ProductView.xaml
    /// </summary>
    public partial class ProductView : Window
    {
        public database.Product product { get; set; }
        public string photoSource { get; set; }
        Notifier notifier;
        ProductsView parent;
        public ProductView() : this(new database.Product()) 
        {
          
        }
        public ProductView(database.Product product, ProductsView parent=null)
        {
            this.product = product;
            this.parent = parent;
            this.photoSource = "../Resources/"+(product.PhotoPath ?? "placeholder.jpeg");
            DataContext = this;
            InitializeComponent();
            List<mManufacturer> manufacturers = db.context.Manufacturer
                                                            .ToList()
                                                            .ConvertAll(m => new mManufacturer(m));
            cbxManufacturer.ItemsSource = manufacturers;
            cbxManufacturer.SelectedItem = manufacturers.Find(m => m.Id == product.ManufacturerId) ?? manufacturers[0];
            List<mDistributor> distributors = db.context.Distributor
                                                            .ToList()
                                                            .ConvertAll(d => new mDistributor(d));
            cbxDistributor.ItemsSource = distributors;
            cbxDistributor.SelectedItem = distributors.Find(m => m.Id == product.DistributorId) ?? distributors[0];
            List<mCategory> categories = db.context.Category
                                                            .ToList()
                                                            .ConvertAll(c => new mCategory(c));
            cbxCategory.ItemsSource = categories;
            cbxCategory.SelectedItem = categories.Find(c => c.Id == product.CategoryId) ?? categories[0];
            notifier = new Notifier(cfg =>
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

        }


        private void SaveHandler(object sender, RoutedEventArgs e)
        {
            mManufacturer manufacturer = cbxManufacturer.SelectedItem as mManufacturer;
            mDistributor distributor = cbxDistributor.SelectedItem as mDistributor;
            mCategory category = cbxCategory.SelectedItem as mCategory;
            product.Manufacturer = db.context.Manufacturer.Find(manufacturer.Id);
            product.Distributor = db.context.Distributor.Find(distributor.Id);
            product.Category = db.context.Category.Find(category.Id);
            db.context.Product.AddOrUpdate(product);
            try
            {
                db.context.SaveChanges();
                notifier.ShowSuccess("Товар успешно сохранен");
                
            }
            catch (Exception ex) 
            {
                notifier.ShowError("Что-то пошло не так"); //TODO: логгирование
                App.logger.Log(ex.StackTrace);
            }
            parent?.Updated?.Invoke();

        }

    }
}
