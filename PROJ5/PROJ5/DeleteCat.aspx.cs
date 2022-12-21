using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PROJ5
{
    public partial class DeleteCat : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            int id = Convert.ToInt32(Request.QueryString["id"]);
            SqlConnection connection =
        new SqlConnection("data source = DESKTOP-PND235Q\\SQLEXPRESS01; database = LIBRARYBOOKS ; integrated security=SSPI");
            connection.Open();

            string query = $"select * from category where category_id={id}";

            SqlCommand comand = new SqlCommand(query, connection);
            SqlDataReader read = comand.ExecuteReader();
            while (read.Read())

            {
                CategoryName.Text += read[1].ToString();
                string image = $"Images/{read[2].ToString()}";
                image1.Src = image;
            }
            connection.Close();
        }

        protected void Delete_button(object sender, EventArgs e)
        {
            SqlConnection connection =
            new SqlConnection("data source =DESKTOP-PND235Q\\SQLEXPRESS01; database = LIBRARYBOOKS ; integrated security=SSPI");
            connection.Open();
            int id = Convert.ToInt32(Request.QueryString["id"]);
            string query = $"delete from category where category_id={id}";
            SqlCommand com = new SqlCommand(query, connection);
            com.ExecuteNonQuery();
            connection.Close();
            Response.Redirect("AdminCategory.aspx");
        }
    }
}