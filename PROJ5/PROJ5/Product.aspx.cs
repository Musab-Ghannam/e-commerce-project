using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Reflection.Emit;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication3
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            SqlConnection connection = new SqlConnection("data source= DESKTOP-PND235Q\\SQLEXPRESS01;database=LIBRARYBOOKS;Integrated security=SSPI");
            connection.Open();
            string query = "select product_id,product_name,product_PICTURE,category_name,prodct_price,quantity,author from product As p inner join category As c on c.category_id=p.category_id;";
            SqlCommand comand = new SqlCommand(query, connection);
            SqlDataReader sdr = comand.ExecuteReader();
            string table = "<div class=\"table-responsive\">";
            table += "<table class='table table-hover '> <tr class=\"table-active\"><th scope=\"col\">Book ID</th> <th scope=\"col\">Book Name</th><th scope=\"col\">Book Image</th><th scope=\"col\">Category Name</th> <th >Book Price</th> <th scope=\"col\">quantity</th><th scope=\"col\">Author</th><th scope=\"col\"></th><th scope=\"col\"></th></tr>";

            while (sdr.Read())
            {
                table += $"<tr >" +
                    $"<td>{sdr[0]}</td><td>{sdr[1]}</td><td><img width='200px' height='200px' src='iamges/{sdr[2]}'/></td>" +
                    $"<td>{sdr[3]}</td><td>{sdr[4]}</td><td>{sdr[5]}</td>" +
                    $"<td>{sdr[6]}<td>" +
                    $"<td collaspe='2'><a href='Editproduct.aspx?id={sdr[0]}'><i class=\"fas fa-pen\"></i></a> <a href='deleteProdut.aspx?id={sdr[0]}'><i class=\"fas fa-trash\" aria-hidden=\"true\"></i></a></td></tr>";



            }
            table += "</table>";
            table += "</div>";
           
            Product.Text = table;
        }
        
      protected void Save_Click(object sender, EventArgs e)
      {
            Response.Write("HI");
      }

        protected void Button1_Click(object sender, EventArgs e)
        {
            SqlConnection connection = new SqlConnection("data source= DESKTOP-PND235Q\\SQLEXPRESS01;database=LIBRARYBOOKS;Integrated security=SSPI");
            connection.Open();
            string query = $"select*from product where product_name like '{TextBox1.Text}' ";
            SqlCommand comand = new SqlCommand(query, connection);
            SqlDataReader sdr = comand.ExecuteReader();
            string table = "<div class=\"table-responsive\">";
            table += "<table class='table table-hover '> <tr class=\"table-active\"><th scope=\"col\">Book ID</th> <th scope=\"col\">Book Name</th><th scope=\"col\">Book Image</th> <th >Book Price</th> <th scope=\"col\">quantity</th><th scope=\"col\">Author</th><th scope=\"col\"></th><th scope=\"col\"></th></tr>";

            while (sdr.Read())
            {
                table += $"<tr >" +
                    $"<td>{sdr[0]}</td><td>{sdr[1]}</td><td><img width='200px' height='200px' src='iamges/{sdr[2]}'/></td>" +
                    $"<td>{sdr[4]}</td><td>{sdr[5]}</td><td>{sdr[8]}</td>";



            }
            table += "</table>";
            table += "</div>";
            Label1.Text = table;    

        }
    }
}