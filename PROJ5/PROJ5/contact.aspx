<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="contact.aspx.cs" Inherits="PROJ5.contact" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="stylesheet" href="About.css" />
<link rel="stylesheet" href="Navbar.css" />
<link rel="preconnect" href="https://fonts.googleapis.com"/>
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin=""/>
<link href="https://fonts.googleapis.com/css2?family=Lato&family=Nunito:ital,wght@0,500;1,500&display=swap" rel="stylesheet"/>
<link href="https://fonts.googleapis.com/css2?family=Lato:ital,wght@0,400;0,700;1,400&display=swap" rel="stylesheet"/>
    <script src="https://kit.fontawesome.com/e8295570d8.js" crossorigin="anonymous"></script>
    <title></title>
</head>
<body>
      <nav>
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
     </nav>
     <div id="FormDiv">
         <h1>Contact Us</h1>
         <form runat="server" id="Form">
            <div class="Roww">
              <asp:Label ID="Label1" runat="server" Text="First Name:"></asp:Label>
              <asp:TextBox class="DetailBoxes" runat="server" ID="Fname"></asp:TextBox>
              <asp:Label ID="Label2" runat="server" Text="Last Name:"></asp:Label>
              <asp:TextBox class="DetailBoxes" runat="server" ID="Lname"></asp:TextBox>
            </div>
            <div class="Roww">
              <asp:Label ID="Label4" runat="server" Text="&nbsp Subject: &nbsp &nbsp"></asp:Label>
              <asp:TextBox class="DetailBoxes" runat="server" id="Subject"></asp:TextBox>
              <asp:Label ID="Label3" runat="server" Text="Phone Number:"></asp:Label>
              <asp:TextBox class="DetailBoxes" runat="server" id="Number"></asp:TextBox>
            </div>
            <div id="Complaint">
                <asp:Label ID="Label5" runat="server" Text="Details:"></asp:Label>
                <asp:TextBox runat="server" ID="bigbox"></asp:TextBox>
            </div>
             <asp:Button ID="Submitbutton" runat="server" Text="Submit!"/>
          </form>
         
     </div>
    <div id="Footer">
        <div id="FooterIcons">
            <i class="fa-brands fa-twitter"></i>
            <i class="fa-brands fa-instagram"></i>
            <i class="fa-brands fa-linkedin"></i>
            <i class="fa-brands fa-tiktok"></i>
        </div>
        <div id="FooterText">
            <p>© 2022 PlotBound. All Rights Reserved</p>
        </div>
    </div>
    <script type="text/javascript">
        
        function showFlag(countryCode) {

            var countryCode = document.getElementById("countryCode");
            const flag = document.getElementById("Flag")
            if (countryCode.length !== 2) {
                console.log('Invalid country code');
                return;
            }
            flag.src = `https://www.countryflags.io/${countryCode}/flat/64.png`;
        }
        function Number_TextChanged(sender, e) {
            if (e.which != 8 && e.which != 0 && (e.which < 48 || e.which > 57)) {
                e.preventDefault();
            }
        }


    </script>
</body>
</html>
