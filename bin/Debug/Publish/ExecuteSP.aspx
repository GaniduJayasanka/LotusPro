<%@ page language="C#" autoeventwireup="true" inherits="ExecuteSP, App_Web_cjp5ygzm" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>

</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Button" />
    
    </div>

        <div>

 <div class="col-md-12">
                                    <asp:GridView ID="GVCheck" runat="server" Width="50%"
                                        AutoGenerateColumns="False" BackColor="White" BorderColor="#6600CC"
                                        BorderStyle="Ridge" BorderWidth="1px" CellPadding="3" CellSpacing="1"
                                        class="w3-table w3-striped w3-bordered w3-card-4 gridtop"
                                        Font-Names="times new roman" GridLines="None">
                                        <RowStyle BackColor="#DEDFDE" ForeColor="Black" />
                                        <Columns>
                                          
                                            <asp:TemplateField HeaderText="ItemID" Visible="true">
                                                <ItemTemplate>
                                                    <asp:Label ID="ItemID" runat="server" Text='<%# Eval("ItemID")%>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="TransferQty">
                                                <ItemTemplate>
                                                    <asp:Label ID="TransferQty" runat="server" Text='<%# Eval("TransferQty")%>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            
                                        </Columns>
                                        <HeaderStyle BackColor="#4A3C8C" ForeColor="#E7E7FF" Height="20px" />
                                    </asp:GridView>
                                </div>
        </div>
    </form>
</body>
</html>
