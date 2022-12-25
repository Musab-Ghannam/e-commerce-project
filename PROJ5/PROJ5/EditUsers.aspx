﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EditUsers.aspx.cs" Inherits="PROJ5.EditUsers" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<hea
    <link rel="stylesheet" href="../../vendors/ti-icons/css/themify-icons.css">
  <link rel="stylesheet" href="../../vendors/base/vendor.bundle.base.css">
  <!-- endinject -->
  <!-- inject:css -->
  <link rel="stylesheet" href="../../css/style.css">
  <!-- endinject -->
  <link rel="shortcut icon" href="../../images/favicon.png" />
  <script src="https://kit.fontawesome.com/e869edadc1.js" crossorigin="anonymous"></script>

    <title></title>
    <style>
          #image1{
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
                  <h2>Edit User</h2>
                    <br />
    <form id="form1" runat="server">
         <div>
            <div class="containerdiv">
<div class="containertable form-group" >
        <table>
            <tr>
                <td>
                            <label> Email : </label>

                </td>
                <td>
                              <asp:TextBox required="true" ID="email" runat="server" CssClass="tb form-control input-lg"></asp:TextBox>

                </td>
            </tr>
            <tr>
                <td>
                             <label> Password : </label>
                </td>
                <td>
                    <input type="password" required id="pass" runat="server" class="tb form-control input-lg"/>
                           

                </td>
            </tr>
            <tr>
                <td>
                             <label> First Name : </label>
                </td>
                <td>
                              <asp:TextBox ID="firstName" required="true" runat="server" CssClass="tb form-control input-lg"></asp:TextBox>

                </td>
            </tr>
            <tr>
                <td>
                     <label> Last Name : </label>
                </td>
                <td>
                  <asp:TextBox ID="lastName" required="true"  runat="server" CssClass="tb form-control input-lg"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                       <label> Phone : </label>
                </td>
                <td>
                              <asp:TextBox required="true" ID="phone" runat="server" CssClass="tb form-control input-lg"></asp:TextBox>

                </td>
            </tr>
            <tr>
                <td>
                     <label> City : </label>
                </td>
                <td>
                             <asp:DropDownList ID="City" runat="server" CssClass="tb mydropdownlist btn btn-default btn-sm"></asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td>
                    <label> Role : </label>
                </td>
                <td>
                    <asp:DropDownList ID="Role" runat="server" CssClass="tb mydropdownlist btn btn-default btn-sm"></asp:DropDownList>
                </td>
            </tr>
            <tr>
                  <td> <asp:FileUpload  accept=".png,.jpg,.jpeg,.gif" ID="FileUpload1" runat="server" cssclass="fileupload"/></td>
            </tr>
            <tr>
               <td><img id="image1"  runat="server" src="#"/></td> 
            </tr>
        </table>
        <div>
            <asp:Button  Text="Save" runat="server" cssclass="btn btn-primary" OnClick="Edituser" />
        </div>
                    


    </div>
                </div>
             </div>
    </form>
</div>
                </div>
              </div>
            </div>
          </div>
        </div>
                  </div>
        </div>
                  </div>

        <script src="../../vendors/base/vendor.bundle.base.js"></script>
  <!-- endinject -->
  <!-- Plugin js for this page-->
  <!-- End plugin js for this page-->
  <!-- inject:js -->
  <script src="../../js/off-canvas.js"></script>
  <script src="../../js/hoverable-collapse.js"></script>
  <script src="../../js/template.js"></script>
  <script src="../../js/todolist.js"></script>

</body>
</html>
