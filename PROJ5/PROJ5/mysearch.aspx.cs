using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PROJ5
{
    public partial class mysearch : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                SqlConnection CONN = new SqlConnection("data source= DESKTOP-PND235Q\\SQLEXPRESS01;database=LIBRARYBOOKS;Integrated security=SSPI");
                SqlCommand comm2 = new SqlCommand($"select * from category ", CONN);
                CONN.Open();
                DataTable dt = new DataTable();

                SqlDataAdapter sda = new SqlDataAdapter(comm2);
                sda.Fill(dt);

                cat.DataSource = dt;
                cat.DataValueField = "category_id";
                cat.DataTextField = "category_name";
                cat.DataBind();

                CONN.Close();


                SqlCommand comm3 = new SqlCommand($"select * from product ", CONN);
                CONN.Open();
                DataTable dt1 = new DataTable();

                SqlDataAdapter sda1 = new SqlDataAdapter(comm3);
                sda1.Fill(dt1);
                auth.DataSource = dt1;
                auth.DataValueField = "author";
                auth.DataTextField = "author";
                auth.DataBind();
                CONN.Close();
                string search = Request.QueryString["ss"];
                SqlCommand comm = new SqlCommand($"select * from product where sale=0 and product_name like '%{search}%';", CONN);
                CONN.Open();
                SqlDataReader read = comm.ExecuteReader();
                while (read.Read())
                {

                    //     mydiv.InnerHtml += $"<section class='search - result - item'> "
                    //+ $" < a class='image-link' href='#'><img class='image' src='{read[2]}'>'  </a>"
                    //+ $" < div class='search-result-item-body'> <div class='row'> <div class='col-sm-9''>"
                    //           + $"  <h4 class='search-result-item-heading'><a href ='http://localhost:56508/singlecategory.aspx?category_id={read[0]}&category_name={read[1]}' >{read[1]}</a></h4>"
                    //           + $"  < p class='info'>{read[8]}</p>"
                    //            + $" <p class='description' > {read[6]}</p> </div> " +
                    //            " <div class=\"col-sm-3 text-align-center\">  " +
                    //            $"< p class=\"value3 mt-sm\">${Convert.ToString(read[4])}</p> " +
                    //            " < p class=\"fs-mini text-muted\">Only</p>" +
                    //            $"<a class=\"btn btn-primary btn-info btn-sm\" href=\"http://localhost:56508/singlecategory.aspx?category_id={read[0]}&category_name={read[1]}\">Learn More</a> " +
                    //            "</div> </div> </div>  </section>\";";




                    mydiv.InnerHtml += $"  <section class=\"search-result-item\">\r\n            <a class=\"image-link\" href=\"#\"><img class=\"image\" src='Images/{read[2]}'         </a>           <div class=\"search-result-item-body\">\r\n                <div class=\"row\">\r\n                    <div class=\"col-sm-9\">\r\n                        <h4 class=\"search-result-item-heading\"><a href=\"http://localhost:56508/singlecategory.aspx?category_id={read[0]}&category_name={read[1]}\">{read[1]}</a></h4>\r\n                        <p class=\"info\">{read[8]}</p>\r\n                        <p class=\"description\">{read[6]}</p>\r\n                    </div>\r\n                    <div class=\"col-sm-3 text-align-center\">\r\n                        <p class=\"value3 mt-sm\">${Convert.ToString(read[4])}</p>\r\n                        <p class=\"fs-mini text-muted\">Only</p><a class=\"btn btn-primary btn-info btn-sm\" href=\"http://localhost:56508/singleProduct.aspx?product_id={read[0]}\">view product</a>\r\n                    </div>\r\n                </div>\r\n            </div>\r\n        </section>";

                }





                CONN.Close();
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            mydiv.InnerHtml = "";
            //string search = Request.QueryString["searches"];
            string sort = RadioButtonList1.SelectedValue;
            int cat2 = Convert.ToInt32(cat.SelectedValue);
            string auth2 = auth.SelectedValue;
            int mini = Convert.ToInt32(TextBox1.Text);
            int maxx = Convert.ToInt32(TextBox2.Text);
            string search = TextBox3.Text;
            //string mycomm = $"select * from product where product_name like '%o% ' and prodct_price between 20 and 600 and category_id = 1 and author = 'omar' ORDER BY prodct_price DESC;\r\n";
            string mycomm = $"select * from product where  product_name like '%{search}%' and prodct_price between {mini} and {maxx} and category_id = {cat2} and author = '{auth2}' ORDER BY prodct_price {sort} ;\r\n";

            SqlConnection CONN = new SqlConnection("data source= DESKTOP-PND235Q\\SQLEXPRESS01;database=LIBRARYBOOKS;Integrated security=SSPI");
            SqlCommand comm = new SqlCommand($"{mycomm}", CONN);

            CONN.Open();

            SqlDataReader read = comm.ExecuteReader();

            while (read.Read())
            {



                mydiv.InnerHtml += $"  <section class=\"search-result-item\">\r\n            <a class=\"image-link\" src='Images/{read[2]}' href='Images/{read[2]}'>\r\n            </a>\r\n            <div class=\"search-result-item-body\">\r\n                <div class=\"row\">\r\n                    <div class=\"col-sm-9\">\r\n                        <h4 class=\"search-result-item-heading\"><a href=\"http://localhost:56508/singlecategory.aspx?category_id={read[0]}&category_name={read[1]}\">{read[1]}</a></h4>\r\n                        <p class=\"info\">{read[8]}</p>\r\n                        <p class=\"description\">{read[6]}</p>\r\n                    </div>\r\n                    <div class=\"col-sm-3 text-align-center\">\r\n                        <p class=\"value3 mt-sm\">${Convert.ToString(read[4])}</p>\r\n                        <p class=\"fs-mini text-muted\">Only</p><a class=\"btn btn-primary btn-info btn-sm\" href=\"http://localhost:56508/singlecategory.aspx?category_id={read[0]}&category_name={read[1]}\">view product</a>\r\n                    </div>\r\n                </div>\r\n            </div>\r\n        </section>";

            }





            CONN.Close();

        }
    }
}