using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;




namespace SignalRRealTimeSQL
{
    public class Products
    {
        public int id { get; set; }
        public string Name { get; set; }
        public string PricDecimal { get; set; }
        public string QuantDecimal { get; set; }
        public string Symbol { get; set; }
        public string PrevClose { get; set; }
        public string Rating { get; set; }
        public string NetChange { get; set; }
        public string PercentChange { get; set; }
        public string Password { get; set; }
    }
}