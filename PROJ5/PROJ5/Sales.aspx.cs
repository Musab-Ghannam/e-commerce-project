using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication3
{
    public partial class Sales : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            SqlConnection connection = new SqlConnection("data source= DESKTOP-PND235Q\\SQLEXPRESS01;database=LIBRARYBOOKS;Integrated security=SSPI");
            connection.Open();
            string query = "select*from users";
            SqlCommand comand = new SqlCommand(query, connection);
            SqlDataReader sdr = comand.ExecuteReader();
            string table = "<div class=\"table-responsive\">";
            table += "<table class='table table-hover table-bordered'><tr class=\"table-active\"><th scope=\"col\">NAME</th><th scope=\"col\">USER_PICTURE</th><th scope=\"col\">PHONE_NUMBER</th><th scope=\"col\">view Sales</th></tr>";

            while (sdr.Read())
            {
                table += $"<tr scope=\"row\"><td>{sdr[3].ToString()}  {sdr[4]}</td><td><img width='200px' height='200px' class=\"image\" src='iamges/{sdr[8]}'/></td>" +
                $"<td>{sdr[5]}</td>"+
                $"<td class=\"viewsalesdiv\"><a href='viewsale.aspx?id={sdr[0]}' class=\"viewsales\"><i class=\"fas fa-eye\"></i></a></td></tr>"
            
                ;
            }
            table += "</table>";
            table += "</div>";

            Sale.Text = table;
        }

        protected void Button1_Click(object sender, EventArgs e)
        {

        }
    }
}