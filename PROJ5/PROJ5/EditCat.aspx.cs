using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PROJ5
{
    public partial class EditCat : System.Web.UI.Page
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
                        Category_Name.Text = read[1].ToString();

                        string image = $"Images/{read[2].ToString()}";
                        image1.Src = image;
                        Session["Image"] = read[2].ToString();
                    }

                }
                else
                {
                    Response.Redirect("login.aspx");
                }
                connection.Close();

            }
        }

        protected void Save(object sender, EventArgs e)
        {
            int id = Convert.ToInt32(Request.QueryString["id"]);
            SqlConnection connection =
            new SqlConnection("data source =DESKTOP-PND235Q\\SQLEXPRESS01; database = LIBRARYBOOKS ; integrated security=SSPI");
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
            string query = $"update category set category_name='{Category_Name.Text}' ,category_PICTURE='{filelocation}' where category_id={id}";


            SqlCommand command = new SqlCommand(query, connection);

            command.ExecuteNonQuery();
            connection.Close();
            Response.Redirect("AdminCategory.aspx");
        }





        protected void Logout(object sender, EventArgs e)
        {
            Session.Abandon();
            Response.Redirect("login.aspx");
        }



    }
}