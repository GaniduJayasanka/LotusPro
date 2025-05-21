<%@ page language="C#" autoeventwireup="true" inherits="SizeWiseFOB, App_Web_10bhy3il" %>

<%@ Register Assembly="BasicFrame.WebControls.BasicDatePicker" Namespace="BasicFrame.WebControls" TagPrefix="BDP" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Size Wise FOB</title>
    <link href="CSS/bootstrap.css" rel="stylesheet" />

    <script src="js/jquery-1.9.1.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/jquery.min.js"></script>

    <script src="js/jquery-1.4.1.min.js" type="text/javascript"></script>
    <script type="text/javascript" src="js/jQuery-1.8.3.js"></script>
    <script src="js/bootstrap.min.js" type="text/javascript"></script>
    <script src="js/jquery.autocomplete.js" type="text/javascript"></script>
    <link href="CSS/jquery.autocomplete.css" rel="stylesheet" type="text/css" />
    <link href="CSS/jquery.ui.all.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
        <asp:ToolkitScriptManager ID="ScriptManager1" runat="server">
        </asp:ToolkitScriptManager>
        <asp:HiddenField ID="hfRemainingValue" runat="server" />
        <div class="col-md-12">
            <div class="row">
                <div class="col-md-1">
                    <br />
                    <asp:ImageButton ID="btnHome" runat="server" ImageUrl="~/images/Tohome.png" Height="35px"
                        Width="35px" OnClick="btnHome_Click" />
                </div>
                <div class="col-md-11">
                    <center><h3>Size Wise FOB</h3></center>
                </div>
            </div>
        </div>
        <asp:Panel ID="pnlsearch" runat="server">
            <div class="col-md-12">
                <div class="row">
                    <div class="col-md-12">
                        <div class="panel panel-default">
                            <div class="panel-body">
                                <div class="row">
                                    <div class="box-body">
                                        <div class="form-group">
                                            <label class="col-md-1 control-label">Style</label>
                                            <div class="col-md-2">
                                                <span class="auto-style1"></span>
                                                <asp:Label ID="lblStyle" runat="server" Text="Label"></asp:Label>
                                            </div>
                                            <label class="col-md-1 control-label">Buyer PO</label>
                                            <div class="col-md-2">
                                                <span class="auto-style1"></span>
                                                <asp:Label ID="lblBuyerPO" runat="server" Text="Label"></asp:Label>
                                            </div>
                                            <label class="col-md-2 control-label">Common FOB</label>
                                            <div class="col-md-1">
                                             <asp:CheckBox ID="chkCommonValue" AutoPostBack="true" runat="server" OnCheckedChanged="chkCommonValue_CheckedChanged" />
                                           &nbsp;&nbsp;
                                                <asp:TextBox ID="txtCommonValue" Width="50px" runat="server" AutoPostBack="true" OnTextChanged="txtCommonValue_TextChanged"></asp:TextBox>
                                              </div>
                                            <%--   <label class="col-md-1 control-label">Color </label>
                                            <div class="col-md-2">
                                            
                                                  <asp:Label ID="lblColor" runat="server" Text="Label"></asp:Label>
                                            </div>--%>
                                            <div class="col-md-2">
                                                <asp:Button ID="BtnSearch" OnClientClick="" runat="server" CssClass="btn btn-success" Text="Save"  OnClick="BtnSearch_Click" />
                                                <asp:Button ID="btnReset" runat="server" CssClass="btn btn-warning" Text="Reset"  OnClick="btnReset_Click" />
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </asp:Panel>
        <div>
            <div id="DivRoot">
                <div>
                    <div class="col-md-12">
                        <div class="row">
                            <div class="col-md-1"></div>
                            <div class="col-md-10">
                                <asp:GridView ID="GVMSizeDetails" OnRowDataBound="GVMSizeDetails_RowDataBound" FooterStyle-Font-Bold="true" runat="server" AllowSorting="True"
                                    AutoGenerateColumns="False" BackColor="White" BorderColor="#cccccc" BorderWidth="2px" CellPadding="4"
                                    EnableModelValidation="True" Font-Size="Small" ForeColor="Black" Height="96px" ShowFooter="true" Width="706px">
                                    <Columns>
                                        <asp:TemplateField HeaderText="OrderNo" Visible="false">
                                            <ItemTemplate>
                                                <asp:Label ID="OrderNo" runat="server" Text='<%#Eval("OrderNo") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="BPOID" Visible="false">
                                            <ItemTemplate>
                                                <asp:Label ID="BPOID" runat="server" Text='<%#Eval("BPOID") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="DID" Visible="true">
                                            <ItemTemplate>
                                                <asp:Label ID="DID" runat="server" Text='<%#Eval("DID") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Size" Visible="true">
                                            <ItemTemplate>
                                                <asp:Label ID="SizeDesc" runat="server" Text='<%#Eval("SizeDesc") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Qty" ItemStyle-HorizontalAlign="Right" Visible="true">
                                            <ItemTemplate>
                                                <asp:Label ID="Qty" runat="server" Text='<%#Eval("Qty") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Average FOB + Upcharge" ItemStyle-HorizontalAlign="Right" Visible="true">
                                            <ItemTemplate>
                                                <asp:Label ID="FC" runat="server" Text=' <%#Eval("FC","{0:n}")%>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Average Value" HeaderStyle-HorizontalAlign="Right" ItemStyle-HorizontalAlign="Right" Visible="true">
                                            <ItemTemplate>
                                                <asp:Label ID="AverageValue" runat="server" Text=' <%#Eval("AverageValue","{0:n4}")%>'></asp:Label>
                                            </ItemTemplate>
                                            <FooterTemplate>
                                                <div>
                                                    <asp:Label ID="lblTTLAverageValue" runat="server" />
                                                </div>
                                            </FooterTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Actual FOB" HeaderStyle-HorizontalAlign="Right" ItemStyle-HorizontalAlign="Right" Visible="true">
                                            <ItemTemplate>
                                                <asp:TextBox ID="ActualFOB" AutoPostBack="true" OnTextChanged="ActualFOB_TextChanged" runat="server" Text='<%#Eval("FC") %>'></asp:TextBox>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Actual Value" HeaderStyle-HorizontalAlign="Right" ItemStyle-HorizontalAlign="Right" Visible="true">
                                            <ItemTemplate>
                                                <asp:Label ID="ActualValue" runat="server" Text=' <%#Eval("AverageValue","{0:n4}")%>'></asp:Label>
                                            </ItemTemplate>
                                            <FooterTemplate>
                                                <div>
                                                    <asp:Label ID="lblTTLActualValue" runat="server" />
                                                </div>
                                            </FooterTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                    <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
                                    <%-- <HeaderStyle Wrap="true" BackColor="#333333" Font-Bold="True" ForeColor="White" />--%>
                                    <FooterStyle HorizontalAlign="Right" BackColor="#333333" Font-Bold="True" ForeColor="White" CssClass="GVFixedFooter" />
                                    <HeaderStyle BackColor="#333333" HorizontalAlign="Right" Font-Bold="True" ForeColor="White" CssClass="GVFixedHeader" />
                                </asp:GridView>
                            </div>
                        </div>
                    </div>
                </div>
                <div>
                </div>
                <div id="DivFooterRow" style="overflow: hidden">
                    <asp:Label ID="lblDID" Visible="false" runat="server" Text="0"></asp:Label>
                    <asp:Label ID="lblExtRecCount" Visible="false" runat="server" Text="0"></asp:Label>
                    <asp:Label ID="lblOrderNo" Visible="false" runat="server" Text="0"></asp:Label>
                    <asp:Label ID="lblBPOID" Visible="false" runat="server" Text="0"></asp:Label>
                    <asp:Label ID="lblBPOSEQ" Visible="false" runat="server" Text="0"></asp:Label>
                    <asp:Label ID="lblSDID" Visible="false" runat="server" Text="0"></asp:Label>
                    <asp:Label ID="lblSDSEQ" Visible="false" runat="server" Text="0"></asp:Label>
                </div>
            </div>
        </div>
    </form>
</body>
</html>

