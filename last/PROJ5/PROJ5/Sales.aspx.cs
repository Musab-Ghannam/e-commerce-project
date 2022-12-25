using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication3
{
    public partial class Sales : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            SqlConnection connection = new SqlConnection("data source= DESKTOP-PND235Q\\SQLEXPRESS01;database=LIBRARYBOOKS;Integrated security=SSPI");
            connection.Open();
            bool flag = false;
            if (!string.IsNullOrEmpty(Session["ID"] as string))
            {
                int IDs = Convert.ToInt32(Session["ID"].ToString());


                SqlCommand check = new SqlCommand($"Select role_id from users where userid={IDs}", connection);
                //connection.Open();


                SqlDataReader rolecheck = check.ExecuteReader();

                while (rolecheck.Read())
                {
                    if (Convert.ToInt32(rolecheck[0]) == 1)
                    {

                        flag = true;
                        break;

                    }
                }
            }
            connection.Close();
            connection.Open();
            if (flag)
            {




    
            string query = "select*from users";
            SqlCommand comand = new SqlCommand(query, connection);
            SqlDataReader sdr = comand.ExecuteReader();
            string table = "<div class=\"table-responsive\">";
            table += "<table class='table table-striped'><tr ><th >NAME</th><th >USER_PICTURE</th><th >PHONE_NUMBER</th><th >view Sales</th></tr>";

            while (sdr.Read())
            {
                table += $"<tr ><td>{sdr[3].ToString()}  {sdr[4]}</td><td><img width='200px' height='200px' class=\"image\" src='Images/{sdr[8]}'/></td>" +
                $"<td>{sdr[5]}</td>"+
                $"<td class=\"viewsalesdiv\"><a href='viewsale.aspx?id={sdr[0]}' class=\"viewsales\"><i class=\"fas fa-eye\"></i>View</a></td></tr>"
            
                ;
            }

            table += "</table>";
            table += "</div>";
            Sale.Text = table;
            connection.Close();
            SqlConnection secondconn = new SqlConnection("data source= DESKTOP-PND235Q\\SQLEXPRESS01;database=LIBRARYBOOKS;Integrated security=SSPI");
            secondconn.Open();
            string secondquery = "select count(*) from  users";
            SqlCommand secondcomand = new SqlCommand(secondquery, secondconn);
            SqlDataReader reader = secondcomand.ExecuteReader();
            while (reader.Read())
            {
                Label1.Text = reader[0].ToString();
            }
            secondconn.Close();
            SqlConnection thiredcondconn = new SqlConnection("data source= DESKTOP-PND235Q\\SQLEXPRESS01;database=LIBRARYBOOKS;Integrated security=SSPI");
            thiredcondconn.Open();
            string thireddquery = "select count(*) from  order_product;";
            SqlCommand thiredcomand = new SqlCommand(thireddquery, thiredcondconn);
            SqlDataReader rdr = thiredcomand.ExecuteReader();
            while (rdr.Read())
            {
                Label2.Text = rdr[0].ToString();
            }
            thiredcondconn.Close();

            SqlConnection fouredcondconn = new SqlConnection("data source= DESKTOP-PND235Q\\SQLEXPRESS01;database=LIBRARYBOOKS;Integrated security=SSPI");
            fouredcondconn.Open();
            string foureeddquery = "select count(*) from  category;";
            SqlCommand fouredcomand = new SqlCommand(foureeddquery, fouredcondconn);
            SqlDataReader rdrer = fouredcomand.ExecuteReader();
            while (rdrer.Read())
            {
                Label3.Text = rdrer[0].ToString();
            }
            fouredcondconn.Close();
            SqlConnection fivedcondconn = new SqlConnection("data source= DESKTOP-PND235Q\\SQLEXPRESS01;database=LIBRARYBOOKS;Integrated security=SSPI");
            fivedcondconn.Open();
            string fivededdquery = "select avg(prodct_price)*count(O.product_id) from order_product as O join product AS p on O.product_id=p.product_id group by O.product_id;";
            SqlCommand fivedcomand = new SqlCommand(fivededdquery, fivedcondconn);
            int count = 0;
            SqlDataReader rdrerr = fivedcomand.ExecuteReader();
            while (rdrerr.Read())
            {
                count += Convert.ToInt32(rdrerr[0]);
            }
            fivedcondconn.Close();
            Label4.Text = count.ToString() + "JD";
            }
            connection.Close();


        }

        protected void Button1_Click(object sender, EventArgs e)
        {

        }
    }
}