using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;

using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication3
{
    public partial class User_Profile : System.Web.UI.Page
    {
        static String image1 = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            
            int id =Convert.ToInt32( Session["ID"].ToString());
            if (!IsPostBack)
            {
                SqlConnection connection = new SqlConnection("data source= DESKTOP-PND235Q\\SQLEXPRESS01;database=LIBRARYBOOKS;Integrated security=SSPI");
                connection.Open();
                SqlCommand comand = new SqlCommand($"select*from users where USerid='{id}'", connection);
                SqlCommand command = new SqlCommand("select * from city", connection);
                SqlDataAdapter adapt = new SqlDataAdapter(command);
                DataTable dt = new DataTable();
                adapt.Fill(dt);
                City.DataSource = dt;
                City.DataTextField = "city_name";
                City.DataValueField = "city_id";
                City.DataBind();
                SqlDataReader read = comand.ExecuteReader();

                while (read.Read())
                {
                    email.Value = read[1].ToString();
                    Password.Value= read[2].ToString();
                    firstName.Value = read[3].ToString();
                    lastName.Value = read[4].ToString();
                    phone.Value = read[5].ToString();
                    City.Items.FindByValue(read[6].ToString()).Selected = true;
                    userImage.Src = $"Images/{read[8].ToString()}";
                    Session["Imagealt"]= read[8].ToString();
                    image1= Session["Imagealt"].ToString();
                    string username = read[3].ToString() + " " + read[4].ToString();
                    Username.Text = username;
                    UserEmail.Text = read[1].ToString();
                }
            }

            
        }

        protected void Save_Click(object sender, EventArgs e)
        {
            int id = Convert.ToInt32(Session["ID"].ToString()); 
            SqlConnection connection = new SqlConnection("data source= DESKTOP-PND235Q\\SQLEXPRESS01;database=LIBRARYBOOKS;Integrated security=SSPI");
            connection.Open(); 
            string query = $"update users set  EMAIL='{email.Value}',pass='{Password.Value}',First_name='{firstName.Value}',Last_Name='{lastName.Value}' ,PHONE='{phone.Value}',city_Id='{City.SelectedValue}',user_PICTURE='{Session["Imagealt"]}' where USerid={id}";
            
            SqlCommand command = new SqlCommand(query, connection);
            command.ExecuteNonQuery();

        }
        protected void Upload_Click(object sender, EventArgs e)
        {
            int id = Convert.ToInt32(Session["ID"].ToString());
            if (FileUpload1.HasFile)
            {

                SqlConnection connection = new SqlConnection("data source= DESKTOP-PND235Q\\SQLEXPRESS01;database=LIBRARYBOOKS;Integrated security=SSPI");
                connection.Open();

                string folderpath = Server.MapPath("~/Images/");
                if (!Directory.Exists(folderpath))
                {
                    Directory.CreateDirectory(folderpath);
                }
                FileUpload1.SaveAs(folderpath + FileUpload1.FileName);
                userImage.Src = "Images/" + FileUpload1.FileName;
                Session["image"] = FileUpload1.FileName;
                image1 = Session["image"].ToString();
                connection.Close();
            }
            else
            {
                Session["image"] = Session["Imagealt"];
                image1 = Session["image"].ToString();

            }


        }

        //protected void Save(object sender, EventArgs e)
        //{
        //}
    }
}
