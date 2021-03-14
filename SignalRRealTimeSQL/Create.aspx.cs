using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SignalRRealTimeSQL
{
    public partial class Create : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void BtnSubmit_Click(object sender, EventArgs e)
        {
            try
            {
                string cs = System.Configuration.ConfigurationManager.ConnectionStrings["DataBase"].ConnectionString;

                SqlConnection con = new SqlConnection(cs);

                SqlCommand cmd = new SqlCommand("INSERT INTO Products (ProductID,Name,UnitPrice,Quantity,Symbol,PrevClose,Rating,NetChange,PercentChange,Password) VALUES('" + ProductID.Text + "','" + Name.Text + "','" + UnitPrice.Text + "','" + Quantity.Text + "','"+ Symbol.Text +"','"+ PrevClose.Text + "', '"+ Rating.Text +"','" + NetChange.Text + "', '" +PercentChange.Text +"','"+ Password.Text + "')", con);

                con.Open();

                cmd.ExecuteNonQuery();

                con.Close();
                Label1.ForeColor = System.Drawing.Color.Green;
                Label1.Text = "Registration successfully!";
            }
            catch(Exception ex)
            {
                string exception = ex.ToString();
                Label1.ForeColor = System.Drawing.Color.Red;
                Label1.Text = "An error occured while registering!";
            }
           
        }
    }
}