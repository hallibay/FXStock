using Microsoft.Reporting.WebForms;
using SignalRRealTimeSQL.Dataset;
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
    public partial class ReportWebForm : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                try
                {

                ReportViewer1.ProcessingMode = ProcessingMode.Local;
                    ReportViewer1.LocalReport.ReportPath = "Reports/ReportTest.rdlc";
                    SignalRDataSet dsCustomers = GetData("SELECT ProductID, Name, UnitPrice, Quantity FROM Products");
                ReportDataSource datasource = new ReportDataSource("DSCustomers", dsCustomers.Tables[0]);
                ReportViewer1.LocalReport.DataSources.Clear();
                ReportViewer1.LocalReport.DataSources.Add(datasource);
                    this.ReportViewer1.AsyncRendering = false;
                    ReportViewer1.LocalReport.Refresh();

                }
                catch(Exception ex)
                {
                    ex.ToString();
                }
            }
        }
        private SignalRDataSet GetData(string query)
        {
            string conString = ConfigurationManager.ConnectionStrings["DataBase"].ConnectionString;
            SqlCommand cmd = new SqlCommand(query);
            using (SqlConnection con = new SqlConnection(conString))
            {
                using (SqlDataAdapter sda = new SqlDataAdapter())
                {
                    cmd.Connection = con;

                    sda.SelectCommand = cmd;
                    using (SignalRDataSet DSCustomers = new SignalRDataSet())
                    {
                        sda.Fill(DSCustomers, "Products");
                        return DSCustomers;
                    }
                }
            }
        }
    }
}