using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PROJ5
{
    public partial class CreateUsers : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                SqlConnection connection = new SqlConnection("data source = DESKTOP-PND235Q\\SQLEXPRESS01; database = LIBRARYBOOKS ; integrated security=SSPI");
                connection.Open();
                SqlCommand command = new SqlCommand("select * from city", connection);
                SqlDataAdapter adapt = new SqlDataAdapter(command);
                DataTable dt = new DataTable();
                adapt.Fill(dt);
                City.DataSource = dt;
                City.DataTextField = "city_name";
                City.DataValueField = "city_id";
                City.DataBind();
                connection.Close();
                connection.Open();
                SqlCommand roles = new SqlCommand("select * from Roles;", connection);
                SqlDataAdapter roleadapt = new SqlDataAdapter(roles);
                DataTable roletable = new DataTable();
                roleadapt.Fill(roletable);
                Role.DataSource = roletable;
                Role.DataTextField = "role_Name";
                Role.DataValueField = "role_Id";
                Role.DataBind();
                connection.Close();

            }

        }

        protected void CreateNew(object sender, EventArgs e)
        {
            string folderPath = Server.MapPath("~/Images/");

            //Check whether Directory (Folder) exists.
            if (!Directory.Exists(folderPath))
            {
                //If Directory (Folder) does not exists Create it.
                Directory.CreateDirectory(folderPath);
            }
            FileUpload1.SaveAs(folderPath + Path.GetFileName(FileUpload1.FileName));
            SqlConnection connection =
           new SqlConnection("data source = DESKTOP-PND235Q\\SQLEXPRESS01; database = LIBRARYBOOKS ; integrated security=SSPI");
            connection.Open();
            string query =
                $"insert into users " +
                $"values('{email.Text}','{pass.Value}','{firstName.Text}','{lastName.Text}','{phone.Text}',{City.SelectedValue},{Role.SelectedValue},'{FileUpload1.FileName}')";
            SqlCommand command = new SqlCommand(query, connection);
            command.ExecuteNonQuery();
            connection.Close();
            Response.Redirect("Users.aspx");

        }



        protected void Logout(object sender, EventArgs e)
        {
            Session.Abandon();
            Response.Redirect("login.aspx");
        }





    }
}