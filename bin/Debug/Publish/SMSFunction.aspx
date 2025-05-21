<%@ page language="C#" autoeventwireup="true" inherits="SMSFunction, App_Web_10bhy3il" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Panel ID="Panel1" runat="server">
                <asp:Table ID="Table1" runat="server">
                    <asp:TableRow>
                        <asp:TableCell></asp:TableCell>
                       
                         <asp:TableCell ColumnSpan="4"><h3>Manual SMS Sending Function - (For Shipment Dispatch Approval) </h3></asp:TableCell>
                         <asp:TableCell></asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell></asp:TableCell>
                        </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell></asp:TableCell>
                          <asp:TableCell>
                              <asp:Label ID="Label1" runat="server" Text="Shipment No"></asp:Label></asp:TableCell>
                          <asp:TableCell>
                              <asp:TextBox ID="txtShipmentNo" runat="server"></asp:TextBox></asp:TableCell>
                          <asp:TableCell> 
                              <asp:Button ID="btnSendSMS" runat="server" Text="Send SMS" OnClick="btnSendSMS_Click" /></asp:TableCell>
                           <asp:TableCell></asp:TableCell>
                           <asp:TableCell></asp:TableCell>

                    </asp:TableRow>
                </asp:Table>
            </asp:Panel>
            <div hidden>
            <asp:Label ID="lblShipmentID" runat="server" Text="0"></asp:Label>
            <asp:Label ID="lblUserID" runat="server" Text="0"></asp:Label>
            <asp:Label ID="lblShipmentNo" runat="server" Text="0"></asp:Label>
            <asp:Label ID="lblPlantID" runat="server" Text="0"></asp:Label>
             <asp:Label ID="LabMobNumber" runat="server" Text="0"></asp:Label>
                </div>
        </div>
    </form>
</body>
</html>
