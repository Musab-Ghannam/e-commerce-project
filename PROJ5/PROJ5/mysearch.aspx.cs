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
                //string search = Request.QueryString["ss"].ToString();
                string search = " ";
                if (!string.IsNullOrEmpty(Session["ssearch"] as string))
                {
                    search = Session["ssearch"].ToString();

                }

                SqlCommand comm = new SqlCommand($"select * from product where product_name like '%' + @search + '%';", CONN);
                comm.Parameters.AddWithValue("@search", search);
                CONN.Open();
                SqlDataReader read = comm.ExecuteReader();
                if (read.Read())
                {
                    while (read.Read())
                    {

                        //     mydiv.InnerHtml += $"<section class='search - result - item'> "
                        //+ $" < a class='image-link' href='#'><img class='image' src='{read[2]}'>'  </a>"
                        //+ $" < div class='search-result-item-body'> <div class='row'> <div class='col-sm-9''>"
                        //  + $"  <h4 class='search-result-item-heading'><a href ='http://localhost:56508/singlecategory.aspx?category_id={read[0]}&category_name={read[1]}' >{read[1]}</a></h4>"
                        //  + $" <p class='description' > {read[6]}</p> </div> " +
                        // " <div class=\"col-sm-3 text-align-center\">  " +
                        //  $"< p class=\"value3 mt-sm\">${Convert.ToString(read[4])}</p> " +
                        //  " < p class=\"fs-mini text-muted\">Only</p>" +
                        //  $"<a class=\"btn btn-primary btn-info btn-sm\" href=\"http://localhost:56508/singlecategory.aspx?category_id={read[0]}&category_name={read[1]}\">Learn More</a> " +
                        // "</div> </div> </div>  </section>\";";




                        mydiv.InnerHtml += $"  <section class=\"search-result-item\">\r\n      " +
                            $"      <a class=\"image-link\" href=\"http://localhost:56508/singleProduct.aspx?product_id={read[0]}\"><img class=\"image\"  src='Images/{read[2]}'   " +
                            $"      </a>           <div class=\"search-result-item-body\">\r\n       " +
                            $"         <div class=\"row\">\r\n          " +
                            $"          <div class=\"col-sm-9\">\r\n         " +
                            $"               <h4 class=\"search-result-item-heading\"><a href=\"http://localhost:56508/singlecategory.aspx?category_id={read[0]}&category_name={read[1]}\">{read[1]}</a></h4>\r\n       " +
                            $"                 <p class=\"info\">{read[8]}</p>\r\n             " +
                            $"           <p class=\"description\">{read[6]}</p>\r\n            " +
                            $"        </div>\r\n                    <div class=\"col-sm-3 text-align-center\">\r\n       " +
                            $"                 <p class=\"value3 mt-sm\">Price: ${Convert.ToString(read[4])}</p>\r\n        " +
                            $"                <p class=\"fs-mini text-muted\">author is : {read[9]}</p> <a class=\"btn btn-primary btn-info btn-sm\" href=\"http://localhost:56508/singleProduct.aspx?product_id={read[0]}\">view product</a>\r\n          " +
                            $"          </div>\r\n                </div>\r\n            </div>\r\n        </section>";

                    }
                }
                else
                {
                    mydiv.InnerHtml = "    <section class=\"search-result-item\"><div class=\"search-result-item-body\" id=\"labeldiv\"><p class=\"Label4\"  >No results</p></div></section>\r\n";
                }




                CONN.Close();
                SqlCommand max = new SqlCommand($"select  max(prodct_price) , min(prodct_price) from product", CONN);



                CONN.Open();

                SqlDataReader min = max.ExecuteReader();

                while (min.Read())
                {
                    TextBox1.Text = min[1].ToString();
                    TextBox2.Text = min[0].ToString();
                }

                CONN.Close();
            }

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            mydiv.InnerHtml = "";
            SqlConnection CONN = new SqlConnection("data source= DESKTOP-PND235Q\\SQLEXPRESS01;database=LIBRARYBOOKS;Integrated security=SSPI");
            SqlCommand max = new SqlCommand($"select  max(prodct_price) , min(prodct_price) from product", CONN);
            string maxprice = "";
            string minprice = "";
            CONN.Open();
            SqlDataReader min = max.ExecuteReader();
            while (min.Read())
            {
                maxprice = min[0].ToString();
                minprice = min[1].ToString();
            }
            CONN.Close();
            string price = " ";
            if (TextBox1.Text != null && TextBox2.Text == null)
            {
                price = $" and prodct_price between {Convert.ToInt32(TextBox1.Text)} and {Convert.ToInt32(maxprice)} ";
            }
            else if (TextBox1.Text == null && TextBox2.Text != null)
            {
                price = $"and prodct_price between {Convert.ToInt32(minprice)} and {Convert.ToInt32(TextBox2.Text)}";
            }
            else if (TextBox1.Text != "" && TextBox2.Text != "")
            {
                price = $"and prodct_price between {Convert.ToInt32(TextBox1.Text)} and {Convert.ToInt32(TextBox2.Text)}";
            }

            string search = " ";
            if (TextBox3.Text == null)
            {
                if (!string.IsNullOrEmpty(Session["ssearch"] as string))
                {
                    search = Session["ssearch"].ToString();

                }
                else
                {
                    Label1.Text = "Please search for somthing";
                }
            }
            else
            {
                search = TextBox3.Text;
            }
            string caregory = " ";
            if (CheckBox1.Checked)
            {
                caregory = $" and category_id = {Convert.ToInt32(cat.SelectedValue)}";
            }
            string author = " ";
            if (CheckBox2.Checked)
            {
                author = $"and author = '{auth.SelectedValue}'";
            }
            string orderprice = " ";
            if (RadioButtonList1.SelectedValue != "no")
            {
                orderprice = $" ORDER BY prodct_price {RadioButtonList1.SelectedValue}";
            }

            //string mycomm = "select * from product where product_name like '%o% ' and prodct_price between 0 and 1000 and category_id = 1  ORDER BY prodct_price DESC\r\n";
            string mycomm = $"select * from product where  product_name like '%' + @search + '%'  {price} {caregory} {author} {orderprice} ;";
            SqlCommand comm = new SqlCommand($"{mycomm}", CONN);
            comm.Parameters.AddWithValue("@search", search);
            CONN.Open();

            SqlDataReader read = comm.ExecuteReader();

            if (read.Read())
            {
                while (read.Read())
                {

                    //     mydiv.InnerHtml += $"<section class='search - result - item'> "
                    //+ $" < a class='image-link' href='#'><img class='image' src='{read[2]}'>'  </a>"
                    //+ $" < div class='search-result-item-body'> <div class='row'> <div class='col-sm-9''>"
                    //  + $"  <h4 class='search-result-item-heading'><a href ='http://localhost:56508/singlecategory.aspx?category_id={read[0]}&category_name={read[1]}' >{read[1]}</a></h4>"
                    //  + $" <p class='description' > {read[6]}</p> </div> " +
                    // " <div class=\"col-sm-3 text-align-center\">  " +
                    //  $"< p class=\"value3 mt-sm\">${Convert.ToString(read[4])}</p> " +
                    //  " < p class=\"fs-mini text-muted\">Only</p>" +
                    //  $"<a class=\"btn btn-primary btn-info btn-sm\" href=\"http://localhost:56508/singlecategory.aspx?category_id={read[0]}&category_name={read[1]}\">Learn More</a> " +
                    // "</div> </div> </div>  </section>\";";




                    mydiv.InnerHtml += $"  <section class=\"search-result-item\">\r\n      " +
                        $"      <a class=\"image-link\" href=\"http://localhost:56508/singleProduct.aspx?product_id={read[0]}\"><img class=\"image\"  src='Images/{read[2]}'   " +
                        $"      </a>           <div class=\"search-result-item-body\">\r\n       " +
                        $"         <div class=\"row\">\r\n          " +
                        $"          <div class=\"col-sm-9\">\r\n         " +
                        $"               <h4 class=\"search-result-item-heading\"><a href=\"http://localhost:56508/singlecategory.aspx?category_id={read[0]}&category_name={read[1]}\">{read[1]}</a></h4>\r\n       " +
                        $"                 <p class=\"info\">{read[8]}</p>\r\n             " +
                        $"           <p class=\"description\">{read[6]}</p>\r\n            " +
                        $"        </div>\r\n                    <div class=\"col-sm-3 text-align-center\">\r\n       " +
                        $"                 <p class=\"value3 mt-sm\">Price: ${Convert.ToString(read[4])}</p>\r\n        " +
                        $"                <p class=\"fs-mini text-muted\">author is : {read[9]}</p> <a class=\"btn btn-primary btn-info btn-sm\" href=\"http://localhost:56508/singleProduct.aspx?product_id={read[0]}\">view product</a>\r\n          " +
                        $"          </div>\r\n                </div>\r\n            </div>\r\n        </section>";

                }
            }
            else
            {
                mydiv.InnerHtml = "  <section class=\"search-result-item\"><div class=\"search-result-item-body\" id=\"labeldiv\"><p  class=\"Label4\"  runat=\"server\"  >No results</p></div></section>\r\n";
            }



            CONN.Close();

        }

        protected void CheckBox1_CheckedChanged(object sender, EventArgs e)
        {

            if (CheckBox1.Checked)
            {
                cat.Enabled = true;
            }
            else
            {
                cat.Enabled = false;
            }
        }

        protected void CheckBox2_CheckedChanged(object sender, EventArgs e)
        {
            if (CheckBox2.Checked)
            {
                auth.Enabled = true;
            }
            else
            {
                auth.Enabled = false;
            }
        }

        protected void TextBox1_TextChanged(object sender, EventArgs e)
        {
            if (System.Text.RegularExpressions.Regex.IsMatch(TextBox1.Text, "[^0-9]"))
            {


                TextBox1.Text = TextBox1.Text.Remove(TextBox1.Text.Length - 1);
                Label2.Text = "only numbers allowed";
            }
        }

        protected void TextBox2_TextChanged(object sender, EventArgs e)
        {
            if (System.Text.RegularExpressions.Regex.IsMatch(TextBox2.Text, "[^0-9]"))
            {
                TextBox2.Text = TextBox2.Text.Remove(TextBox2.Text.Length - 1);
                Label3.Text = "only numbers allowed";

            }

        }


    }
}