using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace project5
{
    public partial class WebForm2 : System.Web.UI.Page
    {

        SqlConnection connection = new SqlConnection("data source= DESKTOP-PND235Q\\SQLEXPRESS01;database=LIBRARYBOOKS;Integrated security=SSPI");



        protected void Remover(object sender, EventArgs e)
        {

            Button nn = (Button)sender;


            string[] rowin = nn.ID.Split('-');

        

        

            connection.Close();
            connection.Open();
            SqlCommand sqcom = new SqlCommand($"delete from cart where cart_id = {Convert.ToInt32(rowin[1])}", connection);
 
            sqcom.ExecuteNonQuery();

            connection.Close();
            cartTable.Attributes.Add("style", "display:block;");
            cartTable.Attributes.Add("onmouseover", "styleRemove();");
            Response.Redirect("cartShraideh.aspx");
        }

 
 
        protected void Page_Load(object sender, EventArgs e)
        {

            int id = Convert.ToInt32(Session["productId"].ToString());
            int userID = 3;//Convert.ToInt32(Session["ID"].ToString());
            connection.Close();
            connection.Open();

            SqlCommand cm = new SqlCommand($"select user_PICTURE from users where Userid = {userID} " , connection);

            SqlDataReader rdr = cm.ExecuteReader();
            while(rdr.Read())
            {
                imgHolder.InnerHtml = $"  <h5 class=\"mb-0\">Card details</h5>  <img src='images\\{rdr[0]}' class='img-fluid rounded-3' style='width: 45px;' alt='Avatar'>";
            }





            connection.Close();
                connection.Open();
                SqlCommand com1 = new SqlCommand($" select product.product_name , product.product_PICTURE , product.prodct_price , cart.product_quantity ,cart.cart_id from cart join product on product.product_id ={id}; ", connection);
                
                SqlDataReader reader = com1.ExecuteReader();

            double subtotal = 0;
                
                while (reader.Read())
                {

                 

                    HtmlGenericControl div1 = new HtmlGenericControl();
                    div1.Attributes.Add("class", "card mb-3");

                    HtmlGenericControl div2 = new HtmlGenericControl();
                    div2.Attributes.Add("class", "card-body");

                    HtmlGenericControl div3 = new HtmlGenericControl();
                    div3.Attributes.Add("class", "d-flex justify-content-between");

                    HtmlGenericControl div4= new HtmlGenericControl();
                    div4.Attributes.Add("class", "d-flex flex-row align-items-center");

                    HtmlGenericControl div5 = new HtmlGenericControl();
                    div5.InnerHtml = $"<img src='Images/{reader[1]}'  class='img-fluid rounded-3' alt='Shopping item' style='width: 65px;'>";
             
                HtmlGenericControl div6 = new HtmlGenericControl();
                    div6.Attributes.Add("class", "ms-3");
                    div6.InnerHtml = $"  <h5>{reader[0]}</h5>  <p class='small mb-0'>256GB, Navy Blue</p>";

                div4.Controls.Add(div5);
                div4.Controls.Add(div6);
                    div3.Controls.Add(div4);

                    HtmlGenericControl div7 = new HtmlGenericControl();
                    div7.Attributes.Add("class", "d-flex flex-row align-items-center");
                    HtmlGenericControl div8 = new HtmlGenericControl();
                    div8.Attributes.Add("style", "width: 50px");
                    div8.InnerHtml = $"  <h5 class='fw-normal mb-0'>{reader[3]}</h5>";
                    div7.Controls.Add(div8);
                

                    HtmlGenericControl div9 = new HtmlGenericControl();
                    div9.Attributes.Add("style", "width: 80px");
                    div9.InnerHtml = $" <h5 class='mb-0'>{Convert.ToDouble(reader[2]) * Convert.ToDouble(reader[3])}</h5>";
                div7.Controls.Add(div9);
                div3.Controls.Add(div7);
                    

                    Button btn = new Button();
                    btn.Attributes.Add("class", "btn-close");
                    btn.ID = $"btn1-{reader[4]}";
                    btn.Click += new EventHandler(this.Remover);
                    div7.Controls.Add(btn);



                    div2.Controls.Add(div3);
                    div1.Controls.Add(div2);
                    shoppedItems.Controls.Add(div1);
                subtotal += Convert.ToDouble(reader[2]) * Convert.ToDouble(reader[3]);








                HtmlTableRow tableRow = new HtmlTableRow();
                HtmlTableCell tableCell1 = new HtmlTableCell();
                HtmlTableCell tableCell2 = new HtmlTableCell();
                HtmlTableCell tableCell3 = new HtmlTableCell();
                HtmlTableCell tableCell4 = new HtmlTableCell();
                HtmlTableCell tableCell5 = new HtmlTableCell();


                tableRow.ID = $"row11-{reader[4]}";
                Button btn1 = new Button();


                btn1.Attributes.Add("class", "btn-close");
                btn1.ID = $"btn11-{reader[4]}";
                btn1.Click += new EventHandler(this.Remover);



                tableCell5.Controls.Add(btn1);
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

                cartCount.InnerText = cartTable.Rows.Count.ToString();




            }
                if(!IsPostBack)
            {
                subTotal.InnerHtml += $" <p class='mb-2'>{subtotal} Jd</p> ";
            }
           
   



        }

        protected void Button1_Click(object sender, EventArgs e)
        {

        }
    }
}