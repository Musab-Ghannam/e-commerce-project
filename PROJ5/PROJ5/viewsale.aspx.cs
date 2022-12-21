using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication3
{
    public partial class viewsale : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            int id = Convert.ToInt32(Request.QueryString["id"]);
            SqlConnection connection = new SqlConnection("data source= DESKTOP-PND235Q\\SQLEXPRESS01;database=LIBRARYBOOKS;Integrated security=SSPI");
            connection.Open();
            string query = $"select   order_product_id,order_date,product_name,prodct_price from orders join users on orders.customer_id=users.Userid join order_product on    order_product.order_id=orders.order_id join product on order_product.product_id=product.product_id where users.Userid ={id};";
            SqlCommand comand = new SqlCommand(query, connection);
            SqlDataReader sdr = comand.ExecuteReader();
            string table = "<div class=\"table-responsive\">";
            table += "<table class='table table-hover table-bordered'><tr class=\"table-active\"><th scope=\"col\">Order ID</th><th scope=\"col\">Order Date</th><th scope=\"col\">Product Name</th><th scope=\"col\">Product Price</th></tr>";

            while (sdr.Read())
            {
                table += $"<tr><td>{sdr[0]}</td><td>{sdr[1]}</td><td>{sdr[2]}</td>"+
                $"<td>{sdr[3]}</td></tr>";

                
            }
            table += "</table>";
            table += "</div>";
            Label1.Text = table;    
            
        }

        protected void Button1_Click(object sender, EventArgs e)
        {

        }
    }
}