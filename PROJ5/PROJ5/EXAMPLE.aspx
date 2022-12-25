<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EXAMPLE.aspx.cs" Inherits="PROJ5.EXAMPLE" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
      <meta charset="UTF-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <link rel="preconnect" href="https://fonts.googleapis.com"/>
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin=""/>
<link href="https://fonts.googleapis.com/css2?family=Lato&family=Nunito:ital,wght@0,500;1,500&display=swap" rel="stylesheet"/>
<link href="https://fonts.googleapis.com/css2?family=Lato:ital,wght@0,400;0,700;1,400&display=swap" rel="stylesheet"/>
  
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous" />
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="new.css" />
    <script src="https://kit.fontawesome.com/a8b56cb52b.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css" >
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" > 
    <title></title>
    <style>
/*
        NavBar Css
nav {
    height: 9%;
    border: solid black 1px;
    position: sticky;
    background-color: #D3D3D3;
    display: flex;
    justify-content: space-between;
    font-family: 'Lato', sans-serif;
    border: none;
    box-shadow: 2px 2px 2px 2px gray;
}

#NavLogo {
    width: 40%;
    height: 100%;
    display: flex;
    justify-content: flex-start;
    gap: 30px;
    align-items: center;
    margin-left: 40px
}

    #NavLogo span {
        font-size: 20px;
        font-weight: bold;
    }
    Logo Image
    #NavLogo img {
        height: 50px;
        width: 100px;
    }
Nav Text
#NavText {
    display: flex;
    justify-content: center;
    gap: 80px;
    align-items: center;
    width: 60%;
    height: 100%;
}

    #NavText button {
        height: 80%;
        width: 15%;
        font-size: 18px;
        color: black;
        font-weight: bold;
        background-color: inherit;
        border: none;
    }

        #NavText button:hover {
            animation-name: bgcolorchange;
            animation-duration: 2s;
            animation-iteration-count: infinite;
            border-radius: 20px;
        }

i {
    font-size: 20px;
}

@keyframes bgcolorchange {
    50% {
        background-color: aliceblue
    }

    100% {
        background-color: #D3D3D3
    }
}

@media only screen and (min-device-width:300px) and (max-device-width:680px) {
    #NavLogo {
        justify-content: center;
    }

        #NavLogo span {
            display: none;
        }

    #NavText {
        width: 100%
    }

        #NavText button {
            font-size: 25px;
        }

    i {
        font-size: 28px;
    }
}*/

        #Label1 {
            display: flex;
            flex-wrap: wrap;
            justify-content: space-around;
            text-align: center;
            align-items: center;
          
       
        }

        .carding {
            display: flex;
            flex-wrap: wrap;
            justify-content: space-around;
        }

        /*    #Label2{
            font-size:30px;
            font-weight:bold;
            text-align:center;
            align-items:center;
            margin-bottom:30px;
            display:flex;
            justify-content:center;
        }*/
        .title {
            font-size: 30px;
            font-weight: bold;
            text-align: center;
            align-items: center;
            margin-bottom: 30px;
            display: flex;
            justify-content: center;
        }

        .book {
            align-items: center;
            margin-top: 30px;
        }
        /*        #Slide {
    font-weight: bold;
    color: black;
    align-items:center;
    text-align:center;
    background-image: url("COVER-1.jpg");
    background-size: cover;
    height: 60vh;
}*/


        .slide {
            position: relative;
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

        .fa-chevron-right {
            position: absolute;
            right: 9px;
            top: 50%;
            z-index: 2;
        }

        .fa-chevron-left {
            position: absolute;
            left: 9px;
            top: 50%;
        }

        #Button3 {
            align-items: center;
            display: flex;
            justify-content: center;
            border-radius: 5px;
            border: none;
            text-transform: uppercase;
            width: 50px;
        }
        /*.more{
     align-items:center;
    display:flex;
    justify-content:center;
}*/
        .seemore {
            text-align: center;
            border: 1px solid black;
            text-align: center;
            align-items: center;
            height: 480px;
            display: flex;
            justify-content: center;
            padding: 30px;
            position: relative;
        }

            .seemore a {
                text-decoration: none;
                color: black;
                text-transform: uppercase;
            }

            .seemore::before {
                content: "";
                position: absolute;
                left: 0;
                top: 0;
                height: 100%;
                width: 100%;
                background-color: #EEECED;
                opacity: .5;
                z-index: -1;
                display: flex;
                flex-wrap: wrap;
            }

            .seemore a:hover {
                font-weight: bold;
            }
         
        .all {
            font-size: 30px;
        }

        .PRICE {
            font-weight: bold;
            color: gray;
            text-decoration-line: line-through;
        }

        .PRICE1 {
            font-weight: bold;
            color: gray;
        }

        }
       /* .bigg{
            width:100vw;
            height:100px;
            background-color:black !important;
           
            color:darkseagreen;
            display:flex;
            justify-content:center;
            align-items:center;
        }
        .smallg{
             width:95%;
                     

            height:75px;
            display:flex;
            justify-content:center;
            align-items:center;
        }
        .leftg{
            float:left;
            
        }
         .rightg{
            float:right;
            
        }*/

       #Button1{
           display:flex;
           justify-content:center;
           align-items:center;
           text-align:center;
           
       

       }
       .but{
              display:flex;
           justify-content:center;
           align-items:center;
           text-align:center;
          padding:7px 15px 5px 15px;
          border-radius:3px;
          border:none;
          

       }

       .pict{
           margin-top:30px;
       }
/**/
.info a{
    text-decoration:none;
    color :black;
}
 .noth{
           margin:0px 12px 0px 12px;
           font-weight:bold;
           font-size:22px;
           color:black;
       }
       .noth2{
          margin-left:5px;
           font-weight:bold;
           font-size:25px;
           color:crimson;
       }
       .hide2{
           display:none;
           font-size:1px;
       }
        .noth3{
          margin-right:35px;
           font-weight:bold;
           font-size:22px;
           color:crimson;
           text-align:center;
       }
        #logo{
            padding-left:3%;
            margin:12px;
        }
        .araba{
            margin :12px !important;
        }
        #sign{
            margin :12px !important;
        }
        
         #log{
            margin :12px !important;
        }
         .midd{
             margin-top:12px;
             margin-bottom:12px;
         }
        .more {
            margin-top: 17px;
        }
       

      
    </style>
</head>

<body onload=" myTimer();tim()">
   
    <form id="form1" runat="server">
<%--          <nav>
        <div id="NavLogo">
       
           <img src="pic\My_project-1-removebg-preview.png"/>
        
           <span>P L O T B O U N D</span>
        </div>
        <div id="NavText">
            <button onclick="location.href='About.aspx'">About</button>
            <button onclick="location.href='Contact.aspx'">Contact</button>
            <button onclick="location.href='login.aspx'">Log In</button>
            <button><i class="fa-solid fa-cart-shopping"></i></button>
        </div>
     </nav>--%>
        <%--origin--%>
<%--         <div class="NAVBAR">
        <div class="data">
<img src="Logo.png" id="logo"/>
             <p class="noth ">plot bound </p>

  

                     </div>

          <div class="burger">
<i class="fa-solid fa-bars"></i>

            </div>
       
       <div class="info">


          
  <a href="http://localhost:56508/cart.aspx">  <i class="fa-sharp fa-solid fa-cart-shopping araba"></i></a>
 </div>
     
</div>--%>
        
            <%--/origin--%>
        <div class="">
  <div class="w3-bar w3-light-grey w3-large">
    <a href="#" class="w3-bar-item w3-button w3-hover-red w3-padding-16"><img src="Logo.png" width="50"></a>
    <a href="#" class="w3-bar-item w3-button w3-hover-red w3-padding-16">PLOTBOUND</a>
    <input type="text"  id="searches" runat="server" class="w3-bar-item w3-input w3-hide-small w3-padding-16 w3-hide-medium" placeholder="Search..">
   
             <%-- <div class="input-group">
                  </div>--%>
  <%--<input type="search" id="searches" runat="server" class="form-control rounded" placeholder="Search" aria-label="Search" aria-describedby="search-addon" />--%>
  

       <%--<asp:Label CssClass="h6 midd  noth2 "  ID="Label7" runat="server" Text="Welcome "></asp:Label> <asp:Label CssClass="h6 midd noth"  ID="Label8" runat="server" Text="Label"></asp:Label> <asp:Label CssClass="h6 midd noth3"  ID="Label9" runat="server" Text="Label"></asp:Label>
           <asp:HyperLink ID="prof" CssClass="midd more" NavigateUrl="http://localhost:56508/User%20Profile.aspx"  runat="server">profile</asp:HyperLink>
           <asp:Button ID="Button2" style="height:2rem;  margin-top:0.8rem;margin-left:0.5rem;padding:0;" runat="server" Text="Log Out" CssClass="btn btn-outline-secondary" OnClick="Button2_Click1" />
                         <asp:HyperLink NavigateUrl="http://localhost:56508/signup.aspx"  ID="sign" runat="server"></asp:HyperLink>
                                   <asp:HyperLink NavigateUrl="http://localhost:56508/login.aspx"   ID="log" runat="server"></asp:HyperLink>--%>
   <%-- <a href="#" class="w3-bar-item w3-button w3-red w3-hide-small w3-padding-16 w3-hide-medium">Go</a>--%>
         <button type="button" runat="server" onserverclick="Submit_Click" class=" w3-bar-item w3-button w3-red w3-hide-small w3-padding-16 w3-hide-medium">search</button>
    <a href="http://localhost:56508/About.aspx" class="w3-bar-item w3-button w3-hover-red w3-hide-small w3-padding-16 w3-hide-medium">About</a>
    <a href="http://localhost:56508/contact.aspx" class="w3-bar-item w3-button w3-hover-red w3-hide-small w3-padding-16 w3-hide-medium">Contact</a>
    <a href="http://localhost:56508/allcategories.aspx" class="w3-bar-item w3-button w3-hover-red w3-hide-small w3-padding-16 w3-hide-medium">Categories</a>
    <a href="http://localhost:56508/login.aspx" class="w3-bar-item w3-button w3-hover-red w3-hide-small w3-padding-16 w3-hide-medium w3-right" runat="server" ID="LOGIN" ><i class="w3-xlarge fa fa-user" id="login"></i> Log In</a>
         <a href="http://localhost:56508/User%20Profile.aspx" class="w3-bar-item w3-button w3-hover-red w3-hide-small w3-padding-16 w3-hide-medium w3-right" runat="server" ID="pro" visible="false" ><i class="w3-xlarge fa fa-user" id="login" ></i> profile</a>

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
                  <%-- <nav>

    <div class="NAVBAR">
        <div class="data">
<img src="Logo.png" id="logo"/>
          

          <p class="plot">plot bound </p>
                     </div>

          <div class="burger">
<i class="fa-solid fa-bars"></i>

            </div>
       
       <div class="info">
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
      
        <div>



            <div class="Slide class1" id="Slide">
                <div class="left">
                    <i class="fa-solid fa-chevron-right" id="rightt"></i>
                </div>
                <div style="color: white">
                    <p class="KNOWLEDGE" id="KNOWLEDGE">EXPLORE THE WORLDS KNOWLEDGE</p>
                    <p class="loyal" style="display: none">There is no friend as loyal as a book.</p>
                    <p class="reader" style="display: none">A reader lives a thousand lives before he dies.</p>


                </div>
                <div class="right">
                    <i class="fa-solid fa-chevron-left" id="leftt"></i>
                </div>
            </div>
            <%--  <asp:Label runat="server" Text=""></asp:Label>--%>

            <br />
            <asp:Label Class="title" ID="Label2" runat="server" Text="categories"></asp:Label>
            <div class="cardnew">

                <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
                <div class="but">
                 <asp:Button ID="Button1" runat="server" Text="view All categories"  Class="but" OnClick="Button1_Click1"/>
                    </div>
                <%--              <div class="seemore">
        <p>see more category</p>


    </div>--%>
            </div>
            <%-- <asp:Label ID="Label5" runat="server" Text="Label"></asp:Label>--%>

            <br />

            <%--  <div class="more">
               <asp:Button ID="Button3" runat="server" Text="see more" Width="88px" />
         </div>--%>
            <br />
            <asp:Label ID="Label3" Class="title" runat="server" Text="discounted products"></asp:Label>
            <asp:Label Class="carding" ID="Label4" runat="server" Text=""></asp:Label>

            <asp:Label ID="Label5" Class="title" runat="server" Text="Most selling"></asp:Label>
            <asp:Label Class="carding" ID="Label6" runat="server" Text=""></asp:Label>

        </div>

        <%--<asp:FileUpload ID="FileUpload1" runat="server" />
            <asp:Button ID="Button1" runat="server" Text="UPLOAD" OnClick="Button1_Click" />
            <br />
     
          
            <br />
             <asp:Button ID="Button2" runat="server" Text="INSERT" OnClick="Button2_Click" />--%>


    <footer id="footer1" style="background-color: #808080 ;margin-top:50px">

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
                
                   <a href="http://localhost:56508/User%20Profile.aspx">MY Profile</a>
                <a href="http://localhost:56508/About.aspx">ABOUT US</a>
                <a href="http://localhost:56508/allcategories.aspx">ALL CATEGORIES</a>
                 
            </div>
                <div claa="contact" style="display:flex;flex-direction:column">
                    <p style="color: white;font-size:16px"><i class="fa fa-phone" aria-hidden="true">+96278095488</i></p>
                    <p  style="color: white;font-size:16px;"><i class="fa fa-map-marker"  aria-hidden="true"></i>Ammman-Jordan:7th Circle near Jet- opposite to Arab BanK</p>
                </div>
               
            
            </div>
            

        </footer>

    </form>


    <script src="example.js"></script>
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
