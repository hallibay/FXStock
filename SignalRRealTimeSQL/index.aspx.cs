using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SignalRRealTimeSQL
{
    public partial class index : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        [WebMethod]
        public static IEnumerable<Products> GetData()
        {
            using (var connection = new SqlConnection(ConfigurationManager.ConnectionStrings["DataBase"].ConnectionString))
            {
                connection.Open();
                using(SqlCommand command = new SqlCommand(@"SELECT [ProductID],[Name],[UnitPrice],[Quantity],[Symbol],[PrevClose],[Rating],[NetChange],[PercentChange],[Password] FROM [SignalRDemo].[dbo].[Products]", connection))
                {
                    //make sure the command obect does not alreasdy have a notification object associated with it.
                    command.Notification = null;
                    SqlDependency.Start(ConfigurationManager.ConnectionStrings["DataBase"].ConnectionString);
                    SqlDependency dependency = new SqlDependency(command);
                    dependency.OnChange += new OnChangeEventHandler(dependency_OnChange);

                    if (connection.State == System.Data.ConnectionState.Closed)
                        connection.Open();
                    using (var reader = command.ExecuteReader())
                        return reader.Cast<IDataRecord>()
                            .Select(x => new Products()
                            {
                                id=x.GetInt32(0),
                                Name = x.GetString(1),
                                PricDecimal = x.GetString(2),
                                QuantDecimal = x.GetString(3),
                                Symbol = x.GetString(4),
                                PrevClose = x.GetString(5),
                                Rating = x.GetString(6),
                                NetChange = x.GetString(7),
                                PercentChange = x.GetString(8),
                                Password = x.GetString(9)
                            }).ToList();
                }
            }
        }
        private static void dependency_OnChange(object sender,SqlNotificationEventArgs e)
        {
            MyHub.Show();
        }
    }
}