<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login_Common.aspx.cs" Inherits="Login_Common" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login</title>
    
     <style type="text/css">
         .panel
         {
             background: #4d4d4d; /* Old browsers */
             background: -moz-linear-gradient(top,  #4d4d4d 0%, #595959 100%); /* FF3.6+ */
             background: -webkit-gradient(linear, left top, left bottom, color-stop(0%,#4d4d4d), color-stop(100%,#595959)); /* Chrome,Safari4+ */
             background: -webkit-linear-gradient(top,  #4d4d4d 0%,#595959 100%); /* Chrome10+,Safari5.1+ */
             background: -o-linear-gradient(top,  #4d4d4d 0%,#595959 100%); /* Opera 11.10+ */
             background: -ms-linear-gradient(top,  #4d4d4d 0%,#595959 100%); /* IE10+ */
             background: linear-gradient(to bottom,  #4d4d4d 0%,#595959 100%); /* W3C */
             filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#499bea', endColorstr='#595959',GradientType=0 ); /* IE6-9 */
             height: 50px;
             width: 97%;
             padding: 0 20px;
             position: relative;
             margin-bottom: 30px;
             border-radius: 10px;
         }
         .style1
         {
             width: 100%;
         }
         .style2
         {
             width: 290px;
         }
         .style3
         {
             width: 197px;
         }
         .style4
         {
         }
     </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <asp:Panel ID="Panel2" runat="server" >
            <div class="panel"><h4 style="position: relative; top: 12px; left: 0px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a style="color:white" href="Home.aspx" >Home</a></h4></div>
        </asp:Panel>
        <asp:Panel ID="Panel3" runat="server" BorderColor="#000d33" BorderStyle="Solid">
            <table class="style1">
                <tr>
                    <td class="style4">
                        &nbsp;</td>
                    <td class="style3">
                        <asp:Label ID="Label4" runat="server" 
                            style="font-weight: 700; font-style: italic; font-size: large" Text="Login"></asp:Label>
                    </td>
                    <td class="style2">
                        &nbsp;</td>
                    <td rowspan="5">
                        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                       <%-- <img alt="logo" src="images/aaaaa.png" 
                            style="width: 350px; height: 148px; float: right" />--%>

                    </td>
                </tr>
                <tr>
                    <td class="style4">
                        &nbsp;</td>
                    <td class="style3">
                        <asp:Label ID="Label1" runat="server" 
                            style="font-weight: 700; font-size: medium" Text="Username"></asp:Label>
                    </td>
                    <td class="style2">
                        <asp:TextBox ID="txtusername" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="style4">
                        &nbsp;</td>
                    <td class="style3">
                        <asp:Label ID="Label2" runat="server" 
                            style="font-weight: 700; font-size: medium" Text="Password"></asp:Label>
                    </td>
                    <td class="style2">
                        <asp:TextBox ID="txtpassword" runat="server" textmode = "password"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="style4" colspan="3">
                        <asp:Label ID="Labelmsg" runat="server" 
                            style="color: #FF0000; font-weight: 700; font-size: medium; font-family: 'Times New Roman', Times, serif" 
                            Text="Login failed. UserName or Password could be invalied. Please try again"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="style4">
                        &nbsp;</td>
                    <td class="style3">
                        &nbsp;</td>
                    <td class="style2">
                        <asp:Button ID="Button1" runat="server" 
                            style="text-align: center; position: relative; top: 3px; left: 116px; font-family: 'Times New Roman', Times, serif; width: 125px; height: 32px;" 
                            Text="Login" BackColor="#1C599D" Font-Bold="True" Font-Italic="True" 
                            ForeColor="White" ToolTip="Click for login" onclick="Button1_Click" />
                    </td>
                </tr>
            </table>
        </asp:Panel>
    
    </div>
    </form>
</body>
</html>
