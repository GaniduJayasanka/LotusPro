<%@ page language="C#" autoeventwireup="true" inherits="ShipmentCancellationRequest, App_Web_10bhy3il" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Shipment Cancellation Request</title>
    <link href="CSS/bootstrap.css" rel="stylesheet" />
       <script src="js/jquery-1.4.1.min.js" type="text/javascript"></script>
    <script type="text/javascript" src="js/jQuery-1.8.3.js"></script>
    <script src="js/jquery.autocomplete.js" type="text/javascript"></script>
    <link href="CSS/jquery.autocomplete.css" rel="stylesheet" type="text/css" />
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
            <div class="row">
                <div class="col-md-1">
                    <br />
                    <asp:ImageButton ID="btnHome" runat="server" ImageUrl="~/images/Tohome.png" Height="35px"
                        Width="35px" OnClick="btnHome_Click" />
                </div>
                <div class="col-md-11">
                    <center><h3>Shipment Cancellation Request</h3></center>
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
                                            <div class="col-md-4">
                                              <asp:TextBox ID="txtStyle" runat="server" CssClass="form-control" ></asp:TextBox>
                                            </div>
                                            <div class="col-md-2">
                                                <asp:Button ID="BtnSearch" runat="server" CssClass="btn btn-info" OnClick="BtnSearch_Click" Text="Find" Width="50px" />
                                                <asp:Button ID="BtnReset" runat="server" CssClass="btn btn-warning" OnClick="BtnReset_Click" Text="Reset" Width="60px" />
                                              
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
         <div class="col-md-11">
            <div class="form-group">
                
                <label class="col-md-2 control-label">
                    <img src="images/offWhite.PNG" width="35" height="20" />
                    : Cancelled</label>
                <label class="col-md-3 control-label">
                    <img src="images/brown.PNG" width="35" height="20" />
                    : Cancel Requested</label>
               

            </div>
        </div>
          <div class="col-md-12">
            <div id="DivRoot" align="left">
                <div style="overflow: hidden;" id="DivHeaderRow">
                </div>
                <div>
                      <asp:GridView ID="GVMSPDeliveries" runat="server" OnRowDataBound="GVMSPDeliveries_RowDataBound"
                                        AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC"
                                        BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black"
                                        AllowSorting="True" Font-Size="Small"
                                        EnableModelValidation="True" Width="1272px">
                                        <Columns>
                                             <asp:TemplateField HeaderText="DID" Visible="true">
                                                <ItemTemplate>
                                                    <asp:Label ID="DID" runat="server" Text='<%#Eval("DID") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            
                                            <asp:BoundField DataField="OrderNo" HeaderText="OrderNo" Visible="false" />
                                            <asp:BoundField DataField="BPOID" HeaderText="BPOID" Visible="false" />
                                            <asp:BoundField DataField="SDID" HeaderText="SDID" Visible="false" />
                                            <asp:BoundField DataField="SDSEQ" HeaderText="SDSEQ" Visible="false" />
                                            <asp:BoundField DataField="Main" HeaderText="Main" Visible="false" />
                                            <asp:BoundField DataField="MDID" HeaderText="MDID" Visible="false" />
                                           
                                            <asp:TemplateField HeaderText="Buyer" Visible="false">
                                                <ItemTemplate>
                                                    <asp:Label ID="BuyerName" runat="server" Text='<%#Eval("BuyerName") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                           
                                         
                                            <asp:TemplateField HeaderText="Plant" ItemStyle-Width="3%">
                                                <ItemTemplate>
                                                    <asp:Label ID="Scheduled" ToolTip="Plant" runat="server" Text='<%#Eval("Plant") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Buyer" ItemStyle-Width="5%">
                                                <ItemTemplate>
                                                    <asp:Label ID="BuyerCode" ToolTip="Buyer" runat="server" Text='<%#Eval("BuyerCode") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Style" ItemStyle-Width="7%">
                                                <ItemTemplate>
                                                    <asp:Label ID="StyleNo" ToolTip="Style" Font-Size="Small" runat="server" Text='<%#Eval("StyleNo") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Buyer PO No" ItemStyle-Width="7%">
                                                <ItemTemplate>
                                                    <asp:Label ID="BuyerPONo" ToolTip="Buyer PO No" Font-Size="Small" runat="server" Text='<%#Eval("BuyerPONo") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Contract No" ItemStyle-Width="7%">
                                                <ItemTemplate>
                                                    <asp:Label ID="ContractNo" ToolTip="ContractNo" Font-Size="Small" runat="server" Text='<%#Eval("ContractNo") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Color" ItemStyle-Width="7%">
                                                <ItemTemplate>
                                                    <asp:Label ID="ColorName" ToolTip="Color" Font-Size="Small" runat="server" Text='<%#Eval("ColorName") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                           
                                            <asp:TemplateField HeaderText="BPO Qty" ItemStyle-HorizontalAlign="Right" ItemStyle-Width="6%">
                                                <ItemTemplate>
                                                    <asp:Label ID="BuyerPOQty" ToolTip="BPO Qty" Font-Bold="true" runat="server" Text='<%#Eval("BPOQty") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="SPO Qty" ItemStyle-HorizontalAlign="Right" Visible="true" ItemStyle-Width="5%">
                                                <ItemTemplate>
                                                    <asp:Label ID="SumithraPOQty" ToolTip="SPO Qty" runat="server" Text='<%#Eval("SumithraPOQty") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                           <asp:TemplateField HeaderText="Committed Qty" ItemStyle-HorizontalAlign="Right" ItemStyle-Width="3%">
                                                <ItemTemplate>
                                                    <asp:Label ID="DeliveryQty" ToolTip="Committed Qty" runat="server" Text='<%#Eval("DeliveryQty") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Buyer's PO Date" ItemStyle-HorizontalAlign="Right" ItemStyle-Width="7%">
                                                <ItemTemplate>
                                                    <asp:Label ID="ShipDate" runat="server"  Text='<%#Eval("ExtendedShipDate","{0:dd/MMM/yyyy}") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Committed Date" ItemStyle-Width="100" Visible="true">
                                                <ItemTemplate>
                                                    <asp:Label ID="DeliveryDate"  runat="server" Text='<%#Eval("DeliveryDate","{0:dd/MMM/yyyy}") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Del#" ItemStyle-Width="3%">
                                                <ItemTemplate>
                                                  <asp:Label ID="DeliveryNo" runat="server" Text='<%#Eval("DeliveryNo") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                          
                                            <asp:TemplateField HeaderText="Comment" ItemStyle-Width="8%">
                                                <ItemTemplate>
                                                    <asp:Label ID="Comment" ToolTip="Comment" Font-Size="Small" runat="server" Text='<%#Eval("Comment") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            
                                           <asp:TemplateField HeaderText="Cancel Remarks" Visible="true" SortExpression="Comment">
                                <ItemTemplate>
                                    <%--<asp:TextBox ID="txtcancelRemarks" runat="server"  Text='<%#Eval("CancelRemarks") %>'  Width="200px" />--%>
                                    <asp:DropDownList ID="DDLCancelRemarks" runat="server" Width="200px">
                                        <asp:ListItem Value="0">Choice Offer</asp:ListItem>
                                        <asp:ListItem Value="1">Stock Lot Buyer Offer</asp:ListItem>
                                        <asp:ListItem Value="2">Other</asp:ListItem>
                                    </asp:DropDownList>

                                     <asp:Label ID="lblCancelRemark" runat="server" Visible="true" Text='<%#Eval("CancelRemarks") %>'></asp:Label>

                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Shipment Cancellation" SortExpression="">
                                <ItemTemplate>
                                    <asp:ImageButton ID="imgbtnSHipmentCancel" OnClick="imgbtnSHipmentCancel_Click" runat="server" Height="40px" ImageUrl="~/images/CancelShip.png" ToolTip="Shipment Cancellation" Width="55px" />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Cancel" Visible="false" SortExpression="Cancel">
                                <ItemTemplate>
                                    <asp:Label ID="Cancel" runat="server" Visible="true" Text='<%#Eval("Cancel") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="CancelRequest" Visible="false" SortExpression="Cancel">
                                <ItemTemplate>
                                    <asp:Label ID="CancelRequest" runat="server" Visible="true" Text='<%#Eval("CancelRequest") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                           
                                        
                                        </Columns>
                                        <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
                                        <FooterStyle BackColor="#333333" Font-Bold="True" ForeColor="White" CssClass="GVFixedFooter" />
                                        <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" CssClass="GVFixedHeader" />
                                    </asp:GridView>
                    </div>
                </div>
              </div>
        <div>
        </div>
        <div >
            <asp:Label ID="lblOrderNo" runat="server" Text="" Visible="false"></asp:Label>
             <asp:Label ID="lblUserID" runat="server" Text="" Visible="false"></asp:Label>
        </div>
    </form>
</body>
</html>
