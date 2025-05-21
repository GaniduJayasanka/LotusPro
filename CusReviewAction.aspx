<%@ Page Language="C#" AutoEventWireup="true" CodeFile="CusReviewAction.aspx.cs" Inherits="CusReviewAction" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>

     <style>
    .myClass {
 position: relative;
 top: 11px;
 left: 20px; 
 height: 450px;
 width: 928px;
 border-color:indigo;
 border-width: medium;
}
          </style>

</head>
<body>
    <form id="form1" runat="server">
        <div>
       <asp:Panel ID="Panel2" runat="server" BorderColor="#003399" BorderWidth="3px">
         <table>
              <tr>
        <td>&nbsp;</td>
    <td colspan="6"><h1>Customer Review</h1></td>
    
  </tr>
               <tr>
                   <td>&nbsp;</td>
    <td>Review Id</td>
    <td>:</td>
    <td> <asp:Label ID="lblCusReviewID" runat="server" Text=""></asp:Label></td>
      <td></td>
       <td><asp:Label ID="lblCRID" runat="server" Text="" Visible="true"></asp:Label></td>
                   <td></td>
  </tr>

  <tr>
        <td>&nbsp;</td>
    <td>First Name</td>
    <td>:</td>
     <td> <asp:Label ID="lblFirstName" runat="server" Text=""></asp:Label></td>
      <td>Last Name</td>
      <td>:</td>
       <td><asp:Label ID="lblLastName" runat="server" Text=""></asp:Label></td>
  </tr>
 <tr>
       <td>&nbsp;</td>
    <td>Email</td>
    <td>:</td>
     <td> <asp:Label ID="lblEmail" runat="server" Text=""></asp:Label></td>
      <td>Contact No</td>
     <td>:</td>
       <td><asp:Label ID="lblContactNo" runat="server" Text=""></asp:Label></td>
  </tr>
              <tr>
                    <td>&nbsp;</td>
    <td>Country</td>
    <td>:</td>
     <td> <asp:Label ID="lblCountry" runat="server" Text=""></asp:Label></td>
      <td>Rating</td>
     <td>:</td>
       <td><asp:Label ID="lblRating" runat="server" Text=""></asp:Label></td>
  </tr>
              <tr>
                    <td>&nbsp;</td>
    <td>Review</td>
    <td>:</td>
     <td colspan="4"  <asp:Label ID="lblreview" runat="server" Text=""></asp:Label></td>      
  </tr>
               <tr>
                     <td>&nbsp;</td>
    <td>Action Taken</td>
    <td>:</td>
     <td colspan="4"> <asp:TextBox ID="txtAction" TextMode="MultiLine" class="form-control" runat="server" Width="95%"></asp:TextBox></td>      
  </tr>
                 <tr>
                       <td>&nbsp;</td>
    <td></td>
    <td></td>
                     <td colspan="4">
    <asp:Button ID="SaveBtn" class="btn btn-success start" Width="120px" runat="server" Text="Save" OnClick="SaveBtn_Click"/>
              <asp:Button ID="ResetBtn" class="btn btn-warning start" Width="120px"  runat="server" Text="Reset" OnClick="ResetBtn_Click" />
</td>
  </tr>

         </table>
</asp:Panel>
        </div>
    </form>
</body>
</html>
