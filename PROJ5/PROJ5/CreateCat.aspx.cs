using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;

namespace PROJ5
{
    public partial class CreateCat : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
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
            if (!flag)
            {

                Response.Redirect("login.aspx");

            }
        }
            protected void CreateNew(object sender, EventArgs e)
        {
            try { 
            string folderPath = Server.MapPath("~/Images/");

            //Check whether Directory (Folder) exists.
            if (!Directory.Exists(folderPath))
            {
                //If Directory (Folder) does not exists Create it.
                Directory.CreateDirectory(folderPath);
            }

            //Save the File to the Directory (Folder).
            FileUpload1.SaveAs(folderPath + Path.GetFileName(FileUpload1.FileName));

            SqlConnection connection =
            new SqlConnection("data source =DESKTOP-PND235Q\\SQLEXPRESS01; database = LIBRARYBOOKS ; integrated security=SSPI");
           
            SqlCommand command = new SqlCommand("insert into category values(@Name,@Image,@Descrip)", connection);
              
                string x = "aaa";
                command.Parameters.AddWithValue("@Name",Category_Name.Text);
                command.Parameters.AddWithValue("@Image", FileUpload1.FileName);
                command.Parameters.AddWithValue("@Descrip", x);

                connection.Open();
                command.ExecuteNonQuery();
            connection.Close();
            Response.Redirect("AdminCategory.aspx");
            }
            catch(SqlException ex)
            {
                string message = ex.Message;
                Response.Write($"<script>alert(\"{message} \")</script>");

            }



        }


        protected void Logout(object sender, EventArgs e)
        {
            Session.Abandon();
            Response.Redirect("login.aspx");
        }

    }
}