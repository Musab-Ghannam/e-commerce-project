using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace my_log_in
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }



        protected void Submit_Click(object sender, EventArgs e)
        {

            string email = emaillogin.Value;
            string password = passwordlogin.Value;
            SqlConnection connection = new SqlConnection("data source= DESKTOP-PND235Q\\SQLEXPRESS01;database=LIBRARYBOOKS;Integrated security=SSPI");
            SqlCommand command1 = new SqlCommand($"select Userid,role_id from Users WHERE EMAIL=@email and pass=@password;", connection);
            command1.Parameters.AddWithValue("@email", email);
            command1.Parameters.AddWithValue("@password", password);

            connection.Open();
            SqlDataReader Read = command1.ExecuteReader();
            if (Read.Read())
            {
                if (Read[1].ToString() == "1")
                {
                    Session["ID"] = Read[0].ToString();
                    Response.Redirect("http://localhost:56508/AdminCategory.aspx"); 
                }
                else
                {
                    Session["ID"] = Read[0].ToString();

                    Response.Redirect("http://localhost:56508/EXAMPLE.aspx");
                }

            }
            else
            {
                Label1.Text = "UserId & Password Is not correct Try again..!!";

            }

            connection.Close();
        }



    }
}