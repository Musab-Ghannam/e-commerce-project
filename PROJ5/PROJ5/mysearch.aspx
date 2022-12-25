<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="mysearch.aspx.cs" Inherits="PROJ5.mysearch" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
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
#mm{
    overflow:hidden;
}
.Label4{
    color: #ff4411; font-size: 48px; font-family: 'Signika', sans-serif; padding-bottom: 10px;
}
#labeldiv{
    width:300px;
    height:100px;
}

@media (min-width:768px) {
    .search-result-item-heading {
        margin: 0
    }
}

       @media only screen and (min-device-width: 0) and (max-device-width: 480px) {
           #mm{
               width:65vw;
           }
       }
   </style>
</head>
<body>
    <form id="form1" runat="server">
       <div class="container">
<div class="row ng-scope">
    <div id="mm" class="col-md-3 col-md-push-9">
        <h4>Results <span class="fw-semi-bold">Filtering</span></h4>
        <p class="text-muted fs-mini">You can filter your results here</p><br />
<asp:Label ID="Label1" runat="server" ></asp:Label>
         <br /><h5>Search</h5><asp:TextBox Cssclass="form-control w-75" ID="TextBox3" runat="server"></asp:TextBox><br />
        sort by price: <asp:RadioButtonList ID="RadioButtonList1" runat="server">
           <asp:ListItem Value="no">not matter</asp:ListItem>
         <asp:ListItem Value="DESC"> DESC</asp:ListItem>
       <asp:ListItem Value="ASC"> ASC</asp:ListItem>
        </asp:RadioButtonList><br />
         <asp:CheckBox ID="CheckBox1" Text="choos a specific category" runat="server" AutoPostBack="true"  OnCheckedChanged="CheckBox1_CheckedChanged" /> 
           <asp:DropDownList   runat="server" Enabled="false"   ID="cat">
           </asp:DropDownList> 
        <br /><br />
    <asp:CheckBox ID="CheckBox2" Text="choos a specific auther" runat="server" AutoPostBack="true"  OnCheckedChanged="CheckBox2_CheckedChanged" /> 
  <br /> 
           <asp:DropDownList  Enabled="false" runat="server" ID="auth">

           </asp:DropDownList> <br />
       specify min price <asp:TextBox ID="TextBox1" Cssclass="form-control w-25" runat="server" AutoPostBack="true"  OnTextChanged="TextBox1_TextChanged" TextMode="Number"></asp:TextBox><br />
    <asp:Label ID="Label2" runat="server" ></asp:Label>
        specify max price<asp:TextBox Cssclass="form-control w-25" ID="TextBox2" runat="server" AutoPostBack="true" OnTextChanged="TextBox2_TextChanged"  TextMode="Number"></asp:TextBox><br /><asp:Label ID="Label3" runat="server" ></asp:Label><br />
<br />
        <asp:Button ID="Button1"   runat="server" Text="apply filters" OnClick="Button1_Click" /><br />
            <asp:HyperLink ID="HyperLink1" NavigateUrl="http://localhost:56508/EXAMPLE.aspx" runat="server">Back to home page</asp:HyperLink>

    </div>
    <div class="col-md-9 col-md-pull-3" id="mydiv" runat="server"/>
    
    
      
    </div>
</div>
    </form>
</body>
</html>
