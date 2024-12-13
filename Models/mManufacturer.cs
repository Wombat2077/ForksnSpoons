using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using dbManufacturer = ForksnSpoons.database.Manufacturer;
namespace ForksnSpoons.Models
{
    public class mManufacturer: dbManufacturer
    {
        public mManufacturer(dbManufacturer manufacturer) 
        {
            this.Id = manufacturer.Id;
            this.Name = manufacturer.Name;
            this.Product = manufacturer.Product;
        }
        public mManufacturer(int id, string name)
        {
            Name = name;
            Id = id;
        }
        public override string ToString()
        {
            return this.Name;
        }
    }
}
