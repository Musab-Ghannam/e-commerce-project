using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PROJ5
{
    public partial class allcategories : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            SqlConnection CONN = new SqlConnection("data source= DESKTOP-PND235Q\\SQLEXPRESS01;database=LIBRARYBOOKS;Integrated security=SSPI");
            SqlCommand command = new SqlCommand("SELECT  * FROM category", CONN);

            CONN.Open();


            SqlDataReader reader = command.ExecuteReader();




            while (reader.Read())
            {
                Label1.Text += $"<div class=\"row\" style=\"\">\r \n \r \n " +
                    $"<div class=\"card book\" style =\"width:250px\">\r\n    " +
                    $"  <img class=\"card-img-top book\"  src='Images/{reader[2]}' style='width:170px; height:250px'>               " +
                    $" <div class=\"card-body\">\r\n      <h4 class=\"card-title\">{reader[1]}</h4>\r\n     " +
                    $" <p class=\"card-text\">{reader[3]}</p>\r\n    " +
                    $"  <a href=\"http://localhost:56508/singlecategory.aspx?category_id={reader[0]}&category_name={reader[1]}\" class=\"btn btn-primary\">See product</a>\r\n    </div>\r\n  </div>\r \n <br> </div>";

            }
            CONN.Close();

        }
    }
}