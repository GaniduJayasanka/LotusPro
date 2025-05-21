<%@ page language="C#" autoeventwireup="true" inherits="Login, App_Web_34neb3g4" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Login</title>
     <link rel="shortcut icon" type="image/x-icon" href="images/ship.ico" />

    <link href="CSS/loginPageStyle.css" rel="stylesheet" />
        <style type="text/css">
        body {
            background-image: url(images/blueco.jpg);
           
        }
    </style>
</head>

<body style="height: 158px; left: 0px; top: 0px; background-color:white">
    <br /><br />
    <div class="container">
        <div class="content">
            <form id="form1" runat="server">
                <h1>Login Form</h1>
                <div>
                    <asp:TextBox ID="txtusername" Class="username" type="text" runat="server"></asp:TextBox>
                </div>
                <div>
                    <asp:TextBox type="password" Class="password" ID="txtpassword" runat="server" TextMode="password"></asp:TextBox>
                </div>
                <div>
                    <asp:Label ID="Labelmsg" runat="server"
                        Style="color: #FF0000; font-weight: 700; font-size: medium; font-family: 'Times New Roman', Times, serif"
                        Text="Login failed. UserName or Password could be invalied. Please try again"></asp:Label>
                </div>
                <div>
                    <asp:Button ID="BtnLogin" runat="server" Text="Log in" type="submit" 
                        OnClick="BtnLogin_Click" />
                </div>
            </form>
        </div>
    </div>
</body>
</html>
