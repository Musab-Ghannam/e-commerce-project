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

@media (min-width:768px) {
    .search-result-item-heading {
        margin: 0
    }
}
   </style>
</head>
<body>
    <form id="form1" runat="server">
       <div class="container">
<div class="row ng-scope">
    <div class="col-md-3 col-md-push-9">
        <h4>Results <span class="fw-semi-bold">Filtering</span></h4>
        <p class="text-muted fs-mini">You can filter your results here</p><br />
       search <br /><asp:TextBox ID="TextBox3" runat="server"></asp:TextBox><br />
        sort by price: <asp:RadioButtonList ID="RadioButtonList1" runat="server">
           
         <asp:ListItem Value="DESC"> DESC</asp:ListItem>
       <asp:ListItem Value="ASC"> ASC</asp:ListItem>
        </asp:RadioButtonList><br />
         choos a specific category   
           <asp:DropDownList runat="server" ID="cat">
               <asp:ListItem Value="nul">not matter</asp:ListItem>
           </asp:DropDownList> 
        <br /><br />
         choos a specific auther  <br /> 
           <asp:DropDownList runat="server" ID="auth">
                              <asp:ListItem Value="nul">not matter</asp:ListItem>

           </asp:DropDownList> <br /><br />
       specify min price <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox><br />
        specify max price<asp:TextBox ID="TextBox2" runat="server"></asp:TextBox><br /><br />
        <asp:Button ID="Button1" runat="server" Text="apply filters" OnClick="Button1_Click" />
            <asp:HyperLink ID="HyperLink1" NavigateUrl="http://localhost:56508/EXAMPLE.aspx" runat="server">back</asp:HyperLink>

    </div>
    <div class="col-md-9 col-md-pull-3" id="mydiv" runat="server"/>

      
      
    </div>
</div>
    </form>
</body>
</html>
