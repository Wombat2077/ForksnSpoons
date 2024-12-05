using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using dbDistributor = ForksnSpoons.database.Distributor;
namespace ForksnSpoons.Models
{
    public class mDistributor : dbDistributor
    {
        public mDistributor(dbDistributor Distributor)
        {
            this.Id = Distributor.Id;
            this.Name = Distributor.Name;
            this.Product = Distributor.Product;
        }
        public override string ToString()
        {
            return this.Name;
        }
    }
}
