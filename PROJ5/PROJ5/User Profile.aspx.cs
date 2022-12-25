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
        static string image1;
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!string.IsNullOrEmpty(Session["ID"] as string))

            {
                if (!IsPostBack)
                {
                    int id = Convert.ToInt32(Session["ID"].ToString());
                    SqlConnection connection = new SqlConnection("data source=DESKTOP-PND235Q\\SQLEXPRESS01;database=LIBRARYBOOKS;Integrated security=SSPI");
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
                        firstName.Value = read[3].ToString();
                        lastName.Value = read[4].ToString();
                        phone.Value = read[5].ToString();
                        City.Items.FindByValue(read[6].ToString()).Selected = true;
                        userImage.Src = $"Images/{read[8].ToString()}";
                        Session["Imagealt"] = read[8].ToString();
                        image1 = Session["Imagealt"].ToString();
                        string username = read[3].ToString() + " " + read[4].ToString();
                        Username.Text = username;
                        UserEmail.Text = read[1].ToString();


                    }
                }
            }

            else
            {
                Response.Redirect("login.aspx");
                form1.Style["display"] = "none";
            }

        }
        //pass='{Password.Value}'
        protected void Save_Click(object sender, EventArgs e)
        {

            int id = Convert.ToInt32(Session["ID"].ToString());
            SqlConnection connection = new SqlConnection("data source=DESKTOP-PND235Q\\SQLEXPRESS01;database=LIBRARYBOOKS;Integrated security=SSPI");
            connection.Open();
            string query = $"update users set  EMAIL='{email.Value}',First_name='{firstName.Value}',Last_Name='{lastName.Value}' ,PHONE='{phone.Value}',city_Id='{City.SelectedValue}',user_PICTURE='{image1}' where USerid={id}";

            SqlCommand command = new SqlCommand(query, connection);
            command.ExecuteNonQuery();

        }


        protected void Upload_Click(object sender, EventArgs e)
        {

            int id = Convert.ToInt32(Session["ID"].ToString());
            if (FileUpload1.HasFile)
            {

                SqlConnection connection = new SqlConnection("data source=DESKTOP-PND235Q\\SQLEXPRESS01;database=LIBRARYBOOKS;Integrated security=SSPI");
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
        protected void changePassword(object sender, EventArgs e)
        {
            //string pssstr = ;
            //passlabel.Text = pssstr;
            olderpass.Style["display"] = "Block";
            btnsforpass.Style["display"] = "Block";
            newerpass.Style["display"] = "Block";


        }
        protected void cancelchangePassword(object sender, EventArgs e)
        {
            olderpass.Style["display"] = "none";
            newerpass.Style["display"] = "none";
            btnsforpass.Style["display"] = "none";

        }
        protected void checkforchangepass(object sender, EventArgs e)
        {

            SqlCommand com;
            int id = Convert.ToInt32(Session["ID"].ToString());
            SqlConnection con = new SqlConnection("data source=DESKTOP-PND235Q\\SQLEXPRESS01;database=LIBRARYBOOKS;Integrated security=SSPI");
            con.Open();
            string strquery = $"select * from users  where USerid='{id}'";
            com = new SqlCommand(strquery, con);
            SqlDataReader reader = com.ExecuteReader();
            bool up = false;
            while (reader.Read())
            {
                if (oldpss.Text == reader["Pass"].ToString())
                {
                    up = true;
                }
            }
            con.Close();
            con.Open();

            if (up)
            {


                string str = $"update users set Pass='{newpss.Text}'  where Userid='{id}'";
                com = new SqlCommand(str, con);
                com.ExecuteNonQuery();
                con.Close();
                testpass.Text = "Password changed Successfully";
                olderpass.Style["display"] = "none";
                newerpass.Style["display"] = "none";
                btnsforpass.Style["display"] = "none";
                testpass.Style["color"] = "blue";

            }
            else
            {
                testpass.Text = "Please enter correct Current password";
                testpass.Style["color"] = "red";
            }
        }





        protected void vieworders(object sender, EventArgs e)
        {
            Response.Redirect("uservieworders.aspx");
        }
        protected void Logout(object sender, EventArgs e)
        {
            Session.Abandon();
            Response.Redirect("login.aspx");
        }
        protected void Submit_Click(object sender, EventArgs e)
        {
            string ss = searches.Value.ToString();
            if (ss.Trim().Length > 0)
            {

                Session["ssearch"] = ss;
                Response.Redirect($"http://localhost:56508/mysearch.aspx?ss={ss.Trim()}");

            }
        }

    }
}

