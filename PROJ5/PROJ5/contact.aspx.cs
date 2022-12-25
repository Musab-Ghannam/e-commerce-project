using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PROJ5
{
    public partial class contact : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }


        protected void SendBtn_Click(object sender, EventArgs e)
        {
            using (SqlConnection connection = new SqlConnection("data source= DESKTOP-PND235Q\\SQLEXPRESS01;database=LIBRARYBOOKS;Integrated security=SSPI"))
            {
                connection.Open();

                string sql = "INSERT INTO contactus (name,subject,email,phone,message) VALUES (@value1, @value2, @value3, @value4, @value5)";

                using (SqlCommand command = new SqlCommand(sql, connection))
                {
                    command.Parameters.AddWithValue("@value1", fullname.Text);
                    command.Parameters.AddWithValue("@value2", subject.Text);
                    command.Parameters.AddWithValue("@value3", email.Text);
                    command.Parameters.AddWithValue("@value4", phone.Text);
                    command.Parameters.AddWithValue("@value5", msg.Text);
                    command.ExecuteNonQuery();
                }
                connection.Close();
            }



        }



    
    }
}