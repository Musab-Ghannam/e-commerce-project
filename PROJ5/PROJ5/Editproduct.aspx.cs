using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Net.NetworkInformation;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows.Input;

namespace WebApplication3
{
    public partial class Editproduct : System.Web.UI.Page
    {
        static dynamic image1;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                int id = Convert.ToInt32(Request.QueryString["id"]);
                SqlConnection connection = new SqlConnection("data source= DESKTOP-PND235Q\\SQLEXPRESS01;database=LIBRARYBOOKS;Integrated security=SSPI");
                connection.Open();
                SqlCommand comand = new SqlCommand($"select*from product where product_id={id}", connection);
                SqlDataReader read = comand.ExecuteReader();
               

                while (read.Read())
                {
                    tbproductname.Text = read[1].ToString();

                    Image1.ImageUrl = $"iamges/{read[2].ToString()}";
                    tbproductprice.Text = read[4].ToString();  
                    tbquantity.Text = read[5].ToString();
                    tbsale.Text = read[7].ToString();   
                    tbdetails.Text = read[6].ToString();
                    drcategoryname.SelectedValue = read[3].ToString();
                    Session["Imagealt"] = read[2].ToString();
                    tbauthor.Text = read[8].ToString();

                }
                connection.Close();
                SqlConnection conn = new SqlConnection("data source= DESKTOP-PND235Q\\SQLEXPRESS01;database=LIBRARYBOOKS;Integrated security=SSPI");

                SqlCommand command = new SqlCommand("select  category_id,category_name from category", conn);
                conn.Open();
                SqlDataAdapter adapt = new SqlDataAdapter(command);
                DataTable dt = new DataTable();

                adapt.Fill(dt);

                drcategoryname.DataSource = dt;
                drcategoryname.DataTextField = "category_name";
                drcategoryname.DataValueField = "category_id";
                drcategoryname.DataBind();  

                SqlDataReader rd = command.ExecuteReader();
            }
        }

        protected void btnupload_Click(object sender, EventArgs e)
        {
            if (FileUpload1.HasFile)
            {
                int id = Convert.ToInt32(Request.QueryString["id"]);
                SqlConnection connection = new SqlConnection("data source= DESKTOP-PND235Q\\SQLEXPRESS01;database=LIBRARYBOOKS;Integrated security=SSPI");
                connection.Open();

                string folderpath = Server.MapPath("~/iamges/");
                if (!Directory.Exists(folderpath))
                {
                    Directory.CreateDirectory(folderpath);
                }
                FileUpload1.SaveAs(folderpath + FileUpload1.FileName);
                Image1.ImageUrl = "iamges/" + FileUpload1.FileName;
                image1 = FileUpload1.FileName;
                connection.Close();
            }
            else {
                image1 = Session["Imagealt"];
            }

        }

        protected void addedit_Click(object sender, EventArgs e)
        {
            int id = Convert.ToInt32(Request.QueryString["id"]);
            SqlConnection connection = new SqlConnection("data source= DESKTOP-PND235Q\\SQLEXPRESS01;database=LIBRARYBOOKS;Integrated security=SSPI");
            connection.Open();
            string query = $"update product set product_name='{tbproductname.Text}',prodct_price='{tbproductprice.Text}',quantity='{tbquantity.Text}',detalis='{tbdetails.Text}',sale='{tbsale.Text}'," +
                $"category_id='{drcategoryname.SelectedValue}',product_PICTURE='{image1}',author='{tbauthor.Text}' where product_id={id}";

            SqlCommand command = new SqlCommand(query, connection); ;

            command.ExecuteNonQuery();
            connection.Close();
            Response.Redirect("Product.aspx");
        }
    }
}