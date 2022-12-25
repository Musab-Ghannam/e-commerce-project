using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PROJ5
{
    public partial class uservieworders : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            SqlConnection connection = new SqlConnection("data source=DESKTOP-PND235Q\\SQLEXPRESS01;database=LIBRARYBOOKS;Integrated security=SSPI");
            connection.Open();
            if (!string.IsNullOrEmpty(Session["ID"] as string))
            {
                int id = Convert.ToInt32(Session["ID"].ToString());
                string query = $"select   order_product_id,order_date,product_name,prodct_price from orders join users on orders.customer_id=users.Userid join order_product on    order_product.order_id=orders.order_id join product on order_product.product_id=product.product_id where users.Userid ={id}  Order by order_date DESC ;";
                SqlCommand comand = new SqlCommand(query, connection);
                SqlDataReader sdr = comand.ExecuteReader();
                string table = "<div class=\"table-responsive\">";
                table += "<table class='table table-striped'><tr ><th >Order ID</th><th>Order Date</th><th >Product Name</th><th>Product Price</th></tr>";

                while (sdr.Read())
                {
                    string sqlFormattedDate = Convert.ToDateTime(sdr[1]).Date.ToString("yyyy-MM-dd");
                    table += $"<tr><td>{sdr[0]}</td><td>{sdr[1]}</td><td>{sqlFormattedDate}</td>" +
                    $"<td>{sdr[3]}</td></tr>";


                }
                table += "</table>";
                table += "</div>";
                orders.Text = table;
            }
            else
            {

                connection.Close();
                Response.Redirect("login.aspx");
            }

        }
        protected void Logout(object sender, EventArgs e)
        {
            Session.Abandon();
            Response.Redirect("login.aspx");
        }
        protected void Submit_Click(object sender, EventArgs e)
        {
            string ss = searches.Value.ToString();
            if (ss.Trim().Length > 0)
            {

                Session["ssearch"] = ss;
                Response.Redirect($"http://localhost:56508/mysearch.aspx?ss={ss.Trim()}");

            }
        }
    }
}