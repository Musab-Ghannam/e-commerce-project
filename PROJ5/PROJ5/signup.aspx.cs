using System;
using System.Collections.Generic;
using System.Data.SqlClient;
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

            string email = emaillogin.Value;
            string pass = passwordlogin.Value;
            string first = Name.Value;
            string last = LastName.Value;
            string phone = phoner.Value;
            int phone1 = Convert.ToInt32(phone);
            int city = Convert.ToInt32(DropDownList1.SelectedValue);
            string pic = FileUpload1.FileName;
            SqlConnection connection = new SqlConnection("data source= DESKTOP-PND235Q\\SQLEXPRESS01;database=LIBRARYBOOKS;Integrated security=SSPI");
            SqlCommand command1 = new SqlCommand($"select Userid from Users WHERE EMAIL='{email}';", connection);
            SqlCommand command2 = new SqlCommand($"insert into users values ('{email}' , '{pass}', ' {first}' , '{last}' , '{phone}' , {city} , 1 ,'{pic}' );", connection);

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
                Label1.Text = " done";



            }


        }
    }
}