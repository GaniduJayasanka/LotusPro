<%@ page language="C#" autoeventwireup="true" inherits="AddSShipBPO, App_Web_b2ychy0x" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Buyer PO Updation</title>
    <link href="CSS/bootstrap.css" rel="stylesheet" />
    <link href="CSS/NewStyles.css" rel="stylesheet" />
    <link href="CSS/jquery.autocomplete.css" rel="stylesheet" type="text/css" />

    <script src="js/jquery.js" type="text/javascript"></script>
    <script src="js/jquery-1.4.1.min.js" type="text/javascript"></script>
    <script src="js/jquery.autocomplete.js" type="text/javascript"></script>

    <%--<link href="CSSS/SPSStyle.css" rel="stylesheet" />--%>

    <script type="text/javascript">
        $(document).ready(function () {
            $("#<%=TxtStyles.ClientID%>").autocomplete('SearchMNSStyle.ashx');
        });
    </script>

</head>
<body>
    <form id="form1" runat="server">
        <div class="col-md-12">
            <div class="col-md-2">
                <h2>
                    <asp:ImageButton ID="btnHome" runat="server" ImageUrl="~/images/Tohome.png" Height="25px"
                        Width="25px" PostBackUrl="~/BPOModificationHome.aspx" /></h2>
            </div>
            <div class="col-md-8">
                <center>
                    <h2>
                       Add Buyer PO</h2>
                </center>
            </div>
        </div>
        <asp:Panel ID="PnlSearch" runat="server">
              <div class="col-md-10">
                <label style="color:red">** Showing only the styles belongs to the Mark & Spencer buyer. (Please add BPOs only for the short shipped dispatches.)</label>
                </div>
            
            <div class="col-md-12">
                <div class="row">
                    <div class="col-md-12">
                        <div class="panel panel-default">
                            <div class="panel-body">
                                <div class="row">
                                    <div class="box-body">
                                        <div class="form-group">
                                            <div class="col-md-1">
                                                <label>Style:</label>
                                            </div>
                                            <div class="col-md-5">
                                                <asp:TextBox ID="TxtStyles" runat="server" CssClass="form-control" placeholder="Enter Style"></asp:TextBox>
                                            </div>
                                            &nbsp;<div class="col-md-3">
                                                <asp:Button ID="BtnSearch" runat="server" CssClass="btn btn-primary" Text="Search"
                                                    OnClick="BtnSearch_Click" Width="100px" />

                                                <asp:Button ID="BtnReset" runat="server" CssClass="btn btn-warning"
                                                    Text="Reset" Width="100px" OnClick="BtnReset_Click" />
                                             
                                                 <asp:ImageButton ImageUrl="images/view_all.png" runat="server" ToolTip="Shipments" OnClick="btnViewShip_Click" ID="btnViewShip" />
                                            </div>
                                            <div class="col-md-2">
                                                  <label>Short Shipment:</label>
                                                  <asp:Label ID="lblSShipment" runat="server" Visible="true"></asp:Label>
                                                <asp:Label ID="LblOrdNo" runat="server" Visible="false"></asp:Label>
                                                <asp:Label ID="LblStyleID" runat="server" Visible="false"></asp:Label>
                                                <asp:Label ID="LblPOID" runat="server" Visible="false"></asp:Label>
                                                <asp:Label ID="LblStyleSeq" runat="server" Visible="false"></asp:Label>
                                            </div>
                                        </div>
                                    </div>
                                </div>



                                    <div class="row">
                                    <div class="box-body">
                                        <div class="form-group">
                                            <div class="col-md-1">
                                                <label>Comment:</label>
                                            </div>
                                            <div class="col-md-5">
                                                <asp:TextBox ID="txtComment" runat="server" CssClass="form-control" placeholder="Enter Style"></asp:TextBox>
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
        <asp:Panel ID="Panel1" runat="server">
            <table class="nav-justified">
                <tr>
                    <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                    <td>
                        <asp:GridView ID="GVMSPDeliveries" runat="server" AllowSorting="True" AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" EnableModelValidation="True" Font-Size="Small" ForeColor="Black" OnRowDataBound="gvDeliveries_RowDataBound" Width="1272px">
                            <Columns>
                                <%--   <asp:TemplateField Visible="true">
                                                                        <ItemTemplate>
                                                                            <asp:ImageButton ID="imgbtnColorView" OnClick="imgbtnColorView_Click"  runat="server" Height="30px" ImageUrl="~/images/DPlus.png"  ToolTip="" Width="30px" />
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>--%>
                                <asp:BoundField DataField="DID" HeaderText="DID" Visible="true" />
                                <asp:BoundField DataField="OrderNo" HeaderText="OrderNo" Visible="false" />
                                <asp:BoundField DataField="BPOID" HeaderText="BPOID" Visible="false" />
                                <asp:BoundField DataField="SDID" HeaderText="SDID" Visible="false" />
                                <asp:BoundField DataField="SDSEQ" HeaderText="SDSEQ" Visible="false" />
                                <asp:BoundField DataField="Main" HeaderText="Main" Visible="false" />
                                <asp:BoundField DataField="MDID" HeaderText="MDID" Visible="false" />
                                <asp:TemplateField HeaderText="POShipDate" Visible="false">
                                    <ItemTemplate>
                                        <asp:Label ID="POShipDate" runat="server" Text='<%#Eval("POShipDate","{0:dd/MM/yyyy}") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Buyer" Visible="false">
                                    <ItemTemplate>
                                        <asp:Label ID="BuyerName" runat="server" Text='<%#Eval("BuyerName") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Item" Visible="false">
                                    <ItemTemplate>
                                        <asp:Label ID="ItemDescription" runat="server" Text='<%#Eval("ItemDescription") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Dep" Visible="false">
                                    <ItemTemplate>
                                        <asp:Label ID="DeptName" runat="server" Text='<%#Eval("DeptName") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="CDID" Visible="false">
                                    <ItemTemplate>
                                        <asp:Label ID="CDID" runat="server" Text='<%#Eval("CDID") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="AQLDate" Visible="false">
                                    <ItemTemplate>
                                        <asp:Label ID="AQLDate" runat="server" Text='<%#Eval("AQLDate","{0:dd/MM/yyyy}") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="ShipmentCompleate" Visible="false">
                                    <ItemTemplate>
                                        <asp:Label ID="ShipmentCompleate" runat="server" Text='<%#Eval("ShipmentCompleate") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Shipped" Visible="false">
                                    <ItemTemplate>
                                        <asp:Label ID="Shipped" runat="server" Text='<%#Eval("Shipped") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="WRH" Visible="false">
                                    <ItemTemplate>
                                        <asp:Label ID="WRH" runat="server" Text='<%#Eval("WRH") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Plant" ItemStyle-Width="3%">
                                    <ItemTemplate>
                                        <asp:Label ID="Scheduled" runat="server" Text='<%#Eval("ScheduledFactory") %>' ToolTip="Plant"></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Buyer" ItemStyle-Width="5%">
                                    <ItemTemplate>
                                        <asp:Label ID="BuyerCode" runat="server" Text='<%#Eval("BuyerCode") %>' ToolTip="Buyer"></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Style" ItemStyle-Width="7%">
                                    <ItemTemplate>
                                        <asp:Label ID="StyleNo" runat="server" Font-Size="Small" Text='<%#Eval("StyleNo") %>' ToolTip="Style"></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Ship Mode" ItemStyle-Width="5%">
                                    <ItemTemplate>
                                        <asp:Label ID="ShipMode" runat="server" Font-Size="Small" Text='<%#Eval("ShipMode") %>' ToolTip="Ship Mode"></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Color" ItemStyle-Width="7%">
                                    <ItemTemplate>
                                        <asp:Label ID="ColorName" runat="server" Font-Size="Small" Text='<%#Eval("ColorName") %>' ToolTip="Color"></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Buyer PO No" ItemStyle-Width="7%">
                                    <ItemTemplate>
                                        <asp:Label ID="BuyerPONo0" runat="server" Font-Size="Small" Text='<%#Eval("BuyerPONo") %>' ToolTip="Buyer PO No"></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Contract No" ItemStyle-Width="7%">
                                    <ItemTemplate>
                                        <asp:Label ID="ContractNo" runat="server" Font-Size="Small" Text='<%#Eval("ContractNo") %>' ToolTip="ContractNo"></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="BPO Qty" ItemStyle-HorizontalAlign="Right" ItemStyle-Width="6%">
                                    <ItemTemplate>
                                        <asp:Label ID="BuyerPOQty" runat="server" Font-Bold="true" Text='<%#Eval("BuyerPOQty") %>' ToolTip="BPO Qty"></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="SPO Qty" ItemStyle-HorizontalAlign="Right" ItemStyle-Width="5%">
                                    <ItemTemplate>
                                        <asp:Label ID="SumithraPOQty" runat="server" Text='<%#Eval("SumithraPOQty") %>' ToolTip="SPO Qty"></asp:Label>
                                        <%--<asp:Label ID="SumithraPOQty" ToolTip='<%#Eval("CAStatus")%>' runat="server" Text='<%#Eval("SumithraPOQty") %>'></asp:Label>--%>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="FOB" ItemStyle-HorizontalAlign="Right" ItemStyle-Width="5%">
                                    <ItemTemplate>
                                        <asp:Label ID="FOB" runat="server" Text='<%#Eval("FOB","{0:n}") %>' ToolTip="FOB"></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Exp.Inc" ItemStyle-HorizontalAlign="Right" ItemStyle-Width="8%">
                                    <ItemTemplate>
                                        <asp:Label ID="FOB_SPO" runat="server" ToolTip="Exp.Inc"></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Buyer's PO Date" ItemStyle-HorizontalAlign="Right" ItemStyle-Width="7%">
                                    <ItemTemplate>
                                        <asp:Label ID="ShipDate" runat="server" Text='<%#Eval("ExtendedShipDate","{0:dd/MMM/yyyy}") %>' tooltip='<%# Eval("DespatchedOn","{0:dd/MMM/yyyy}") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Delivery Date" ItemStyle-Width="100" Visible="true">
                                    <ItemTemplate>
                                        <asp:Label ID="DeliveryDate" runat="server" Font-Bold="true" Text='<%#Eval("DeliveryDate","{0:dd/MMM/yyyy}") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Del#" ItemStyle-Width="3%">
                                    <ItemTemplate>
                                        <asp:Label ID="lblDEL" runat="server" Text="DEL#" ToolTip="Del#"></asp:Label>
                                        <asp:Label ID="DeliveryNo" runat="server" Text='<%#Eval("DeliveryNo") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Meeting Date" ItemStyle-Width="8%">
                                    <ItemTemplate>
                                        <asp:Label ID="RevisedDate" runat="server" Text='<%#Eval("RevisedDate","{0:dd/MMM/yyyy}") %>' ToolTip="Meeting Date"></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Comment" ItemStyle-Width="8%">
                                    <ItemTemplate>
                                        <asp:Label ID="Comment" runat="server" Font-Size="Small" Text='<%#Eval("Comment") %>' ToolTip="Comment"></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Committed Qty" ItemStyle-HorizontalAlign="Right" ItemStyle-Width="3%">
                                    <ItemTemplate>
                                        <asp:Label ID="DeliveryQty" runat="server" Text='<%#Eval("DeliveryQty") %>' ToolTip="Committed Qty"></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Ship Qty" ItemStyle-HorizontalAlign="Right" ItemStyle-Width="3%">
                                    <ItemTemplate>
                                        <asp:Label ID="ShippedQty" runat="server" Text='<%#Eval("ShippedQty") %>' ToolTip="Ship Qty"></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Var" ItemStyle-HorizontalAlign="Right" ItemStyle-Width="3%">
                                    <ItemTemplate>
                                        <asp:Label ID="DelDesVar" runat="server" Text='<%#Eval("Varience") %>' ToolTip="Var"></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Status" ItemStyle-Width="8%">
                                    <ItemTemplate>
                                        <asp:Label ID="Status" runat="server" ToolTip="Status"></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Date Difference" ItemStyle-Width="">
                                    <ItemTemplate>
                                        <asp:Label ID="labDifference" runat="server" Text='<%#Eval("datedif") %>' ToolTip="Date Difference"></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Cancel" Visible="false">
                                    <ItemTemplate>
                                        <asp:Label ID="labCancel" runat="server" Text='<%#Eval("Cancel") %>' Visible="true"></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Cancel" Visible="true">
                                    <ItemTemplate>
                                        <asp:Label ID="labCancelRemarks" runat="server" Text='<%#Eval("CancelRe") %>' ToolTip="Cancel" Visible="true"></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="ColorCode" Visible="false">
                                    <ItemTemplate>
                                        <asp:Label ID="ColorCode" runat="server" Text='<%#Eval("ColorCode") %>' Visible="true"></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="OrderNo" Visible="false">
                                    <ItemTemplate>
                                        <asp:Label ID="OrderNo" runat="server" Text='<%#Eval("OrderNo") %>' Visible="true"></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="HandedOver" Visible="false">
                                    <ItemTemplate>
                                        <asp:Label ID="HandedOver" runat="server" Text='<%#Eval("HandedOver") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                            <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
                            <FooterStyle BackColor="#333333" CssClass="GVFixedFooter" Font-Bold="True" ForeColor="White" />
                            <HeaderStyle BackColor="#333333" CssClass="GVFixedHeader" Font-Bold="True" ForeColor="White" />
                        </asp:GridView>
                    </td>
                    <td>&nbsp;</td>
                </tr>
            </table>
            
        
        </asp:Panel>
        <asp:Panel ID="PnlDetails" runat="server">
            <div class="col-md-12">
                <div class="box box-success">
                    <div class="box-body">
                        <asp:GridView ID="GVBuyerPODetails" OnRowCommand="GVBuyerPODetails_RowCommand" OnDataBound="GVBuyerPODetails_DataBound" runat="server" AutoGenerateColumns="False" ShowFooter="true"
                            EnableModelValidation="True" BorderColor="#0066CC"
                            Width="75%" >
                            <HeaderStyle BackColor="#0066cc" ForeColor="White" />
                            <Columns>
                                <asp:TemplateField HeaderStyle-BackColor="#0066cc" HeaderText="No" ItemStyle-BackColor="DarkGray">
                                    <ItemTemplate>
                                        <%# Container.DataItemIndex + 1 %>
                                    </ItemTemplate>
                                    <%--"#339966" --%>
                                    <HeaderStyle BackColor="#0066cc" />
                                    <ItemStyle BackColor="DarkGray" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="BuyerPONo">
                                    <ItemTemplate>
                                        <asp:Label ID="lblBuyerPONo" runat="server" Text='<%# Eval("BuyerPONo") %>' />
                                    </ItemTemplate>
                                      <FooterTemplate>
                                        <asp:TextBox  ID="txtBPO" CssClass="form-control" runat="server"></asp:TextBox>
                                    </FooterTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Style ID" Visible="false">
                                    <ItemTemplate>
                                        <asp:Label ID="LblStyleID" runat="server" Text='<%# Eval("StyleID") %>' />
                                    </ItemTemplate>
                                   
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Style Seq" Visible="false">
                                    <ItemTemplate>
                                        <asp:Label ID="LblStyleSeq" runat="server" Text='<%# Eval("StyleSeq") %>' />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="BuyerPO No" Visible="false">
                                    <ItemTemplate>
                                        <asp:Label ID="BuyerPONo" runat="server" Text='<%# Eval("BuyerPONo") %>' />
                                    </ItemTemplate>
                                   
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="POID" Visible="false">
                                    <ItemTemplate>
                                        <asp:Label ID="LblPOID" runat="server" Text='<%# Eval("POID") %>' />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Contract No">
                                    <ItemTemplate>
                                        <asp:Label ID="LblContractNo" runat="server" Text='<%# Eval("ContractNo") %>' />
                                    </ItemTemplate>
                                     <FooterTemplate>
                                        <asp:TextBox  ID="txtContractNo" CssClass="form-control" runat="server"></asp:TextBox>
                                    </FooterTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Color Name">
                                    <ItemTemplate>
                                        <asp:Label ID="LblColorName" runat="server" Text='<%# Eval("ColorName") %>' />
                                    </ItemTemplate>
                                      <FooterTemplate>
                                          <asp:DropDownList ID="DDLColor"  CssClass="form-control" runat="server"></asp:DropDownList>
                                    </FooterTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Color Code" Visible="false">
                                    <ItemTemplate>
                                        <asp:Label ID="LblColorCode" runat="server" Text='<%# Eval("ColorCode") %>' />
                                    </ItemTemplate>
                                      <FooterTemplate>
                                        <asp:TextBox  ID="txtColorCode" CssClass="form-control" runat="server"></asp:TextBox>
                                    </FooterTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Quantity">
                                    <ItemTemplate>
                                        <asp:Label ID="LblQty" runat="server" Text='<%# Eval("Qty") %>' />
                                    </ItemTemplate>
                                      <FooterTemplate>
                                        <asp:TextBox  ID="txtQty" CssClass="form-control" runat="server"></asp:TextBox>
                                          <asp:RegularExpressionValidator runat="server" id="rexNumber" controltovalidate="txtQty" validationexpression="^[0-9]+$" errormessage="Please enter a number!" />
                                    </FooterTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Select">
                                    <ItemTemplate>
                                       <%-- <asp:Button ID="BtnSelect" runat="server" Text="Select" CssClass="btn btn-success"
                                            CommandName="Select" Height="30px" Width="60px" />--%>
                                    </ItemTemplate>
                                    <FooterTemplate>
                                        <asp:ImageButton ID="ImageButton1" CommandName="Add" CommandArgument="<%# Container.DataItemIndex %>" Height="30%" ImageUrl="~/images/AddVendor.png" runat="server" />
                                    </FooterTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                        </div>
    </div>
                
    </div>
            </asp:Panel>
    </form>
</body>
</html>
