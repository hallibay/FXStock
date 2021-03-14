using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SignalRRealTimeSQL
{
    public partial class HomePage : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["DataBase"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (!IsPostBack)
                {
                    
                    if (Session["username"] == null)
                        Response.Redirect("loginpage.aspx");
                    lblUserDetails.Text = " " + Session["username"];

                    string check = "select * from [Products] where Name =  '" + Session["username"] + "' ";
                    SqlCommand com = new SqlCommand(check, con);
                    try
                    {
                        con.Open();
                        using (SqlDataReader reader = com.ExecuteReader())
                        {
                            while (reader.Read())
                            {
                                LblId.Text = (reader["ProductID"].ToString());
                                Label2.Text = (reader["Name"].ToString());
                                UnitPrice.Text = (reader["UnitPrice"].ToString());
                                Quantity.Text = (reader["Quantity"].ToString());
                                Label11.Text = (reader["Symbol"].ToString());
                                PrevClose.Text = (reader["PrevClose"].ToString());
                                //Rating.Text = (reader["Rating"].ToString());
                                NetChange.Text = (reader["NetChange"].ToString());
                                PercentChange.Text = (reader["PercentChange"].ToString());
                                //Password.Text = (reader["Password"].ToString());
                            }
                        }
                    }
                    finally
                    {
                        con.Close();
                    }
                    // Name.Text = com.ExecuteScalar().ToString();
                }



            }
            catch (Exception ex)
            {
                string excp = ex.ToString();
            }
           
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            Response.Redirect("Loginpage.aspx");
        }
        protected void BtnSubmit_Click(object sender, EventArgs e)
        {
            try
            {
                string cs = System.Configuration.ConfigurationManager.ConnectionStrings["DataBase"].ConnectionString;

                SqlConnection con = new SqlConnection(cs);
                string NewUnitPrice = UnitPrice.Text;
                SqlCommand cmd = new SqlCommand("UPDATE Products SET UnitPrice = '" + NewUnitPrice + "',Quantity= '" + Quantity.Text + "',PrevClose='" + PrevClose.Text + "',NetChange='" + NetChange.Text + "',PercentChange='" + PercentChange.Text + "' WHERE ProductID= '" + LblId.Text + "'", con);
                //SqlCommand cmd = new SqlCommand("INSERT INTO Products (ProductID,Name,UnitPrice,Quantity,Symbol,PrevClose,Rating,NetChange,PercentChange,Password) VALUES('" + ProductID.Text + "','" + Name.Text + "','" + UnitPrice.Text + "','" + Quantity.Text + "','" + Symbol.Text + "','" + PrevClose.Text + "', '" + Rating.Text + "','" + NetChange.Text + "', '" + PercentChange.Text + "','" + Password.Text + "')", con);

                con.Open();

                cmd.ExecuteNonQuery();

                con.Close();
                Label1.ForeColor = System.Drawing.Color.Green;
                Label1.Text = "Stock Updated successfully!";
            }
            catch (Exception ex)
            {
                string exception = ex.ToString();
                Label1.ForeColor = System.Drawing.Color.Red;
                Label1.Text = "There was an error updating the stock";

            }

        }
    }
}