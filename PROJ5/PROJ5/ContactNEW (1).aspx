<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ContactNEW.aspx.cs" Inherits="WebApplication2.WebForm1" %>

<!DOCTYPE html>
<html>
<title>Contact Us</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin=""/>
<link href="https://fonts.googleapis.com/css2?family=Lato:ital,wght@0,400;0,700;1,400&display=swap" rel="stylesheet">
<link rel="stylesheet" href="AboutContact.css">
<body runat="server">
<div class="">
  <div class="w3-bar w3-light-grey w3-large">
    <a href="#" class="w3-bar-item w3-button w3-hover-red w3-padding-16"><img src="Logo.png" id="Lg"></a>
    <a href="#" class="w3-bar-item w3-button w3-hover-red w3-padding-16">PLOTBOUND</a>
    <input type="text" class="w3-bar-item w3-input w3-hide-small w3-padding-16 w3-hide-medium" placeholder="Search..">
    <a href="#" class="w3-bar-item w3-button w3-red w3-hide-small w3-padding-16 w3-hide-medium">Go</a>
    <a href="About.aspx" class="w3-bar-item w3-button w3-hover-red w3-hide-small w3-padding-16 w3-hide-medium">About</a>
    <a href="ContactNEW.aspx" class="w3-bar-item w3-button w3-hover-red w3-hide-small w3-padding-16 w3-hide-medium">Contact</a>
    <a href="#" class="w3-bar-item w3-button w3-hover-red w3-hide-small w3-padding-16 w3-hide-medium">Categories</a>
    <a href="#" class="w3-bar-item w3-button w3-hover-red w3-hide-small w3-padding-16 w3-hide-medium w3-right"><i class="w3-xlarge fa fa-user" id="login"></i> Log In</a>
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
<div class="PP">
 <div class="w3-container w3-card-4 w3-light-grey w3-text-pink" style="width: 100%; height: 200px;">
  <p class="w3-center w3-xxlarge" >Connect with us!</p>
  <p class="w3-center w3-large">For all inquires, Reach out to us using the form below!</p>
 </div>
</div>
<div class="PP">

<form class="w3-container w3-card-4 w3-light-grey w3-text-pink w3-margin" runat="server" style="width: 80%;">
<h2 class="w3-center">Contact Us</h2>
 
<div class="w3-row w3-section">
  <div class="w3-col" style="width:50px"><i class="w3-xxlarge fa fa-user"></i></div>
    <div class="w3-rest">
      <asp:TextBox class="w3-input w3-border" name="first" type="text" placeholder="Full Name" id="fullname" runat="server" required=""></asp:TextBox>
    </div>
</div>

<div class="w3-row w3-section">
  <div class="w3-col" style="width:50px"><i class="w3-xxlarge fa fa-pencil"></i></div>
    <div class="w3-rest">
      <asp:TextBox class="w3-input w3-border" name="last" type="text" placeholder="Subject" id="subject" runat="server" required=""></asp:TextBox>
    </div>
</div>

<div class="w3-row w3-section">
  <div class="w3-col" style="width:50px"><i class="w3-xxlarge fa fa-envelope-o"></i></div>
    <div class="w3-rest">
      <asp:TextBox class="w3-input w3-border" name="email" type="text" placeholder="Email" id="email" runat="server" required=""></asp:TextBox>
    </div>
</div>

<div class="w3-row w3-section">
  <div class="w3-col" style="width:50px"><i class="w3-xxlarge fa fa-phone"></i></div>
    <div class="w3-rest">
      <asp:TextBox class="w3-input w3-border" name="phone" type="number" placeholder="Phone" id="phone" runat="server" required=""></asp:TextBox>
    </div>
</div>

<div class="w3-row w3-section">
  <div class="w3-col" style="width:50px"><i class="w3-xxlarge fa fa-pencil"></i></div>
    <div class="w3-rest">
      <asp:TextBox class="w3-input w3-border" name="message" type="text" placeholder="Message" id="msg" required="" runat="server" style="height: 250px;"></asp:TextBox>
    </div>
</div>

<p class="w3-center">
<asp:button class="w3-button w3-section w3-red w3-ripple w3-padding-16 w3-hover-pink" style="width: 30%; border-radius: 10px;"  onclick="SendBtn_Click" runat="server"  id="SendBtn" Text="Send">  </asp:button>
</p>
</form>
</div>

<footer class="w3-container w3-padding-16 w3-light-grey w3-card-4 w3-center">
  <div class="w3-xlarge w3-half">
    <i class="fa fa-facebook-official w3-hover-opacity"></i>
    <i class="fa fa-instagram w3-hover-opacity"></i>
    <i class="fa fa-snapchat w3-hover-opacity"></i>
    <i class="fa fa-pinterest-p w3-hover-opacity"></i>
    <i class="fa fa-twitter w3-hover-opacity"></i>
    <i class="fa fa-linkedin w3-hover-opacity"></i>
  </div>
  <div class="w3-large w3-half">
    © Plotbound JO, Inc. All Rights Reserved
  </div>
</footer>

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

