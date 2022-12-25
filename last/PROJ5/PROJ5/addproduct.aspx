<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="addproduct.aspx.cs" Inherits="WebApplication3.addproduct" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
     <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.2/css/all.min.css" rel="stylesheet" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
 <link rel="stylesheet" href="../CSS/Addproduct.css"/>
   <meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">

    <title>Add Book</title>
    <style>
                    width:200px;
            height:200px;
            margin-bottom:5%;
        }
        .containertable {
            width:fit-content;
            padding:2rem;
            margin-top:1.5%;
            display: flex;
            flex-direction:column;
            align-items:center;
            background-color:#f3f3f3;
            border-radius:10px;
            box-shadow:3px 1px 1px #aaa;
           
           
        }
        .tb {
        margin-bottom:0.75rem;
        border:1px solid;

        }
        .fileupload
         {
        font-family: inherit;
        font-size: inherit;
         line-height: inherit;
         width: 100%;
        height: 32px;    
      
        }
        .btnadd{
            display:flex;
            justify-content:center;
            align-items:center;
        }
        .containerdiv {
            display:flex;
            flex-direction:column;
            justify-content:center;
            align-items:center;
           
        
        }

        .mydropdownlist
        {
        background-color:white;
        font-size: 16px;
        padding: 5px 10px;
        border-radius: 5px;
        border:1px solid;
        font-weight: bold;
       
        }
        @media only screen and (min-device-width:0px) and (max-device-width:480px){
            .containerdiv{
                 height:90vh;
            }
            table tr {
                height:140px;
            }
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
<div class="w3-container w3-center w3-animate-right">
  <h1>ADD NEW BOOK</h1>
    </div>
        <div>
            <div class="containerdiv">
<div class="containertable form-group">
         <table>
           <tr>
               <td>
                 <asp:Label  ID="lbproductname" runat="server" Text="Book Name"></asp:Label>
               </td>
               <td>
                <asp:TextBox ID="tbproductname" CssClass="tb form-control input-lg" runat="server"></asp:TextBox>
               </td>
           </tr>
          <tr>
              <td>
                              <asp:Label ID="lbcategoryname"  runat="server" Text="Category Name"></asp:Label>

              </td>
              <td>
                              <asp:DropDownList ID="drcategoryname"  CssClass="tb mydropdownlist btn btn-default btn-sm" runat="server"></asp:DropDownList>

              </td>
          </tr>
           <tr>
               <td>
                                <asp:Label ID="Label1" runat="server" Text="Author"></asp:Label>

               </td>
               <td>
                               <asp:TextBox ID="tbauthor" CssClass="tb form-control input-lg" runat="server"></asp:TextBox>

               </td>
           </tr>
 
        <tr>
            <td>
                            <asp:Label ID="lbproductprice"  runat="server" Text="Book Price"></asp:Label>

            </td>
            <td>
                            <asp:TextBox ID="tbproductprice"  CssClass="tb form-control input-lg" runat="server" ></asp:TextBox>

            </td>
        </tr>
            
         <tr>
             <td>
                             <asp:Label ID="lbquantity" for="exampleInputEmail1" class='control-label' runat="server" Text="Quantity"></asp:Label>

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
                               <asp:TextBox ID="tbdetails" CssClass="tb form-control input-lg" runat="server"></asp:TextBox>

                </td>
                </tr>
                <tr>
                <td>
                                <asp:Label ID="lbsale" runat="server" Text="Disaccount"></asp:Label>

                </td>
                <td>
                                <asp:TextBox ID="tbsale" CssClass="tb form-control input-lg" runat="server"></asp:TextBox>

                </td>
                </tr>
                <tr>
                <td>
                               <asp:FileUpload ID="FileUpload1" runat="server"  cssclass="fileupload"/>

                </td>
            
                 <td>
                                                    <asp:Button ID="btnupload"  runat="server" Text="Upload" OnClick="btnupload_Click" cssclass="btn btn-primary"  />

                 </td>
            </tr>
             <tr>
                <td>
                            <asp:Image ID="Image1" runat="server"  />

                </td>
            </tr>
            </table>
     <div class="btnadd">
                            <asp:Button ID="Button1" runat="server" cssclass="btn btn-primary" OnClick="Button1_Click" Text="Add Book" />   
            </div>
          
         </div>
               
        </div>    
       
        </div>
    </form>
</body>
</html>
