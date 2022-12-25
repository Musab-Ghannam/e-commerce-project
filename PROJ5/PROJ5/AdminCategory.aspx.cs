using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PROJ5
{
    public partial class AdminCategory : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            SqlConnection connection = new SqlConnection("data source = DESKTOP-PND235Q\\SQLEXPRESS01; database = LIBRARYBOOKS ; integrated security=SSPI");
            bool flag = false;
            if (!string.IsNullOrEmpty(Session["ID"] as string))
            {
                int IDs = Convert.ToInt32(Session["ID"].ToString());


                SqlCommand check = new SqlCommand($"Select role_id from users where userid={IDs}", connection);
                connection.Open();
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
                string table = "<table class='table table-striped'> <tr><th>ID</th> <th>Category Name</th><th>Image</th> <th>Actions</th></tr>";
                SqlCommand comand = new SqlCommand("select * from category", connection);

                SqlDataReader sdr = comand.ExecuteReader();
                while (sdr.Read())
                {
                    table +=
                     $"<tr><td>{sdr[0]}</td><td>{sdr[1]}</td><td><img  src='Images/{sdr[2]}'/></td>"
                    +
                     $"<td><a href='editCat.aspx?id={sdr[0]}'><i class=\"fas fa-pen\"></i>Edit</a> &nbsp <a href='DeleteCat.aspx?id={sdr[0]}'><i class=\"fas fa-trash\" aria-hidden=\"true\"></i>Delete</a></td></tr>";
                }



                table += "</table>";
                Label1.Text = table;

            }
            else
            {
                Response.Redirect("login.aspx");
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