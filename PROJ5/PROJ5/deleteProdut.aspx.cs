using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Collections;

namespace WebApplication3
{
    public partial class deleteProdut : System.Web.UI.Page
    {


        protected void Page_Load(object sender, EventArgs e)
        {
            SqlConnection connection = new SqlConnection("data source=DESKTOP-PND235Q\\SQLEXPRESS01;database=LIBRARYBOOKS;Integrated security=SSPI");
            connection.Open();
            if (!string.IsNullOrEmpty(Session["ID"] as string))
            {

                if (!IsPostBack)
                {
                    int id = Convert.ToInt32(Request.QueryString["id"]);
                    SqlCommand comand = new SqlCommand($"select*from product where product_id={id}", connection);
                    SqlDataReader read = comand.ExecuteReader();
                    while (read.Read())
                    {
                        //tbproductname.Text = read[1].ToString();
                        Image1.ImageUrl = $"Images/{read[2].ToString()}";
                        lbproductname.Text += read[1].ToString();
                        lbproductprice.Text += read[4].ToString() + "JD";
                        Author.Text += read[9].ToString();



                    }
                    connection.Close();
                    connection.Open();
                    string query = $"select * from category join product on category.category_id=product.category_id\r\nand product_id={id};";
                    SqlCommand com = new SqlCommand(query, connection);
                    SqlDataReader sdr = com.ExecuteReader();
                    while (sdr.Read())
                    {
                        lbcategoryname.Text += sdr[1].ToString();

                    }
                }
            }
            else
            {
                connection.Close();
                Response.Redirect("login.aspx");
                form1.Style["display"] = "none";
            }
        }
        protected void btnDelete_Click(object sender, EventArgs e)
        {
            SqlConnection connection = new SqlConnection("data source=DESKTOP-PND235Q\\SQLEXPRESS01;database=LIBRARYBOOKS;Integrated security=SSPI");
            connection.Open();
            if (!string.IsNullOrEmpty(Session["ID"] as string))
            {
                int id = Convert.ToInt32(Request.QueryString["id"]);
                string guerycondition = $"select order_id from order_product as O join product as P \r\non O.product_id=P.product_id and p.product_id={id};";
                SqlCommand com = new SqlCommand(guerycondition, connection);
                SqlDataReader sdr = com.ExecuteReader();
                if (!sdr.Read())
                {

                    connection.Close();
                    connection.Open();
                    string query = $"DELETE FROM product where product_id={id};";
                    SqlCommand command = new SqlCommand(query, connection); ;
                    command.ExecuteNonQuery();
                    connection.Close();
                    string dannger = "<div class=\"alert2\"> <span class=\"closebtn2\" onclick=\"this.parentElement.style.display='none';\"><a href=\"http://localhost:56508/Product.aspx\" class=\"xsign\">&times;</a></span>" +
                        " <strong>Success!</strong>The book has been successfully deleted</div>";
                    lbtest.Text = dannger;
                }
                else
                {
                    connection.Close();
                    connection.Open();
                    string dannger = "<div class=\"alert\"> <span class=\"closebtn\" onclick=\"this.parentElement.style.display='none';\"><a href=\"http://localhost:56508/Product.aspx\" class=\"xsign\">&times;</a></span>" +
                        " <strong>Danger!</strong>You cannot delete this product because it is included on orders</div>";
                    lbtest.Text = dannger;


                }
            }
            else
            {
                connection.Close();
                Response.Redirect("login.aspx");
                form1.Style["display"] = "none";
            }
        }
        protected void Logout(object sender, EventArgs e)
        {
            Session.Abandon();
            Response.Redirect("login.aspx");
        }


    }
}