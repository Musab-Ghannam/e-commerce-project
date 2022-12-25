﻿using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Reflection.Emit;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace my_log_in
{
    public partial class WebForm2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {


        }
        protected void Submit_Click(object sender, EventArgs e)
        {
            try
            {
                string email = emaillogin.Value;
                string pass = passwordlogin.Value;
                string first = Name.Value;
                string last = LastName.Value;
                string phone = phoner.Value;
                string city1 = DropDownList1.SelectedValue;
                int phone1 = Convert.ToInt32(phone);
                int city = Convert.ToInt32(city1);
                string pic = FileUpload1.FileName;
                SqlConnection connection = new SqlConnection("data source= DESKTOP-PND235Q\\SQLEXPRESS01;database=LIBRARYBOOKS;Integrated security=SSPI");
                SqlCommand command1 = new SqlCommand($"select Userid from Users WHERE EMAIL=@email;", connection);
                SqlCommand command2 = new SqlCommand($"insert into users values (@email , @password, @first , @last , @phone , @city , 2 ,@pic );", connection);
                command1.Parameters.AddWithValue("@email", email);
                command2.Parameters.AddWithValue("@email", email);
                command2.Parameters.AddWithValue("@password", pass);
                command2.Parameters.AddWithValue("@first", first);
                command2.Parameters.AddWithValue("@last", last);
                command2.Parameters.AddWithValue("@phone", phone);
                command2.Parameters.AddWithValue("@city", city);
                command2.Parameters.AddWithValue("@pic", pic);





                if (email != "" && pass != "" && first != "" && last != "" && phone != "" && city1 != "" && pic != "")
                {

                    connection.Open();
                    SqlDataReader Read = command1.ExecuteReader();
                    if (Read.Read())
                    {
                        Session["Image"] = Read[0].ToString();
                        Label1.Text = "already regestered";
                        connection.Close();

                    }
                    else
                    {
                        connection.Close();
                        connection.Open();
                        command2.ExecuteNonQuery();
                        connection.Close();
                        string folderpath = Server.MapPath("~/Images/");
                        if (!Directory.Exists(folderpath))
                        {
                            Directory.CreateDirectory(folderpath);
                        }
                        FileUpload1.SaveAs(folderpath + FileUpload1.FileName);
                        Session["image"] = FileUpload1.FileName;
                        Label1.Text = " done";



                    }
                }
                else
                {
                    Label1.Text = "Please fill all the required information";
                }

            }
            catch (Exception ex)
            {
                Label1.Text = "Please fill all the required information";
            }
        }
    }
}