using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using dbProduct = ForksnSpoons.database.Product;
namespace ForksnSpoons.Models
{
    public class mProduct : dbProduct
    {
        public dbProduct Product { get; private set; }
        public string InStock
        {
            get
            {
                return this.Count > 0 ? "В наличии" : "Нет в наличии";
            }
        }
        public string photoPath
        {
            get
            {
                return "../Resources/" + (this.PhotoPath ?? "placeholder.jpeg");
            }
        }
        public mProduct(dbProduct product)
        {
            this.Article = product.Article;
            this.Category = product.Category;
            this.CategoryId = product.CategoryId;
            this.Cost = product.Cost;
            this.Count = product.Count;
            this.Description = product.Description;
            this.Discount = product.Discount;
            this.Distributor = product.Distributor;
            this.DistributorId = product.DistributorId;
            this.Manufacturer = product.Manufacturer;
            this.ManufacturerId = product.ManufacturerId;
            this.MaxDiscount = product.MaxDiscount;
            this.Name = product.Name;
            this.OrderList = product.OrderList;
            this.PhotoPath = product.PhotoPath;
            this.Unit = product.Unit;
            this.Product = product;
        }
    }
}
