<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="About.aspx.cs" Inherits="PROJ5.About" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<title>About</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin=""/>
<link href="https://fonts.googleapis.com/css2?family=Lato:ital,wght@0,400;0,700;1,400&display=swap" rel="stylesheet">
<link rel="stylesheet" href="../CSS/AboutContact.css">
<body>
    <div class="">
  <div class="w3-bar w3-light-grey w3-large">
    <a href="#" class="w3-bar-item w3-button w3-hover-red w3-padding-16"><img src="Logo.png" id="Lg" width="60"></a>
    <a href="http://localhost:56508/EXAMPLE.aspx" class="w3-bar-item w3-button w3-hover-red w3-padding-16">PLOTBOUND</a>
    <input type="text" class="w3-bar-item w3-input w3-hide-small w3-padding-16 w3-hide-medium" placeholder="Search..">
    <a href="#" class="w3-bar-item w3-button w3-red w3-hide-small w3-padding-16 w3-hide-medium">Go</a>
    <a href="About.aspx" class="w3-bar-item w3-button w3-hover-red w3-hide-small w3-padding-16 w3-hide-medium">About</a>
    <a href="http://localhost:56508/contact.aspx" class="w3-bar-item w3-button w3-hover-red w3-hide-small w3-padding-16 w3-hide-medium">Contact</a>
    <a href="http://localhost:56508/allcategories.aspx" class="w3-bar-item w3-button w3-hover-red w3-hide-small w3-padding-16 w3-hide-medium">Categories</a>
      <a href="http://localhost:56508/login.aspx" class="w3-bar-item w3-button w3-hover-red w3-hide-small w3-padding-16 w3-hide-medium w3-right"><i class="w3-xlarge fa fa-user" id="login"></i> Log out</a>
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
 <div class="w3-container w3-card-4 w3-light-grey w3-text-pink" style="width: 100%; height: 300px;">
  <p class="w3-center w3-xxlarge">About Us!</p>
  <p class="w3-center w3-large">We are a small team from Irbid, Jordan. We work together to ultimataly create an inclusive reading enviroment for Jordainian Youth.</p>
 </div>
</div>
  <div class="w3-row-padding w3-padding-16 w3-center" style="margin-top:100px;margin-bottom:60px;">
    <div class="w3-third">
      <img src="Images/Croiasant.jpg" alt="Sandwich" style="width:100%;height:240px;">
      <h3>Our Vision</h3>
      <p>To create a more educated and sophisticated Jordan.</p>
    </div>
    <div class="w3-third">
      <img src="Images/View.jpg" alt="Steak" style="width:100%;height:240px;">
      <h3>Our Mission</h3>
      <p>To improve the literacy and education of the Youth.</p>
    </div>
    <div class="w3-third">
      <img src="Images/reading.jpg" alt="Cherries" style="width:100%;height:240px">
      <h3>Our Values</h3>
      <p>At Plotbound, Diversity and diffrence are always put to a higher standard.</p>
    </div>
    <%--<div class="w3-quarter">
      <img src="Images/team.jpg" alt="Pasta and Wine" style="width:100%">
      <h3>Our Team</h3>
      <p>We work together to achieve our goals and grow as people and a team alike.</p>
    </div>--%>
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
