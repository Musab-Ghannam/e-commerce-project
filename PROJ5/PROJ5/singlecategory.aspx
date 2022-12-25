<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="singlecategory.aspx.cs" Inherits="PROJ5.HOME_PAGE" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
       <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous"/>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
    <title></title>
     <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css"/ >
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <link rel="stylesheet" href="homepage.css"/>
    <script src="https://kit.fontawesome.com/a8b56cb52b.js" crossorigin="anonymous"></script>
  <link rel="preconnect" href="https://fonts.googleapis.com"/><link rel="preconnect" href="https://fonts.gstatic.com" crossorigin/>
    <link href="https://fonts.googleapis.com/css2?family=Lobster&family=Oswald&family=Russo+One&display=swap" rel="stylesheet"/>
           <style>
        #Label1 {
/*     display: grid;

grid-template-columns:repeat(auto-fill,minmax(250px,1fr));
grid-row-gap:50px;
justify-content: center;
    text-align: center;
    align-items:center;
    margin-left:35px;*/


  display: flex;
            flex-wrap: wrap;
            justify-content: space-around;
            text-align: center;
            align-items: center;
              gap:70px;


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
                   margin-left:30px;
                   margin-top:30px;

               }


    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
<%--<nav>

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
           --%>
                 

                    <div class="">
  <div class="w3-bar w3-light-grey w3-large" style="position:fixed;z-index:2"> 
    <a href="#" class="w3-bar-item w3-button w3-hover-red w3-padding-16"><img src="Logo.png" width="50"></a>
    <a href="http://localhost:56508/EXAMPLE.aspx" class="w3-bar-item w3-button w3-hover-red w3-padding-16">PLOTBOUND</a>
    <input type="text" class="w3-bar-item w3-input w3-hide-small w3-padding-16 w3-hide-medium" placeholder="Search..">
    <a href="#" class="w3-bar-item w3-button w3-red w3-hide-small w3-padding-16 w3-hide-medium">Go</a>
    <a href="http://localhost:56508/About.aspx" class="w3-bar-item w3-button w3-hover-red w3-hide-small w3-padding-16 w3-hide-medium">About</a>
    <a href="http://localhost:56508/contact.aspx" class="w3-bar-item w3-button w3-hover-red w3-hide-small w3-padding-16 w3-hide-medium">Contact</a>
    <a href="#" class="w3-bar-item w3-button w3-hover-red w3-hide-small w3-padding-16 w3-hide-medium">Categories</a>
    <a href="http://localhost:56508/login.aspx" class="w3-bar-item w3-button w3-hover-red w3-hide-small w3-padding-16 w3-hide-medium w3-right"><i class="w3-xlarge fa fa-user" id="login"></i> Log In</a>
    <a href="#" class="w3-bar-item w3-button w3-hover-red w3-hide-small w3-padding-16 w3-hide-medium w3-right"><i class="w3-xlarge fa fas fa-shopping-cart" id="login"></i> Cart</a>
    <a href="javascript:void(0)" class="w3-bar-item w3-button w3-right w3-hide-large w3-padding-16" onclick="myFunction()">&#9776;</a>
  </div>
  <div id="demo" class="w3-bar-block w3-light-grey w3-hide w3-hide-large ">
    <a href="#" class="w3-bar-item w3-hover-red w3-button">About</a>
    <a href="#" class="w3-bar-item w3-hover-red w3-button">Contact</a>
    <a href="#" class="w3-bar-item w3-hover-red w3-button">Categories</a>
    <a href="#" class="w3-bar-item w3-hover-red w3-button">Categories</a>
    <a href="#" class="w3-bar-item w3-hover-red w3-button">Log In</a>
    <a href="#" class="w3-bar-item w3-hover-red w3-button">Cart</a>
  </div>
</div>

        </div>
         <asp:Label ID="Label2" runat="server" Text=""></asp:Label>
        
          <asp:Label ID="Label3" runat="server" Text="" BorderColor="Black" CssClass="auto-style1" Height="36px" Width="129px"></asp:Label>

        <br />

        <br />

    <asp:Label ID="Label1" runat="server" Text="" CssClass="container"></asp:Label>
   
    </form>
    <script src="mosab.js"></script>
    
    <script>
  function myFunction() {
    var x = document.getElementById("demo");
    if (x.className.indexOf("w3-show") == -1) {
      x.className += " w3-show";
    } else { 
      x.className = x.className.replace(" w3-show", "");
    }
  }
    </script>
</body>
</html>
