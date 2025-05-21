<%@ page language="C#" autoeventwireup="true" inherits="InvoiceSearch, App_Web_cjp5ygzm" %>

<%@ Register Assembly="BasicFrame.WebControls.BasicDatePicker" Namespace="BasicFrame.WebControls" TagPrefix="BDP" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>MSP Dispatch vs Invoice Rpt</title>
    <link href="CSS/bootstrap.css" rel="stylesheet" />

    <link href="CSS/jquery.autocomplete.css" rel="stylesheet" type="text/css" />
    <script src="js/jquery-1.4.1.min.js" type="text/javascript"></script>
    <script src="js/jquery.autocomplete.js" type="text/javascript"></script>

</head>
<body>
    <form id="form1" runat="server">
        <div class="col-md-12">
            <asp:Label ID="lblOrderNo" runat="server" Visible="False"></asp:Label>
            <div class="row">
                <div class="col-md-12">
                    <div class="col-md-2">
                        <br />
                        <asp:ImageButton ID="btnHome" runat="server" ImageUrl="~/images/Tohome.png" Height="35px"
                            Width="35px" PostBackUrl="~/StyleWiseHistory.aspx" />
                        <asp:ImageButton ID="btnback" runat="server" ImageUrl="~/images/Back.png" Height="35px"
                            Width="35px" PostBackUrl="~/StyleWiseHistory.aspx" />
                    </div>
                    <div class="col-md-9">
                        <h4 style="text-align: center">Invoice Wise Search</h4>
                    </div>
                </div>
            </div>
            <div class="col-md-12">
                <div class="panel panel-default">
                    <div class="panel-body">
                        <div class="box-body">
                            <div class="row">
                                <div class="box-body">
                                    <div class="form-group">
                                        <label class="col-md-1 control-label">Invoice No:</label>
                                        <div class="col-md-4">
                                            <asp:TextBox ID="txtInvNo" runat="server" CssClass="form-control" Width="200px"></asp:TextBox>
                                        </div>
                                        <div class="col-md-3">
                                            <asp:Button ID="BtnSearch" CssClass="btn btn-info" Width="100px" runat="server" Text="Search" OnClick="btnSearch_Click" />
                                            <asp:Button ID="BtnSet" runat="server" CssClass="btn btn-warning" OnClick="BtnSet_Click" Text="Reset" Width="100px" />
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-12">
                <label class="col-md-2 control-label">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </label>
                <div class="row">
                    <label class="col-md-2 control-label">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </label>
                    <label class="col-md-2 control-label">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </label>
                    <asp:GridView ID="GridInvReport" runat="server" ShowFooter="false" AutoGenerateColumns="False" BackColor="White"
                        BorderColor="#999999"
                        BorderWidth="2px" ForeColor="Black" FooterStyle-HorizontalAlign="Right" AllowSorting="True"
                        Style="max-width: 100%; font-size: small; min-width: 90%"
                        EnableModelValidation="True" Width="980px">
                        <Columns>
                            <%--  <asp:TemplateField HeaderText="BuyerName"   SortExpression="" Visible="true">
                        <ItemTemplate>
                        <asp:Label ID="BuyerName" runat="server"   Text='<%#Eval("BuyerName") %>' ></asp:Label>
                        </ItemTemplate>                       
                    </asp:TemplateField>--%>
                            <asp:TemplateField HeaderText="Final Invoice Style No" SortExpression="" Visible="true">
                                <ItemTemplate>
                                    <asp:Label ID="StyleNo" runat="server" Text='<%#Eval("StyleNo") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                              <asp:TemplateField HeaderText="BOI Invoice Style No" SortExpression="" Visible="true">
                                <ItemTemplate>
                                    <asp:Label ID="BOIInvoieStyleNo" runat="server" Text='<%#Eval("BOIInvoieStyleNo") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="BuyerPO No" SortExpression="" Visible="true">
                                <ItemTemplate>
                                    <asp:Label ID="BuyerPONo" runat="server" Text='<%#Eval("BuyerPONo") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Contract No" SortExpression="" Visible="true">
                                <ItemTemplate>
                                    <asp:Label ID="ContractNo" runat="server" Text='<%#Eval("ContractNo") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Confirm Status" SortExpression="" Visible="true">
                                <ItemTemplate>
                                    <asp:Label ID="ConfirmStatus" runat="server" Text='<%#Eval("ConfirmStatus") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Payment Status" SortExpression="" Visible="true">
                                <ItemTemplate>
                                    <asp:Label ID="PaymentStatus" runat="server" Text='<%#Eval("PaymentStatus") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Verification" SortExpression="" Visible="true">
                                <ItemTemplate>
                                    <asp:Label ID="Verification" runat="server" Text='<%#Eval("Verification") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="BOI Invoice" SortExpression="" Visible="true">
                                <ItemTemplate>
                                    <asp:Label ID="BOI" runat="server" Text='<%#Eval("BOI") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                        <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
                        <FooterStyle BackColor="#696765" Font-Bold="True" ForeColor="White" CssClass="GVFixedFooter" />
                        <HeaderStyle BackColor="#333333" CssClass="GVFixedHeader" Font-Bold="True" ForeColor="White" />
                    </asp:GridView>
                    <br />
                    <br />
                </div>
            </div>
        </div>
    </form>
</body>
</html>
