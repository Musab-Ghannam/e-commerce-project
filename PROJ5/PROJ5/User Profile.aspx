<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="User Profile.aspx.cs" Inherits="WebApplication3.User_Profile" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
     <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.2/css/all.min.css" rel="stylesheet" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="userprofile.css"/>
    <title>USer Profile</title>
    <link rel="stylesheet" href="../CSS/userprofile.css"/>
</head>

<body> 

    <form id="form1" runat="server"  >
<div class="containeruserprofile" >
           <div class="container rounded bg-white mt-5 mb-5" style="background-color:transparent;background-image: url(book-library-with-open-textbook.jpg);">
   
    <div class="row altrow">
        <div class="col-md-3 border-right">
            <div class="d-flex flex-column align-items-center text-center p-3 py-5"><img runat="server" id="userImage" class="rounded-circle mt-5" src="https://st3.depositphotos.com/15648834/17930/v/600/depositphotos_179308454-stock-illustration-unknown-person-silhouette-glasses-profile.jpg"></div>
        </div>
        <div class="col-md-5 border-right">
            <div class="p-3 py-5">
                <div class="d-flex justify-content-between align-items-center mb-3">
                    <h4 class="text-right">Profile Settings</h4>
                </div>
                <div>
                </div>
                <div class="row mt-2">
                    <div class="col-md-6"><label class="labels">Name</label><input runat="server" id="firstName" type="text" class="form-control" placeholder="First Name" value=""></div>
                    <div class="col-md-6"><label class="labels">Last Name</label><input runat="server" id="lastName" type="text" class="form-control" value="" placeholder="Last Name"></div>
                </div>
                <div class="row mt-3">
                    <div class="col-md-12"><label class="labels">Mobile Number</label><input runat="server" id="phone" type="text" class="form-control" placeholder="enter phone number" value=""></div>
                    <div class="col-md-12"><label class="labels">Email</label><input type="text" runat="server" id="email" class="form-control" placeholder="enter Email address" value=""></div>
                    <div class="col-md-12"><label class="labels">Password</label><input  runat="server" id="Password" type="Text" class="form-control"   placeholder="Enter New password"  value=""></div>
                    <div class="col-md-6 userinfo"><label class="labels">City</label>
                        <asp:DropDownList ID="City" runat="server"></asp:DropDownList>
                    </div>
                    
                    
                </div>
                <div class="meflex" userinfo>
                          <p id="selectimage">Select Image:</p>
                          <asp:FileUpload ID="FileUpload1" runat="server" />
                          <asp:Button ID="Upload" runat="server" Text="Upload" cssclass="btn btn-primary" OnClick="Upload_Click" />
                 </div>
                <div class="mt-5 text-center">
                            <asp:Button ID="Save" runat="server" OnClick="Save_Click" cssclass="btn btn-primary" Text="Save" />
                </div>

            </div>
        </div>
       
    </div>
</div>

</div>

    </form>
</body>
</html>
