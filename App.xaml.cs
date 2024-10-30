using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net.NetworkInformation;
using System.Threading.Tasks;
using System.Windows;
using db = ForksnSpoons.database;
using ForksnSpoons.Models;
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
            User user = (User)db.Database.context.User.Where(u => u.Login == login & u.Password == password).FirstOrDefault();
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
        public static void startup()
        {
            database.Database.context.User.Take(0).FirstOrDefault();
            
        }
        public static async Task<StatusCode> AddProduct(String name,
                                                        int categoryId,
                                                        String unit,
                                                        int manufacturerId,
                                                        int distributorId,
                                                        double cost,
                                                        String article = null,
                                                        String description = null,
                                                        int? discount = null,
                                                        int? maxDiscount = null,
                                                        int? count = 0)
        {
            if (App.user.Role != Roles.Administrator)
            {
                return StatusCode.AccessDenied;
            }
            article = article ?? ArticleGenerator.Generate();
            db.Product product = new db.Product { 
                                                Article = article, 
                                                CategoryId = categoryId, 
                                                Unit = unit, 
                                                ManufacturerId = manufacturerId, 
                                                DistributorId = distributorId, 
                                                Cost = (decimal?)cost, 
                                                Description = description, 
                                                Discount = discount, 
                                                MaxDiscount = maxDiscount, 
                                                Count = count 
                                            };
            db.Database.context.Product.Add(product);
            await db.Database.context.SaveChangesAsync();
            return StatusCode.Success;  
            
        }
    }
}
