<%@ page language="C#" autoeventwireup="true" inherits="partialShipments, App_Web_10bhy3il" %>

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
                </div>


                <div class="col-md-11">
                    <center><h3>Partial Shipment</h3></center>
                  
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
                                            <label class="col-md-1 control-label">To</label>
                                            <div class="col-md-2">
                                                <span class="auto-style1"></span>
                                              <BDP:BasicDatePicker ID="DatePickerToDate" ToolTip="Commited Date" runat="server" CssClass="form-control" />   
                                            </div>

                                            <label class="col-md-1 control-label">From</label>
                                            <div class="col-md-2">
                                            <span class="auto-style1">
                                                <BDP:BasicDatePicker ID="DatePickerFromDate" runat="server" CssClass="form-control" ToolTip="Commited Date" />
                                                </span>
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
                    <asp:GridView ID="GVMSPShedule" runat="server"  DataKeyNames="OrderNo" AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" 
                BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" 
                AllowSorting="True" Style="max-width: 100%; min-width: 90%" Font-Size="Small"
                EnableModelValidation="True" >
               
                <Columns>
            
                              <asp:TemplateField HeaderText="DID" SortExpression="" Visible="true">
                        <ItemTemplate>
                            <asp:Label ID="DID" ToolTip="DID" runat="server" Text='<%#Eval("DID") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="BPOID" SortExpression="" Visible="false">
                        <ItemTemplate>
                            <asp:Label ID="BPOID"  runat="server" Text='<%#Eval("BPOID") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="OrderNo" SortExpression="" Visible="false">
                        <ItemTemplate>
                            <asp:Label ID="OrderNo" runat="server" Text='<%#Eval("OrderNo") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="BPOSEQ" SortExpression="" Visible="false">
                        <ItemTemplate>
                            <asp:Label ID="BPOSEQ" runat="server" Text='<%#Eval("BPOSEQ") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="SDID" SortExpression="" Visible="false">
                        <ItemTemplate>
                            <asp:Label ID="SDID" runat="server" Text='<%#Eval("SDID") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="SDSEQ" SortExpression="" Visible="false">
                        <ItemTemplate>
                            <asp:Label ID="SDSEQ" runat="server" Text='<%#Eval("SDSEQ") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
            
                    <asp:TemplateField HeaderText="Buyer" Visible="true">
                        <ItemTemplate>
                            <asp:Label ID="BuyerName" runat="server" Text='<%#Eval("BuyerName") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Style">
                        <ItemTemplate>
                            <asp:Label ID="StyleNo" runat="server" Text='<%#Eval("StyleNo") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                   <asp:TemplateField HeaderText="BPONo" Visible="true">
                        <ItemTemplate>
                            <asp:Label ID="BuyerPONo" ToolTip="BPONo" runat="server" Text='<%#Eval("BuyerPONo") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>                  
                    <asp:TemplateField HeaderText="Color" Visible="true">
                        <ItemTemplate>
                            <asp:Label ID="ColorName" runat="server" Text='<%#Eval("ColorName") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                  
                    <asp:TemplateField HeaderText="Contract #" Visible="true">
                        <ItemTemplate>
                            <asp:Label ID="Label1" ToolTip="Contract #" runat="server" Text='<%#Eval("ContractNo") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                     <asp:TemplateField HeaderText="Plant" Visible="true">
                        <ItemTemplate>
                            <asp:Label ID="lblPlant" ToolTip="Plant" runat="server" Text='<%#Eval("Plant") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Ex. Ship Date" Visible="true">
                        <ItemTemplate>
                            <asp:Label ID="ExtendedShipDate" ToolTip="Ex. Ship Date" runat="server"  Text='<%#Eval("ExtendedShipDate","{0:dd/MMM/yyyy}") %>' ></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                       <asp:TemplateField HeaderText="BPOQty" Visible="true">
                        <ItemTemplate>
                            <asp:Label ID="BPOQty" ToolTip="BPOQty" runat="server" Text='<%#Eval("BPOQty") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    
                     <asp:TemplateField HeaderText="SPOQty" Visible="true">
                        <ItemTemplate> 
                            <asp:Label ID="SumithraPOQty" ToolTip="SPOQty" runat="server" Text='<%#Eval("SumithraPOQty") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Del #" Visible="true">
                        <ItemTemplate>
                            <asp:Label ID="ContractNo" ToolTip="Del #" runat="server" Text='<%#Eval("DeliveryNo") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    
                     <asp:TemplateField HeaderText="Committed Qty" Visible="true">
                        <ItemTemplate>
                            <asp:Label ID="txtPromisedQty" ToolTip="Committed Qty" runat="server" Text='<%#Eval("DeliveryQty") %>'></asp:Label>
                                                   </ItemTemplate>
                    </asp:TemplateField>
                     <asp:TemplateField HeaderText="Committed Date" Visible="true">
                        <ItemTemplate>
                            <asp:Label ID="DeliveryDate" ToolTip="Committed Date" runat="server" Visible="true" Text='<%#Eval("DeliveryDate") %>'></asp:Label>
                          <%--  <BDP:BasicDatePicker  ID="BDPDeliveryDate"  Text='<%# Eval("DeliveryDate", "{0:dd/MM/yyyy}") %>'  runat="server" CssClass="form-control" />--%>
                        </ItemTemplate>
                    </asp:TemplateField>
                      <asp:TemplateField HeaderText="Shipped Qty" Visible="true">
                        <ItemTemplate>
                            <asp:Label ID="txtShippedQty" ToolTip="Shipped Qty" runat="server" Text='<%#Eval("ShippedQty") %>'></asp:Label>
                                                   </ItemTemplate>
                    </asp:TemplateField>
                     <asp:TemplateField HeaderText="Comment" Visible="true">
                        <ItemTemplate>                           
                            <asp:Label ID="txtgvComment" runat="server" Text='<%#Eval("Comment") %>' Width="300px" />
                        </ItemTemplate>
                    </asp:TemplateField>
                  
                    <asp:TemplateField HeaderText="rowcunts" Visible="false">
                        <ItemTemplate>                           
                            <asp:Label ID="rowcunts" runat="server" Text='<%#Eval("rowcunts") %>'  />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="DNo" Visible="false">
                        <ItemTemplate>                           
                            <asp:Label ID="DNo" runat="server" Text='<%#Eval("DNo") %>'  />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="RevisedDate" Visible="true">
                        <ItemTemplate>
                            <asp:Label ID="RevisedDate" runat="server" Visible="true" Text='<%#Eval("RevisedDate") %>'></asp:Label>
                           
                        </ItemTemplate>
                    </asp:TemplateField>

                     <asp:TemplateField HeaderText="Cancel" Visible="false">
                            <ItemTemplate>                           
                                <asp:Label ID="labCancel" runat="server" Visible="true" Text='<%#Eval("Cancel") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                                      <asp:TemplateField HeaderText="Cancel"  Visible="true">
                            <ItemTemplate>                           
                                <asp:Label ID="labCancelRemarks" Width="80px" runat="server" Visible="true" Text='<%#Eval("CancelRe") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>

                      <asp:TemplateField HeaderText="Status"  Visible="true">
                            <ItemTemplate>                           
                                <asp:Label ID="labstatus" Width="80px" runat="server" Visible="true" Text='<%#Eval("Pending") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>

                </Columns>
                <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
               <%-- <HeaderStyle Wrap="true" BackColor="#333333" Font-Bold="True" ForeColor="White" />--%>
                <FooterStyle BackColor="#333333" Font-Bold="True" ForeColor="White"  CssClass="GVFixedFooter"/>
                <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" CssClass="GVFixedHeader" />

            </asp:GridView>
                </div>
                <div>
                   
                </div>
               
                
               
                <div id="DivFooterRow" style="overflow: hidden">
                </div>
            </div>
           
        </div>
        
    </form>
</body>
</html>


