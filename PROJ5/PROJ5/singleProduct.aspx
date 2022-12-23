<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="singleProduct.aspx.cs" Inherits="project5.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
    <head runat="server">
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Shop Item - Start Bootstrap Template</title>
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
        <!-- Bootstrap icons-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="CSS/shraideh.css" rel="stylesheet" />
        <style>
                 #tableContainer table {
    display: none;
    position:absolute;
    right:50px;
    top:50px;
    background-color:white;
    padding:20px;
    border:1px solid black;
}

#tableContainer:hover table {
    display: block;
 
}

        </style>







    </head>

<body>
        <form id="form1" runat="server">
            <nav class="navbar navbar-expand-lg navbar-light bg-light">
            <div class="container px-4 px-lg-5">
                <a class="navbar-brand" href="#!">Welcome</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0 ms-lg-4">
                        <li class="nav-item"><a class="nav-link active" aria-current="page" href="http://localhost:56508/EXAMPLE.aspx">Home</a></li>
                        <li class="nav-item"><a class="nav-link" href="http://localhost:56508/About.aspx">About US</a></li>
                        <li class="nav-item dropdown">
                            <a class="" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false"></a>
                            <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <li><a class="dropdown-item" href="#!">All Products</a></li>
                                <li><hr class="dropdown-divider" /></li>
                                <li><a class="dropdown-item" href="#!">Popular Items</a></li>
                                <li><a class="dropdown-item" href="#!">New Arrivals</a></li>
                            </ul>
                        </li>
                    </ul>
                    <div class="d-flex" id="tableContainer" runat="server">

                                                    <asp:LinkButton ID="LinkButton3" runat="server"  OnClick="Button3_Click"  class="btn btn-outline-dark" type="button">
             <i class="bi-cart-fill me-1"></i>
                            Cart
                            <span class="badge bg-dark text-white ms-1 rounded-pill" id="cartCount" runat="server">0</span></asp:LinkButton>

                             <table id="cartTable" class="table table-stripped table-hover align-middle" runat="server"></table>
                    </div>
                </div>
            </div>
        </nav>

        

       
            <div class="container px-4 px-lg-5 my-5">
                <div class="row gx-4 gx-lg-5 align-items-center">
                    <div class="col-md-6" id="imgContainer" runat="server"></div>
                    <div class="col-md-6">
                        <div class="small mb-1">SKU: BST-498</div>
                        <h1 class="display-5 fw-bolder" id="itemName" runat="server">Shop item template</h1>
                        <div class="fs-5 mb-5">
                            <span class="text-decoration-line-through" id="itemSale" runat="server">$45.00</span>
                            <span id="itemPrice" runat="server">$40.00</span>
                        </div>
                        <p class="lead" id="itemDetails" runat="server">Lorem ipsum dolor sit amet consectetur adipisicing elit. Praesentium at dolorem quidem modi. Nam sequi consequatur obcaecati excepturi alias magni, accusamus eius blanditiis delectus ipsam minima ea iste laborum vero?</p>
                        <div class="d-flex">
                            <%--<input class="form-control text-center me-3" id="inputQuantity" type="num" value="1" style="max-width: 3rem" />--%>
                             <asp:DropDownList ID="DropDownList1" runat="server" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
                                   </asp:DropDownList>
                            <asp:LinkButton ID="Button1" runat="server"  OnClick="Button1_Click"  class="btn btn-outline-dark flex-shrink-0" type="button">
 <i class="bi-cart-fill me-1"></i> Add To Cart</asp:LinkButton>


                        
             
                        </div>
                    </div>
                </div>
            </div>
   




 

  

    
  <%--<div class="container my-5 py-5">
          <div class="row d-flex justify-content-center">
      <div class="col-md-12 col-lg-10">
 
        <div class="card " >
       <div class="card-body p-4">
 

           
         

 
      </div>
    </div>
  </div>--%>
<%--      </div>--%>
      
    <div class="row d-flex justify-content-center">
      <div class="col-md-12 col-lg-10">
       <h4 class="mb-0">Comments</h4>
            <p class="fw-light mb-4 pb-2">Latest Comments section by users</p>
        <div class="card text-dark" id="commentsSection" runat="server">



      </div>
                       <div class="card-body p-4">
      
  
                                               	<div class="row">
                                                       		<div class="col-md-2">
			 
              <asp:Label ID="Label1" runat="server" Text="Add a comment"  ></asp:Label>
		</div>
		<div class="col-md-8">
        
		 
			<asp:TextBox ID="TextBox1" runat="server" CssClass="form-control"></asp:TextBox>
		</div>
 
		<div class="col">
			 
            <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="Send" CssClass="btn btn-primary" />
		</div>
	</div>
           <hr class='my-0' />
      </div>

   

 



 
    <script src="https://kit.fontawesome.com/84df3b83c8.js" crossorigin="anonymous"></script>
    <script>
        function styleRemove() {
            document.getElementById("cartTable").removeAttribute("style")
        }
    </script>

    
        

     
    </form>












    </body>
</html>
