<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="singlecategory.aspx.cs" Inherits="PROJ5.HOME_PAGE" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
       <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous"/>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
    <title></title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <link rel="stylesheet" href="homepage.css"/>
    <script src="https://kit.fontawesome.com/a8b56cb52b.js" crossorigin="anonymous"></script>
  <link rel="preconnect" href="https://fonts.googleapis.com"/><link rel="preconnect" href="https://fonts.gstatic.com" crossorigin/>
    <link href="https://fonts.googleapis.com/css2?family=Lobster&family=Oswald&family=Russo+One&display=swap" rel="stylesheet"/>
           <style>
        #Label1 {
     display: grid;

grid-template-columns:repeat(auto-fill,minmax(250px,1fr));
grid-row-gap:50px;
justify-content: center;
    text-align: center;
    align-items:center;
    margin-left:35px;
        }
              #Label2 {
 text-align:center;
 margin-left:35px;
 font-weight:bold;
 font-size:50px;

        }
    


               .auto-style1 {
                   margin-left:15px;
                               text-align:center;

 font-weight:bold;
 font-size:50px;
               }
               .PRICE{
                   color:gray;
                   font-weight:bold;
               }
               a{
                   text-decoration:none;
                   color:black;

               }
               .book{
                   display:flex;
                   justify-content:center;
                   align-items:center;

               }


    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
<nav>

    <div class="NAVBAR">
        <div class="data">
<img src="pic\My_project-1-removebg-preview.png" id="logo"/>
            <p class="plot">plot bound </p>
            </div>

          <div class="burger">
<i class="fa-solid fa-bars"></i>

            </div>
       
      <div class="info">
              <a href="http://localhost:56508/EXAMPLE.aspx" style="margin-right:30PX">    <p class="log-in">HOME PAGE</p></a>
           <a href="http://localhost:56508/signup.aspx">     <p id="reg">regestration</p></a>
       <a href="http://localhost:56508/login.aspx">    <p class="log-in">log in</p></a>
      
          
  <a href="http://localhost:56508/cart.aspx">  <i class="fa-sharp fa-solid fa-cart-shopping"></i></a>
 </div>
        <div class="box" >
            <div class="inner">
               <p id="reg1">regestration</p>
        <p class="log-in">log in</p>
             <a href="http://localhost:56508/cart.aspx">  <i class="fa-sharp fa-solid fa-cart-shopping"></i></a>
                     

                </div>
      
        </div>

     
</nav>
           
                 

        </div>
         <asp:Label ID="Label2" runat="server" Text=""></asp:Label>
        
          <asp:Label ID="Label3" runat="server" Text="Category" BorderColor="Black" CssClass="auto-style1" Height="36px" Width="129px"></asp:Label>

        <br />

        <br />

    <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
   
    </form>
    <script src="mosab.js"></script>
</body>
</html>
