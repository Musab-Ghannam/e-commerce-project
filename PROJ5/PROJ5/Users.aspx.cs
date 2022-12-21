using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PROJ5
{
    public partial class Users : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            SqlConnection connection = new SqlConnection("data source = DESKTOP-PND235Q\\SQLEXPRESS01; database = LIBRARYBOOKS ; integrated security=SSPI");
            connection.Open();
            string table =
"<table class='table table-hover table-striped'><tr><th>ID</th><th>Email</th><th>First Name</th><th>Last Name</th><th>Phone</th><th>City</th><th>Role</th><th>Image</th><th>Actions</th></tr>";
            SqlCommand comand = new SqlCommand
                ("select Userid,EMAIL,First_name,Last_Name,PHONE,user_PICTURE,City.city_Name,Roles.role_Name " +
                "from users inner join City on users.city_Id=City.city_Id inner join Roles on users.role_id=Roles.role_Id;"

                , connection);
            SqlDataReader sdr = comand.ExecuteReader();
            while (sdr.Read())
            {
                table +=
                    $"<tr><td>{sdr[0]}</td><td>{sdr[1]}</td><td>{sdr[2]}</td><td>{sdr[3]}</td>" +
                    $"<td>{sdr[4]}</td><td>{sdr[6]}</td><td>{sdr[7]}</td>" +
                    $"<td><img width = '200px' height = '200px' src = 'Images/{sdr[5]}' /></ td >"
                    +
                    $"<td><a href='EditUsers.aspx?id={sdr[0]}'>Edit</a> &nbsp <a href='DeleteUsers.aspx?id={sdr[0]}'>Delete</a></td></tr>";
            }
            table += "</table>";
            Label1.Text = table;

        }
    }
}