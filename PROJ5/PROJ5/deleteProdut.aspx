<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="deleteProdut.aspx.cs" Inherits="WebApplication3.deleteProdut" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
       <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.2/css/all.min.css" rel="stylesheet" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <link rel="stylesheet" href="../CSS/Deleteproduct.css"/>
     <meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    <title>Delete Book</title>
</head>
<body>

    <form id="form1" runat="server">
        <div class="w3-container w3-center w3-animate-right">
    <h1>DELETE BOOK</h1>
    </div>
                        <div>
            <div class="containerdiv">
<div class="containertable form-group">
    <table>
        <tr>
            <td>
                  <asp:Label ID="lbproductname" runat="server" Text="Product Name"></asp:Label>
            </td>
            <td>
                  <asp:TextBox ID="tbproductname"  CssClass="tb form-control input-lg" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
            <asp:Label ID="lbcategoryname" runat="server" Text="Category Name"></asp:Label>

            </td>
            <td>
              <asp:DropDownList ID="drcategoryname" CssClass="tb mydropdownlist btn btn-default btn-sm" runat="server"></asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td>
                    <asp:Label ID="Label1" runat="server" Text="Author"></asp:Label>
            </td>
            <td>
                    <asp:TextBox ID="tbauthor"  CssClass="tb form-control input-lg" runat="server"></asp:TextBox>

            </td>
        </tr>
        <tr>
            <td>

            </td>
        </tr>
        <tr>
            <td>
                            <asp:Label ID="lbproductprice" runat="server" Text="Product Price"></asp:Label>
            </td>
            <td>
                            <asp:TextBox ID="tbproductprice"  CssClass="tb form-control input-lg" runat="server"></asp:TextBox>

            </td>
        </tr>
        <tr>
            <td>
                        <asp:Label ID="lbquantity" runat="server" Text="Quantity"></asp:Label>
            </td>
            <td>
                        <asp:TextBox ID="tbquantity"  CssClass="tb form-control input-lg" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                 <asp:Label ID="Lbdetails" runat="server" Text="Details"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="tbdetails"  CssClass="tb form-control input-lg" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                   <asp:Label ID="lbsale" runat="server" Text="Sale"></asp:Label>
            </td>
            <td>
                  <asp:TextBox ID="tbsale"  CssClass="tb form-control input-lg" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                 <asp:FileUpload ID="FileUpload1" runat="server" />
            </td>
            <td>
                 <asp:Button ID="btnupload" runat="server" cssclass="btn btn-primary" Text="Upload" OnClick="btnupload_Click" />
            </td>
        </tr>
        <tr>
            <td>
                 <asp:Image ID="Image1" runat="server" />
            </td>
        </tr>
        
    </table>
    <div class="btnadd">
        <asp:Button ID="btnDelete" runat="server"  cssclass="btn btn-primary" OnClick="btnDelete_Click" Text="Delete" />
    </div>
     
  </div>
                </div>
                            </div>
        
    </form>
</body>
</html>
