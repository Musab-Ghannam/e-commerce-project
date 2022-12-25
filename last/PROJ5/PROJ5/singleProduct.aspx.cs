using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Diagnostics;
using System.Linq;
using System.Reflection.Emit;
using System.Runtime.Remoting.Messaging;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace project5
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        
        
        SqlConnection connection = new SqlConnection("data source= DESKTOP-PND235Q\\SQLEXPRESS01;database=LIBRARYBOOKS;Integrated security=SSPI");
 protected void Page_PreRender(object sender, EventArgs e)
        {
           
            int id =Convert.ToInt32( Request.QueryString["product_id"]);
           
            cartCount.InnerText = cartTable.Rows.Count.ToString();
            if (Request.QueryString["val"] != null)
            {
                DropDownList1.Items.FindByValue(Request.QueryString["val"]).Selected= true;
            }
            connection.Close();
            connection.Open();
            SqlCommand cm = new SqlCommand($"  select First_name , user_PICTURE, product_id ,comment , comment_date from comment \r\n inner join users on comment.customer_id = users.Userid where product_id={id};" ,connection);
            SqlDataReader rea = cm.ExecuteReader();
            while (rea.Read())
            {
                commentsSection.InnerHtml += $"   <div class='card-body p-4'>   " +
                    $"    <div class='d-flex flex-start'> " +
                    $"       <img class='rounded-circle shadow-1-strong me-3'   " +
                    $"        src='images\\{rea[1]}' alt='avatar' width='60'  height='60'>   " +
                    $"      <div>  " +
                    $"     <h6 class='fw-bold mb-1'>{rea[0]}</h6>  " +
                    $"    <div class='d-flex align-items-center mb-3'> " +
                    $"     <p class='mb-0'>{rea[4]} </p> " +
                    $" </div>  " +
                    $" <p class='mb-0'>{rea[3]} </p> " +
                    $"  </div> " +
                    $"</div>" +
                    $" </div> " +
                    $" <hr class='my-0' />";


            }


            connection.Close();
        }
        protected void Page_Load(object sender, EventArgs e)
        {

            int id = Convert.ToInt32(Request.QueryString["product_id"]);
            Session["productID"] = id;
            int userid = 1; // Convert.ToInt32(Session["ID"].ToString());
            if (!IsPostBack)
            {
        
                connection.Open();
               
                SqlCommand print = new SqlCommand($"select product.product_name , product.product_PICTURE ,  product.prodct_price , product.quantity , product.detalis from product where product_id = {id} ", connection);
                SqlDataReader read = print.ExecuteReader();

             
                while (read.Read())
                {
                    string im = $"<img class='card-img-top mb-5 mb-md-0' src='Images/{read[1]}'  style='width: 300px; alt='...' />";
                   imgContainer.InnerHtml= im ;
                    itemName.InnerText = $"{read[0]}" ;
                    itemPrice.InnerText = $"{read[2]} JD";
                    itemDetails.InnerText = $"{read[4]}";
                  
                    Session["quantity"] = read[3];
                    Session["price"] = read[2];
                    Session["img"] = read[1];
                    Session["name"] = read[0];
                }
      
                connection.Close();
                int quantity = Convert.ToInt32(Session["quantity"].ToString());
                if (quantity > 5)
                {
                    for (int i = 1; i < 6; i++)
                    {
                        ListItem item = new ListItem();

                        item.Text = $"{i}pc";
                        item.Value = i.ToString();
                        DropDownList1.Items.Add(item);
                    }

                }
                else
                {
                    for (int i = 1; i <= quantity; i++)
                    {
                        ListItem item = new ListItem();

                        item.Text = $"{i}pc";
                        item.Value = i.ToString();
                        DropDownList1.Items.Add(item);

                    }
                }

            }

            connection.Open();

             
            SqlCommand com1 = new SqlCommand($"select product.product_name ,  product.product_PICTURE , product.prodct_price , cart.product_quantity ,cart.cart_id  from cart inner join product on product.product_id = cart.product_id where Userid = {userid}", connection);
            SqlDataReader reader = com1.ExecuteReader();

            while (reader.Read())
            {
                HtmlTableRow tableRow = new HtmlTableRow();
                HtmlTableCell tableCell1 = new HtmlTableCell();
                HtmlTableCell tableCell2 = new HtmlTableCell();
                HtmlTableCell tableCell3 = new HtmlTableCell();
                HtmlTableCell tableCell4 = new HtmlTableCell();
                HtmlTableCell tableCell5 = new HtmlTableCell();
               

                tableRow.ID = $"row1-{reader[4]}";
                Button btn = new Button();

               
                btn.Attributes.Add("class", "btn-close");
                btn.ID = $"btn1-{reader[4]}";
                btn.Click += new EventHandler(this.Remover);



                tableCell5.Controls.Add(btn);
                tableCell1.InnerHtml = $" <img src = 'Images/{reader[1]}' style='width:100px;'>";
                tableCell2.InnerHtml = $"{reader[0]}";
                tableCell3.InnerHtml = $"x{reader[3]}";
                tableCell4.InnerHtml = $"{Convert.ToDouble(reader[2]) * Convert.ToDouble(reader[3])} JD";

                tableRow.Cells.Add(tableCell1);
                tableRow.Cells.Add(tableCell2);
                tableRow.Cells.Add(tableCell3);
                tableRow.Cells.Add(tableCell4);
                tableRow.Cells.Add(tableCell5);
                cartTable.Rows.Add(tableRow);
          

            }
         
        }

        protected void Remover(object sender, EventArgs e)
        {

            Button nn = (Button)sender;
           
          
            string[] rowin = nn.ID.Split('-');
            
            HtmlTableRow tr = (HtmlTableRow)Page.FindControl("row1-"+(string)rowin[1]);
          
                cartTable.Rows.Remove(tr);
      
            connection.Close();
            connection.Open();
            SqlCommand sqcom = new SqlCommand($"delete from cart where cart_id = {Convert.ToInt32(rowin[1])}" , connection);
            SqlCommand scmd = new SqlCommand($"TRUNCATE table cart", connection);
            if (!cartTable.HasControls())
            {
                scmd.ExecuteNonQuery();
            }
           sqcom.ExecuteNonQuery();
   
            connection.Close();
            cartTable.Attributes.Add("style", "display:block;");
            cartTable.Attributes.Add("onmouseover", "styleRemove();");
         
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            int id = Convert.ToInt32(Request.QueryString["product_id"]);
            int userid = 3; // Convert.ToInt32(Session["ID"].ToString());

            int val =Convert.ToInt32( DropDownList1.SelectedValue);
 

            connection.Close();
            connection.Open();
            SqlCommand com = new SqlCommand($"insert into cart Values( {id} , {val} , {userid} )", connection);
            com.ExecuteNonQuery();
            connection.Close();
            Response.Redirect($"singleProduct.aspx?product_id={id}&val={val}");
          

        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
          
            
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
                        int id = Convert.ToInt32(Request.QueryString["product_id"]);
            int userid = 3;//Convert.ToInt32(Session["ID"].ToString());
            connection.Close();
            connection.Open();
            DateTime now = DateTime.Now;

            SqlCommand cm2 = new SqlCommand($" insert into comment values({id} , {userid} , @comment , '{now}')", connection);

            cm2.Parameters.AddWithValue("@comment", TextBox1.Text);
            cm2.ExecuteNonQuery();
            connection.Close();
          
            Response.Redirect($"singleProduct.aspx?product_id={id}");
        }
        protected void Button3_Click(object sender, EventArgs e)
        {
            int userid = 3;

            int id = Convert.ToInt32(Request.QueryString["product_id"]);
            Session["productID"] = id;
            Session["userId"] = userid;
            Response.Redirect($"cartShraideh.aspx");

        }
    }
}