using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PROJ5
{
    public partial class EditUsers : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            { 
                int id = Convert.ToInt32(Request.QueryString["id"]);
            SqlConnection connection =
        new SqlConnection("data source = DESKTOP-PND235Q\\SQLEXPRESS01; database = LIBRARYBOOKS ; integrated security=SSPI");
            bool flag = false;
            connection.Open();

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
                string query = $"select * from users where userid={id}";

                SqlCommand comand = new SqlCommand(query, connection);
                SqlCommand command = new SqlCommand("select * from city", connection);

                SqlDataAdapter adapt = new SqlDataAdapter(command);
                DataTable dt = new DataTable();
                adapt.Fill(dt);
                City.DataSource = dt;
                City.DataTextField = "city_name";
                City.DataValueField = "city_id";
                City.DataBind();
                SqlCommand roles = new SqlCommand("select * from Roles;", connection);
                SqlDataAdapter roleadapt = new SqlDataAdapter(roles);
                DataTable roletable = new DataTable();
                roleadapt.Fill(roletable);
                Role.DataSource = roletable;
                Role.DataTextField = "role_Name";
                Role.DataValueField = "role_Id";
                Role.DataBind();

                SqlDataReader read = comand.ExecuteReader();

                while (read.Read())

                {
                    email.Text = read[1].ToString();
                    pass.Value = read[2].ToString();
                    firstName.Text = read[3].ToString();
                    lastName.Text = read[4].ToString();
                    phone.Text = read[5].ToString();
                    City.Items.FindByValue(read[6].ToString()).Selected = true;
                    Role.Items.FindByValue(read[7].ToString()).Selected = true;
                    string image = $"Images/{read[8].ToString()}";
                    image1.Src = image;
                    Session["Image"] = read[8].ToString();

                }
            }
            else
            {
                Response.Redirect("login.aspx");
            }

            connection.Close();

            }
        }

        protected void Edituser(object sender, EventArgs e)
        {
            try
            {

         

            int id = Convert.ToInt32(Request.QueryString["id"]);
            SqlConnection connection =
            new SqlConnection("data source = DESKTOP-PND235Q\\SQLEXPRESS01; database = LIBRARYBOOKS ; integrated security=SSPI");
            connection.Open();

            string filelocation = "";
            if (FileUpload1.HasFile)
            {
                string fullPath = Server.MapPath("Images/") + FileUpload1.FileName;
                filelocation = FileUpload1.FileName;
                FileUpload1.SaveAs(fullPath);

            }

            else
            {
                filelocation = Session["Image"].ToString();
            }
            string query = $"update USERS set EMAIL='{email.Text}',pass='{pass.Value}',first_name='{firstName.Text}'" +
                $",last_name='{lastName.Text}',phone='{phone.Text}',city_id={City.SelectedValue},role_id={Role.SelectedValue},user_PICTURE='{filelocation}'  where userid={id}";
            SqlCommand command = new SqlCommand(query, connection);

            command.ExecuteNonQuery();
            connection.Close();
            Response.Redirect("Users.aspx");


            }
            catch (SqlException c)
            {
                string moath = c.Message;

                Response.Write($"<script>alert(\"{moath}\")</script>");


            }






        }

        protected void Logout(object sender, EventArgs e)
        {
            Session.Abandon();
            Response.Redirect("login.aspx");
        }




    }
}