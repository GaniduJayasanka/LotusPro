<%@ page language="C#" autoeventwireup="true" inherits="ProdPlantChange, App_Web_cjp5ygzm" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>MSP Production Plant Change</title>
    <link href="CSS/bootstrap.css" rel="stylesheet" />

    <link href="CSS/jquery.autocomplete.css" rel="stylesheet" type="text/css" />
    <script src="js/jquery-1.4.1.min.js" type="text/javascript"></script>
    <script src="js/jquery.autocomplete.js" type="text/javascript"></script>

    <script type="text/javascript">
        $(document).ready(function () {
            $("#<%=txtStyle.ClientID%>").autocomplete('SearchStyle.ashx');
        });
    </script>

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
                            Width="35px" PostBackUrl="~/DataEntry.aspx" />
                        <asp:ImageButton ID="btnback" runat="server" ImageUrl="~/images/Back.png" Height="35px"
                            Width="35px" PostBackUrl="~/DataEntry.aspx" />
                    </div>
                    <div class="col-md-9">
                        <h4 style="text-align: center">Production Plant Change</h4>
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
                                        <label class="col-md-1 control-label">Style<span style="color: red">*</span> </label>
                                        <div class="col-md-2">
                                            <asp:TextBox ID="txtStyle" runat="server" CssClass="form-control" Width="200px"></asp:TextBox>
                                        </div>
                                        <div class="col-md-3">
                                            <asp:Button ID="BtnSearch" CssClass="btn btn-info" Width="100px" runat="server" Text="Search" OnClick="BtnSearch_Click" />
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
                    <asp:GridView ID="GVProdPlantUpdate" runat="server" ShowFooter="false" AutoGenerateColumns="False" BackColor="White" 
                        BorderColor="#999999" OnRowEditing="GVProdPlantUpdate_RowEditing" OnRowCancelingEdit="GVProdPlantUpdate_RowCancelingEdit"
                        OnRowUpdating="GVProdPlantUpdate_RowUpdating" OnRowDataBound="GVProdPlantUpdate_RowDataBound"
                        BorderWidth="2px" RowStyle-Height="35px" ForeColor="Black" FooterStyle-HorizontalAlign="Right" AllowSorting="True"
                        Style="max-width: 100%; font-size: small; min-width: 90%"
                        EnableModelValidation="True" Width="980px">
                        <Columns>
                            <asp:TemplateField HeaderText="DID" SortExpression="" Visible="true">
                                <ItemTemplate>
                                    <asp:Label ID="DID" runat="server" Text='<%#Eval("DID") %>'></asp:Label>
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
                            <asp:TemplateField HeaderText="Color" SortExpression="" Visible="true">
                                <ItemTemplate>
                                    <asp:Label ID="ColorName" runat="server" Text='<%#Eval("ColorName") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Committed Qty" SortExpression="" Visible="true">
                                <ItemTemplate>
                                    <asp:Label ID="PaymentStatus" runat="server" Text='<%#Eval("DeliveryQty") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="SPO Qty" SortExpression="" Visible="false">
                                <ItemTemplate>
                                    <asp:Label ID="Verification" runat="server" Text='<%#Eval("SumithraPOQty") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Plant" SortExpression="" Visible="true">
                                <ItemTemplate>
                                    <asp:Label ID="BOI" runat="server" Text='<%#Eval("ScheduledFactory") %>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                   
                                     <asp:DropDownList id="DDLPlant" runat="server" />
                                          
                                    <%--<asp:DropDownList ID="DDLPlant" runat="server" Width="55px">
                                    <asp:ListItem Value=""></asp:ListItem>
                                    <asp:ListItem Value="1">SUB</asp:ListItem>
                                    <asp:ListItem Value="2">SP</asp:ListItem>
                                    <asp:ListItem Value="3">SW</asp:ListItem>
                                    <asp:ListItem Value="4">SH</asp:ListItem>
                                    <asp:ListItem Value="5">SN</asp:ListItem></asp:DropDownList>--%>
                                </EditItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="" ItemStyle-HorizontalAlign="Center">
                                <ItemTemplate>
                                    <asp:Button ID="BtnEdit" runat="server" CommandName="Edit" CssClass="btn btn-primary"
                                        Font-Names="Times New Roman" Height="30px" Text="Edit"
                                        Width="70px" />
                                    <%-- CommandArgument="<%# ((GridViewRow) Container).RowIndex %>"--%>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:Button ID="BtnCancel" runat="server" CommandName="Cancel"
                                        CssClass="btn btn-danger" Font-Names="Times New Roman" Height="30px"
                                        Text="Cancel" Width="70px" />
                                    <asp:Button ID="BtnRefund" runat="server" CommandName="Update"
                                        CssClass="btn btn-success" Font-Names="Times New Roman"
                                        Height="30px" Text="Update" Width="70px" />
                                </EditItemTemplate>
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
