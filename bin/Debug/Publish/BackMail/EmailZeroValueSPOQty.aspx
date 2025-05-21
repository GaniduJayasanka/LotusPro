<%@ page language="C#" autoeventwireup="true" inherits="EmailZeroValueSPOQty, App_Web_1sts43su" %>

<%@ Register Assembly="BasicFrame.WebControls.BasicDatePicker" Namespace="BasicFrame.WebControls" TagPrefix="BDP" %>
<%--<%@ Register Assembly="TimePicker" Namespace="MKB.TimePicker" TagPrefix="cc1" %>--%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">


    <title>Email - Zero SPO Qty </title>
    <link href="CSS/SPSStyle.css" rel="stylesheet" />
    <link href="CSS/bootstrap.css" rel="stylesheet" />
    <link href="CSS/font-awesome.css" rel="stylesheet" />

    <script language="javascript" type="text/javascript">
        function AssignExportHTML() {
            document.getElementById("<%= GVZeroValueSpo.ClientID %>").value = htmlEscape(forExport.innerHTML);
        }
        function htmlEscape(str) {
            return String(str)
            .replace(/&/g, '&amp;')
            .replace(/"/g, '&quot;')
            .replace(/'/g, '&#39;')
            .replace(/</g, '&lt;')
            .replace(/>/g, '&gt;');
        }
    </script>

</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
        <div id="divExport" runat="server">


            <div>
                <br />
                <asp:Panel ID="PnlReport" runat="server" Visible="true">
                    <div class="col-sm-12">
                        <div class="panel panel-default">
                            <div class="form-group">
                                <div>
                                    <asp:GridView ID="GVZeroValueSpo"     runat="server" AutoGenerateColumns="False" Font-Size="14px" Width="100%" EnableModelValidation="True">
                                        <HeaderStyle BackColor="#333333" ForeColor="White" />
                                        <Columns>
                                           

                                            <asp:TemplateField HeaderText="Plant" SortExpression="Plant">
                                                <ItemTemplate>
                                                    <asp:Label ID="Plant" runat="server" Text='<%# Eval("Plant") %>' />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Buyer Name">
                                                <ItemTemplate>
                                                    <asp:Label ID="LblBuyerName" runat="server" Text='<%# Eval("Buyer") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>

                                            <asp:TemplateField HeaderText="Style">
                                                <ItemTemplate>
                                                    <asp:Label ID="LblStyle" runat="server" Text='<%# Eval("StyleNo") %>' />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Buyer PO">
                                                <ItemTemplate>
                                                    <asp:Label ID="BuyerPO" runat="server" Text='<%# Eval("BuyerPO") %>' />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Contract No" Visible="true">
                                                <ItemTemplate>
                                                    <asp:Label ID="ContractNo" runat="server" Text='<%# Eval("ContractNo") %>' />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Color" Visible="true">
                                                <ItemTemplate>
                                                    <asp:Label ID="Color" runat="server" Text='<%# Eval("Color") %>' />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            
                                            <asp:TemplateField HeaderText="Buyer PO Qty" ItemStyle-HorizontalAlign="Right">
                                                <ItemTemplate>
                                                    <asp:Label ID="BuyerPOQty"  Font-Bold="true" Font-Size="Large"  runat="server" Text='<%# Eval("BPOQty") %>' />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Sumithra PO Qty" ItemStyle-HorizontalAlign="Right">
                                                <ItemTemplate>
                                                    <asp:Label ID="SumithraPOQty" runat="server" Text='<%# Eval("SumithraPOQty") %>' />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                           <asp:TemplateField HeaderText="Line In Date" ItemStyle-HorizontalAlign="Right">
                                                <ItemTemplate>
                                                    <asp:Label ID="LineInDate" runat="server" Text='<%# Eval("LineInDate") %>' />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                              <asp:TemplateField HeaderText="Merchandiser" ItemStyle-HorizontalAlign="Right">
                                                <ItemTemplate>
                                                    <asp:Label ID="Merchandiser" runat="server" Text='<%# Eval("Merchandiser") %>' />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                           
                                        </Columns>
                                    </asp:GridView>
                                </div>
                               
                                <asp:Label ID="LblOTRID" runat="server" Text="" Visible="false"></asp:Label>
                                <asp:Label ID="LblOTRIDs" runat="server" Text="" Visible="false"></asp:Label>
                                <asp:Label ID="lblStarting" runat="server" Text="Label" Visible="false"></asp:Label>
                                <asp:Label ID="lblEnding" runat="server" Text="Label" Visible="false"></asp:Label>
                                <asp:Label ID="lblUserID" runat="server" Text="0" Visible="false"></asp:Label>
                                <asp:Label ID="lblEmpID" runat="server" Text="0" Visible="false"></asp:Label>
                            </div>
                        </div>
                    </div>
                </asp:Panel>
            </div>

        </div>
    </form>
</body>
</html>

