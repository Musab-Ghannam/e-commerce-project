using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Reflection.Emit;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PROJ5
{
    public partial class HOME_PAGE : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {string id = Request.QueryString["category_id"] ;
            string categoryname = Request.QueryString["category_name"];
            SqlConnection CONN = new SqlConnection("data source= DESKTOP-PND235Q\\SQLEXPRESS01;database=LIBRARYBOOKS;Integrated security=SSPI");
            SqlCommand command = new SqlCommand($"SELECT * FROM PRODUCT where category_id = {id}", CONN);
            CONN.Open();

        

            SqlDataReader reader = command.ExecuteReader();

            Label2.Text+= categoryname ;

            while (reader.Read())
            {
               
                Label1.Text += $"<div class=\"row \" style=\"\">\r \n \r \n " +
                    $"<div class=\"card\" style =\"width:250px\">\r\n    " +
                    $"  <img class=\"card-img-top book\"  src='Images/{reader[2]}' style='width:170px; height:250px'>               " +
                    $" <div class=\"card-body\">\r\n      <h4 class=\"card-title\">{reader[1]}</h4>\r\n     " +
                       $" <p class=\"card-text PRICE1\" >Price:{reader[4]}.00JD</p>\r\n    " +
                    $" <p class=\"card-text\">{reader[6]}</p>\r\n    " +
                    $"  <a href=\"http://localhost:56508/singleProduct.aspx?product_id={reader[0]}\" class=\"btn btn-primary\">see more details</a>\r\n    </div>\r\n  </div>\r \n <br> </div>";

                

            }



             //Label1.Text += $"<div class=\"row\" style=\"\">\r \n \r \n " +
             //       $"<div class=\"card\" style =\"width:250px\">\r\n    " +
             //       $"  <img class=\"card-img-top\"  src='{reader[2]}' style='width:170px'>               " +
             //       $" <div class=\"card-body\">\r\n      <h4 class=\"card-title\">{reader[1]}</h4>\r\n     " +
             //       $" <p class=\"card-text\">Some example text some example text. John Doe is an architect and engineer</p>\r\n    " +
             //       $"  <a href=\"http://localhost:56508/singlecategory.aspx?category_id={reader[0]}\" class=\"btn btn-primary\">See product</a>\r\n    </div>\r\n  </div>\r \n <br> </div>";



            CONN.Close();

        }
    }
}

//http://localhost:56508/singlecategory.aspx