using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PROJ5
{
    public partial class DeleteUsers : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

              
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

                    int id = Convert.ToInt32(Request.QueryString["id"]);


                    string query = $"" +
                        $"select Userid,EMAIL,First_name,Last_Name,PHONE,user_PICTURE,City.city_Name,Roles.role_Name " +
                        $"from users inner join City on users.city_Id=City.city_Id inner join Roles on users.role_id=Roles.role_Id where userid={id};";

                    SqlCommand comand = new SqlCommand(query, connection);
                    SqlDataReader read = comand.ExecuteReader();
                    while (read.Read())

                    {
                        email.Text += read[1].ToString();
                        firstName.Text += read[2].ToString();
                        lastName.Text += read[3].ToString();
                        phone.Text += read[4].ToString();
                        City.Text += read[6].ToString();
                        Role.Text += read[7].ToString();
                        string image = $"Images/{read[5].ToString()}";
                        image1.Src = image;

                    }

                }
                else { Response.Redirect("login.aspx"); }
               
                connection.Close();
            }
        }

        protected void Delete_button(object sender, EventArgs e)
        {
            SqlConnection connection =
            new SqlConnection("data source = DESKTOP-PND235Q\\SQLEXPRESS01; database = LIBRARYBOOKS ; integrated security=SSPI");
            connection.Open();
            int id = Convert.ToInt32(Request.QueryString["id"]);
            SqlCommand ordercheck = new SqlCommand($"Select count(*) from orders where customer_id={id}", connection);
            SqlDataReader read = ordercheck.ExecuteReader();
            int ordersnum = 0;
            while (read.Read()) { ordersnum = Convert.ToInt32(read[0]); }

            if (ordersnum >= 1)
            {

                Response.Write($"<script>alert(\"can't delete a this user cause she/he has{ordersnum} orders \")</script>");
            }
            else
            {
                connection.Close();
                connection.Open();

                string query = $"delete from users where userid={id}";
                SqlCommand com = new SqlCommand(query, connection);
                com.ExecuteNonQuery();
                connection.Close();
                Response.Redirect("Users.aspx");
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