using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication3
{
    public partial class addproduct : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            SqlConnection connection = new SqlConnection("data source=DESKTOP-PND235Q\\SQLEXPRESS01;database=LIBRARYBOOKS;Integrated security=SSPI");
            connection.Open();

            if (!string.IsNullOrEmpty(Session["ID"] as string) && Convert.ToInt32(Session["ID"].ToString()) == 1)
            {

                SqlCommand command = new SqlCommand("select  category_id,category_name from category", connection);
                SqlDataAdapter adapt = new SqlDataAdapter(command);
                DataTable dt = new DataTable();
                adapt.Fill(dt);
                drcategoryname.DataSource = dt;
                drcategoryname.DataTextField = "category_name";
                drcategoryname.DataValueField = "category_id";
                drcategoryname.DataBind();
                SqlDataReader rd = command.ExecuteReader();
            }
            else
            {
                connection.Close();
                Response.Redirect("login.aspx");


            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            SqlConnection connection = new SqlConnection("data source=DESKTOP-PND235Q\\SQLEXPRESS01;database=LIBRARYBOOKS;Integrated security=SSPI");
            connection.Open();

            string folderpath = Server.MapPath("~/Images/");
            if (!Directory.Exists(folderpath))
            {
                Directory.CreateDirectory(folderpath);
            }
            FileUpload1.SaveAs(folderpath + FileUpload1.FileName);
            Session["image"] = FileUpload1.FileName;
            connection.Close();
            connection.Open();

            string query = $"insert into product(product_name,prodct_price,quantity,detalis,sale,category_id,product_PICTURE) values('{tbproductname.Text}','{tbproductprice.Text}','{tbquantity.Text}','{tbdetails.Text}','{tbsale.Text}','{drcategoryname.SelectedValue}',='{Session["image"].ToString()}')";
            SqlCommand command = new SqlCommand($"insert into product(product_name,prodct_price,quantity,detalis,sale,category_id,product_PICTURE,author) values('{tbproductname.Text}','{tbproductprice.Text}','{tbquantity.Text}','{tbdetails.Text}','{tbsale.Text}','{drcategoryname.SelectedValue}','{Session["image"].ToString()}','{tbauthor.Text}');", connection);
            command.ExecuteNonQuery();

            connection.Close();
            string sucsses = "<div class=\"alert\"> <span class=\"closebtn\" onclick=\"this.parentElement.style.display='none';\"><a href=\"http://localhost:56508/Product.aspx\" class=\"xsign\">&times;</a>  </span>" +
                      " <strong>Success!</strong>The book has been successfully added</div>";
            Label2.Text = sucsses;

        }

        protected void btnupload_Click(object sender, EventArgs e)
        {

        }
        protected void Logout(object sender, EventArgs e)
        {
            Session.Abandon();
            Response.Redirect("login.aspx");
        }
    }
}