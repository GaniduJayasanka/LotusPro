<%@ page language="C#" autoeventwireup="true" inherits="DailyShipments, App_Web_euilynsb" %>

<%@ Register Assembly="BasicFrame.WebControls.BasicDatePicker" Namespace="BasicFrame.WebControls" TagPrefix="BDP" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Daily Shipments List</title>
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

    <script type="text/javascript">
        $(document).ready(function () {
            $("#<%=txtStyle.ClientID%>").autocomplete('SearchStyle.ashx');
        });
    </script>
       
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
                    <asp:ImageButton ID="btnHome" OnClick="btnHome_Click" runat="server" ImageUrl="~/images/Tohome.png" Height="35px"
                        Width="35px"  />
                      <asp:ImageButton ID="btnHelp" runat="server" ImageUrl="~/images/help.png" Height="35px"
                        Width="35px" OnClick="btnHelp_Click" />
                </div>


                <div class="col-md-11">
                    <center><h3>Daily Shipments List</h3></center>
                  
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
                                            <label class="col-md-1 control-label">Date</label>
                                            <div class="col-md-2">
                                                <span class="auto-style1"></span>
                                              <BDP:BasicDatePicker ID="DatePickerFromDate" ToolTip="Commited Date" runat="server" CssClass="form-control" />   
                                            </div>

                                            <label class="col-md-1 control-label">Style</label>
                                            <div class="col-md-2">
                                            <span class="auto-style1"></span>
                                            <asp:TextBox ID="txtStyle" CssClass="form-control" runat="server"></asp:TextBox>
                                            </div>                                            
                                       
                                            <div class="col-md-3">
                                                <asp:Button ID="BtnSearch" runat="server" CssClass="btn btn-primary"  Text="Find" Width="100px" OnClick="BtnSearch_Click" />
                                                <asp:Button ID="btnReset"  runat="server" CssClass="btn btn-warning" Text="Reset" Width="100px" OnClick="btnReset_Click" />
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
        <div class="col-md-12">
            <div id="DivRoot" align="left">
                
                <div>
                    <asp:GridView ID="GVMSizeDetails" FooterStyle-Font-Bold="true" runat="server" AllowSorting="True" 
                        AutoGenerateColumns="False" BackColor="White" BorderColor="#cccccc" BorderWidth="2px" CellPadding="4"
                         EnableModelValidation="True" Font-Size="Small" ForeColor="Black" Height="96px"  > 
                   
                        <Columns>
                            <asp:TemplateField HeaderText="          " >
                        <ItemTemplate>
                            <asp:Button ID="btnAddSize"  runat="server" Text="Add Size Wise FOB"  CssClass="btn btn-success"  OnClick="btnAddSize_Click" />
                        </ItemTemplate>
                    </asp:TemplateField>
                             <asp:TemplateField HeaderText="DID"  Visible="true">
                                <ItemTemplate>
                                    <asp:Label ID="DID" runat="server" Text='<%#Eval("DID") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
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
                            <asp:TemplateField HeaderText="Style"  Visible="true">
                                <ItemTemplate>
                                    <asp:Label ID="Style" runat="server" Text='<%#Eval("Style") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="BuyerPO" Visible="true">
                        <ItemTemplate>
                            <asp:Label ID="BuyerPO" runat="server"  Text='<%#Eval("BuyerPO") %>' ></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                          <asp:TemplateField HeaderText="Color" Visible="true">
                                                <ItemTemplate>
                                                    <asp:Label ID="Color" runat="server" Text='<%# Eval("Color") %>' />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            
                                            <asp:TemplateField HeaderText="Buyer PO Qty" ItemStyle-HorizontalAlign="Right">
                                                <ItemTemplate>
                                                    <asp:Label ID="BuyerPOQty"  Font-Bold="true" Font-Size="Large"  runat="server" Text='<%# Eval("BuyerPOQty") %>' />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Sumithra PO Qty" Visible="false" ItemStyle-HorizontalAlign="Right">
                                                <ItemTemplate>
                                                    <asp:Label ID="SumithraPOQty" runat="server" Text='<%# Eval("SumithraPOQty") %>' />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Commited Qty" ItemStyle-HorizontalAlign="Right">
                                                <ItemTemplate>
                                                    <asp:Label ID="CommitedQty" runat="server" Text='<%# Eval("CommitedQty") %>' />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Shipped Qty" ItemStyle-HorizontalAlign="Right">
                                                <ItemTemplate>
                                                    <asp:Label ID="ShippedQty" runat="server" Text='<%# Eval("ShippedQty") %>' />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Short/Over Variance" ItemStyle-HorizontalAlign="Right">
                                                <ItemTemplate>
                                                    <asp:Label ID="Variance" runat="server" Text='<%# Eval("Variance") %>' />
                                                </ItemTemplate>
                                            </asp:TemplateField>

                                            <asp:TemplateField HeaderText="   FOB + Upcharge ($)   " ItemStyle-HorizontalAlign="Right" Visible="true" SortExpression="FOB">
                                                <ItemTemplate>
                                                    <asp:Label ID="FOB" runat="server" Text='<%#Eval("FOBWithUpcharge","{0:n}") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                        </Columns>
                        <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
                        <%-- <HeaderStyle Wrap="true" BackColor="#333333" Font-Bold="True" ForeColor="White" />--%>
                        <FooterStyle BackColor="#333333" Font-Bold="True" ForeColor="White" CssClass="GVFixedFooter" />
                        <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" CssClass="GVFixedHeader" />
                    </asp:GridView>
                </div>
                <div>
                   
                </div>
               
                
               
                <div id="DivFooterRow" style="overflow: hidden">
                    <asp:Label ID="lblDID" Visible="false" runat="server" Text="Label"></asp:Label>
                    <asp:Label ID="Label2" Visible="false" runat="server" Text="Label"></asp:Label>
                </div>
            </div>
           
        </div>
        
    </form>
</body>
</html>

