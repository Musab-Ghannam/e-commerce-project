<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="uservieworders.aspx.cs" Inherits="PROJ5.uservieworders" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
       <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
     <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.2/css/all.min.css" rel="stylesheet" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="userprofile.css"/>
    
    <link rel="stylesheet" href="../CSS/userprofile.css"/>
    <title>View My Orders</title>
      <style>
        .btns {
            display:flex;
            flex-direction:row;
            justify-content:space-evenly
        }
        #btnsforpass{
            display:flex;
            flex-direction:row;
            justify-content:center;

        }
           .social{
            display:flex;
            flex-direction:row-reverse;
            justify-content:space-evenly;
           flex-wrap:wrap;
            align-content:center;
            align-self:center;
            align-items:center;
            padding-bottom:0.3rem;
        }
        .inst{
            display:flex;
            flex-direction:row;
            font-size:1rem;
            text-align:center;
            justify-content:center;
        }
        .inst a{
            display:block;
            font-size:1rem;
            margin-right:1rem;

        }
        .aboutinfooter{
            display:flex;
            flex-direction:column;
            color:white;
            
        }
        .aboutinfooter a{
            margin-bottom:0.5rem;
              display:block;
            font-size:1rem;
            margin-right:1rem;
            text-decoration:none;
            color:white;
            text-align:center;
            
        }
        .btn-secondary{
            font-size:1.25rem !important;
        }
        .savebtn{
           display:flex;
           justify-content:center;
           margin-bottom:0.75rem;
        }
       @media only screen and (max-device-width: 1000px)
        {  
           .rounded{
               background-image:none !important;
           }
        }
       .w3-bar-item img{
           width:60px;
       }
       #footer1{
           
           position: sticky; 
           bottom: 0; 
       }
       .containermain{
           width:85%;
           margin-left:auto;
           margin-right:auto;
           height:100vh;
           padding-top:10%;
           
       }
       .w3-bar,#footer1{
           padding:1rem 2rem;
           
       }
    </style>
</head>
<body>
       
<div class="">
  <div class="w3-bar w3-light-grey w3-large">
    <a href="#" class="w3-bar-item w3-button w3-hover-red w3-padding-16"><img src="Logo.png" width="50"></a>
    <a href="#" class="w3-bar-item w3-button w3-hover-red w3-padding-16">PLOTBOUND</a>
    <input type="text"  id="searches" runat="server" class="w3-bar-item w3-input w3-hide-small w3-padding-16 w3-hide-medium" placeholder="Search..">
    <button type="button" runat="server" onserverclick="Submit_Click" class=" w3-bar-item w3-button w3-red w3-hide-small w3-padding-16 w3-hide-medium">search</button>
    <a href="http://localhost:56508/About.aspx" class="w3-bar-item w3-button w3-hover-red w3-hide-small w3-padding-16 w3-hide-medium">About</a>
    <a href="http://localhost:56508/contact.aspx" class="w3-bar-item w3-button w3-hover-red w3-hide-small w3-padding-16 w3-hide-medium">Contact</a>
    <a href="http://localhost:56508/allcategories.aspx" class="w3-bar-item w3-button w3-hover-red w3-hide-small w3-padding-16 w3-hide-medium">Categories</a>
 <a href="http://localhost:56508/login.aspx" class="w3-bar-item w3-button w3-hover-red w3-hide-small w3-padding-16 w3-hide-medium w3-right" onserverclick="Logout">Logout</span></a>
      <asp:LinkButton class="nav-link w3-bar-item w3-button w3-hover-red w3-hide-small w3-padding-16 w3-hide-medium w3-right" ID="LinkButton1" OnClick="Logout" runat="server" Visible="false"> Log out </asp:LinkButton>
    <a href="#" class="w3-bar-item w3-button w3-hover-red w3-hide-small w3-padding-16 w3-hide-medium w3-right"><i class="w3-xlarge fa fas fa-shopping-cart" id="login"></i> Cart</a>
    <a href="javascript:void(0)" class="w3-bar-item w3-button w3-right w3-hide-large w3-padding-16" onclick="myFunction()">&#9776;</a>
  </div>
  <div id="demo" class="w3-bar-block w3-light-grey w3-hide w3-hide-large ">
    <a href="#" class="w3-bar-item w3-hover-red w3-button">About</a>
    <a href="#" class="w3-bar-item w3-hover-red w3-button">Contact</a>
    <a href="http://localhost:56508/allcategories.aspx" class="w3-bar-item w3-hover-red w3-button">Categories</a>
    <a href="http://localhost:56508/allcategories.aspx" class="w3-bar-item w3-hover-red w3-button">Categories</a>
    <a href="http://localhost:56508/login.aspx" class="w3-bar-item w3-hover-red w3-button">Log In</a>
    <a href="#" class="w3-bar-item w3-hover-red w3-button">Cart</a>
     
  </div>
</div>

    <form id="form1" runat="server">
        <div class="containermain">
            <div class="view_my_orders">
                <h3>My Orders</h3>
                <asp:Label ID="orders" runat="server" ></asp:Label>
            </div>
        </div>
      
    </form>
               <div id="footer1" style="background-color: #808080 ;">

            <div class="social">
                
             <div class="copyright">
                       <p id="rights" style=" color: white">© 2020 Copyright:All Rights Reserved</p>
               
                <div class="inst">
                    <a class="icons" href="https://web.facebook.com/musab.alghannam.37/" target="_blank" style="text-decoration: none; color: white;"><i  class="fab fa-facebook-f fa-2x"></i></a>
                    <a class="icons" href="https://www.linkedin.com/in/musab-ghannam-0a8284253/" target="_blank" style="text-decoration: none; color: white;"><i class="fab fa-linkedin-in fa-2x"></i></a>
                    <a class="icons" href="https://www.instagram.com/musab_ghannam/" target="_blank" style="text-decoration: none; color: white;"><i class="fab fa-instagram fa-2x" aria-hidden="true"></i></a>
                </div>
            </div>
             <div class="aboutinfooter">
                <h3>ABOUT</h3>
                <a href="http://localhost:56508/About.aspx">ABOUT US</a>
                <a href="http://localhost:56508/contact.aspx">BOOKS</a>
                 
            </div>
                <div claa="contact" style="display:flex;flex-direction:column">
                    <p style="color: white;font-size:16px"><i class="fa fa-phone" aria-hidden="true">+96278095488</i></p>
                    <p  style="color: white;font-size:16px;"><i class="fa fa-map-marker"  aria-hidden="true"></i>Ammman-Jordan:7th Circle near Jet- opposite to Arab BanK</p>
                </div>
               
            
            </div>
            

        </div>
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
