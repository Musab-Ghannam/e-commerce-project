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
            int id = Convert.ToInt32(Request.QueryString["id"]);
            SqlConnection connection =
        new SqlConnection("data source = DESKTOP-PND235Q\\SQLEXPRESS01; database = LIBRARYBOOKS ; integrated security=SSPI");
            connection.Open();

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
            connection.Close();

        }

        protected void Delete_button(object sender, EventArgs e)
        {
            SqlConnection connection =
            new SqlConnection("data source = DESKTOP-PND235Q\\SQLEXPRESS01; database = LIBRARYBOOKS ; integrated security=SSPI");
            connection.Open();
            int id = Convert.ToInt32(Request.QueryString["id"]);
            string query = $"delete from users where userid={id}";
            SqlCommand com = new SqlCommand(query, connection);
            com.ExecuteNonQuery();
            connection.Close();
            Response.Redirect("Users.aspx");
        }
    }
}