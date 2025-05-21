<%@ page language="C#" autoeventwireup="true" inherits="EmailDebitNote, App_Web_1sts43su" %>


<%@ Register Assembly="BasicFrame.WebControls.BasicDatePicker" Namespace="BasicFrame.WebControls" TagPrefix="BDP" %>
<%--<%@ Register Assembly="TimePicker" Namespace="MKB.TimePicker" TagPrefix="cc1" %>--%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">


    <title>Email - Debit Note Approved </title>
    <link href="CSS/SPSStyle.css" rel="stylesheet" />
    <link href="CSS/bootstrap.css" rel="stylesheet" />
    <link href="CSS/font-awesome.css" rel="stylesheet" />

    <script language="javascript" type="text/javascript">
        function AssignExportHTML() {
            document.getElementById("<%= GVDebitNoteApproved.ClientID %>").value = htmlEscape(forExport.innerHTML);
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
                                    <asp:GridView ID="GVDebitNoteApproved"     runat="server" AutoGenerateColumns="False" Font-Size="14px" Width="100%" EnableModelValidation="True">
                                        <HeaderStyle BackColor="#333333" ForeColor="White" />
                                        <Columns>
                                           

                                            <asp:TemplateField HeaderText="DB NOTE" SortExpression="Plant">
                                                <ItemTemplate>
                                                    <asp:Label ID="DBNOTE" runat="server" Text='<%# Eval("DBNOTE") %>' />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Buyer">
                                                <ItemTemplate>
                                                    <asp:Label ID="LblBuyerName" runat="server" Text='<%# Eval("Buyer") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>

                                            <asp:TemplateField HeaderText="Style">
                                                <ItemTemplate>
                                                    <asp:Label ID="LblStyle" runat="server" Text='<%# Eval("STYLE") %>' />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="ITEM">
                                                <ItemTemplate>
                                                    <asp:Label ID="ITEM" runat="server" Text='<%# Eval("ITEM") %>' />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="COMMENT" Visible="true">
                                                <ItemTemplate>
                                                    <asp:Label ID="COMMENT" runat="server" Text='<%# Eval("COMMENT") %>' />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                        
                                              <asp:TemplateField HeaderText="Merchandiser" >
                                                <ItemTemplate>
                                                    <asp:Label ID="Merchandiser" runat="server" Text='<%# Eval("Merchandiser") %>' />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                           <asp:TemplateField HeaderText="DB NOTE DATE" >
                                                <ItemTemplate>
                                                    <asp:Label ID="DB_NOTE_DATE" runat="server" Text='<%# Eval("DB_NOTE_DATE") %>' />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                             <asp:TemplateField HeaderText="Against" >
                                                <ItemTemplate>
                                                    <asp:Label ID="AGAINST" runat="server" Text='<%# Eval("AGAINST") %>' />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                             <asp:TemplateField HeaderText="FINAL APPROVER COMMENT" >
                                                <ItemTemplate>
                                                    <asp:Label ID="FINALAPPROVERCOMMENT" runat="server" Text='<%# Eval("FINALAPPROVERCOMMENT") %>' />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                             <asp:TemplateField HeaderText="Quantity" ItemStyle-HorizontalAlign="Right">
                                                <ItemTemplate>
                                                    <asp:Label ID="QUANTITY" runat="server" Text='<%# Eval("QUANTITY") %>' />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                             <asp:TemplateField HeaderText="Amount" ItemStyle-HorizontalAlign="Right">
                                                <ItemTemplate>
                                                    <asp:Label ID="AMOUNT" runat="server" Text='<%# Eval("AMOUNT") %>' />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                             <asp:TemplateField HeaderText="Currency" >
                                                <ItemTemplate>
                                                    <asp:Label ID="CURRENCY" runat="server" Text='<%# Eval("CURRENCY") %>' />
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

