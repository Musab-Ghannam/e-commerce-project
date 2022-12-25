<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="allcategories.aspx.cs" Inherits="PROJ5.allcategories" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
      <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous"/>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
    <title></title>
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css"/ >
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"/>
       <link rel="stylesheet" href="new.css"/>
    <style>

                #Label1 {
/*display:flex;
flex-wrap:wrap;

   justify-content:space-between;
    text-align: center;
    align-items:center;
    
*/

display: grid;

grid-template-columns:repeat(auto-fill,minmax(250px,1fr));
grid-row-gap:50px;
justify-content: center;
    text-align: center;
    align-items:center;
    margin-left:35px;

        }

               #Label2{
                   display:flex;
     flex-wrap:wrap;
                   justify-content:center;
                   text-align:center;
                   align-items:center;
                   font-weight:bold;
                   font-size:50PX;
                margin-bottom:50PX;

               }

               .book{
                   align-items:center;
                   padding-top:20px;
                   
               }

               @media(min-device-width:0px) and (max-device-width:500px){
                /*      #Label1{
                          display: grid;
                          width:290PX;
                          grid-template-columns:auto;
                          margin:0px auto;
                          justify-content:center;
                          align-items:center;
                      

                      }*/
               


               }

               a{
                   text-decoration:none;
                   color:black;

               }
    </style>
</head>
<body>
    <form id="form1" runat="server">
 <%--       <div>



             <nav>

    <div class="NAVBAR">
        <div class="data">
<img src="pic\My_project-1-removebg-preview.png" id="logo"/>--%>
       

       <%--     <p class="plot">plot bound </p>--%>
     <%--       </div>

          <div class="burger">
<i class="fa-solid fa-bars"></i>

            </div>--%>
       
<%--       <div class="info">
              <a href="http://localhost:56508/EXAMPLE.aspx" style="margin-right:30PX">    <p class="log-in">HOME PAGE</p></a>
           <a href="http://localhost:56508/signup.aspx">     <p id="reg">regestration</p></a>
       <a href="http://localhost:56508/login.aspx">    <p class="log-in">log in</p></a>
      
          
  <a href="http://localhost:56508/cart.aspx">  <i class="fa-sharp fa-solid fa-cart-shopping"></i></a>
 </div>
     
</div>
        <div class="box" >
            <div class="inner">
               <p id="reg1">regestration</p>
        <p class="log-in">log in</p>
             <a href="http://localhost:56508/cart.aspx">  <i class="fa-sharp fa-solid fa-cart-shopping"></i></a>
                     

                </div>
      
        </div>
          

     
</nav>--%>
        <div class="">
  <div class="w3-bar w3-light-grey w3-large" style="position:fixed;z-index:2">
    <a href="#" class="w3-bar-item w3-button w3-hover-red w3-padding-16"><img src="Logo.png" width="50"></a>
    <a href="http://localhost:56508/EXAMPLE.aspx" class="w3-bar-item w3-button w3-hover-red w3-padding-16">PLOTBOUND</a>
    <input type="text" class="w3-bar-item w3-input w3-hide-small w3-padding-16 w3-hide-medium" placeholder="Search..">
    <a href="#" class="w3-bar-item w3-button w3-red w3-hide-small w3-padding-16 w3-hide-medium">Go</a>
    <a href="http://localhost:56508/About.aspx" class="w3-bar-item w3-button w3-hover-red w3-hide-small w3-padding-16 w3-hide-medium">About</a>
    <a href="http://localhost:56508/contact.aspx" class="w3-bar-item w3-button w3-hover-red w3-hide-small w3-padding-16 w3-hide-medium">Contact</a>
    <a href="#" class="w3-bar-item w3-button w3-hover-red w3-hide-small w3-padding-16 w3-hide-medium" style="background-color:red;color:white">Categories</a>
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
        <div>


              <asp:Label ID="Label2" runat="server" Text="ALL CATEGORIES"></asp:Label>


            <asp:Label ID="Label1" runat="server" Text=""></asp:Label>




        </div>
    </form>

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
