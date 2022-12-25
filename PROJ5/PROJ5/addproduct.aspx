<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="addproduct.aspx.cs" Inherits="WebApplication3.addproduct" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">

        <title>Edit Book</title>
     <link rel="stylesheet" href="../../vendors/ti-icons/css/themify-icons.css">
  <link rel="stylesheet" href="../../vendors/base/vendor.bundle.base.css">
  <!-- endinject -->
  <!-- inject:css -->
  <link rel="stylesheet" href="../../css/style.css">
  <!-- endinject -->
  <link rel="shortcut icon" href="../../images/favicon.png" />
    
   
  <style>
      .xsign{
          color:blue;
          text-decoration:none
      }
  .alert {
  padding: 20px;
  background-color: #04AA6D; /* Red */
  color: white;
  margin-bottom: 15px;
}

/* The close button */
.closebtn {
  margin-left: 15px;
  color: white;
  font-weight: bold;
  float: right;
  font-size: 22px;
  line-height: 20px;
  cursor: pointer;
  transition: 0.3s;
}

/* When moving the mouse over the close button */
.closebtn:hover {
  color: black;
}
 #Image1{
    width: 200px;
    height: 200px;
    margin-bottom: 5%;
    margin:1rem 0;
}

.containertable {
    width: fit-content;
    padding: 2rem;
    margin-top: 1.5%;
    display: flex;
    flex-direction: column;
    align-items: center;
    background-color: #f3f3f3;
    border-radius: 10px;
    box-shadow: 3px 1px 1px #aaa;
}

.tb {
    margin-bottom: 0.75rem;
    border: 1px solid;
}

.fileupload {
    font-family: inherit;
    font-size: inherit;
    line-height: inherit;
    width: 100%;
    height: 32px;
}

.btnadd {
    display: flex;
    justify-content: center;
    align-items: center;
}

.containerdiv {
    display: flex;
    flex-direction: column;
    justify-content: center;
    align-items: center;
}

.mydropdownlist {
    background-color: white;
    font-size: 16px;
    padding: 5px 10px;
    border-radius: 5px;
    border: 1px solid black !important;
    font-weight: bold;
    background-color:white !important;
}

@media only screen and (min-device-width:0px) and (max-device-width:480px) {
    .containerdiv {
        height: 90vh;
    }

    table tr {
        height: 140px;
    }
}

  </style>
</head>
<body>
        <div class="container-scroller">
    <!-- partial:../../partials/_navbar.html -->
    <nav class="navbar col-lg-12 col-12 p-0 fixed-top d-flex flex-row">
      <div class="text-center navbar-brand-wrapper d-flex align-items-center justify-content-center">
        <a class="navbar-brand brand-logo mr-5" href="../../index.html"><img src="../../images/Logo.png" class="mr-2" alt="logo" style="height: 65px; width: 65px;"/></a>
        <a class="navbar-brand brand-logo-mini" href="../../index.html"><img src="../../images/Logo.png" alt="logo"  style="height: 60px; width: 60px;"/></a>
      </div>
      <div class="navbar-menu-wrapper d-flex align-items-center justify-content-end">
        <button class="navbar-toggler navbar-toggler align-self-center" type="button" data-toggle="minimize">
          <span class="ti-view-list"></span>
        </button>
        <button class="navbar-toggler navbar-toggler-right d-lg-none align-self-center" type="button" data-toggle="offcanvas">
          <span class="ti-view-list"></span>
        </button>
      </div>
    </nav>
    <!-- partial -->
    <div class="container-fluid page-body-wrapper">
      <!-- partial:../../partials/_sidebar.html -->
      
      <nav class="sidebar sidebar-offcanvas" id="sidebar">
        <ul class="nav">
            <li class="nav-item">
            <a class="nav-link" href="Sales.aspx">
              <i class="fa-solid fa-clipboard-list" style="font-size: 20px;"></i>
              <span class="menu-title">&nbsp;Sales</span>
            </a>
          </li>
         
          <li class="nav-item">
            <a class="nav-link" href="AdminCategory.aspx">
              <i class="fa-solid fa-clipboard-list" style="font-size: 20px;"></i>
              <span class="menu-title">&nbsp;Category</span>
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="Product.aspx">
              <i class="fa-solid fa-book" style="font-size: 20px;"></i>
              <span class="menu-title">&nbsp; Product</span>
            </a>
          </li>
        
          <li class="nav-item">
            <a class="nav-link" href="Users.aspx">
              <i class="fa-solid fa-user" style="font-size: 20px;"></i>
              <span class="menu-title">&nbsp; Users</span>
            </a>
          </li>

          <li class="nav-item">
                <a class="nav-link" ID="LinkButton1" onserverclick="Logout" runat="server">
              <i class="fa fa-sign-out" style="font-size: 20px;"></i>
              <span class="menu-title">&nbsp; Logout</span>
             </a>
          </li>

        </ul>
      </nav>
      <div class="main-panel">
        <div class="content-wrapper">
          <div class="row">
            <div class="col-lg-12 grid-margin stretch-card">
              <div class="card">
                <div class="card-body">
                    <br />
                  
                  <div class="table-responsive">
    <form id="form1" runat="server">
<div class="w3-container w3-center w3-animate-right">
  <h1>ADD BOOK</h1>
    </div>
                             <asp:Label ID="Label2" runat="server" Text=""></asp:Label>
        <div>
            <div class="containerdiv">
<div class="containertable form-group">
         <table>
           <tr>
               <td>
                 <asp:Label  ID="lbproductname" runat="server" Text="Book Name"></asp:Label>
               </td>
               <td>
                <asp:TextBox ID="tbproductname" CssClass="tb form-control input-lg" runat="server"  required="true"></asp:TextBox>
               </td>
           </tr>
          <tr>
              <td>
                              <asp:Label ID="lbcategoryname"  runat="server" Text="Category Name"></asp:Label>

              </td>
              <td>
                              <asp:DropDownList ID="drcategoryname"  CssClass="tb mydropdownlist btn btn-default btn-sm" runat="server" ></asp:DropDownList>

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
                             <asp:TextBox ID="tbquantity"  CssClass="tb form-control input-lg" runat="server" ></asp:TextBox>

             </td>
         </tr>  
           <tr>
               <td>
                               <asp:Label ID="Lbdetails" runat="server" Text="Details"></asp:Label>

               </td>
               <td>
                               <asp:TextBox ID="tbdetails" CssClass="tb form-control input-lg" runat="server" ></asp:TextBox>

                </td>
                </tr>
                <tr>
                <td>
                                <asp:Label ID="lbsale" runat="server" Text="Disaccount"></asp:Label>

                </td>
                <td>
                                <asp:TextBox ID="tbsale" CssClass="tb form-control input-lg" runat="server" ></asp:TextBox>

                </td>
                </tr> 
                <tr>
                <td>
                               <asp:FileUpload ID="FileUpload1" runat="server" required="true" cssclass="fileupload" accept=".png,.jpg,.jpeg,.gif"/>

                </td>
            
                 <td>
                                                   <%-- <asp:Button ID="btnupload"  runat="server" Text="Upload" OnClick="btnupload_Click" cssclass="btn btn-primary"  />--%>

                 </td>
            </tr>
            <%-- <tr>
                 <td>

                 </td>
                <td>
                            <asp:Image ID="Image1" runat="server"  />

                </td>
            </tr>--%>
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
