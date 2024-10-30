using System;
using System.CodeDom.Compiler;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ForksnSpoons
{
    public static class ArticleGenerator
    {
        static String alphabet = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890";
        static Random Random = new Random();
        public static String Generate()
        {
            String article = "";
            for (int i = 0; i < 6; i++)
            {
                article += alphabet[Random.Next(alphabet.Length)];
            }
            return article;
        }
    }
}
