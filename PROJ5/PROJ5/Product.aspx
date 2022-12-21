<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Product.aspx.cs" Inherits="WebApplication3.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">
       <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous"/>
     <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.2/css/all.min.css" rel="stylesheet" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous"/>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
     <meta name="viewport" content="width=device-width, initial-scale=1"/>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css"/>
   <link rel="stylesheet" href="../CSS/Product.css"/>
    <title>Books in library</title>
 
</head>
<body>
    <div class="w3-container w3-center w3-animate-top">
  <h1>BOOKS IN LIBRARY</h1>
</div>
    <form id="form1" runat="server">
        
           <div class="divbtn">
               <a class="btn btn-primary" href="addproduct.aspx" role="button">Add New Book</a><br />
            </div>
            <div class="search">
                <div>
                    <asp:TextBox ID="TextBox1" runat="server" cssClass="form-control tbsearch"></asp:TextBox>
                </div>
                <div>
                    <asp:Button ID="Button1" runat="server" Text="search" class="btn btn-primary btnsearch" OnClick="Button1_Click "/>
                </div>
            </div>
<div class="searchbookname">
                <asp:Label ID="Label1" runat="server"></asp:Label>

</div>           
            <asp:Label ID="Product" runat="server"></asp:Label>
        
    </form>
</body>
</html>
