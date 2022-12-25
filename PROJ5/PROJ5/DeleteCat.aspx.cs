using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PROJ5
{
    public partial class DeleteCat : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack) 
            {

                int id = Convert.ToInt32(Request.QueryString["id"]);
                SqlConnection connection =
                new SqlConnection("data source = DESKTOP-PND235Q\\SQLEXPRESS01; database = LIBRARYBOOKS ; integrated security=SSPI");
                connection.Open();
                bool flag = false;

                if (!string.IsNullOrEmpty(Session["ID"] as string))
                {
                    int IDs = Convert.ToInt32(Session["ID"].ToString());


                    SqlCommand check = new SqlCommand($"Select role_id from users where userid={IDs}", connection);
               
                    SqlDataReader rolecheck = check.ExecuteReader();

                    while (rolecheck.Read())
                    {
                        if (Convert.ToInt32(rolecheck[0]) == 1)
                        {

                            flag = true;
                            break;

                        }
                    }
                }
                connection.Close();
                connection.Open();
                if (flag)
                {
                    string query = $"select * from category where category_id={id}";

                    SqlCommand comand = new SqlCommand(query, connection);
                    SqlDataReader read = comand.ExecuteReader();
                        while (read.Read())

                            {
                                 CategoryName.Text += read[1].ToString();
                                 string image = $"Images/{read[2].ToString()}";
                                 image1.Src = image;
                            }
            
                }
                else
                {
                    Response.Redirect("login.aspx");
                }

                connection.Close();
            }

        }

        protected void Delete_button(object sender, EventArgs e)
        {

            SqlConnection connection =
            new SqlConnection("data source =DESKTOP-PND235Q\\SQLEXPRESS01; database = LIBRARYBOOKS ; integrated security=SSPI");
            connection.Open();
            int id = Convert.ToInt32(Request.QueryString["id"]);

            SqlCommand productcheck = new SqlCommand($"select count (*) from product where category_id={id}", connection);
            SqlDataReader read = productcheck.ExecuteReader();
            int productsNum = 0;
            while (read.Read()) { productsNum = Convert.ToInt32(read[0]); }

            if (productsNum >= 1)
            {

                Response.Write($"<script>alert(\"Can't Delete This Category cause it has {productsNum} Products in it \")</script>");
            }
            else
            {
                connection.Close();
                connection.Open();

                string query = $"delete from category where category_id={id}";
                SqlCommand com = new SqlCommand(query, connection);
                com.ExecuteNonQuery();
                connection.Close();
                Response.Redirect("AdminCategory.aspx");
            }
            connection.Close();

        }






        protected void Logout(object sender, EventArgs e)
        {
            Session.Abandon();
            Response.Redirect("login.aspx");
        }





    }
}