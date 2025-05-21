<%@ page language="C#" autoeventwireup="true" inherits="De, App_Web_sdwe5enq" %>

<%@ Register Assembly="BasicFrame.WebControls.BasicDatePicker" Namespace="BasicFrame.WebControls" TagPrefix="BDP" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Delivery Breakdown</title>
 <%--   <script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<script type="text/javascript" src="http://code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css" />--%>

    <script src="js/jquery-1.11.3.min.js" type="text/javascript"></script>
    <script src="js/jquery-ui.js" type="text/javascript"></script>
    <link href="css/jquery-ui.css" rel="stylesheet" type="text/css" />

    <style type="text/css">
       .ui-tooltip, .arrow:after
        {
            /*background: #FFFF80;*/
            background-color: rgba(53, 255, 42, 0.9);
            background: rgba(53, 255, 42, 0.9);
            color: rgba(53, 255, 42, 0.9);
            border: 1px solid Black;
            text-align:center;
        }
        .ui-tooltip
        {
            padding: 10px 10px;
            color: black;
            border-radius: 10px;
            font: bold 16px "Helvetica Neue" , Sans-Serif;
            text-transform: uppercase;
            box-shadow: 0 0 7px black;
        }
        .arrow
        {
            width: 70px;
            height: 16px;
            overflow: hidden;
            position: absolute;
            left: 50%;
            margin-left: -35px;
            bottom: -16px;
        }
        .arrow.top
        {
            top: -25px;
            bottom: auto;
        }
        .arrow.left
        {
            left: 20%;
        }
        .arrow:after
        {
            content: "";
            position: absolute;
            left: 20px;
            top: -20px;
            width: 25px;
            height: 25px;
            box-shadow: 6px 5px 9px -9px black;
            -webkit-transform: rotate(45deg);
            -ms-transform: rotate(45deg);
            transform: rotate(45deg);
        }
        .arrow.top:after
        {
            bottom: -20px;
            top: auto;
        }
    </style>
    <script type="text/javascript">

        $(function () {
            $(document).tooltip({
                position: {
                    my: "center bottom-20",
                    at: "center top",
                    using: function (position, feedback) {
                        $(this).css(position);
                        $("<div>")
            .addClass("arrow")
            .addClass(feedback.vertical)
            .addClass(feedback.horizontal)
            .appendTo(this);
                    }
                }
            });
        });
    </script>
    <link href="CSS/bootstrap.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <asp:Label ID="lblOrderNo" runat="server" Visible="False"></asp:Label>
        <asp:Label ID="lblBPOID" runat="server" Visible="False"></asp:Label>
        <asp:Label ID="lblBPOSEQ" runat="server" Visible="False"></asp:Label>
        <asp:Label ID="lblSDID" runat="server" Visible="False"></asp:Label>
        <asp:Label ID="lblSDSEQ" runat="server" Visible="False"></asp:Label>
        <asp:Label ID="LabPOQty" runat="server" Visible="False"></asp:Label>
        <asp:HiddenField ID="hfRemainingValue" runat="server" />
        <asp:Label ID="LabelDSID" runat="server" Visible="False"></asp:Label>
        <asp:Panel ID="pnlsearch" runat="server">
            <div class="row">
                <div class="col-md-12">
                    <div class="col-md-2">
                        <br />
                        <asp:ImageButton ID="btnHome" runat="server" ImageUrl="~/images/Tohome.png" Height="35px"
                            Width="35px" PostBackUrl="~/home.aspx" />
                        <asp:ImageButton ID="btnback" runat="server" ImageUrl="~/images/Back.png" Height="35px"
                            Width="35px" PostBackUrl="~/report.aspx" />
                    </div>
                    <div class="col-md-9">
                        <h3 style="text-align: center">Delivery Plan</h3>
                    </div>
                </div>
            </div>
            <div class="col-md-12">
                <div class="panel panel-default">
                    <div class="panel-body">
                        <div class="box-body">
                            <div class="row">
                                <div class="form-group">
                                    <label class="col-md-1 control-label">DateRange<span style="color: red">*</span></label>
                                    <div class="col-md-2">
                                        <BDP:BasicDatePicker Width="50px" ID="DatePickerFromDate" runat="server" CssClass="form-control" />
                                       
                                    </div>
                                     <div class="col-md-1">
                                         &nbsp; &nbsp; &nbsp; &nbsp;
                                         </div>
                                    <label class="col-md-1 control-label">To <span style="color: red">*</span></label>
                                    <div class="col-md-2">
                                       
                                        <BDP:BasicDatePicker ID="DatePickerToDate" runat="server" CssClass="form-control" />
                                    </div>
                                    <div class="col-md-1">
                                         &nbsp; &nbsp; &nbsp; &nbsp;
                                         </div>
                                    <label class="col-md-1 control-label">Type <span style="color: red">*</span></label>
                                    <div class="col-md-2">
                                        <asp:DropDownList ID="ddlType" runat="server" CssClass="form-control">
                                            <asp:ListItem> </asp:ListItem>
                                            <asp:ListItem Value="1">Shipment Schedule Report</asp:ListItem>
                                            <asp:ListItem Value="2">Revision Report</asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                    <div class="col-md-1">
                                        <asp:Button ID="btnsearch" CssClass="btn btn-info" runat="server" Text="Search" OnClick="btnsearch_Click" />
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="box-body">
                                <div class="form-group">
                                    <label class="col-md-1 control-label">Status:</label>
                                    <div class="col-md-2">
                                        <asp:DropDownList ID="ddlStatus" runat="server" CssClass="form-control"
                                            AutoPostBack="true" OnSelectedIndexChanged="ddlStatus_SelectedIndexChanged">
                                            <asp:ListItem> </asp:ListItem>
                                            <asp:ListItem Value="1">Pending</asp:ListItem>
                                            <asp:ListItem Value="2">Dispatched</asp:ListItem>
                                            <asp:ListItem Value="3">Shipped</asp:ListItem>
                                            <asp:ListItem Value="4">Cargo at HO</asp:ListItem>
                                            <asp:ListItem Value="5">Cancel</asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                    <label class="col-md-1 control-label">Plant:</label>
                                    <div class="col-md-2">
                                        <asp:DropDownList ID="DDLPlant" runat="server" CssClass="form-control"
                                            AutoPostBack="true" OnSelectedIndexChanged="DDLPlant_SelectedIndexChanged">
                                        </asp:DropDownList>
                                    </div>
                                    <label class="col-md-1 control-label">Buyer:</label>
                                    <div class="col-md-2">
                                        <asp:DropDownList ID="DDLBUYER" CssClass="form-control" runat="server"
                                            AutoPostBack="true" OnSelectedIndexChanged="DDLBUYER_SelectedIndexChanged">
                                        </asp:DropDownList>
                                    </div>
                                    <label class="col-md-1 control-label">Style:</label>
                                    <div class="col-md-2">
                                        <asp:DropDownList ID="DDLStyle" runat="server" CssClass="form-control"
                                            AutoPostBack="true" OnSelectedIndexChanged="DDLStyle_SelectedIndexChanged">
                                        </asp:DropDownList>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </asp:Panel>

         <asp:Panel ID="Panel1" runat="server">
            <div class="col-md-12">
                <asp:GridView ID="GridViewPrevious" runat="server" OnRowDataBound="GridViewDelivery_RowDataBound" Font-Size="Small" Visible="False">
                    <HeaderStyle BackColor="#c1bcbc" />
                </asp:GridView>
                <br />
            </div>
        </asp:Panel>

        <br />

        <asp:Panel ID="pnlrevisedplan" runat="server">
            <div class="col-md-12">
                <asp:GridView ID="GridViewDelivery" runat="server" OnRowDataBound="GridViewDelivery_RowDataBound" Font-Size="Small">
                    <HeaderStyle BackColor="#c1bcbc" />
                </asp:GridView>
                <br />
            </div>
        </asp:Panel>
        <asp:Panel ID="pnlSchedulePlan" runat="server">
              <div class="col-md-11">
                <div class="box-body">
                    <div class="form-group">
                        <label class="col-md-2 control-label">
                            <img src="images/Green.PNG" width="35" height="20" />
                            : Shipped</label>
                        <label class="col-md-2 control-label">
                            <img src="images/Blue.PNG" width="35" height="20" />
                            : Shipped But Delayed</label>
                        <label class="col-md-2 control-label">
                            <img src="images/Yelow.PNG" width="35" height="20" />
                            : Dispatched But Delayed</label>
                        <label class="col-md-2 control-label">
                            <img src="images/Pink.PNG" width="35" height="20" />
                            : Overdue</label>
                         <label class="col-md-2 control-label">
                            <img src="images/offwhite.PNG" width="35" height="20" />
                            : Cancel</label>
                        <label class="col-md-2 control-label" style="font-size: larger; border: solid; padding: 5px 5px 5px 5px;">
                            Total Exp.Inc :
                            <asp:Label ID="lblTotalExpInc" runat="server"></asp:Label></label>
                    </div>
                </div>
            </div>
            <asp:Panel ID="PanelPrevousPendind" runat="server">
            <br />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:Label ID="Label1" runat="server"   Font-Size="20px"  Text="Privously not gone shipments"></asp:Label>
              <br />
             <br />
            <div class="col-md-12">
             <asp:GridView ID="GridViewPrivousShipments"  runat="server" HeaderStyle-BackColor="#c1bcbc"
                    AutoGenerateColumns="False" OnRowDataBound="GridViewPrivousShipments_RowDataBound" EnableModelValidation="True" Width="100%">
                   
                                        <Columns>
                                           <%-- <asp:BoundField DataField="DID" HeaderText="DID" Visible="true" />--%>
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
                                            <asp:TemplateField HeaderText="DeliveryDate" ItemStyle-Width="100" Visible="false">
                                                <ItemTemplate>
                                                    <asp:Label ID="DeliveryDate" runat="server" Text='<%#Eval("DeliveryDate","{0:dd/MMM/yyyy}") %>'></asp:Label>
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
                                            <asp:TemplateField HeaderText="Plant"  ItemStyle-Width="3%">
                                                <ItemTemplate>
                                                    <asp:Label ID="Scheduled"  ToolTip="Plant" runat="server" Text='<%#Eval("ScheduledFactory") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Buyer" ItemStyle-Width="5%">
                                                <ItemTemplate>
                                                    <asp:Label ID="BuyerCode" ToolTip="Buyer" runat="server" Text='<%#Eval("BuyerCode") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Style"  ItemStyle-Width="7%">
                                                <ItemTemplate>
                                                    <asp:Label ID="StyleNo" ToolTip="Style" runat="server" Text='<%#Eval("StyleNo") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Ship Mode" ItemStyle-Width="5%">
                                                <ItemTemplate>
                                                    <asp:Label ID="ShipMode" ToolTip="Ship Mode" runat="server" Text='<%#Eval("ShipMode") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Color" ItemStyle-Width="7%">
                                                <ItemTemplate>
                                                    <asp:Label ID="ColorName" ToolTip="Color" runat="server" Text='<%#Eval("ColorName") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Buyer PO No" ItemStyle-Width="7%">
                                                <ItemTemplate>
                                                    <asp:Label ID="BuyerPONo" ToolTip="Buyer PO No" runat="server" Text='<%#Eval("BuyerPONo") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Contract No" ItemStyle-Width="7%">
                                                <ItemTemplate>
                                                    <asp:Label ID="ContractNo" ToolTip="Contract No" runat="server" Text='<%#Eval("ContractNo") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="BPO Qty" ItemStyle-HorizontalAlign="Right"
                                                ItemStyle-Width="6%">
                                                <ItemTemplate>
                                                    <asp:Label ID="BuyerPOQty" ToolTip="BPO Qty" runat="server" Text='<%#Eval("BuyerPOQty") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="SPO Qty" ItemStyle-HorizontalAlign="Right"
                                                ItemStyle-Width="5%">
                                                <ItemTemplate>
                                                    <asp:Label ID="SumithraPOQty"  ToolTip='<%#Eval("CAStatus")%>' runat="server" Text='<%#Eval("SumithraPOQty") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="FOB" ItemStyle-HorizontalAlign="Right"
                                                ItemStyle-Width="5%">
                                                <ItemTemplate>
                                                    <asp:Label ID="FOB" runat="server" ToolTip="FOB" Text='<%#Eval("FOB","{0:n}") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Exp.Inc" ItemStyle-HorizontalAlign="Right"
                                                ItemStyle-Width="8%">
                                                <ItemTemplate>
                                                    <asp:Label ID="FOB_SPO" ToolTip="Exp.Inc" runat="server"></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Ext.Ship Date" ItemStyle-HorizontalAlign="Right"
                                                ItemStyle-Width="7%">
                                                <ItemTemplate>
                                                    <asp:Label ID="ShipDate"   runat="server" tooltip="Ext.Ship Date" Text='<%#Eval("ExtendedShipDate","{0:dd/MMM/yyyy}") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Del#" ItemStyle-Width="3%">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblDEL" runat="server" ToolTip="Del#" Text="DEL#"></asp:Label><asp:Label ID="DeliveryNo" runat="server" Text='<%#Eval("DeliveryNo") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>                                            
                                            <asp:TemplateField HeaderText="Meeting Date" ItemStyle-Width="8%">
                                                <ItemTemplate>
                                                    <asp:Label ID="RevisedDate" ToolTip="Meeting Date"  runat="server" Text='<%#Eval("RevisedDate","{0:dd/MMM/yyyy}") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Comment" ItemStyle-Width="8%">
                                                <ItemTemplate>
                                                    <asp:Label ID="Comment" runat="server" ToolTip="Comment" Text='<%#Eval("Comment") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Del Qty" ItemStyle-HorizontalAlign="Right" ItemStyle-Width="3%">
                                                <ItemTemplate>
                                                    <asp:Label ID="DeliveryQty" runat="server" ToolTip="Del Qty" Text='<%#Eval("DeliveryQty") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Ship Qty" ItemStyle-HorizontalAlign="Right" ItemStyle-Width="3%">
                                                <ItemTemplate>
                                                    <asp:Label ID="ShippedQty" runat="server" ToolTip="Ship Qty" Text='<%#Eval("ShippedQty") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Var" ItemStyle-HorizontalAlign="Right" ItemStyle-Width="3%">
                                                <ItemTemplate>
                                                    <asp:Label ID="DelDesVar" runat="server" ToolTip="Var" Text='<%#Eval("Varience") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Status" ItemStyle-Width="8%">
                                                <ItemTemplate>
                                                    <asp:Label ID="Status" ToolTip="Status" runat="server"></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                                  <asp:TemplateField HeaderText="Cancel" Visible="false">
                            <ItemTemplate>                           
                                <asp:Label ID="labCancel" runat="server" Visible="true" Text='<%#Eval("Cancel") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                                      <asp:TemplateField HeaderText="Cancel"  Visible="true">
                            <ItemTemplate>                           
                                <asp:Label ID="labCancelRemarks" ToolTip="Cancel" runat="server" Visible="true" Text='<%#Eval("CancelRe") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                                     
                             
                    </Columns>
                </asp:GridView>
                </div>
                </asp:Panel>
            <div class="col-md-12">
                <asp:GridView ID="gvdeliveryReport" OnRowDataBound="gvdeliveryReport_RowDataBound" runat="server" GridLines="None"
                    AutoGenerateColumns="False" ShowHeader="False" DataKeyNames="DeliveryDate" EnableModelValidation="True" Width="100%">
                    <Columns>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:Panel ID="pnlChild" runat="server">
                                    <asp:Panel ID="pnlHeading" runat="server">
                                        <h4 style="text-align: center">
                                            <p>
                                                <asp:Label ID="lblExfactory" runat="server" Text="Exfactory Date :"></asp:Label>
                                                <asp:Label ID="lblDeliveryDate" runat="server" Text='<%#Eval("DeliveryDate") %>'></asp:Label>
                                            </p>
                                        </h4>
                                    </asp:Panel>
                                    <asp:GridView ID="gvDeliveries" runat="server" AutoGenerateColumns="false"
                                        HeaderStyle-BackColor="#c1bcbc" Width="100%" OnRowDataBound="gvDeliveries_RowDataBound">
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
                                            <asp:TemplateField HeaderText="DeliveryDate" ItemStyle-Width="100" Visible="false">
                                                <ItemTemplate>
                                                    <asp:Label ID="DeliveryDate" runat="server" Text='<%#Eval("DeliveryDate","{0:dd/MMM/yyyy}") %>'></asp:Label>
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
                                                    <asp:Label ID="Scheduled" runat="server" Text='<%#Eval("ScheduledFactory") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Buyer" ItemStyle-Width="5%">
                                                <ItemTemplate>
                                                    <asp:Label ID="BuyerCode" runat="server" Text='<%#Eval("BuyerCode") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Style" ItemStyle-Width="7%">
                                                <ItemTemplate>
                                                    <asp:Label ID="StyleNo" runat="server" Text='<%#Eval("StyleNo") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Ship Mode" ItemStyle-Width="5%">
                                                <ItemTemplate>
                                                    <asp:Label ID="ShipMode" runat="server" Text='<%#Eval("ShipMode") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Color" ItemStyle-Width="7%">
                                                <ItemTemplate>
                                                    <asp:Label ID="ColorName" runat="server" Text='<%#Eval("ColorName") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Buyer PO No" ItemStyle-Width="7%">
                                                <ItemTemplate>
                                                    <asp:Label ID="BuyerPONo" runat="server" Text='<%#Eval("BuyerPONo") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Contract No" ItemStyle-Width="7%">
                                                <ItemTemplate>
                                                    <asp:Label ID="ContractNo" runat="server" Text='<%#Eval("ContractNo") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="BPO Qty" ItemStyle-HorizontalAlign="Right"
                                                ItemStyle-Width="6%">
                                                <ItemTemplate>
                                                    <asp:Label ID="BuyerPOQty" runat="server" Text='<%#Eval("BuyerPOQty") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="SPO Qty" ItemStyle-HorizontalAlign="Right"
                                                ItemStyle-Width="5%">
                                                <ItemTemplate>
                                                    <asp:Label ID="SumithraPOQty" ToolTip='<%#Eval("CAStatus")%>' runat="server" Text='<%#Eval("SumithraPOQty") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="FOB" ItemStyle-HorizontalAlign="Right"
                                                ItemStyle-Width="5%">
                                                <ItemTemplate>
                                                    <asp:Label ID="FOB" runat="server" Text='<%#Eval("FOB","{0:n}") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Exp.Inc" ItemStyle-HorizontalAlign="Right"
                                                ItemStyle-Width="8%">
                                                <ItemTemplate>
                                                    <asp:Label ID="FOB_SPO" runat="server"></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Ext.Ship Date" ItemStyle-HorizontalAlign="Right"
                                                ItemStyle-Width="7%">
                                                <ItemTemplate>
                                                    <asp:Label ID="ShipDate" runat="server" tooltip='<%# Eval("DespatchedOn","{0:dd/MMM/yyyy}") %>' Text='<%#Eval("ExtendedShipDate","{0:dd/MMM/yyyy}") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Del#" ItemStyle-Width="3%">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblDEL" runat="server" Text="DEL#"></asp:Label><asp:Label ID="DeliveryNo" runat="server" Text='<%#Eval("DeliveryNo") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>                                            
                                            <asp:TemplateField HeaderText="Meeting Date" ItemStyle-Width="8%">
                                                <ItemTemplate>
                                                    <asp:Label ID="RevisedDate" runat="server" Text='<%#Eval("RevisedDate","{0:dd/MMM/yyyy}") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Comment" ItemStyle-Width="8%">
                                                <ItemTemplate>
                                                    <asp:Label ID="Comment" runat="server" Text='<%#Eval("Comment") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Del Qty" ItemStyle-HorizontalAlign="Right" ItemStyle-Width="3%">
                                                <ItemTemplate>
                                                    <asp:Label ID="DeliveryQty" runat="server" Text='<%#Eval("DeliveryQty") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Ship Qty" ItemStyle-HorizontalAlign="Right" ItemStyle-Width="3%">
                                                <ItemTemplate>
                                                    <asp:Label ID="ShippedQty" runat="server" Text='<%#Eval("ShippedQty") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Var" ItemStyle-HorizontalAlign="Right" ItemStyle-Width="3%">
                                                <ItemTemplate>
                                                    <asp:Label ID="DelDesVar" runat="server" Text='<%#Eval("Varience") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Status" ItemStyle-Width="8%">
                                                <ItemTemplate>
                                                    <asp:Label ID="Status" runat="server"></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                             <asp:TemplateField HeaderText="Cancel" Visible="false">
                            <ItemTemplate>                           
                                <asp:Label ID="labCancel" runat="server" Visible="true" Text='<%#Eval("Cancel") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                                      <asp:TemplateField HeaderText="Cancel"  Visible="true">
                            <ItemTemplate>                           
                                <asp:Label ID="labCancelRemarks" runat="server" Visible="true" Text='<%#Eval("CancelRe") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                                        </Columns>
                                    </asp:GridView>
                                </asp:Panel>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Delivery Date" Visible="false">
                            <ItemTemplate>
                                <asp:Label ID="DeliveryDate" runat="server" Text='<%#Eval("DeliveryDate") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
                <br />
            </div>
        </asp:Panel>
        <asp:Panel ID="pnlCargoatHO" runat="server">
            <div class="col-md-12">
                <label class="col-md-3 control-label pull-right" style="font-size: larger; border: solid; padding: 5px 5px 5px 5px;">
                    Total Exp.Inc :
                            <asp:Label ID="lblTGHOExpInc" runat="server"></asp:Label></label>
                <asp:GridView ID="gvCHODeliveries" runat="server" AutoGenerateColumns="false"
                    HeaderStyle-BackColor="#c1bcbc" Width="100%">
                    <Columns>
                        <asp:TemplateField HeaderText="Plant">
                            <ItemTemplate>
                                <asp:Label ID="Plant" runat="server" Text='<%#Eval("Plant") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                         <asp:TemplateField HeaderText="Buyer">
                            <ItemTemplate>
                                <asp:Label ID="BuyerName" runat="server" Text='<%#Eval("BuyerName") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Style Details" ItemStyle-Width="40%">
                            <ItemTemplate>
                                <asp:Label ID="Detail" runat="server" Text='<%#Eval("Detail") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="AQL date">
                            <ItemTemplate>
                                <asp:Label ID="ShipDate" runat="server" Text='<%#Eval("AQLDate","{0:dd/MMM/yyyy}") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                         <asp:TemplateField HeaderText="Date Diff.">
                            <ItemTemplate>
                                <asp:Label ID="DateDiff" runat="server" Text='<%#Eval("DateDiff") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Promised Qty" ItemStyle-HorizontalAlign="Right" ItemStyle-Width="3%">
                            <ItemTemplate>
                                <asp:Label ID="PromisedQty" runat="server" Text='<%#Eval("PromisedQty") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Despatched Qty" ItemStyle-HorizontalAlign="Right"  ItemStyle-Width="3%">
                            <ItemTemplate>
                                <asp:Label ID="DespatchedQty" runat="server" Text='<%#Eval("DespatchedQty") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="FOB" ItemStyle-HorizontalAlign="Right">
                            <ItemTemplate>
                                <asp:Label ID="FOB" runat="server" Text='<%#Eval("FOB","{0:n}") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Exp.Inc" ItemStyle-HorizontalAlign="Right">
                            <ItemTemplate>
                                <asp:Label ID="ExpInc" runat="server" Text='<%#Eval("ExpInc","{0:n}") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Over Short Reason" ItemStyle-Width="30%">
                            <ItemTemplate>
                                <asp:Label ID="OverShortReason" runat="server" Text='<%#Eval("OverShortReason") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
                <br />
            </div>
        </asp:Panel>
    </form>
</body>
</html>
