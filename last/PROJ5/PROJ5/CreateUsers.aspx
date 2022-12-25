<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CreateUsers.aspx.cs" Inherits="PROJ5.CreateUsers" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
     <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.2/css/all.min.css" rel="stylesheet" />
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
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
            <a class="nav-link" href="../../pages/icons/themify.html">
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
        </ul>
      </nav>
      <div class="main-panel">
        <div class="content-wrapper">
          <div class="row">
            <div class="col-lg-12 grid-margin stretch-card">
              <div class="card">
                <div class="card-body">
                  <h2>Create User</h2>
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
                              <asp:TextBox ID="email" runat="server" CssClass="tb form-control input-lg"></asp:TextBox>

                </td>
            </tr>
            <tr>
                <td>
                             <label> Password : </label>
                </td>
                <td>
                    <input type="password" ID="pass" runat="server" Class="tb form-control input-lg"/>
                           

                </td>
            </tr>
            <tr>
                <td>
                             <label> First Name : </label>
                </td>
                <td>
                              <asp:TextBox ID="firstName" runat="server" CssClass="tb form-control input-lg"></asp:TextBox>

                </td>
            </tr>
            <tr>
                <td>
                     <label> Last Name : </label>
                </td>
                <td>
                  <asp:TextBox ID="lastName" runat="server" CssClass="tb form-control input-lg"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                       <label> Phone : </label>
                </td>
                <td>
                              <asp:TextBox ID="phone" runat="server" CssClass="tb form-control input-lg"></asp:TextBox>

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
                  <td> <asp:FileUpload ID="FileUpload1" runat="server" cssclass="fileupload"/></td>
            </tr>
           
        </table>
        <div>
            <asp:Button ID="btnUpload" Text="Save" runat="server" cssclass="btn btn-primary" OnClick="CreateNew" />
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