<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SignUp.aspx.cs" Inherits="my_log_in.WebForm2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" />
    <title></title>

	<link rel="stylesheet" type="text/css" href="util.css">
	<link rel="stylesheet" type="text/css" href="main.css">
</head>
<body>
    <form id="form1" runat="server">
      
	<div class="limiter">
		<div class="container-login100">
			<div class="wrap-login100">
				<form class="login100-form validate-form">
					<span class="login100-form-title p-b-26">
						Welcome
					</span>
					<span class="login100-form-title p-b-48">
						<i class="zmdi zmdi-font"></i>
					</span>

					<div class="wrap-input100 validate-input" data-validate = "Valid email is: a@b.c">
						<input runat="server" id="emaillogin" class="input100" type="text" name="email"/>
						<span class="focus-input100" data-placeholder="Email"></span>
					</div>

					<div class="wrap-input100 validate-input" data-validate="Enter password">
						<span class="btn-show-pass">
							<i class="zmdi zmdi-eye"></i>
						</span>
						<input runat="server" id="passwordlogin" class="input100" type="password" name="pass"/>
						<span class="focus-input100" data-placeholder="Password"></span>
					</div>
					<div class="wrap-input100 validate-input" >
						<span class="btn-show-pass">
							<i class="zmdi zmdi-eye"></i>
						</span>
						<input runat="server" id="Name" class="input100" type="text" name="First Name"/>
						<span class="focus-input100" data-placeholder="Name"></span>
					</div>
					<div class="wrap-input100 validate-input" >
						<span class="btn-show-pass">
							<i class="zmdi zmdi-eye"></i>
						</span>
						<input runat="server" id="LastName" class="input100" type="text" name="LastName"/>
						<span class="focus-input100" data-placeholder="LastName"></span>
					</div>
					<div class="wrap-input100 validate-input" >
						<span class="btn-show-pass">
							<i class="zmdi zmdi-eye"></i>
						</span>
						<input runat="server" id="phoner" class="input100" type="number" name="number"/>
						<span class="focus-input100" data-placeholder="your phone"></span>
					</div>
					<asp:DropDownList ID="DropDownList1" runat="server">
						<asp:ListItem Value="1">Irbid</asp:ListItem>
												<asp:ListItem Value="2">Amman</asp:ListItem>

												<asp:ListItem Value="2">Jarash</asp:ListItem>

					</asp:DropDownList>
												<asp:FileUpload ID="FileUpload1" runat="server" />

					<div class="container-login100-form-btn">
						<div class="wrap-login100-form-btn">
							<div class="login100-form-bgbtn"></div>
							<button type="button" value="submit"  runat="server" onserverclick="Submit_Click" class="login100-form-btn">
								sign up
							</button>
						</div>
						<asp:Label ID="Label1" runat="server" ></asp:Label>

					</div>

					<div class="text-center p-t-115">
						<span class="txt1">
							Already have an account?
						</span>

						<a class="txt2" href="http://localhost:56508/login.aspx">
							Log In 
						</a>
					</div>
				</form>
			</div>
		</div>
	</div>
	

	<div id="dropDownSelect1"></div>

    </form>
</body>
</html>
