<%@ page language="C#" autoeventwireup="true" inherits="SerialNoWiseDeliveryRpt, App_Web_cjp5ygzm" %>


<%@ Register Assembly="BasicFrame.WebControls.BasicDatePicker" Namespace="BasicFrame.WebControls" TagPrefix="BDP" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="CSS/bootstrap.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="col-md-12">
            <div class="row">
                <div class="col-md-1">
                    <br />
                    <asp:ImageButton ID="btnHome" runat="server" ImageUrl="~/images/Tohome.png" Height="35px"
                        Width="35px" PostBackUrl="~/Report.aspx" />
                </div>
                <div class="col-md-10">
                    <center><h3>Serial No. Wise Delivery Report</h3></center>
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
                                            
                                            <label class="col-md-1 control-label">DateRange</label>
                                    <div class="col-md-2">
                                        <BDP:BasicDatePicker ToolTip="Costing Approved Date" Width="50px" ID="DatePickerFromDate" runat="server" CssClass="form-control" />
                                       
                                    </div>
                                   <%--  <div class="col-md-3">
                                         &nbsp; &nbsp; &nbsp; &nbsp;
                                         </div>--%>
                                    <label class="col-md-1 control-label">To </label>
                                    <div class="col-md-2">
                                       
                                        <BDP:BasicDatePicker ToolTip="Costing Approved Date" ID="DatePickerToDate" runat="server" CssClass="form-control" />
                                    </div>
                                          
                                            <div class="col-md-3">
                                                <asp:Button ID="BtnSearch" CssClass="btn btn-info" Width="100px" runat="server" Text="Search" OnClick="btnSearch_Click" />
                                                <asp:Button ID="BtnSet" runat="server" CssClass="btn btn-warning" OnClick="BtnSet_Click" Text="Reset" Width="100px" />
                                            </div>
                                            <div class="col-md-3">
                                            <img src="images/Green.PNG" width="35" height="20" /> : Over Shipped</label>
                                            <img src="images/Pink.PNG" width="35" height="20" /> : Short Shipped</label>
                                                <img src="images/Blues.PNG" width="35" height="20" /> : Not Schedulued</label>
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
            <asp:GridView ID="GVSerialNoDeliveryRpt"  OnRowDataBound="GVSerialNoDeliveryRpt_RowDataBound"  OnSorting="GVSerialNoDeliveryRpt_Sorting" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC"
                BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" AllowSorting="True"
                Style="max-width: 100%; min-width: 90%; margin-bottom: 0px;" Font-Size="Small" EnableModelValidation="True">
                <Columns>
                    <asp:TemplateField HeaderText="Buyer" SortExpression="BuyerName" Visible="true">
                        <ItemTemplate>
                            <asp:Label ID="BuyerName" runat="server" Text='<%#Eval("BuyerName") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Sumithra Serial No" SortExpression="SSNo"  ControlStyle-Font-Bold="true" ControlStyle-ForeColor="#0066ff"  Visible="true">
                        <ItemTemplate>
                            <asp:Label ID="SSNo" runat="server" Text='<%#Eval("SSNo") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Style" SortExpression="StyleNo" Visible="true">
                        <ItemTemplate>
                            <asp:Label ID="StyleNo" runat="server" Text='<%#Eval("StyleNo") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Buyer PO No." SortExpression="BuyerPONo" Visible="true">
                        <ItemTemplate>
                            <asp:Label ID="BuyerPONo" runat="server" Text='<%#Eval("BuyerPONo") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Contract No." SortExpression="ContractNo" Visible="true">
                        <ItemTemplate>
                            <asp:Label ID="ContractNo" runat="server" Text='<%#Eval("ContractNo") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Color" SortExpression="ColorName" Visible="true">
                        <ItemTemplate>
                            <asp:Label ID="ColorName" runat="server" Text='<%#Eval("ColorName") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Extended ShipDate" SortExpression="ExtendedShipDate" Visible="true">
                        <ItemTemplate>
                            <asp:Label ID="ExtendedShipDate" runat="server" Text='<%#Eval("ExtendedShipDate","{0:dd/MMM/yyyy}") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Delivery Date" SortExpression="DeliveryDate" Visible="true">
                        <ItemTemplate>
                            <asp:Label ID="DeliveryDate" runat="server" Text='<%#Eval("DeliveryDate","{0:dd/MMM/yyyy}") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                     <asp:TemplateField HeaderText="Costing Approved Date" SortExpression="ApprovedDate" Visible="true">
                        <ItemTemplate>
                            <asp:Label ID="ApprovedDate" runat="server" Text='<%#Eval("ApprovedDate","{0:dd/MMM/yyyy}") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="WRH" SortExpression="WRH" Visible="true">
                        <ItemTemplate>
                            <asp:Label ID="WRH" runat="server" Text='<%#Eval("WRH") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Ship Mode" SortExpression="ShipMode" Visible="true">
                        <ItemTemplate>
                            <asp:Label ID="ShipMode" runat="server" Text='<%#Eval("ShipMode") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Plant" SortExpression="Plant" Visible="true">
                        <ItemTemplate>
                            <asp:Label ID="Plant" runat="server" Text='<%#Eval("Plant") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="BuyerPO Qty" SortExpression="BuyerPOQty" Visible="true">
                        <ItemTemplate>
                            <asp:Label ID="BuyerPOQty" runat="server" Text='<%#Eval("BuyerPOQty") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="SPO Qty" SortExpression="SumithraPOQty" Visible="true">
                        <ItemTemplate>
                            <asp:Label ID="SumithraPOQty" runat="server" Text='<%#Eval("SumithraPOQty") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Delivery No" SortExpression="DeliveryNo" Visible="true">
                        <ItemTemplate>
                            <asp:Label ID="DeliveryNo" runat="server" Text='<%#Eval("DeliveryNo") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Delivery Qty" SortExpression="DeliveryQty" Visible="true">
                        <ItemTemplate>
                            <asp:Label ID="DeliveryQty" runat="server" Text='<%#Eval("DeliveryQty") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Shipped Qty" SortExpression="ShippedQty" Visible="true">
                        <ItemTemplate>
                            <asp:Label ID="ShippedQty" runat="server" Text='<%#Eval("ShippedQty") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Varience" SortExpression="Varience" Visible="true">
                        <ItemTemplate>
                            <asp:Label ID="Varience" runat="server" Text='<%#Eval("Varience") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Comment" SortExpression="Comment" Visible="true">
                        <ItemTemplate>
                            <asp:Label ID="Comment" runat="server" Text='<%#Eval("Comment") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Short Reason" SortExpression="Remarks" Visible="true">
                        <ItemTemplate>
                            <asp:Label ID="Remarks" runat="server" Text='<%#Eval("Remarks") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                      <asp:TemplateField HeaderText="Partial Shipment" SortExpression="PartialShipment" Visible="true">
                        <ItemTemplate>
                            <asp:Label ID="PartialShipment" runat="server" Text='<%#Eval("PartialShipment") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="FOB" SortExpression="FOB" Visible="false">
                        <ItemTemplate>
                            <asp:Label ID="FOB" runat="server" Text='<%#Eval("FOB") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                     <asp:TemplateField HeaderText="DID" SortExpression="DID" Visible="true">
                        <ItemTemplate>
                            <asp:Label ID="DID" runat="server" Text='<%#Eval("DID") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
                <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
                <%-- <HeaderStyle Wrap="true" BackColor="#333333" Font-Bold="True" ForeColor="White" />--%>
                <FooterStyle BackColor="#333333" Font-Bold="True" ForeColor="White" CssClass="GVFixedFooter" />
                <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" CssClass="GVFixedHeader" />
            </asp:GridView>
        </div>
    </form>
</body>
</html>
