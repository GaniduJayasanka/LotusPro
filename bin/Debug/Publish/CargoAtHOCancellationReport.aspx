<%@ page language="C#" autoeventwireup="true" inherits="CargoAtHOCancellationReport, App_Web_cjp5ygzm" %>

<%@ Register Assembly="BasicFrame.WebControls.BasicDatePicker" Namespace="BasicFrame.WebControls" TagPrefix="BDP" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Cargo@HO Cancellation</title>

    <link href="CSS/bootstrap.css" rel="stylesheet" />
    <link href="CSS/SPSStyle.css" rel="stylesheet" />

    <script src="js/jquery-1.9.1.js"></script>
    <script src="js/jquery.min.js"></script>

    <script src="js/jquery-1.4.1.min.js" type="text/javascript"></script>
    <script type="text/javascript" src="js/jQuery-1.8.3.js"></script>
    <script src="js/bootstrap.min.js" type="text/javascript"></script>
    <script src="js/jquery.autocomplete.js" type="text/javascript"></script>
    <link href="CSS/jquery.autocomplete.css" rel="stylesheet" type="text/css" />
    <link href="CSS/jquery.ui.all.css" rel="stylesheet" type="text/css" />

<%--    <style type="text/css">
        body {
            margin: 0;
            padding: 0;
            font-family: Arial;
        }

        .modalrt {
            position: fixed;
            z-index: 999;
            height: 100%;
            width: 100%;
            top: 0;
            background-color: Black;
            filter: alpha(opacity=60);
            opacity: 0.6;
            -moz-opacity: 0.8;
        }

        .center {
            z-index: 1000;
            margin: 300px auto;
            padding: 10px;
            width: 238px;
            background-color: White;
            border-radius: 10px;
            filter: alpha(opacity=100);
            opacity: 1;
            -moz-opacity: 1;
        }
    </style>--%>

    <script type="text/javascript">
        $(document).ready(function () {
            $("#<%=TxtStyle.ClientID%>").autocomplete('SearchStyle.ashx');
        });
    </script>
</head>
<body>
    <form id="form1" runat="server">

        <asp:Label ID="lblOrderNo" runat="server" Visible="False"></asp:Label>
        <asp:Label ID="lblBPOID" runat="server" Visible="False"></asp:Label>
        <asp:Label ID="lblBPOSEQ" runat="server" Visible="False"></asp:Label>
        <asp:Label ID="lblSDID" runat="server" Visible="False"></asp:Label>
        <asp:Label ID="lblSDSEQ" runat="server" Visible="False"></asp:Label>
        <asp:Label ID="LabPOQty" runat="server" Visible="False"></asp:Label>
        <asp:Label ID="LabelDSID" runat="server" Visible="False"></asp:Label>
        <asp:Label ID="lblDeliveryDate" runat="server" Visible="False"></asp:Label>

        <asp:Panel ID="pnlsearch" runat="server">
            <div class="row">
                <div class="col-md-12">
                    <div class="col-md-2">
                        <br />
                        <asp:ImageButton ID="btnHome" runat="server" ImageUrl="~/images/Tohome.png" Height="35px"
                            Width="35px" PostBackUrl="~/home.aspx" />
                        <asp:ImageButton ID="btnback" runat="server" ImageUrl="~/images/Back.png" Height="35px"
                            Width="35px" PostBackUrl="~/Allreports.aspx" />
                    </div>
                    <div class="col-md-6">
                        <h3 style="text-align: center">Cargo @ HO Cancellation</h3>
                    </div>
                </div>
            </div>
            <div class="col-md-12">
                <div class="panel panel-default">
                    <div class="panel-body">
                        <div class="box-body">
                            <div class="row">
                                <div class="form-group">
                                    <label class="col-md-1 control-label">From<span style="color: red">*</span></label><div class="col-md-2">
                                        <BDP:BasicDatePicker Width="50px" ID="DatePickerFromDate" runat="server" CssClass="form-control" />
                                    </div>
                                    <label class="col-md-1 control-label">To<span style="color: red">*</span></label><div class="col-md-2">
                                        <BDP:BasicDatePicker ID="DatePickerToDate" runat="server" CssClass="form-control" />
                                    </div>
                                    <label class="col-md-1 control-label">Status:</label>
                                    <div class="col-md-3">
                                        <asp:DropDownList ID="DDLCancelRemStatus" runat="server" CssClass="form-control">
                                            <asp:ListItem Value=""></asp:ListItem>
                                            <asp:ListItem Value="1">Choice Offer</asp:ListItem>
                                            <asp:ListItem Value="2">Stock Lot Buyer Offer</asp:ListItem>
                                            <asp:ListItem Value="3">Other</asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                    <label class="col-md-2 control-label" style="font-size: larger; border: solid; padding: 5px 5px 5px 5px;">
                                        Total Exp.Inc :
                            <asp:Label ID="lblTotalExpInc" runat="server"></asp:Label></label>
                                </div>
                            </div>
                            <br />
                            <div class="row">
                                <div class="form-group">
                                    <label class="col-md-1 control-label">Style</label><div class="col-md-4">
                                        <asp:TextBox ID="TxtStyle" runat="server" CssClass="form-control"></asp:TextBox>
                                    </div>
                                    <div class="col-md-2">
                                        <asp:Button ID="Btnsearch" CssClass="btn bg-gray" runat="server" Text="Search" OnClick="Btnsearch_Click" Style="width: 69px" />
                                        <asp:Button ID="BtnReset" CssClass="btn bg-gray" runat="server" Text="Reset" OnClick="BtnReset_Click" Style="width: 69px" />
                                    </div>
                                    <asp:Label ID="Label18" runat="server" class="col-md-5 control-label" ForeColor="#E34225" Font-Bold="True" Visible="true">Only approved cancellation requests are shown.</asp:Label>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </asp:Panel>

        <%--                    <div class="col-md-12">
                <div class="panel panel-default">
                    <div class="panel-body">
                        <div class="box-body">
                            <div class="row">
                                <div class="form-group">--%>

        <asp:Panel ID="pnlSchedulePlan" runat="server">
            <div class="col-md-12">
                            <%-- <div class="row">
                                <div class="form-group">--%>
                            <%--<label class="col-md-10 control-label">
                            <img src="images/Green.PNG" width="35" height="20" />
                            : Shipped &nbsp;&nbsp;&nbsp;&nbsp;   
                            <img src="images/dam.PNG" width="35" height="20" />
                            : Cargo @ HO &nbsp;&nbsp;&nbsp;&nbsp;
                            <img src="images/Blue.PNG" width="35" height="20" />
                            : Shipped But Delayed &nbsp;&nbsp;&nbsp;&nbsp;
                                <img src="images/Yelow.PNG" width="35" height="20" />
                            : FG in Transit But Delayed &nbsp;&nbsp;&nbsp;&nbsp;
                                    <img src="images/Pink.PNG" width="35" height="20" />
                            : Overdue &nbsp;&nbsp;&nbsp;&nbsp;
                                        <img src="images/offwhite.PNG" width="35" height="20" />
                            : Cancelled
                        </label>--%>
                            <%--<label class="col-md-12 control-label" style="font-size: larger; border: solid; padding: 5px 5px 5px 5px;">
                            Total Exp.Inc :
                            <asp:Label ID="lblTotalExpInc" runat="server"></asp:Label></label>--%>
                            <%--       </div>
                            </div>--%>
                            <%--                       </div>--%>
                                    <asp:GridView ID="GVCargoAtHOCancellation" runat="server" AutoGenerateColumns="false" Width="1000px"
                                        HeaderStyle-BackColor="#c1bcbc" OnRowDataBound="GVCargoAtHOCancellation_RowDataBound">
                                        <Columns>
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
                                            <asp:TemplateField HeaderText="Exfac. Date" Visible="true">
                                                <ItemTemplate>
                                                    <asp:Label ID="DeliveryDate" runat="server" Text='<%#Eval("DeliveryDate","{0:dd/MMM/yyyy}") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Buyer" Visible="false">
                                                <ItemTemplate>
                                                    <asp:Label ID="BuyerName" runat="server" Text='<%#Eval("BuyerName") %>'></asp:Label>
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
                                            <asp:TemplateField HeaderText="Plant">
                                                <ItemTemplate>
                                                    <asp:Label ID="Scheduled" ToolTip="Plant" runat="server" Text='<%#Eval("ScheduledFactory") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Buyer">
                                                <ItemTemplate>
                                                    <asp:Label ID="BuyerCode" ToolTip="Buyer" runat="server" Text='<%#Eval("BuyerCode") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Style">
                                                <ItemTemplate>
                                                    <asp:Label ID="StyleNo" ToolTip="Style" Font-Size="Small" runat="server" Text='<%#Eval("StyleNo") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Ship Mode">
                                                <ItemTemplate>
                                                    <asp:Label ToolTip="Ship Mode" ID="ShipMode" Font-Size="Small" runat="server" Text='<%#Eval("ShipMode") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Color">
                                                <ItemTemplate>
                                                    <asp:Label ID="ColorName" ToolTip="Color" Font-Size="Small" runat="server" Text='<%#Eval("ColorName") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Buyer PO No">
                                                <ItemTemplate>
                                                    <asp:Label ID="BuyerPONo" ToolTip="Buyer PO No" Font-Size="Small" runat="server" Text='<%#Eval("BuyerPONo") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Contract No">
                                                <ItemTemplate>
                                                    <asp:Label ID="ContractNo" ToolTip="ContractNo" Font-Size="Small" runat="server" Text='<%#Eval("ContractNo") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="BPO Qty" ItemStyle-HorizontalAlign="Right">
                                                <ItemTemplate>
                                                    <asp:Label ID="BuyerPOQty" ToolTip="BPO Qty" Font-Bold="true" runat="server" Text='<%#Eval("BuyerPOQty") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="SPO Qty" Visible="false" ItemStyle-HorizontalAlign="Right">
                                                <ItemTemplate>
                                                    <asp:Label ID="SumithraPOQty" ToolTip="SPO Qty" runat="server" Text='<%#Eval("SumithraPOQty") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="FOB" ItemStyle-HorizontalAlign="Right">
                                                <ItemTemplate>
                                                    <asp:Label ID="FOB" ToolTip="FOB" runat="server" Text='<%#Eval("FOB","{0:n}") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Exp.Inc" ItemStyle-HorizontalAlign="Right">
                                                <ItemTemplate>
                                                    <asp:Label ID="FOB_SPO" ToolTip="Exp.Inc" runat="server" Text='<%#Eval("TTLIncome","{0:n2}") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Buyer's PO Date" ItemStyle-HorizontalAlign="Right">
                                                <ItemTemplate>
                                                    <asp:Label ID="ShipDate" Font-Bold="true" runat="server" ToolTip='<%# Eval("DespatchedOn","{0:dd/MMM/yyyy}") %>' Text='<%#Eval("ExtendedShipDate","{0:dd/MMM/yyyy}") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Del#">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblDEL" ToolTip="Del#" runat="server" Text="DEL#"></asp:Label><asp:Label ID="DeliveryNo" runat="server" Text='<%#Eval("DeliveryNo") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Meeting Date">
                                                <ItemTemplate>
                                                    <asp:Label ID="RevisedDate" ToolTip="Meeting Date" runat="server" Text='<%#Eval("RevisedDate","{0:dd/MMM/yyyy}") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Comment">
                                                <ItemTemplate>
                                                    <asp:Label ID="Comment" ToolTip="Comment" Font-Size="Small" runat="server" Text='<%#Eval("Comment") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Committed Qty" ItemStyle-HorizontalAlign="Right">
                                                <ItemTemplate>
                                                    <asp:Label ID="DeliveryQty" ToolTip="Committed Qty" runat="server" Text='<%#Eval("DeliveryQty") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Ship Qty" ItemStyle-HorizontalAlign="Right">
                                                <ItemTemplate>
                                                    <asp:Label ID="ShippedQty" ToolTip="Ship Qty" runat="server" Text='<%#Eval("ShippedQty") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Var" ItemStyle-HorizontalAlign="Right">
                                                <ItemTemplate>
                                                    <asp:Label ID="DelDesVar" ToolTip="Var" runat="server" Text='<%#Eval("Varience") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Status">
                                                <ItemTemplate>
                                                    <asp:Label ID="Status" ToolTip="Status" runat="server"></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Date Difference">
                                                <ItemTemplate>
                                                    <asp:Label ID="labDifference" ToolTip="Date Difference" Text='<%#Eval("datedif") %>' runat="server"></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Cancel" Visible="false">
                                                <ItemTemplate>
                                                    <asp:Label ID="labCancel" runat="server" Visible="true" Text='<%#Eval("Cancel") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Cancel" Visible="true">
                                                <ItemTemplate>
                                                    <asp:Label ID="labCancelRemarks" ToolTip="Cancel" runat="server" Visible="true" Text='<%#Eval("CancelRe") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="ColorCode" Visible="false">
                                                <ItemTemplate>
                                                    <asp:Label ID="ColorCode" runat="server" Visible="true" Text='<%#Eval("ColorCode") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="OrderNo" Visible="false">
                                                <ItemTemplate>
                                                    <asp:Label ID="OrderNo" runat="server" Visible="true" Text='<%#Eval("OrderNo") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="HandedOver" Visible="false">
                                                <ItemTemplate>
                                                    <asp:Label ID="HandedOver" runat="server" Text='<%#Eval("HandedOver") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="CancelRequest" Visible="false" SortExpression="Cancel">
                                                <ItemTemplate>
                                                    <asp:Label ID="CancelRequest" runat="server" Visible="true" Text='<%#Eval("CancelRequest") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Cumulative Dispatched" Visible="true">
                                                <ItemTemplate>
                                                    <asp:Label ID="SOFARDeliveredQty" runat="server" Visible="true" Text='<%#Eval("SOFARDeliveredQty") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Cancelled Reason" Visible="true">
                                                <ItemTemplate>
                                                    <asp:Label ID="CancelledReason" runat="server" Visible="true" Text='<%#Eval("CancelledReason") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                        </Columns>
                                    </asp:GridView>
                                </div>
        </asp:Panel>
    </form>
</body>
</html>
