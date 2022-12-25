using System;
using System.IO;
using System.Data;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using Newtonsoft.Json.Linq;

namespace WebApplication2
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
       

        protected void SendBtn_Click(object sender, EventArgs e)
        {
            using (SqlConnection connection = new SqlConnection("connection here"))
            {
                connection.Open();

                string sql = "INSERT INTO feedback (name,subject,email,phone,message) VALUES (@value1, @value2, @value3, @value4, @value5)";

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