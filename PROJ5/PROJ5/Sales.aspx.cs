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
            SqlConnection connection = new SqlConnection("data source=DESKTOP-PND235Q\\SQLEXPRESS01;database=LIBRARYBOOKS;Integrated security=SSPI");
            connection.Open();

            if (!string.IsNullOrEmpty(Session["ID"] as string) && Convert.ToInt32(Session["ID"].ToString()) == 1)
            {

                string query = "select*from users";
                SqlCommand comand = new SqlCommand(query, connection);
                SqlDataReader sdr = comand.ExecuteReader();
                string table = "<div class=\"table-responsive\">";
                table += "<table class='table table-striped'><tr ><th >NAME</th><th >USER_PICTURE</th><th >PHONE_NUMBER</th><th >view Sales</th></tr>";

                while (sdr.Read())
                {
                    table += $"<tr ><td>{sdr[3].ToString()}  {sdr[4]}</td><td><img width='200px' height='200px' class=\"image\" src='Images/{sdr[8]}'/></td>" +
                    $"<td>{sdr[5]}</td>" +
                    $"<td class=\"viewsalesdiv\"><a href='viewsale.aspx?id={sdr[0]}' class=\"viewsales\"><i class=\"fas fa-eye\"></i>View</a></td></tr>";
                }

                table += "</table>";
                table += "</div>";
                Sale.Text = table;
                connection.Close();
                connection.Open();
                string secondquery = "select count(*) from  users where USERID !=1;";
                SqlCommand secondcomand = new SqlCommand(secondquery, connection);
                SqlDataReader reader = secondcomand.ExecuteReader();
                while (reader.Read())
                {
                    Label1.Text = reader[0].ToString();
                }
                connection.Close();
                connection.Open();
                string thireddquery = "select count(*) from  order_product;";
                SqlCommand thiredcomand = new SqlCommand(thireddquery, connection);
                SqlDataReader rdr = thiredcomand.ExecuteReader();
                while (rdr.Read())
                {
                    Label2.Text = rdr[0].ToString();
                }
                connection.Close();
                connection.Open();
                string foureeddquery = "select count(*) from  category;";
                SqlCommand fouredcomand = new SqlCommand(foureeddquery, connection);
                SqlDataReader rdrer = fouredcomand.ExecuteReader();
                while (rdrer.Read())
                {
                    Label3.Text = rdrer[0].ToString();
                }
                connection.Close();
                connection.Open();
                string fivededdquery = "select avg(prodct_price)*count(O.product_id) from order_product as O join product AS p on O.product_id=p.product_id group by O.product_id;";
                SqlCommand fivedcomand = new SqlCommand(fivededdquery, connection);
                int count = 0;
                SqlDataReader rdrerr = fivedcomand.ExecuteReader();
                while (rdrerr.Read())
                {
                    count += Convert.ToInt32(rdrerr[0]);
                }
                connection.Close();
                Label4.Text = count.ToString() + "JD";

            }
            else
            {

                connection.Close();
                Response.Redirect("login.aspx");
                form1.Style["display"] = "none";
            }

        }

        protected void Button1_Click(object sender, EventArgs e)
        {

        }
        protected void Logout(object sender, EventArgs e)
        {
            Session.Abandon();
            Response.Redirect("login.aspx");
        }
    }
}