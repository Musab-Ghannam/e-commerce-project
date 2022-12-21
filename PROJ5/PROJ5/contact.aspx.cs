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
            SqlConnection conn = new SqlConnection("data source= DESKTOP-PND235Q\\SQLEXPRESS01;database=LIBRARYBOOKS;Integrated security=SSPI");
           
            string commm = $"Insert into contacus (fname,lname,sub,phone,detail) Values ('{Fname.Text}','{Lname.Text}','{Subject.Text}','{Number.Text}','{bigbox.Text}')";
            SqlCommand com = new SqlCommand(commm, conn);
            conn.Open();
            com.ExecuteNonQuery();
            conn.Close();
        }
    }
}