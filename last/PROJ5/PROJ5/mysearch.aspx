<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="mysearch.aspx.cs" Inherits="PROJ5.mysearch" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
     <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css" >
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" > 
       <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous" />
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
   <style>
       body{margin-top:20px;
background-color: #eee;
}

.search-result-categories>li>a {
    color: #b6b6b6;
    font-weight: 400
}

.search-result-categories>li>a:hover {
    background-color: #ddd;
    color: #555
}

.search-result-categories>li>a>.glyphicon {
    margin-right: 5px
}

.search-result-categories>li>a>.badge {
    float: right
}

.search-results-count {
    margin-top: 10px
}

.search-result-item {
    padding: 20px;
    background-color: #fff;
    border-radius: 4px
}

.search-result-item:after,
.search-result-item:before {
    content: " ";
    display: table
}

.search-result-item:after {
    clear: both
}

.search-result-item .image-link {
    display: block;
    overflow: hidden;
    border-top-left-radius: 4px;
    border-bottom-left-radius: 4px
}

@media (min-width:768px) {
    .search-result-item .image-link {
        display: inline-block;
        margin: -20px 0 -20px -20px;
        float: left;
        width: 200px
    }
}

@media (max-width:767px) {
    .search-result-item .image-link {
        max-height: 200px
    }
}

.search-result-item .image {
    max-width: 100%
}

.search-result-item .info {
    margin-top: 2px;
    font-size: 12px;
    color: #999
}

.search-result-item .description {
    font-size: 13px
}

.search-result-item+.search-result-item {
    margin-top: 20px
}

@media (min-width:768px) {
    .search-result-item-body {
        margin-left: 200px
    }
}

.search-result-item-heading {
    font-weight: 400
}

.search-result-item-heading>a {
    color: #555
}

@media (min-width:768px) {
    .search-result-item-heading {
        margin: 0
    }
}
   </style>
</head>
<body>

    <%--   <div class="">
  <div class="w3-bar w3-light-grey w3-large">
    <a href="#" class="w3-bar-item w3-button w3-hover-red w3-padding-16"><img src="Logo.png" width="50"></a>
    <a href="#" class="w3-bar-item w3-button w3-hover-red w3-padding-16">PLOTBOUND</a>
<%--    <input type="text"  id="searches" runat="server" class="w3-bar-item w3-input w3-hide-small w3-padding-16 w3-hide-medium" placeholder="Search..">--%>
   
             <%-- <div class="input-group">
                  </div>--%>
  <%--<input type="search" id="searches" runat="server" class="form-control rounded" placeholder="Search" aria-label="Search" aria-describedby="search-addon" />--%>
  

      <%-- <asp:Label CssClass="h6 midd  noth2 "  ID="Label7" runat="server" Text="Welcome "></asp:Label> <asp:Label CssClass="h6 midd noth"  ID="Label8" runat="server" Text="Label"></asp:Label> <asp:Label CssClass="h6 midd noth3"  ID="Label9" runat="server" Text="Label"></asp:Label>
           <asp:HyperLink ID="prof" CssClass="midd more" NavigateUrl="http://localhost:56508/User%20Profile.aspx"  runat="server">profile</asp:HyperLink>
           <asp:Button ID="Button2" style="height:2rem;  margin-top:0.8rem;margin-left:0.5rem;padding:0;" runat="server" Text="Log Out" CssClass="btn btn-outline-secondary" OnClick="Button2_Click1" />--%>
                        <%-- <asp:HyperLink NavigateUrl="http://localhost:56508/signup.aspx"  ID="sign" runat="server"></asp:HyperLink>
                                   <asp:HyperLink NavigateUrl="http://localhost:56508/login.aspx"   ID="log" runat="server"></asp:HyperLink>--%>
   <%-- <a href="#" class="w3-bar-item w3-button w3-red w3-hide-small w3-padding-16 w3-hide-medium">Go</a>--%>
         <%--<button type="button" runat="server" onserverclick="Submit_Click" class=" w3-bar-item w3-button w3-red w3-hide-small w3-padding-16 w3-hide-medium">search</button>--%>
<%--    <a href="http://localhost:56508/About.aspx" class="w3-bar-item w3-button w3-hover-red w3-hide-small w3-padding-16 w3-hide-medium">About</a>
    <a href="http://localhost:56508/contact.aspx" class="w3-bar-item w3-button w3-hover-red w3-hide-small w3-padding-16 w3-hide-medium">Contact</a>
    <a href="http://localhost:56508/allcategories.aspx" class="w3-bar-item w3-button w3-hover-red w3-hide-small w3-padding-16 w3-hide-medium">Categories</a>
    <a href="http://localhost:56508/login.aspx" class="w3-bar-item w3-button w3-hover-red w3-hide-small w3-padding-16 w3-hide-medium w3-right"><i class="w3-xlarge fa fa-user" id="login"></i> Log In</a>
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
</div>--%><%----%>



    <form id="form1" runat="server">


           

       <div class="container">
<div class="row ng-scope">
    <div class="col-md-3 col-md-push-9">
        <h4>Results <span class="fw-semi-bold">Filtering</span></h4>
        <p class="text-muted fs-mini">You can filter your results here</p><br />
<asp:Label ID="Label1" runat="server" ></asp:Label>
       search <br /><asp:TextBox ID="TextBox3" runat="server"></asp:TextBox><br />
        sort by price: <asp:RadioButtonList ID="RadioButtonList1" runat="server">
           <asp:ListItem Value="no">not matter</asp:ListItem>
         <asp:ListItem Value="DESC"> DESC</asp:ListItem>
       <asp:ListItem Value="ASC"> ASC</asp:ListItem>
        </asp:RadioButtonList><br />
         <asp:CheckBox ID="CheckBox1" Text="choos a specific category" runat="server" AutoPostBack="true"  OnCheckedChanged="CheckBox1_CheckedChanged" /> 
           <asp:DropDownList runat="server" Enabled="false"   ID="cat">
           </asp:DropDownList> 
        <br /><br />
    <asp:CheckBox ID="CheckBox2" Text="choos a specific auther" runat="server" AutoPostBack="true"  OnCheckedChanged="CheckBox2_CheckedChanged" /> 
  <br /> 
           <asp:DropDownList  Enabled="false" runat="server" ID="auth">

           </asp:DropDownList> <br /><br />
       specify min price <asp:TextBox ID="TextBox1" runat="server" AutoPostBack="true"  OnTextChanged="TextBox1_TextChanged" TextMode="Number"></asp:TextBox><br />
    <asp:Label ID="Label2" runat="server" ></asp:Label><br />
        specify max price<asp:TextBox ID="TextBox2" runat="server" AutoPostBack="true" OnTextChanged="TextBox2_TextChanged"  TextMode="Number"></asp:TextBox><br /><asp:Label ID="Label3" runat="server" ></asp:Label><br />
<br />
        <asp:Button ID="Button1"   runat="server" Text="apply filters" OnClick="Button1_Click" /><br /><br />
            <asp:HyperLink ID="HyperLink1" NavigateUrl="http://localhost:56508/EXAMPLE.aspx" runat="server">Back to home page</asp:HyperLink>

    </div>
    <div class="col-md-9 col-md-pull-3" id="mydiv" runat="server"/>

      
      
    </div>
</div>
    </form>
</body>
</html>
