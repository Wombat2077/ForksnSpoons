using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using dbCategory = ForksnSpoons.database.Category;
namespace ForksnSpoons.Models
{
    public class mCategory: dbCategory
    {
        public mCategory(dbCategory Category) 
        {
            this.Id = Category.Id;
            this.Name = Category.Name;
            this.Product = Category.Product;
        }
        public override string ToString()
        {
            return this.Name;
        }
    }
}
