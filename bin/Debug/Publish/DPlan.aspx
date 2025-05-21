<%@ page language="C#" autoeventwireup="true" inherits="DPlan, App_Web_cjp5ygzm" enableeventvalidation="false" %>

<%@ Register Assembly="BasicFrame.WebControls.BasicDatePicker" Namespace="BasicFrame.WebControls" TagPrefix="BDP" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Delivery Breakdown</title>

    <link href="CSS/bootstrap.css" rel="stylesheet" />

    <script src="js/jquery-1.11.3.min.js" type="text/javascript"></script>
    <script src="js/jquery-ui.js" type="text/javascript"></script>
    <link href="css/jquery-ui.css" rel="stylesheet" type="text/css" />

    <style>
        /* The container */
        .container {
            display: block;
            position: relative;
            padding-left: 35px;
            margin-bottom: 12px;
            cursor: pointer;
            font-size: 22px;
            -webkit-user-select: none;
            -moz-user-select: none;
            -ms-user-select: none;
            user-select: none;
        }

        /* Hide the browser's default checkbox */
        /*.container input {
    position: absolute;
    opacity: 0;
    cursor: pointer;
               width: 20px;
           }*/

        /* Create a custom checkbox */
        .checkmark {
            width: 30px;
            height: 30px;
            /*position: absolute;
    top: 0;
    left: 0;
    height: 25px;
    width: 25px;
    background-color: #666666;*/
        }

        /* On mouse-over, add a grey background color */
        .container:hover input ~ .checkmark {
            background-color: #ccc;
        }

        /* When the checkbox is checked, add a blue background */
        .container input:checked ~ .checkmark {
            background-color: #2196F3;
        }

        /* Create the checkmark/indicator (hidden when not checked) */
        .checkmark:after {
            content: "";
            position: absolute;
            display: none;
        }

        /* Show the checkmark when checked */
        .container input:checked ~ .checkmark:after {
            display: block;
        }

        /* Style the checkmark/indicator */
        .container .checkmark:after {
            left: 9px;
            top: 5px;
            width: 5px;
            height: 10px;
            border: solid white;
            border-width: 0 3px 3px 0;
            -webkit-transform: rotate(45deg);
            -ms-transform: rotate(45deg);
            transform: rotate(45deg);
        }
    </style>

    <style type="text/css">
        .ui-tooltip, .arrow:after {
            /*background: #FFFF80;*/
            background-color: rgba(53, 255, 42, 0.9);
            background: rgba(53, 255, 42, 0.9);
            color: rgba(53, 255, 42, 0.9);
            border: 1px solid Black;
            text-align: center;
        }

        .ui-tooltip {
            padding: 10px 10px;
            color: black;
            border-radius: 10px;
            font: bold 16px "Helvetica Neue", Sans-Serif;
            text-transform: uppercase;
            box-shadow: 0 0 7px black;
        }

        .arrow {
            width: 70px;
            height: 16px;
            overflow: hidden;
            position: absolute;
            left: 50%;
            margin-left: -35px;
            bottom: -16px;
        }

            .arrow.top {
                top: -25px;
                bottom: auto;
            }

            .arrow.left {
                left: 20%;
            }

            .arrow:after {
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

            .arrow.top:after {
                bottom: -20px;
                top: auto;
            }

        .auto-style1 {
            font-size: medium;
        }
    </style>

    <script src="Scripts/jquery-1.7.1.js"></script>
    <script language="javascript">
        $(document).ready(function () {
            var gridHeader = $('#<%=gvCHODeliveries.ClientID%>').clone(true); // Here Clone Copy of Gridview with style
            $(gridHeader).find("tr:gt(0)").remove(); // Here remove all rows except first row (header row)
            $('#<%=gvCHODeliveries.ClientID%> tr th').each(function (i) {
                // Here Set Width of each th from gridview to new table(clone table) th 
                $("th:nth-child(" + (i + 1) + ")", gridHeader).css('width', ($(this).width()).toString() + "px");
            });
            $("#GHead").append(gridHeader);
            $('#GHead').css('position', 'absolute');
            //  $('#GHead').css('top', $('#<%=gvCHODeliveries.ClientID%>').offset().top);
        });
    </script>

    <script type="text/javascript">
        $(function () {
            $("#tabs").tabs({
                collapsible: true
            });
        });
    </script>

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

    <style type="text/css">
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
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <asp:ToolkitScriptManager ID="ScriptManager1" runat="server" AsyncPostBackTimeout="400">
        </asp:ToolkitScriptManager>

        <script type="text/javascript">

            function pageLoad(sender, args) {
                if (!args.get_isPartialLoad()) {
                    //  add our handler to the document's
                    //  keydown event
                    $addHandler(document, "keydown", onKeyDown);
                }
            }

            function onKeyDown(e) {
                if (e && e.keyCode == Sys.UI.Key.esc) {
                    // if the key pressed is the escape key, dismiss the dialog
                    $find('MPESL').hide();
                }
            }

        </script>
        <asp:Label ID="lblOrderNo" runat="server" Visible="False"></asp:Label>
        <asp:Label ID="lblBPOID" runat="server" Visible="False"></asp:Label>
        <asp:Label ID="lblBPOSEQ" runat="server" Visible="False"></asp:Label>
        <asp:Label ID="lblSDID" runat="server" Visible="False"></asp:Label>
        <asp:Label ID="lblSDSEQ" runat="server" Visible="False"></asp:Label>
        <asp:Label ID="LabPOQty" runat="server" Visible="False"></asp:Label>
        <asp:HiddenField ID="hfRemainingValue" runat="server" />
        <asp:Label ID="LabelDSID" runat="server" Visible="False"></asp:Label>
        <asp:Label ID="lblDeliveryDate" runat="server" Visible="False"></asp:Label>
         <asp:Label ID="LabPlantCount" runat="server" Visible="False"></asp:Label>
        <asp:UpdateProgress runat="server" ID="PageUpdateProgress">
            <ProgressTemplate>
                <%-- <div style="width:200px;margin:0 auto;">Processing... --%>
                <div class="modalrt">
                    <div class="center">
                        <img alt="" src="images/wait.gif" />
                    </div>
                </div>
            </ProgressTemplate>
        </asp:UpdateProgress>

        <asp:Panel ID="pnlsearch" runat="server">
            <div class="row">
                <div class="col-md-12">
                    <div class="col-md-2">
                        <br />
                        <asp:ImageButton ID="btnHome" runat="server" ImageUrl="~/images/Tohome.png" Height="35px"
                            Width="35px" PostBackUrl="~/home.aspx" />
                        <asp:ImageButton ID="btnback" runat="server" ImageUrl="~/images/Back.png" Height="35px"
                            Width="35px" PostBackUrl="~/report.aspx" />
                        <asp:ImageButton ID="btnBuyer0" runat="server" ImageUrl="images/user.png" OnClick="btnBuyer_Click" ToolTip="Buyer Wise Summary" Height="35px" Width="35px" />
                    </div>
                    <div class="col-md-6">
                        <h3 style="text-align: center">Delivery Plan</h3>
                    </div>
                    <div class="col-md-4">
                        <br />
                        <%-- <asp:LinkButton ID="LinkButton4" PostBackUrl="~/DashboardFourLevel.aspx" runat="server" ToolTip="MSP Dashboard">Dashboard </asp:LinkButton> |
                        <asp:LinkButton ID="LinkButton1" PostBackUrl="~/StyleWiseHistory.aspx" runat="server" ToolTip="Log Report">Log Report </asp:LinkButton> |--%>
                        <%-- <asp:LinkButton ID="LinkButton2" PostBackUrl="~/PlantWiseDeliveryRep.aspx" ToolTip="Drill Down Report" runat="server">Drill Down </asp:LinkButton>  |
                        <asp:LinkButton ID="LinkButton3" PostBackUrl="~/SerialNoWiseDeliveryRpt.aspx" runat="server" ToolTip="Serial No Wise Delivery Plan">Serial No </asp:LinkButton>   |
                          <asp:LinkButton ID="LinkButton5" PostBackUrl="~/PlantWiseDeliveryReport.aspx" runat="server" ToolTip="Plant Wise Delivery Report">Plant </asp:LinkButton> 
                        --%>
                        <a href="ShipmentDashboard.aspx" target="_blank">
                            <asp:Label ID="Label8" runat="server" ToolTip="MSP Dashboard" Text="Dashboard" type="button"></asp:Label>
                        </a>|
                         <a href="PlantWiseDeliveryRep.aspx" tooltip="Drill Down Report" target="_blank">
                             <asp:Label ID="Label7" runat="server" ToolTip="Drill Down Report" Text="Drill Down" type="button"></asp:Label></a> |
                         <a href="SerialNoWiseDeliveryRpt.aspx" target="_blank">
                             <asp:Label ID="Label6" runat="server" ToolTip="Serial No Wise Delivery Plan" Text="Serial No" type="button"></asp:Label>
                         </a>|
                         <a href="PlantWiseDeliveryReport.aspx" target="_blank">
                             <asp:Label ID="Label5" runat="server" ToolTip="Plant Wise Delivery Report" Text="Plant" type="button"></asp:Label>
                         </a>|
                         <a href="StyleWiseHistory.aspx" target="_blank">
                             <asp:Label ID="Button1" runat="server" ToolTip="Style Wise Log Report" Text="Log" type="button"></asp:Label>
                         </a>|
                       <asp:LinkButton ID="LBtncargoHO" ToolTip="Cargo @ HO Deliveries" OnClick="LBtncargoHO_Click" runat="server">Cargo-HO</asp:LinkButton>
                    </div>
                </div>
            </div>
            <div class="col-md-12">
                <div class="panel panel-default">
                    <div class="panel-body">
                        <div class="box-body">
                            <div class="row">
                                <div class="form-group">
                                    <label class="col-md-1 control-label">From<span style="color: red">*</span></label>
                                    <div class="col-md-3">
                                        <BDP:BasicDatePicker Width="50px" ID="DatePickerFromDate" AutoPostBack="true" runat="server" CssClass="form-control" OnSelectionChanged="DatePickerFromDate_SelectionChanged" />
                                    </div>
                                    <%--  <div class="col-md-3">
                                         &nbsp; &nbsp; &nbsp; &nbsp;
                                         </div>--%>
                                    <label class="col-md-1 control-label">To <span style="color: red">*</span></label>
                                    <div class="col-md-3">
                                        <BDP:BasicDatePicker ID="DatePickerToDate" AutoPostBack="true" runat="server" CssClass="form-control" OnSelectionChanged="DatePickerToDate_SelectionChanged" />
                                    </div>
                                    <%--<div class="col-md-1">
                                         &nbsp; &nbsp; &nbsp; &nbsp;
                                         </div>--%>
                                    <label class="col-md-1 control-label">Plant:</label>
                                    <div class="col-md-1">
                                        <asp:DropDownList ID="DDLPlant" runat="server" CssClass="form-control" Font-Size="Smaller"
                                            AutoPostBack="true" OnSelectedIndexChanged="DDLPlant_SelectedIndexChanged">
                                        </asp:DropDownList>
                                    </div>
                                    <div class="col-md-1">
                                        <%--  <img src="images/tab.png" width="20px" onclick="multiopen()"/>--%>
                                        <asp:ImageButton ImageUrl="images/Excel-32.png" Width="24px" runat="server" ToolTip="Export To Excel" OnClick="btnExcel_Click" ID="btnExcel" />
                                        <asp:ImageButton ImageUrl="images/tab.png" Width="22px" runat="server" ToolTip="Plant in Tabs" OnClick="btntab_Click" ID="btntab" />
                                        <asp:ImageButton ImageUrl="images/group.png" Width="22px" runat="server" ToolTip="Group To Exfactory Date" OnClick="ImageButton2_Click1" ID="imgBtnGroup" />
                                    </div>
                                    <script type="text/javascript">
                                        function multiopen() {
                                            var DatePickerFromDate = document.getElementById("DatePickerFromDate").value;
                                            var DatePickerToDate = document.getElementById("DatePickerToDate").value;

                                            var FromDate = "2018-10-01";
                                            var ToDate = "2018-10-31";

                                            window.open("DPlan.aspx?type=1&FromDate=" + FromDate + "@ToDate=" + ToDate + "", '_blank');
                                            window.open('DPlan.aspx?type=2', '_blank');
                                            window.open('DPlan.aspx?type=3', '_blank');
                                            window.open('DPlan.aspx?type=4', '_blank');
                                        }
                                    </script>
                                    <div class="col-md-1">
                                        <asp:UpdatePanel runat="server" ID="Panel">
                                            <ContentTemplate>
                                                <asp:Button ID="btnsearch" CssClass="btn btn-info" runat="server" Text="Search" OnClick="btnsearch_Click" Style="width: 69px" />
                                            </ContentTemplate>
                                        </asp:UpdatePanel>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="box-body">
                        <div class="row">
                            <div class="form-group">
                                <%--  <label class="col-md-1 control-label">Type <span style="color: red">*</span></label>--%>
                                <%--<div class="col-md-1">--%>
                                <asp:DropDownList ID="ddlType" runat="server" CssClass="form-control" Font-Size="Smaller" Visible="false" AutoPostBack="true" OnSelectedIndexChanged="ddlType_SelectedIndexChanged">
                                    <%--<asp:ListItem> </asp:ListItem>--%>
                                    <asp:ListItem Value="1">Shipment Schedule Report</asp:ListItem>
                                    <%-- <asp:ListItem Value="2">Revision Report</asp:ListItem>--%>
                                    <asp:ListItem Value="3">Cancelled Report</asp:ListItem>
                                </asp:DropDownList>
                                <%-- </div>--%>
                                <label class="col-md-1 control-label">Status:</label>
                                <div class="col-md-1">
                                    <asp:DropDownList ID="ddlStatus" runat="server" CssClass="form-control" Font-Size="Smaller"
                                        AutoPostBack="true" OnSelectedIndexChanged="ddlStatus_SelectedIndexChanged">
                                        <asp:ListItem> </asp:ListItem>
                                        <asp:ListItem Value="1">Pending</asp:ListItem>
                                        <asp:ListItem Value="2">FG in Transit</asp:ListItem>
                                        <asp:ListItem Value="3">Shipped</asp:ListItem>
                                        <asp:ListItem Value="4">Cargo at HO</asp:ListItem>
                                        <asp:ListItem Value="6">Cancelled</asp:ListItem>
                                        <%--  <asp:ListItem Value="6">All Records Without Cancel</asp:ListItem>--%>
                                    </asp:DropDownList>
                                </div>
                                <label class="col-md-1 control-label" style="font-size: smaller">Without Cancelled:</label>
                                <div class="col-md-1">
                                    <label class="container">
                                        <%--<input type="checkbox"  ID="CheckBox1"   checked="checked" runat="server" visible="true">--%>
                                        <%--<asp:CheckBox ID="CheckBox1" checked="true" runat="server" />--%>
                                        <asp:CheckBox ID="CheckBox1" AutoPostBack="true" OnCheckedChanged="CheckBox1_CheckedChanged" Width="25px" Height="25px" Checked="true" runat="server" />
                                        <%-- <span class="checkmark" ></span> --%>
                                    </label>
                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%--&nbsp;<asp:CheckBox ID="CheckBox1" class="checkmark" runat="server" />--%></div>
                                <label class="col-md-1 control-label">Buyer:</label>
                                <div class="col-md-2">
                                    <asp:DropDownList ID="DDLBUYER" CssClass="form-control" runat="server" Font-Size="Smaller"
                                        AutoPostBack="true" OnSelectedIndexChanged="DDLBUYER_SelectedIndexChanged">
                                    </asp:DropDownList>
                                </div>
                                <label class="col-md-1 control-label">Style:</label>
                                <div class="col-md-2">
                                    <asp:DropDownList ID="DDLStyle" runat="server" CssClass="form-control" Font-Size="Smaller"
                                        AutoPostBack="true" OnSelectedIndexChanged="DDLStyle_SelectedIndexChanged">
                                    </asp:DropDownList>
                                </div>
                                <label class="col-md-1 control-label">Efficiency:</label>
                                <div class="col-md-1">
                                    <asp:DropDownList ID="DropEfficiency" runat="server" CssClass="form-control"
                                        AutoPostBack="true" OnSelectedIndexChanged="DropEfficiency_SelectedIndexChanged">
                                        <asp:ListItem Value="0">All</asp:ListItem>
                                        <asp:ListItem Value="1">Ontime</asp:ListItem>
                                        <asp:ListItem Value="2">Delay</asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </asp:Panel>
        <asp:UpdatePanel runat="server" ID="UpdatePanel1">
            <ContentTemplate>
                <asp:Panel ID="Panel1" runat="server">
                    <div class="col-md-12">
                        <asp:GridView ID="GridViewPrevious" runat="server" OnRowDataBound="GridViewDelivery_RowDataBound" Font-Size="Small" Visible="False">
                            <HeaderStyle BackColor="#c1bcbc" />
                        </asp:GridView>
                        <br />
                    </div>
                </asp:Panel>
                <asp:Panel ID="pnlSchedulePlan" runat="server">
                    <div class="col-md-16">
                        <div class="box-body">
                            <div class="form-group">
                                <label class="col-md-1 control-label">
                                    <img src="images/Green.PNG" width="35" height="20" />
                                    : Shipped</label>
                                <label class="col-md-2 control-label">
                                    <img src="images/dam.PNG" width="35" height="20" />
                                    : Cargo @HO</label>
                                <label class="col-md-2 control-label">
                                    <img src="images/Blue.PNG" width="35" height="20" />
                                    : Shipped But Delayed</label>
                               
                                <%--<label class="col-md-1 control-label">
                            <img src="images/orange.PNG" width="35" height="20" />
                            : Cancel Requested</label>--%>
                               
                                <label class="col-md-2 control-label" style="font-size: larger; border: solid; padding: 2px 2px 2px 2px;">
                                    Total Exp.Inc :
                            <asp:Label ID="lblTotalExpInc" runat="server"></asp:Label></label>
                           <br />  <label class="col-md-2 control-label" style="font-size: larger; border: solid; padding: 2px 2px 2px 2px;">
                                    Total CM.Inc :
                                  <asp:Label ID="lblCMIncome" runat="server"></asp:Label></label>

                                <br />  <label class="col-md-2 control-label" style="font-size: larger; border: solid; padding: 2px 2px 2px 2px;">
                                    Total Planned Inc. :
                                  <asp:Label ID="lblPlannedIncome" runat="server"></asp:Label></label>
                            </div>
                        </div>
                        
                        <div class="col-md-12">                            
                                <div class="form-group">
                                      <label class="col-md-1 control-label">
                                    <img src="images/Pink.PNG" width="35" height="20" />
                                    : Overdue</label>
                         <label class="col-md-2 control-label">
                                    <img src="images/Yelow.PNG" width="35" height="20" />
                                    : FG in Transit But Delayed</label>
                              
                                     <label class="col-md-2 control-label">
                                    <img src="images/offwhite.PNG" width="35" height="20" />
                                    : Cancelled</label>
                                    </div>                               
                            </div>

                        <div class="col-md-12">
                            <div class="box-body">
                                <div class="form-group">
                                    <asp:Label ID="Label17" runat="server" class="col-md-8 control-label" ForeColor="#e34225" Font-Bold="true"> Exp. Inc. = Committed Qty X FOB (Status : All / Cancelled / Pending)   </asp:Label>
                                    
                                    <asp:Label ID="Label18" runat="server" class="col-md-12 control-label" ForeColor="#e34225" Font-Bold="true">         Exp. Inc. = Ship Qty X FOB (Status : FG in Transit / Shipped / Cargo @ HO) </asp:Label>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-12">
                        <asp:Panel ID="Panel2" runat="server">
                            <asp:GridView ID="GVBuyerSummary" runat="server" OnRowDataBound="GVBuyerSummary_RowDataBound" FooterStyle-HorizontalAlign="Right" ShowFooter="true" Height="25px" AutoGenerateColumns="False" BackColor="White" BorderColor="#cccccc"
                                BorderWidth="1px" CellPadding="4" ForeColor="Black" AllowSorting="True"
                                EnableModelValidation="True" Width="900px">
                                <Columns>
                                    <asp:TemplateField HeaderText="Buyer" ControlStyle-Width="150px">
                                        <ItemTemplate>
                                            <asp:Label ID="BuyerName" runat="server" Text='<%#Eval("BuyerName") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Committed Qty" HeaderStyle-CssClass="text-right" ItemStyle-HorizontalAlign="Right" ControlStyle-Width="150px">
                                        <ItemTemplate>
                                            <asp:Label ID="SumithraPOQty" runat="server" Text=' <%#Eval("SumithraPOQty","{0:#,##0}")%>'></asp:Label>
                                        </ItemTemplate>
                                        <FooterTemplate>
                                            <div>
                                                <asp:Label Font-Bold="true" ID="LblTotSPO" runat="server" />
                                            </div>
                                        </FooterTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Total Exp. Inc" HeaderStyle-CssClass="text-right" ItemStyle-HorizontalAlign="Right" ControlStyle-Width="150px">
                                        <ItemTemplate>
                                            <asp:Label ID="TotExy" runat="server" Text=' <%#Eval("TotExy","{0:#,##0.00}")%>'></asp:Label>
                                        </ItemTemplate>
                                        <FooterTemplate>
                                            <div>
                                                <asp:Label Font-Bold="true" ID="LblTotExy" runat="server" />
                                            </div>
                                        </FooterTemplate>
                                    </asp:TemplateField>
                                </Columns>
                                <FooterStyle BackColor="#333333" Font-Bold="True" ForeColor="White" CssClass="GVFixedFooter" />
                                <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
                            </asp:GridView>
                        </asp:Panel>
                    </div>
                    <div class="col-md-12">
                        <%-- <asp:GridView ID="gvdeliveryReport" OnRowDataBound="gvdeliveryReport_RowDataBound" runat="server" GridLines="None"
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
                                    </asp:Panel>--%>
                        <asp:GridView ID="gvDeliveries" OnSorting="gvDeliveries_Sorting" runat="server" AutoGenerateColumns="false"
                            HeaderStyle-BackColor="#c1bcbc" Width="100%" OnRowDataBound="gvDeliveries_RowDataBound">
                            <Columns>
                                <asp:TemplateField Visible="true">
                                    <ItemTemplate>
                                        <asp:ImageButton ID="imgbtnColorView" OnClick="imgbtnColorView_Click" runat="server" Height="30px" ImageUrl="~/images/DPlus.png" ToolTip="" Width="30px" />
                                    </ItemTemplate>
                                </asp:TemplateField>
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
                                <asp:TemplateField HeaderText="Exfac. Date" ItemStyle-Width="100" Visible="true">
                                    <ItemTemplate>
                                        <asp:Label ID="DeliveryDate" runat="server" Text='<%#Eval("DeliveryDate","{0:dd/MMM/yyyy}") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="DELDate" Visible="false">
                                    <ItemTemplate>
                                        <asp:Label ID="DELDate" runat="server" Text='<%#Eval("DELDate") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Buyer" Visible="false">
                                    <ItemTemplate>
                                        <asp:Label ID="BuyerName" runat="server" Text='<%#Eval("BuyerName") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <%--<asp:TemplateField HeaderText="Item" Visible="false">
                                                <ItemTemplate>
                                                    <asp:Label ID="ItemDescription" runat="server" Text='<%#Eval("ItemDescription") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>--%>
                                <%--<asp:TemplateField HeaderText="Dep" Visible="false">
                                                <ItemTemplate>
                                                    <asp:Label ID="DeptName" runat="server" Text='<%#Eval("DeptName") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>--%>
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
                                        <asp:Label ID="Scheduled" ToolTip="Plant" runat="server" Text='<%#Eval("ScheduledFactory") %>'></asp:Label>
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
                                <asp:TemplateField HeaderText="Ship Mode" ItemStyle-Width="5%">
                                    <ItemTemplate>
                                        <asp:Label ToolTip="Ship Mode" ID="ShipMode" Font-Size="Small" runat="server" Text='<%#Eval("ShipMode") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Color" ItemStyle-Width="7%">
                                    <ItemTemplate>
                                        <asp:Label ID="ColorName" ToolTip="Color" Font-Size="Small" runat="server" Text='<%#Eval("ColorName") %>'></asp:Label>
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
                                <asp:TemplateField HeaderText="BPO Qty" ItemStyle-HorizontalAlign="Right"
                                    ItemStyle-Width="6%">
                                    <ItemTemplate>
                                        <asp:Label ID="BuyerPOQty" ToolTip="BPO Qty" Font-Bold="true" runat="server" Text='<%#Eval("BuyerPOQty") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="SPO Qty" ItemStyle-HorizontalAlign="Right" Visible="true"
                                    ItemStyle-Width="5%">
                                    <ItemTemplate>
                                        <asp:Label ID="SumithraPOQty" ToolTip="SPO Qty" runat="server" Text='<%#Eval("SumithraPOQty") %>'></asp:Label>
                                        <%--<asp:Label ID="SumithraPOQty" ToolTip='<%#Eval("CAStatus")%>' runat="server" Text='<%#Eval("SumithraPOQty") %>'></asp:Label>--%>
                                    </ItemTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="SPO/BPO Variance" ItemStyle-HorizontalAlign="Right" Visible="true"
                                    ItemStyle-Width="5%">
                                    <ItemTemplate>
                                        <asp:Label ID="BPOtoSPOVariance" ToolTip="SPO/BPO Variance" runat="server" Text='<%#Eval("BPOtoSPOVariance") %>'></asp:Label>
                                       
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="FOB" ItemStyle-HorizontalAlign="Right"
                                    ItemStyle-Width="5%">
                                    <ItemTemplate>
                                        <asp:Label ID="FOB" ToolTip="FOB" runat="server" Text='<%#Eval("FOB","{0:n}") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Exp.Inc" ItemStyle-HorizontalAlign="Right"
                                    ItemStyle-Width="8%">
                                    <ItemTemplate>
                                        <asp:Label ID="FOB_SPO" ToolTip="Exp.Inc" runat="server" Text='<%#Eval("TTLIncome","{0:n2}") %>'></asp:Label>
                                        <%-- <asp:Label ID="FOB_SPO" ToolTip="Exp.Inc" runat="server"></asp:Label>--%>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Buyer's PO Date" ItemStyle-HorizontalAlign="Right"
                                    ItemStyle-Width="7%">
                                    <ItemTemplate>
                                        <asp:Label ID="ShipDate" Font-Bold="true" runat="server" ToolTip='<%# Eval("DespatchedOn","{0:dd/MMM/yyyy}") %>' Text='<%#Eval("ExtendedShipDate","{0:dd/MMM/yyyy}") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Del#" ItemStyle-Width="3%">
                                    <ItemTemplate>
                                        <asp:Label ID="lblDEL" ToolTip="Del#" runat="server" Text="DEL#"></asp:Label><asp:Label ID="DeliveryNo" runat="server" Text='<%#Eval("DeliveryNo") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Meeting Date" ItemStyle-Width="8%">
                                    <ItemTemplate>
                                        <asp:Label ID="RevisedDate" ToolTip="Meeting Date" runat="server" Text='<%#Eval("RevisedDate","{0:dd/MMM/yyyy}") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Comment" ItemStyle-Width="8%">
                                    <ItemTemplate>
                                        <asp:Label ID="Comment" ToolTip="Comment" Font-Size="Small" runat="server" Text='<%#Eval("Comment") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Committed Qty" ItemStyle-HorizontalAlign="Right" ItemStyle-Width="3%">
                                    <ItemTemplate>
                                        <asp:Label ID="DeliveryQty" ToolTip="Committed Qty" runat="server" Text='<%#Eval("DeliveryQty") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Ship Qty" ItemStyle-HorizontalAlign="Right" ItemStyle-Width="3%">
                                    <ItemTemplate>
                                        <asp:Label ID="ShippedQty" ToolTip="Ship Qty" runat="server" Text='<%#Eval("ShippedQty") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Var" ItemStyle-HorizontalAlign="Right" ItemStyle-Width="3%">
                                    <ItemTemplate>
                                        <asp:Label ID="DelDesVar" ToolTip="Var" runat="server" Text='<%#Eval("Varience") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="SPO/Cum. Ship Var" ItemStyle-HorizontalAlign="Right" ItemStyle-Width="3%">
                                    <ItemTemplate>
                                        <asp:Label ID="SPOShipVari" ToolTip="Var" runat="server" Text='<%#Eval("SPOShipVari") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Status" ItemStyle-Width="8%">
                                    <ItemTemplate>
                                        <asp:Label ID="Status" ToolTip="Status" runat="server"></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Date Difference" ItemStyle-Width="">
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
                                 

                                  <asp:TemplateField HeaderText="CM" ItemStyle-HorizontalAlign="Right"
                                    ItemStyle-Width="5%">
                                    <ItemTemplate>
                                        <asp:Label ID="CM" ToolTip="CM" runat="server" Text='<%#Eval("CM","{0:n}") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Total CM" ItemStyle-HorizontalAlign="Right"
                                    ItemStyle-Width="8%">
                                    <ItemTemplate>
                                        <asp:Label ID="TTLCM_Income" ToolTip="Total CM" runat="server" Text='<%#Eval("TTLCM_Income","{0:n2}") %>'></asp:Label>
                                        <%-- <asp:Label ID="FOB_SPO" ToolTip="Exp.Inc" runat="server"></asp:Label>--%>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                 <asp:TemplateField HeaderText="Planned Income" ItemStyle-HorizontalAlign="Right"
                                    ItemStyle-Width="8%">
                                    <ItemTemplate>
                                        <asp:Label ID="TTLBPOIncome" ToolTip="BPO QTY X FOB" runat="server" Text='<%#Eval("TTLBPOIncome","{0:n2}") %>'></asp:Label>
                                        <%-- <asp:Label ID="FOB_SPO" ToolTip="Exp.Inc" runat="server"></asp:Label>--%>
                                    </ItemTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="Sewing SMV" ItemStyle-HorizontalAlign="Right"
                                    ItemStyle-Width="5%">
                                    <ItemTemplate>
                                        <asp:Label ID="SewingSMV" ToolTip="SewingSMV" runat="server" Text='<%#Eval("SewingSMV","{0:n}") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="SAH" ItemStyle-HorizontalAlign="Right"
                                    ItemStyle-Width="5%">
                                    <ItemTemplate>
                                        <asp:Label ID="SAH" ToolTip="SAH = (SMV * Shipped Qty)/ 60" runat="server" Text='<%#Eval("SAH","{0:n}") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="EPM" ItemStyle-HorizontalAlign="Right"
                                    ItemStyle-Width="5%">
                                    <ItemTemplate>
                                        <asp:Label ID="EPM" ToolTip="EPM = CM / SMV" runat="server" Text='<%#Eval("EPM","{0:n}") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                        <%--/asp:Panel>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Delivery Date" Visible="false">
                            <ItemTemplate>
                                <asp:Label ID="DeliveryDate" runat="server" Text='<%#Eval("DeliveryDate") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>                       
                    </Columns>
                </asp:GridView>--%><br /></div>
                    </label>
                </asp:Panel>
                <asp:Panel ID="pnlCargoatHO" runat="server">
                    <label class="col-md-2 control-label pull-right" style="font-size: larger; border: solid; padding: 5px 5px 5px 5px;">
                        Total Exp.Inc :
                            <asp:Label ID="lblTGHOExpInc" runat="server"></asp:Label></label>
                    <div class="col-md-12">
                        <div style="width: 1500px;">
                            <div id="GHead"></div>
                            <%-- This GHead is added for Store Gridview Header  --%>
                            <div style="height: 600px; overflow: auto">
                                <asp:GridView ID="gvCHODeliveries" runat="server" AutoGenerateColumns="false"
                                    HeaderStyle-BackColor="#c1bcbc" Width="1470px">
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
                                        <asp:TemplateField HeaderText="Committed Qty" ItemStyle-HorizontalAlign="Right" ItemStyle-Width="3%">
                                            <ItemTemplate>
                                                <asp:Label ID="PromisedQty" runat="server" Text='<%#Eval("PromisedQty") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Despatched Qty" ItemStyle-HorizontalAlign="Right" ItemStyle-Width="3%">
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
                            </div>
                        </div>
                        <br />
                    </div>
                </asp:Panel>
                <asp:Panel ID="pnlCancellationDel" runat="server">
                    <asp:GridView ID="GVCancellationGrid" runat="server" AutoGenerateColumns="false"
                        HeaderStyle-BackColor="#c1bcbc" Width="1470px">
                        <Columns>
                            <asp:TemplateField HeaderText="DID">
                                <ItemTemplate>
                                    <asp:Label ID="DID" runat="server" Text='<%#Eval("DID") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Plant">
                                <ItemTemplate>
                                    <asp:Label ID="Plant" runat="server" Text='<%#Eval("ScheduledFactory") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Buyer">
                                <ItemTemplate>
                                    <asp:Label ID="BuyerName" runat="server" Text='<%#Eval("BuyerName") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Style">
                                <ItemTemplate>
                                    <asp:Label ID="StyleNo" runat="server" Text='<%#Eval("StyleNo") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="ShipMode">
                                <ItemTemplate>
                                    <asp:Label ID="ShipMode" runat="server" Text='<%#Eval("ShipMode") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Color">
                                <ItemTemplate>
                                    <asp:Label ID="ColorName" runat="server" Text='<%#Eval("ColorName") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Buyer PO">
                                <ItemTemplate>
                                    <asp:Label ID="BuyerPONo" runat="server" Text='<%#Eval("BuyerPONo") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Contract">
                                <ItemTemplate>
                                    <asp:Label ID="ContractNo" runat="server" Text='<%#Eval("ContractNo") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="BuyerPOQty">
                                <ItemTemplate>
                                    <asp:Label ID="BuyerPOQty" runat="server" Text='<%#Eval("BuyerPOQty") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="SPO Qty" ItemStyle-Width="40%">
                                <ItemTemplate>
                                    <asp:Label ID="SumithraPOQty" runat="server" Text='<%#Eval("SumithraPOQty") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="FOB" ItemStyle-HorizontalAlign="Right"
                                ItemStyle-Width="5%">
                                <ItemTemplate>
                                    <asp:Label ID="FOB" ToolTip="FOB" runat="server" Text='<%#Eval("FOB","{0:n}") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Exp.Inc" ItemStyle-HorizontalAlign="Right"
                                ItemStyle-Width="8%">
                                <ItemTemplate>
                                    <asp:Label ID="FOB_SPO" ToolTip="Exp.Inc" runat="server"></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Buyer's PO Date" ItemStyle-HorizontalAlign="Right"
                                ItemStyle-Width="7%">
                                <ItemTemplate>
                                    <asp:Label ID="ShipDate" Font-Bold="true" runat="server" ToolTip='<%# Eval("DespatchedOn","{0:dd/MMM/yyyy}") %>' Text='<%#Eval("ExtendedShipDate","{0:dd/MMM/yyyy}") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Del#" ItemStyle-Width="3%">
                                <ItemTemplate>
                                    <asp:Label ID="lblDEL" ToolTip="Del#" runat="server" Text="DEL#"></asp:Label><asp:Label ID="DeliveryNo" runat="server" Text='<%#Eval("DeliveryNo") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Meeting Date" ItemStyle-Width="8%">
                                <ItemTemplate>
                                    <asp:Label ID="RevisedDate" ToolTip="Meeting Date" runat="server" Text='<%#Eval("RevisedDate","{0:dd/MMM/yyyy}") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Comment" ItemStyle-Width="8%">
                                <ItemTemplate>
                                    <asp:Label ID="Comment" ToolTip="Comment" Font-Size="Small" runat="server" Text='<%#Eval("Comment") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Committed Qty" ItemStyle-HorizontalAlign="Right" ItemStyle-Width="3%">
                                <ItemTemplate>
                                    <asp:Label ID="DeliveryQty" ToolTip="Del Qty" runat="server" Text='<%#Eval("DeliveryQty") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Ship Qty" ItemStyle-HorizontalAlign="Right" ItemStyle-Width="3%">
                                <ItemTemplate>
                                    <asp:Label ID="ShippedQty" ToolTip="Ship Qty" runat="server" Text='<%#Eval("ShippedQty") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Var" ItemStyle-HorizontalAlign="Right" ItemStyle-Width="3%">
                                <ItemTemplate>
                                    <asp:Label ID="DelDesVar" ToolTip="Var" runat="server" Text='<%#Eval("Varience") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Status" ItemStyle-Width="8%">
                                <ItemTemplate>
                                    <asp:Label ID="Status" ToolTip="Status" runat="server"></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Date Difference" ItemStyle-Width="">
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
                        </Columns>
                    </asp:GridView>
                </asp:Panel>
                <asp:Panel ID="PanelPrevousPendind" runat="server">
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
                <asp:Label ID="Label1" runat="server" Font-Size="20px" Text="Privously not gone shipments" Visible="False"></asp:Label>
                    <div class="col-md-12">
                        <asp:GridView ID="GridViewPrivousShipments" runat="server" HeaderStyle-BackColor="#c1bcbc"
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
                                <asp:TemplateField HeaderText="Committed Date" ItemStyle-Width="100" Visible="false">
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
                                        <asp:Label ID="Scheduled" ToolTip="Plant" runat="server" Text='<%#Eval("ScheduledFactory") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Buyer" ItemStyle-Width="5%">
                                    <ItemTemplate>
                                        <asp:Label ID="BuyerCode" ToolTip="Buyer" runat="server" Text='<%#Eval("BuyerCode") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Style" ItemStyle-Width="7%">
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
                                        <asp:Label ID="BuyerPOQty" Font-Bold="true" ToolTip="BPO Qty" runat="server" Text='<%#Eval("BuyerPOQty") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="SPO Qty" ItemStyle-HorizontalAlign="Right"
                                    ItemStyle-Width="5%">
                                    <ItemTemplate>
                                        <asp:Label ID="SumithraPOQty" runat="server" Text='<%#Eval("SumithraPOQty") %>'></asp:Label>
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
                                <asp:TemplateField HeaderText="Buyer's PO Date" ItemStyle-HorizontalAlign="Right"
                                    ItemStyle-Width="7%">
                                    <ItemTemplate>
                                        <asp:Label ID="ShipDate" Font-Bold="true" runat="server" ToolTip="Ext.Ship Date" Text='<%#Eval("ExtendedShipDate","{0:dd/MMM/yyyy}") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Del#" ItemStyle-Width="3%">
                                    <ItemTemplate>
                                        <asp:Label ID="lblDEL" runat="server" ToolTip="Del#" Text="DEL#"></asp:Label><asp:Label ID="DeliveryNo" runat="server" Text='<%#Eval("DeliveryNo") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Meeting Date" ItemStyle-Width="8%">
                                    <ItemTemplate>
                                        <asp:Label ID="RevisedDate" ToolTip="Meeting Date" runat="server" Text='<%#Eval("RevisedDate","{0:dd/MMM/yyyy}") %>'></asp:Label>
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
                                <asp:TemplateField HeaderText="Cancel" Visible="true">
                                    <ItemTemplate>
                                        <asp:Label ID="labCancelRemarks" ToolTip="Cancel" runat="server" Visible="true" Text='<%#Eval("CancelRe") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                    </div>
                </asp:Panel>
                <asp:Panel ID="pnlrevisedplan" runat="server">
                    <div class="col-md-12">
                        <asp:GridView ID="GridViewDelivery" runat="server" OnRowDataBound="GridViewDelivery_RowDataBound" Font-Size="Small">
                            <HeaderStyle BackColor="#c1bcbc" />
                        </asp:GridView>
                        <br />
                    </div>
                </asp:Panel>
                <asp:Button ID="btnShowPopup" runat="server" Style="display: none" />
                <asp:ModalPopupExtender ID="MPESL" runat="server" TargetControlID="btnShowPopup" PopupControlID="pnlpopup"
                    CancelControlID="btnMPECancel" BackgroundCssClass="modalBackground">
                </asp:ModalPopupExtender>
                <asp:Panel ID="pnlpopup" runat="server" BackColor="White" Height="500px" Width="1100px"
                    Style="overflow: scroll; border: Solid 3px #0026ff;">
                    <div class="container" style="max-width: 1050px">
                        <div class="row">
                            <div class="col-md-10">
                                <h4 style="text-align: center">Color Wise Summary</h4>
                            </div>
                            <div class="col-md-2">
                                <br />
                                <asp:ImageButton ID="btnMPECancel" runat="server" ImageUrl="~/images/Cancel.png"
                                    Width="20" Height="20" CssClass="pull-right" />
                                <%--  <asp:ImageButton ID="ImageButton1" runat="server" Height="30px" ToolTip="Print View" ImageUrl="~/images/Printer-icon.png" OnClick="ImageButton1_Click" OnClientClick=""  Width="30px" />--%>
                            </div>
                        </div>
                        <div class="col-md-12">
                            <div class="panel panel-default">
                                <div class="panel-body">
                                    <div class="box-body">
                                        <div class="row">
                                            <div class="box-body">
                                                <div class="form-group">
                                                    <div class="col-md-1">
                                                        <asp:Label ID="Label13" runat="server" Font-Bold="true" Font-Size="Small" Text="Buyer :"></asp:Label>
                                                    </div>
                                                    <div class="col-md-2">
                                                        <asp:Label ID="lblBuyer" runat="server" Font-Size="Small" Text="Label"></asp:Label>
                                                    </div>
                                                    <div class="col-md-1">
                                                        <asp:Label ID="Label14" runat="server" Font-Bold="true" Font-Size="Small" Text="Style :"></asp:Label>
                                                    </div>
                                                    <div class="col-md-2">
                                                        <asp:Label ID="LabpopStylepop" Font-Size="Small" runat="server" Text="Label"></asp:Label>
                                                    </div>
                                                    <div class="col-md-1">
                                                        <asp:Label ID="Label15" runat="server" Font-Bold="true" Font-Size="Small" Text="Color :"></asp:Label>
                                                    </div>
                                                    <div class="col-md-2">
                                                        <asp:Label ID="Labcolour" runat="server" Font-Size="Small" Text="Label"></asp:Label>
                                                    </div>
                                                    <div class="col-md-2">
                                                        <asp:Label ID="Label16" Font-Bold="true" runat="server" Font-Size="Small" Text="BPO Qty :"></asp:Label>
                                                    </div>
                                                    <div class="col-md-1">
                                                        <asp:Label ID="LabcolourQty" Font-Size="Small" runat="server" Visible="true" Text=""></asp:Label>
                                                    </div>
                                                    <div class="col-md-1">
                                                        <asp:Label ID="lblBuyerID" runat="server" Visible="false" Text=""></asp:Label>
                                                        <asp:Label ID="lblStatus" runat="server" Visible="false" Text=""></asp:Label>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <%-- <div class="col-md-10">
                        <h4 style="text-align: center">Delivery Breakdown</h4>                                               
                    </div>--%>
                            <div class="col-md-1">
                                <%-- <asp:ImageButton ID="btnCancel" runat="server" ImageUrl="~/images/remove3.png" Width="20" Height="20"  />--%>
                            </div>
                        </div>
                        <%--    <div class="row">
                    <div class="auto-style26">
                   <table class="auto-style1">
                            <tr>
                                <td class="auto-style17">&nbsp; </td>
                                <td class="auto-style14"><strong>Style&nbsp; :</strong></td>
                                <td class="auto-style7">&nbsp;
                                   <asp:Label ID="LabpopStylepopf" runat="server"></asp:Label>
                                </td>
                                <td class="auto-style22">&nbsp;&nbsp;&nbsp; <strong>Colour&nbsp;&nbsp; :</strong>&nbsp; </td>                                
                                <td class="auto-style20">
                                    <asp:Label ID="Labcolourb" runat="server"></asp:Label>
                                </td>                                
                                <td class="auto-style25">
                                    &nbsp;&nbsp;<span style="color: rgb(0, 0, 0); font-family: &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; font-size: small; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; letter-spacing: normal; orphans: 2; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;"><strong>Colour Qty </strong></span>
                                    <span style="color: rgb(0, 0, 0); font-family: &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; font-size: small; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 700; letter-spacing: normal; orphans: 2; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;">&nbsp;:</span></td>                                
                                <td class="auto-style24">
                                    <asp:Label ID="LabcolourQtyc" runat="server"></asp:Label>
                                </td>
                                <td>
                                 <asp:Label ID="LabCCode" runat="server" Visible="false"></asp:Label><asp:Label ID="LabCName" runat="server" Visible="false"></asp:Label>
                                    </td>                                
                                <td>
                                    &nbsp;</td>                                
                                <td>
                                    &nbsp;</td>                                
                                <td>                                    
                                </td>   
                                 <td>
                                    &nbsp;</td>    
                                 <td>
                                    &nbsp;</td>    
                                 <td>
                                    &nbsp;</td>    
                                 <td>
                                    &nbsp;</td>    
                                 <td>
                                    &nbsp;</td>    
                                 <td>
                                     &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                                    </td>                                                              
                            </tr>
                            <tr>
                                <td class="auto-style17">&nbsp;</td>
                                <td class="auto-style14">&nbsp;</td>
                                <td class="auto-style7">&nbsp;</td>
                                <td class="auto-style22">&nbsp;</td>
                                <td class="auto-style20">&nbsp;</td>
                                <td class="auto-style25">&nbsp;</td>
                                <td class="auto-style24">&nbsp;</td>
                                <td class="auto-style5">&nbsp;</td>                             
                                <td class="auto-style5">&nbsp;</td>                               
                                <td class="auto-style5">&nbsp;</td>                               
                                <td class="auto-style5">&nbsp;</td>                              
                            </tr>
                        </table>
                    </div>
                </div>--%>
                        <div class="row">
                            <label class="col-md-7">
                                <asp:GridView ID="GridSuReport" runat="server" ShowFooter="true" AutoGenerateColumns="False" BackColor="White" BorderColor="#cc3300"
                                    BorderWidth="2px" CellPadding="4" ForeColor="Black" OnRowDataBound="GridSuReport_RowDataBound" FooterStyle-HorizontalAlign="Right" AllowSorting="True" Style="max-width: 100%; min-width: 90%; font-size: small;"
                                    EnableModelValidation="True" Width="980px">
                                    <Columns>
                                        <asp:TemplateField HeaderText="DID" ItemStyle-HorizontalAlign="Center" SortExpression="" Visible="false">
                                            <ItemTemplate>
                                                <asp:Label ID="labDID" runat="server" Text='<%#Eval("DID") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="MDID" ItemStyle-HorizontalAlign="Center" SortExpression="" Visible="false">
                                            <ItemTemplate>
                                                <asp:Label ID="labMDID" runat="server" Text='<%#Eval("MDID") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="PendingDID" ItemStyle-HorizontalAlign="Center" SortExpression="" Visible="false">
                                            <ItemTemplate>
                                                <asp:Label ID="labPendingDID" runat="server" Text='<%#Eval("PendingDID") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="PlantID" ItemStyle-HorizontalAlign="Center" SortExpression="" Visible="false">
                                            <ItemTemplate>
                                                <asp:Label ID="PlantID" runat="server" Text='<%#Eval("PlantID") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Plant" ItemStyle-HorizontalAlign="Center" SortExpression="" Visible="true">
                                            <ItemTemplate>
                                                <asp:Label ID="Plant" runat="server" Text='<%#Eval("Plant") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Delivery No" ItemStyle-HorizontalAlign="Center" SortExpression="" Visible="true">
                                            <ItemTemplate>
                                                <asp:Label ID="labDeliveryNo" runat="server" Text='<%#Eval("DeliveryNo") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Buyer PO No" ItemStyle-HorizontalAlign="Center" SortExpression="" Visible="true">
                                            <ItemTemplate>
                                                <%--                            <asp:Label ID="labBuyerPONo" runat="server" Text='<%#Eval("BuyerPONo") %>'></asp:Label>--%>
                                                <asp:LinkButton ID="labBuyerPONo" runat="server" OnClick="GridSuReport_Click" Text='<%#Eval("BuyerPONo") %>' Width="180px"></asp:LinkButton>
                                            </ItemTemplate>
                                            <FooterTemplate>
                                                <div>
                                                    <asp:Label ID="lblTotColourQty" runat="server" />
                                                </div>
                                            </FooterTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="FOB" ItemStyle-HorizontalAlign="Right" Visible="false" SortExpression="">
                                            <ItemTemplate>
                                                <asp:Label ID="labFOB" runat="server" Text='<%#Eval("FOB") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Extended Ship Date" ItemStyle-HorizontalAlign="Center" SortExpression="">
                                            <ItemTemplate>
                                                <asp:Label ID="labExtendedShipDate" runat="server" Text='<%#Eval("ExtendedShipDate") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Committed Date" ItemStyle-HorizontalAlign="Center" SortExpression="">
                                            <ItemTemplate>
                                                <asp:Label ID="labPromisedDate" runat="server" Text='<%#Eval("PromisedDate") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Committed Qty" ItemStyle-HorizontalAlign="Right" SortExpression="">
                                            <ItemTemplate>
                                                <asp:Label ID="labPromisedQty" runat="server" Text='<%#Eval("PromisedQty") %>'></asp:Label>
                                            </ItemTemplate>
                                            <FooterTemplate>
                                                <div>
                                                    <asp:Label ID="lblTotPromisedQty" runat="server" />
                                                </div>
                                            </FooterTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Despatched Qty" ItemStyle-HorizontalAlign="Right" SortExpression="">
                                            <ItemTemplate>
                                                <asp:Label ID="labDespatchedQty" runat="server" Text='<%#Eval("DespatchedQty") %>'></asp:Label>
                                            </ItemTemplate>
                                            <FooterTemplate>
                                                <div>
                                                    <asp:Label ID="lblTotDespatchedQty" runat="server" />
                                                </div>
                                            </FooterTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Committed Vs Des" ItemStyle-HorizontalAlign="Right" Visible="false">
                                            <ItemTemplate>
                                                <asp:Label ID="labPromisedQtyDetail" runat="server"></asp:Label>
                                            </ItemTemplate>
                                            <FooterTemplate>
                                                <div>
                                                    <asp:Label ID="lblTotPromisedQtyDetailFOBDetail" runat="server" />
                                                </div>
                                            </FooterTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Committed Vs Des" ItemStyle-HorizontalAlign="Right" Visible="false">
                                            <ItemTemplate>
                                                <asp:Label ID="labPromisedQtyFOB" runat="server"></asp:Label>
                                            </ItemTemplate>
                                            <FooterTemplate>
                                                <div>
                                                    <asp:Label ID="lblTotPromisedQtyFOBValue" runat="server" />
                                                </div>
                                            </FooterTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Over/Short Qty" ItemStyle-HorizontalAlign="Right" SortExpression="">
                                            <ItemTemplate>
                                                <asp:Label ID="labOSQty" runat="server" Text='<%#Eval("OSQty") %>'></asp:Label>
                                            </ItemTemplate>
                                            <FooterTemplate>
                                                <div>
                                                    <asp:Label ID="lblTotOSQty" runat="server" />
                                                </div>
                                            </FooterTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Remarks" Visible="true">
                                            <ItemTemplate>
                                                <asp:Label ID="OverShortReason" runat="server" Text='<%#Eval("OverShortReason") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Despatched On" ItemStyle-HorizontalAlign="Center" Visible="true">
                                            <ItemTemplate>
                                                <asp:Label ID="labDespatchedOn" runat="server" Text='<%#Eval("DespatchedOn") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Shipped On" ItemStyle-HorizontalAlign="Center">
                                            <ItemTemplate>
                                                <asp:Label ID="labShippedOn" runat="server" Text='<%#Eval("ShippedOn") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Pending" Visible="false" ItemStyle-HorizontalAlign="Center">
                                            <ItemTemplate>
                                                <asp:Label ID="labPending" runat="server" Text='<%#Eval("Pending") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="ChildCount" Visible="false" ItemStyle-HorizontalAlign="Center">
                                            <ItemTemplate>
                                                <asp:Label ID="labChildCount" runat="server" Text='<%#Eval("ChildCount") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="POID" Visible="false" ItemStyle-HorizontalAlign="Center">
                                            <ItemTemplate>
                                                <asp:Label ID="labPOID" runat="server" Text='<%#Eval("POID") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Cancel" Visible="false">
                                            <ItemTemplate>
                                                <asp:Label ID="labCancel" runat="server" Visible="true" Text='<%#Eval("Cancel") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Cancel" Visible="true">
                                            <ItemTemplate>
                                                <asp:Label ID="labCancelRemarks" Width="80px" runat="server" Visible="true" Text='<%#Eval("CancelRe") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Short Reason" Visible="true">
                                            <ItemTemplate>
                                                <asp:Label ID="labShortReason" Width="80px" runat="server" Visible="true" Text='<%#Eval("ShortReason") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                    <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
                                </asp:GridView>
                                <br />
                                <asp:Label ID="Labebpo" runat="server" Text="" Style="font-size: small"></asp:Label>
                                <asp:GridView ID="GridSuReportSub" runat="server" ShowFooter="true" AutoGenerateColumns="False" BackColor="White" BorderColor="#cc3300"
                                    BorderWidth="2px" CellPadding="4" ForeColor="Black" OnRowDataBound="GridSuReportSub_RowDataBound" FooterStyle-HorizontalAlign="Right" AllowSorting="True" Style="max-width: 100%; min-width: 90%; font-size: small;"
                                    EnableModelValidation="True" Width="980px">
                                    <Columns>
                                        <asp:TemplateField HeaderText="Plant" ItemStyle-HorizontalAlign="Center" Visible="false" SortExpression="">
                                            <ItemTemplate>
                                                <asp:Label ID="labPlant" runat="server" Text='<%#Eval("Plant") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Colour" ItemStyle-HorizontalAlign="Center" SortExpression="">
                                            <ItemTemplate>
                                                <asp:Label ID="labColorName" runat="server" Text='<%#Eval("ColorName") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="ExtendedShipDate" ItemStyle-HorizontalAlign="Center" SortExpression="" Visible="false">
                                            <ItemTemplate>
                                                <asp:Label ID="labExtendedShipDate" runat="server" Text='<%#Eval("ExtendedShipDate") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Committed Qty" ItemStyle-HorizontalAlign="Right" SortExpression="">
                                            <ItemTemplate>
                                                <asp:Label ID="labPromisedQty" runat="server" Text='<%#Eval("PromisedQty") %>'></asp:Label>
                                            </ItemTemplate>
                                            <FooterTemplate>
                                                <div>
                                                    <asp:Label ID="lblTotPromisedQty" runat="server" />
                                                </div>
                                            </FooterTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="DespatchedQty" ItemStyle-HorizontalAlign="Right" SortExpression="" Visible="">
                                            <ItemTemplate>
                                                <asp:Label ID="labDespatchedQty" runat="server" Text='<%#Eval("DespatchedQty") %>'></asp:Label>
                                            </ItemTemplate>
                                            <FooterTemplate>
                                                <div>
                                                    <asp:Label ID="lblTotDespatchedQty" runat="server" />
                                                </div>
                                            </FooterTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Over/Short Qty" ItemStyle-HorizontalAlign="Right" SortExpression="" Visible="true">
                                            <ItemTemplate>
                                                <asp:Label ID="labOSQty" runat="server" Text='<%#Eval("OSQty") %>'></asp:Label>
                                            </ItemTemplate>
                                            <FooterTemplate>
                                                <div>
                                                    <asp:Label ID="lblTotOSQty" runat="server" />
                                                </div>
                                            </FooterTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Cancel" Visible="false">
                                            <ItemTemplate>
                                                <asp:Label ID="labCancel" runat="server" Visible="true" Text='<%#Eval("Cancel") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Cancel" Visible="true">
                                            <ItemTemplate>
                                                <asp:Label ID="labCancelRemarks" Width="80px" runat="server" Visible="true" Text='<%#Eval("CancelRe") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                    <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
                                </asp:GridView>
                                <asp:Label ID="Label12" runat="server" Text="Color Summing Up" Style="font-size: small"></asp:Label>
                                <br />
                                <br />
                                <asp:GridView ID="GVColorSummingUp" runat="server" ShowFooter="false" AutoGenerateColumns="False" BackColor="White" BorderColor="#cc3300"
                                    BorderWidth="2px" CellPadding="4" ForeColor="Black" FooterStyle-HorizontalAlign="Right" AllowSorting="True" Style="max-width: 100%; min-width: 90%; font-size: small;"
                                    EnableModelValidation="True" Width="980px">
                                    <Columns>
                                        <asp:TemplateField HeaderText="BPO Qty" ItemStyle-HorizontalAlign="Center" SortExpression="">
                                            <ItemTemplate>
                                                <asp:Label ID="labBPOQty" runat="server" Text='<%#Eval("BPOQty") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="SPO Qty" ItemStyle-HorizontalAlign="Center" SortExpression="" Visible="false">
                                            <ItemTemplate>
                                                <asp:Label ID="labSPOQty" runat="server" Text='<%#Eval("SPOQty") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Committed Qty" ItemStyle-HorizontalAlign="Center" SortExpression="">
                                            <ItemTemplate>
                                                <asp:Label ID="labCommittedQty" runat="server" Text='<%#Eval("CommittedQty") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Dispatched Qty" ItemStyle-HorizontalAlign="Center" SortExpression="">
                                            <ItemTemplate>
                                                <asp:Label ID="labDespatchedQty" runat="server" Text='<%#Eval("DespatchedQty") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="BPO Vs Dispatched Qty" ItemStyle-HorizontalAlign="Center" SortExpression="">
                                            <ItemTemplate>
                                                <asp:Label ID="BPOVsDispatched" runat="server" Text='<%#Eval("BPOVsDispatched") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="SPO Vs Dispatched Qty" ItemStyle-HorizontalAlign="Center" SortExpression="" Visible="false">
                                            <ItemTemplate>
                                                <asp:Label ID="SPOVsDispatched" runat="server" Text='<%#Eval("SPOVsDispatched") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Committed Vs Dispatched Qty" ItemStyle-HorizontalAlign="Center" SortExpression="">
                                            <ItemTemplate>
                                                <asp:Label ID="CommittedVsDispatched" runat="server" Text='<%#Eval("CommittedVsDispatched") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                </asp:GridView>
                                <br />
                                <br />
                                <asp:Label ID="Label09" runat="server" Text="BPO Summery" Style="font-size: small"></asp:Label>
                                <br />
                                <br />
                                <asp:GridView ID="GridBpoSummery" runat="server" ShowFooter="false" AutoGenerateColumns="False" BackColor="White" BorderColor="#cc3300"
                                    BorderWidth="2px" CellPadding="4" ForeColor="Black" OnRowDataBound="GridBpoSummery_RowDataBound" FooterStyle-HorizontalAlign="Right" AllowSorting="True" Style="max-width: 100%; min-width: 90%; font-size: small;"
                                    EnableModelValidation="True" Width="980px">
                                    <Columns>
                                        <asp:TemplateField HeaderText="BuyerPONo" ItemStyle-HorizontalAlign="Center" SortExpression="">
                                            <ItemTemplate>
                                                <asp:Label ID="labBuyerPONo" runat="server" Text='<%#Eval("BuyerPONo") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="ContractNo" ItemStyle-HorizontalAlign="Center" SortExpression="" Visible="">
                                            <ItemTemplate>
                                                <asp:Label ID="labContractNo" runat="server" Text='<%#Eval("ContractNo") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="BPOQty" ItemStyle-HorizontalAlign="Right" SortExpression="">
                                            <ItemTemplate>
                                                <asp:Label ID="ReqQty" runat="server" Text='<%#Eval("ReqQty") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="ShippedQty" ItemStyle-HorizontalAlign="Right" SortExpression="">
                                            <ItemTemplate>
                                                <asp:Label ID="ShippedQty" runat="server" Text='<%#Eval("ShippedQty")%>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Short / Over Qty" ItemStyle-HorizontalAlign="Right" SortExpression="" Visible="">
                                            <ItemTemplate>
                                                <asp:Label ID="labShippedQty" runat="server"></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="ExtendedShipDate" ItemStyle-HorizontalAlign="Right" SortExpression="" Visible="true">
                                            <ItemTemplate>
                                                <asp:Label ID="labExtendedShipDate" runat="server" Text='<%#Eval("ExtendedShipDate", "{0:dd/MM/yyyy}") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="maxShippedDate" ItemStyle-HorizontalAlign="Right" Visible="">
                                            <ItemTemplate>
                                                <asp:Label ID="labmaxShippedDate" runat="server" Text='<%#Eval("maxShippedDate", "{0:dd/MM/yyyy}") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                    <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
                                </asp:GridView>
                                <br />
                                <br />
                                <asp:Label ID="Label2" runat="server" Text="Pending Deliveries" Style="font-size: small"></asp:Label>
                                <asp:GridView ID="GridViewShiped" runat="server" ShowFooter="true" AutoGenerateColumns="False" BackColor="White" BorderColor="#cc3300"
                                    BorderWidth="2px" CellPadding="4" ForeColor="Black" FooterStyle-HorizontalAlign="Right" OnRowDataBound="GridViewShiped_RowDataBound" AllowSorting="True" Style="max-width: 100%; min-width: 90%; font-size: small;"
                                    EnableModelValidation="True" Width="980px">
                                    <Columns>
                                        <asp:TemplateField HeaderText="PlantID" ItemStyle-HorizontalAlign="Center" SortExpression="" Visible="false">
                                            <ItemTemplate>
                                                <asp:Label ID="PlantID" runat="server" Text='<%#Eval("PlantID") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Plant" ItemStyle-HorizontalAlign="Center" SortExpression="" Visible="true">
                                            <ItemTemplate>
                                                <asp:Label ID="Plant" runat="server" Text='<%#Eval("Plant") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Delivery No" ItemStyle-Width="20px" ItemStyle-HorizontalAlign="Center" SortExpression="" Visible="true">
                                            <ItemTemplate>
                                                <asp:Label ID="labDeliveryNo" runat="server" Text='<%#Eval("DeliveryNo") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Buyer PO No" ItemStyle-Width="180px" ItemStyle-HorizontalAlign="Center" SortExpression="" Visible="true">
                                            <ItemTemplate>
                                                <asp:Label ID="labBuyerPONo" runat="server" Text='<%#Eval("BuyerPONo") %>'></asp:Label>
                                            </ItemTemplate>
                                            <FooterTemplate>
                                                <div>
                                                    <asp:Label ID="lblTotColourQty" runat="server" />
                                                </div>
                                            </FooterTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="FOB" ItemStyle-HorizontalAlign="Right" Visible="false" SortExpression="">
                                            <ItemTemplate>
                                                <asp:Label ID="labFOB" runat="server" Text='<%#Eval("FOB") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Extended Ship Date" ItemStyle-Width="35px" ItemStyle-HorizontalAlign="Center" SortExpression="">
                                            <ItemTemplate>
                                                <asp:Label ID="labExtendedShipDate" runat="server" Text='<%#Eval("ExtendedShipDate") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Committed Date" ItemStyle-Width="60px" ItemStyle-HorizontalAlign="Center" SortExpression="">
                                            <ItemTemplate>
                                                <asp:Label ID="labPromisedDate" runat="server" Text='<%#Eval("PromisedDate") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Committed Qty" ItemStyle-Width="63px" ItemStyle-HorizontalAlign="Right" SortExpression="">
                                            <ItemTemplate>
                                                <asp:Label ID="labPromisedQty" runat="server" Text='<%#Eval("PromisedQty") %>'></asp:Label>
                                            </ItemTemplate>
                                            <FooterTemplate>
                                                <div>
                                                    <asp:Label ID="lblTotPromisedQty" runat="server" />
                                                </div>
                                            </FooterTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Despatched Qty" ItemStyle-Width="40px" ItemStyle-HorizontalAlign="Right" SortExpression="">
                                            <ItemTemplate>
                                                <asp:Label ID="labDespatchedQty" runat="server"></asp:Label>
                                            </ItemTemplate>
                                            <FooterTemplate>
                                                <div>
                                                    <asp:Label ID="lblTotDespatchedQty" runat="server" />
                                                </div>
                                            </FooterTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Committed Vs Des" ItemStyle-HorizontalAlign="Right" Visible="false">
                                            <ItemTemplate>
                                                <asp:Label ID="labPromisedQtyDetail" runat="server"></asp:Label>
                                            </ItemTemplate>
                                            <FooterTemplate>
                                                <div>
                                                    <asp:Label ID="lblTotPromisedQtyDetailFOBDetail" runat="server" />
                                                </div>
                                            </FooterTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Committed Vs Des" ItemStyle-HorizontalAlign="Right" Visible="false">
                                            <ItemTemplate>
                                                <asp:Label ID="labPromisedQtyFOB" runat="server"></asp:Label>
                                            </ItemTemplate>
                                            <FooterTemplate>
                                                <div>
                                                    <asp:Label ID="lblTotPromisedQtyFOBValue" runat="server" />
                                                </div>
                                            </FooterTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Over/Short Qty" ItemStyle-Width="70px" ItemStyle-HorizontalAlign="Right" SortExpression="">
                                            <ItemTemplate>
                                                <asp:Label ID="labOSQty" runat="server"></asp:Label>
                                            </ItemTemplate>
                                            <FooterTemplate>
                                                <div>
                                                    <asp:Label ID="lblTotOSQty" runat="server" />
                                                </div>
                                            </FooterTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Remarks" Visible="true">
                                            <ItemTemplate>
                                                <asp:Label ID="OverShortReason" runat="server"></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Despatched On" ItemStyle-HorizontalAlign="Center" Visible="true">
                                            <ItemTemplate>
                                                <asp:Label ID="labDespatchedOn" runat="server"></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Shipped On" ItemStyle-Width="68px" ItemStyle-HorizontalAlign="Center">
                                            <ItemTemplate>
                                                <asp:Label ID="labShippedOn" runat="server"></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Pending" Visible="false" ItemStyle-HorizontalAlign="Center">
                                            <ItemTemplate>
                                                <asp:Label ID="labPending" runat="server"></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="ChildCount" Visible="false" ItemStyle-HorizontalAlign="Center">
                                            <ItemTemplate>
                                                <asp:Label ID="labChildCount" runat="server"></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="POID" Visible="false" ItemStyle-HorizontalAlign="Center">
                                            <ItemTemplate>
                                                <asp:Label ID="labPOID" runat="server"></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Cancel" Visible="false">
                                            <ItemTemplate>
                                                <asp:Label ID="labCancel" runat="server" Visible="true"></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Cancel" Visible="true">
                                            <ItemTemplate>
                                                <asp:Label ID="labCancelRemarks" Width="80px" runat="server" Visible="true"></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Short Reason" Visible="true">
                                            <ItemTemplate>
                                                <asp:Label ID="labShortReason" Width="80px" runat="server" Visible="true"></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                    <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
                                </asp:GridView>
                                <br />
                                <asp:Label ID="Label3" runat="server" Text="Shipment History" Style="font-size: small"></asp:Label>
                                <asp:GridView ID="GridViewOtherShipments" runat="server" ShowFooter="true" AutoGenerateColumns="False" BackColor="White" BorderColor="#cc3300"
                                    BorderWidth="2px" CellPadding="4" ForeColor="Black" OnRowDataBound="GridViewOtherShipments_RowDataBound" FooterStyle-HorizontalAlign="Right" AllowSorting="True" Style="max-width: 100%; min-width: 90%; font-size: small;"
                                    EnableModelValidation="True" Width="980px">
                                    <Columns>
                                        <asp:TemplateField HeaderText="PlantID" ItemStyle-HorizontalAlign="Center" SortExpression="" Visible="false">
                                            <ItemTemplate>
                                                <asp:Label ID="PlantID" runat="server" Text='<%#Eval("PlantID") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Plant" ItemStyle-Width="20px" ItemStyle-HorizontalAlign="Center" SortExpression="" Visible="true">
                                            <ItemTemplate>
                                                <asp:Label ID="Plant" runat="server" Text='<%#Eval("Plant") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Delivery No" ItemStyle-Width="20px" ItemStyle-HorizontalAlign="Center" SortExpression="" Visible="true">
                                            <ItemTemplate>
                                                <asp:Label ID="labDeliveryNo" runat="server" Text='<%#Eval("DeliveryNo") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Buyer PO No" ItemStyle-Width="180px" ItemStyle-HorizontalAlign="Center" SortExpression="" Visible="true">
                                            <ItemTemplate>
                                                <asp:Label ID="labBuyerPONo" runat="server" Text='<%#Eval("BuyerPONo") %>'></asp:Label>
                                            </ItemTemplate>
                                            <FooterTemplate>
                                                <div>
                                                    <asp:Label ID="lblTotColourQty" runat="server" />
                                                </div>
                                            </FooterTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="FOB" ItemStyle-HorizontalAlign="Right" Visible="false" SortExpression="">
                                            <ItemTemplate>
                                                <asp:Label ID="labFOB" runat="server" Text='<%#Eval("FOB") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Extended Ship Date" ItemStyle-Width="35px" ItemStyle-HorizontalAlign="Center" SortExpression="">
                                            <ItemTemplate>
                                                <asp:Label ID="labExtendedShipDate" runat="server" Text='<%#Eval("ExtendedShipDate") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Committed Date" ItemStyle-Width="60px" ItemStyle-HorizontalAlign="Center" SortExpression="">
                                            <ItemTemplate>
                                                <asp:Label ID="labPromisedDate" runat="server" Text='<%#Eval("PromisedDate") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Committed Qty" ItemStyle-Width="63px" ItemStyle-HorizontalAlign="Right" SortExpression="">
                                            <ItemTemplate>
                                                <asp:Label ID="labPromisedQty" runat="server" Text='<%#Eval("PromisedQty") %>'></asp:Label>
                                            </ItemTemplate>
                                            <FooterTemplate>
                                                <div>
                                                    <asp:Label ID="lblTotPromisedQty" runat="server" />
                                                </div>
                                            </FooterTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Despatched Qty" ItemStyle-Width="40px" ItemStyle-HorizontalAlign="Right" SortExpression="">
                                            <ItemTemplate>
                                                <asp:Label ID="labDespatchedQty" runat="server" Text='<%#Eval("DespatchedQty") %>'></asp:Label>
                                            </ItemTemplate>
                                            <FooterTemplate>
                                                <div>
                                                    <asp:Label ID="lblTotDespatchedQty" runat="server" />
                                                </div>
                                            </FooterTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Committed Vs Des" ItemStyle-HorizontalAlign="Right" Visible="false">
                                            <ItemTemplate>
                                                <asp:Label ID="labPromisedQtyDetail" runat="server"></asp:Label>
                                            </ItemTemplate>
                                            <FooterTemplate>
                                                <div>
                                                    <asp:Label ID="lblTotPromisedQtyDetailFOBDetail" runat="server" />
                                                </div>
                                            </FooterTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Committed Vs Des" ItemStyle-HorizontalAlign="Right" Visible="false">
                                            <ItemTemplate>
                                                <asp:Label ID="labPromisedQtyFOB" runat="server"></asp:Label>
                                            </ItemTemplate>
                                            <FooterTemplate>
                                                <div>
                                                    <asp:Label ID="lblTotPromisedQtyFOBValue" runat="server" />
                                                </div>
                                            </FooterTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Over/Short Qty" ItemStyle-Width="65px" ItemStyle-HorizontalAlign="Right" SortExpression="">
                                            <ItemTemplate>
                                                <asp:Label ID="labOSQty" runat="server" Text='<%#Eval("OSQty") %>'></asp:Label>
                                            </ItemTemplate>
                                            <FooterTemplate>
                                                <div>
                                                    <asp:Label ID="lblTotOSQty" runat="server" />
                                                </div>
                                            </FooterTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Remarks" ItemStyle-Width="10px" Visible="true">
                                            <ItemTemplate>
                                                <asp:Label ID="OverShortReason" runat="server" Text='<%#Eval("OverShortReason") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Despatched On" ItemStyle-Width="20px" ItemStyle-HorizontalAlign="Center" Visible="true">
                                            <ItemTemplate>
                                                <asp:Label ID="labDespatchedOn" runat="server" Text='<%#Eval("DespatchedOn") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Shipped On" ItemStyle-HorizontalAlign="Center">
                                            <ItemTemplate>
                                                <asp:Label ID="labShippedOn" runat="server" Text='<%#Eval("ShippedOn") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Cancel" Visible="true">
                                            <ItemTemplate>
                                                <asp:Label ID="labCancelRemarks" Width="80px" runat="server" Visible="true"></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Short Reason" ItemStyle-HorizontalAlign="Center">
                                            <ItemTemplate>
                                                <asp:Label ID="ShortReason" runat="server" Text='<%#Eval("ShortReason") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="ChildCount" Visible="false" ItemStyle-HorizontalAlign="Center">
                                            <ItemTemplate>
                                                <asp:Label ID="labChildCount" runat="server" Text='<%#Eval("ChildCount") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Pending" Visible="false" ItemStyle-HorizontalAlign="Center">
                                            <ItemTemplate>
                                                <asp:Label ID="labPendings" runat="server" Text='<%#Eval("Pending") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                    <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
                                </asp:GridView>
                                <br />
                                <asp:Label ID="Label4" runat="server" Text="Debit Notes" Style="font-size: small"></asp:Label>
                                <asp:GridView ID="GridViewDebitNotes" runat="server" ShowFooter="true" AutoGenerateColumns="False" BackColor="White" BorderColor="#cc3300"
                                    BorderWidth="2px" CellPadding="4" ForeColor="Black" OnRowDataBound="GridViewDebitNotes_RowDataBound" FooterStyle-HorizontalAlign="Right" AllowSorting="True" Style="max-width: 100%; min-width: 90%; font-size: small;"
                                    EnableModelValidation="True" Width="980px">
                                    <Columns>
                                        <asp:TemplateField HeaderText="DB Note" SortExpression="">
                                            <ItemTemplate>
                                                <asp:Label ID="DEBNumber" runat="server" Text='<%#Eval("DEBNumber") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Style" SortExpression="">
                                            <ItemTemplate>
                                                <asp:Label ID="STYLE" runat="server" Text='<%#Eval("STYLE") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Item Description" SortExpression="">
                                            <ItemTemplate>
                                                <asp:Label ID="ItemDescription" runat="server" Text='<%#Eval("ItemDescription") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="DB Note Date">
                                            <ItemTemplate>
                                                <asp:Label ID="DEBDate" runat="server" Text='<%#Eval("DB_NOTE_DATE","{0:dd/MMM/yyyy}") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="AGAINST" SortExpression="">
                                            <ItemTemplate>
                                                <asp:Label ID="Address" runat="server" Text='<%#Eval("AGAINST") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="DESCRIPTION" Visible="true">
                                            <ItemTemplate>
                                                <asp:Label ID="DESCRIPTION" runat="server" Text='<%#Eval("DESCRIPTION") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Merchandiser" Visible="true">
                                            <ItemTemplate>
                                                <asp:Label ID="OurMerchandiserName" runat="server" Text='<%#Eval("MERCHANDISER") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="DB Note Quantity" ItemStyle-HorizontalAlign="Right" Visible="true">
                                            <ItemTemplate>
                                                <asp:Label ID="QUANTITY" runat="server" Text='<%#Eval("QUANTITY") %>'></asp:Label>
                                            </ItemTemplate>
                                            <FooterTemplate>
                                                <div>
                                                    <asp:Label ID="lblTotDebQUANTITY" runat="server" />
                                                </div>
                                            </FooterTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Amount" Visible="true">
                                            <ItemTemplate>
                                                <asp:Label ID="AMOUNT" runat="server" Text='<%#Eval("AMOUNT") %>'></asp:Label>
                                            </ItemTemplate>
                                            <FooterTemplate>
                                                <div>
                                                    <asp:Label ID="lblTotDebAMOUNT" runat="server" />
                                                </div>
                                            </FooterTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Acknowledge Quantity" ItemStyle-HorizontalAlign="Right" Visible="true">
                                            <ItemTemplate>
                                                <asp:Label ID="AcknowledgeQty" runat="server" Text='<%#Eval("AcknowledgeQty") %>'></asp:Label>
                                            </ItemTemplate>
                                            <FooterTemplate>
                                                <div>
                                                    <asp:Label ID="lblAcknowledgeQty" runat="server" />
                                                </div>
                                            </FooterTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Currrency" Visible="true">
                                            <ItemTemplate>
                                                <asp:Label ID="CURRENCY" runat="server" Text='<%#Eval("CURRENCY") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Approve Comment" Visible="true">
                                            <ItemTemplate>
                                                <asp:Label ID="ShortShipmentApprovalComment" runat="server" Text='<%#Eval("ShortShipmentApprovalComment") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                    <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
                                </asp:GridView>
                                <br />
                                <asp:Label ID="Label10" runat="server" Text="Sample Dispatch Notes" Style="font-size: small"></asp:Label>
                                <asp:GridView ID="GVSampleDespatchNote" runat="server" ShowFooter="true" AutoGenerateColumns="False" BackColor="White" BorderColor="#cc3300"
                                    BorderWidth="2px" CellPadding="4" ForeColor="Black" OnRowDataBound="GVSampleDespatchNote_RowDataBound" FooterStyle-HorizontalAlign="Right" AllowSorting="True" Style="max-width: 100%; min-width: 90%; font-size: small;"
                                    EnableModelValidation="True" Width="980px">
                                    <Columns>
                                        <asp:TemplateField HeaderText="Sample Despatch No" SortExpression="">
                                            <ItemTemplate>
                                                <asp:Label ID="SampleDespatchNo" runat="server" Text='<%#Eval("SampleDespatchNo") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Style" SortExpression="">
                                            <ItemTemplate>
                                                <asp:Label ID="STYLE" runat="server" Text='<%#Eval("StyleNo") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Color" SortExpression="">
                                            <ItemTemplate>
                                                <asp:Label ID="ColorName" runat="server" Text='<%#Eval("ColorName") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Sample Type" SortExpression="">
                                            <ItemTemplate>
                                                <asp:Label ID="SampleType" runat="server" Text='<%#Eval("SampleType") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Despatched Qty" ItemStyle-HorizontalAlign="Right" Visible="true">
                                            <ItemTemplate>
                                                <asp:Label ID="DespatchedQty" runat="server" Text='<%#Eval("DespatchedQty") %>'></asp:Label>
                                            </ItemTemplate>
                                            <FooterTemplate>
                                                <div>
                                                    <asp:Label ID="lblTotDespatchedQty" runat="server" />
                                                </div>
                                            </FooterTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Received QTy" ItemStyle-HorizontalAlign="Right" Visible="true">
                                            <ItemTemplate>
                                                <asp:Label ID="ReceivedQTy" runat="server" Text='<%#Eval("ReceivedQTy") %>'></asp:Label>
                                            </ItemTemplate>
                                            <FooterTemplate>
                                                <div>
                                                    <asp:Label ID="lblTotReceivedQTy" runat="server" />
                                                </div>
                                            </FooterTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Remaining Qty" ItemStyle-HorizontalAlign="Right" Visible="true">
                                            <ItemTemplate>
                                                <asp:Label ID="RemainingQty" runat="server" Text='<%#Eval("RemainingQty") %>'></asp:Label>
                                            </ItemTemplate>
                                            <FooterTemplate>
                                                <div>
                                                    <asp:Label ID="lblTotRemainingQty" runat="server" />
                                                </div>
                                            </FooterTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Despatched To" Visible="true">
                                            <ItemTemplate>
                                                <asp:Label ID="DespatchCompany" runat="server" Text='<%#Eval("DespatchCompany") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Despatched Date">
                                            <ItemTemplate>
                                                <asp:Label ID="DespatchedDate" runat="server" Text='<%#Eval("DespatchedDate","{0:dd/MMM/yyyy}") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Despatch Comment" Visible="true">
                                            <ItemTemplate>
                                                <asp:Label ID="DespatchComment" runat="server" Text='<%#Eval("DespatchComment") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Location" Visible="true">
                                            <ItemTemplate>
                                                <asp:Label ID="Send_Plant" runat="server" Text='<%#Eval("Send_Plant") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                    <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
                                </asp:GridView>
                                <br />
                                <asp:Label ID="Label11" runat="server" Text="Rejected Deliveries" Style="font-size: small"></asp:Label>
                                <asp:GridView ID="GV_RejectedDeliveries" runat="server" ShowFooter="true" AutoGenerateColumns="False" BackColor="White" BorderColor="#cc3300"
                                    BorderWidth="2px" CellPadding="4" ForeColor="Black" OnRowDataBound="GV_RejectedDeliveries_RowDataBound" FooterStyle-HorizontalAlign="Right" AllowSorting="True" Style="max-width: 100%; min-width: 90%; font-size: small;"
                                    EnableModelValidation="True" Width="980px">
                                    <Columns>
                                        <asp:TemplateField HeaderText="PlantID" ItemStyle-HorizontalAlign="Center" SortExpression="" Visible="false">
                                            <ItemTemplate>
                                                <asp:Label ID="PlantID" runat="server" Text='<%#Eval("PlantID") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Plant" ItemStyle-HorizontalAlign="Center" SortExpression="" Visible="true">
                                            <ItemTemplate>
                                                <asp:Label ID="Plant" runat="server" Text='<%#Eval("Plant") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Style No" ItemStyle-Width="180px" ItemStyle-HorizontalAlign="Center" SortExpression="" Visible="true">
                                            <ItemTemplate>
                                                <asp:Label ID="labStyleNo" runat="server" Text='<%#Eval("StyleNo") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Buyer PO No" ItemStyle-Width="180px" ItemStyle-HorizontalAlign="Center" SortExpression="" Visible="true">
                                            <ItemTemplate>
                                                <asp:Label ID="labBuyerPONo" runat="server" Text='<%#Eval("BuyerPONo") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Color" ItemStyle-Width="180px" ItemStyle-HorizontalAlign="Center" SortExpression="" Visible="true">
                                            <ItemTemplate>
                                                <asp:Label ID="labColorName" runat="server" Text='<%#Eval("ColorName") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Delivery No" ItemStyle-Width="20px" ItemStyle-HorizontalAlign="Center" SortExpression="" Visible="true">
                                            <ItemTemplate>
                                                <asp:Label ID="labDeliveryNo" runat="server" Text='<%#Eval("DeliveryNo") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <%-- <asp:TemplateField HeaderText="FOB" ItemStyle-HorizontalAlign="Right" Visible="false" SortExpression="" >
                        <ItemTemplate>
                            <asp:Label ID="labFOB" runat="server" Text='<%#Eval("FOB") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>--%>
                                        <asp:TemplateField HeaderText="Extended Ship Date" ItemStyle-Width="35px" ItemStyle-HorizontalAlign="Center" SortExpression="">
                                            <ItemTemplate>
                                                <asp:Label ID="labExtendedShipDate" runat="server" Text='<%#Eval("ExtendedShipDate","{0:dd/MMM/yyyy}") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Committed Date" ItemStyle-Width="60px" ItemStyle-HorizontalAlign="Center" SortExpression="">
                                            <ItemTemplate>
                                                <asp:Label ID="labPromisedDate" runat="server" Text='<%#Eval("DeliveryDate","{0:dd/MMM/yyyy}") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Committed Qty" ItemStyle-Width="63px" ItemStyle-HorizontalAlign="Right" SortExpression="">
                                            <ItemTemplate>
                                                <asp:Label ID="labPromisedQty" runat="server" Text='<%#Eval("DeliveryQty") %>'></asp:Label>
                                            </ItemTemplate>
                                            <FooterTemplate>
                                                <div>
                                                    <asp:Label ID="lblTotPromisedQty" runat="server" />
                                                </div>
                                            </FooterTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Despatched Qty" ItemStyle-Width="40px" ItemStyle-HorizontalAlign="Right" SortExpression="">
                                            <ItemTemplate>
                                                <asp:Label ID="labDespatchedQty" runat="server" Text='<%#Eval("DisQty") %>'></asp:Label>
                                            </ItemTemplate>
                                            <FooterTemplate>
                                                <div>
                                                    <asp:Label ID="lblTotDespatchedQty" runat="server" />
                                                </div>
                                            </FooterTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Dispatched Date" ItemStyle-Width="60px" ItemStyle-HorizontalAlign="Center" SortExpression="">
                                            <ItemTemplate>
                                                <asp:Label ID="labDispatchedDate" runat="server" Text='<%#Eval("DispatchedDate","{0:dd/MMM/yyyy}") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Removal Comment" Visible="true">
                                            <ItemTemplate>
                                                <asp:Label ID="OverShortReason" runat="server" Text='<%#Eval("RemovalComment") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Rejection Requested" Visible="true">
                                            <ItemTemplate>
                                                <asp:Label ID="lblRejectionRequested" runat="server" Text='<%#Eval("RejectionRequested") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Reject Request Date" ItemStyle-Width="60px" ItemStyle-HorizontalAlign="Center" SortExpression="">
                                            <ItemTemplate>
                                                <asp:Label ID="labPRejectRequestDate" runat="server" Text='<%#Eval("RejectRequestDate","{0:dd/MMM/yyyy}") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Approved By" Visible="true">
                                            <ItemTemplate>
                                                <asp:Label ID="lblApprovedBy" runat="server" Text='<%#Eval("ApprovedBy") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Approved Date" ItemStyle-Width="60px" ItemStyle-HorizontalAlign="Center" SortExpression="">
                                            <ItemTemplate>
                                                <asp:Label ID="ApprovedDate" runat="server" Text='<%#Eval("ApprovedDate","{0:dd/MMM/yyyy}") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                    <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
                                </asp:GridView>
                            </label>
                        </div>
                        <div class="row">&nbsp;</div>
                </asp:Panel>
                <asp:Label ID="LabColorCode" runat="server" Text="" Visible="false"></asp:Label>

                <%---------------------------%>

                <asp:GridView ID="gvDeliveriesExporttoExcel" runat="server" AutoGenerateColumns="false"
                    HeaderStyle-BackColor="#c1bcbc" Width="100%" OnRowDataBound="gvDeliveries_RowDataBound">
                    <Columns>
                        <asp:TemplateField Visible="true">
                            <ItemTemplate>
                                <asp:ImageButton ID="imgbtnColorView" OnClick="imgbtnColorView_Click" runat="server" Height="30px" ImageUrl="~/images/DPlus.png" ToolTip="" Width="30px" />
                            </ItemTemplate>
                        </asp:TemplateField>
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
                        <asp:TemplateField HeaderText="Exfactory Date" ItemStyle-Width="100" Visible="true">
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
                                <asp:Label ID="Scheduled" ToolTip="Plant" runat="server" Text='<%#Eval("ScheduledFactory") %>'></asp:Label>
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
                        <asp:TemplateField HeaderText="Ship Mode" ItemStyle-Width="5%">
                            <ItemTemplate>
                                <asp:Label ToolTip="Ship Mode" ID="ShipMode" Font-Size="Small" runat="server" Text='<%#Eval("ShipMode") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Color" ItemStyle-Width="7%">
                            <ItemTemplate>
                                <asp:Label ID="ColorName" ToolTip="Color" Font-Size="Small" runat="server" Text='<%#Eval("ColorName") %>'></asp:Label>
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
                        <asp:TemplateField HeaderText="BPO Qty" ItemStyle-HorizontalAlign="Right"
                            ItemStyle-Width="6%">
                            <ItemTemplate>
                                <asp:Label ID="BuyerPOQty" ToolTip="BPO Qty" Font-Bold="true" runat="server" Text='<%#Eval("BuyerPOQty") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="SPO Qty" ItemStyle-HorizontalAlign="Right"
                            ItemStyle-Width="5%" Visible="true">
                            <ItemTemplate>
                                <asp:Label ID="SumithraPOQty" ToolTip="SPO Qty" runat="server" Text='<%#Eval("SumithraPOQty") %>'></asp:Label>
                                <%--<asp:Label ID="SumithraPOQty" ToolTip='<%#Eval("CAStatus")%>' runat="server" Text='<%#Eval("SumithraPOQty") %>'></asp:Label>--%>
                            </ItemTemplate>
                        </asp:TemplateField>

                         <asp:TemplateField HeaderText="BPO/SPO Variance" ItemStyle-HorizontalAlign="Right"
                            ItemStyle-Width="5%" Visible="true">
                            <ItemTemplate>
                                <asp:Label ID="BPOtoSPOVariance" ToolTip="BPO/SPO Variance" runat="server" Text='<%#Eval("BPOtoSPOVariance") %>'></asp:Label>
                                
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="FOB" ItemStyle-HorizontalAlign="Right"
                            ItemStyle-Width="5%">
                            <ItemTemplate>
                                <asp:Label ID="FOB" ToolTip="FOB" runat="server" Text='<%#Eval("FOB","{0:n}") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Exp.Inc" ItemStyle-HorizontalAlign="Right"
                            ItemStyle-Width="8%">
                            <ItemTemplate>
                                <asp:Label ID="FOB_SPO" ToolTip="Exp.Inc" runat="server"></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Buyer's PO Date" ItemStyle-HorizontalAlign="Right"
                            ItemStyle-Width="7%">
                            <ItemTemplate>
                                <asp:Label ID="ShipDate" Font-Bold="true" runat="server" ToolTip='<%# Eval("DespatchedOn","{0:dd/MMM/yyyy}") %>' Text='<%#Eval("ExtendedShipDate","{0:dd/MMM/yyyy}") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Del#" ItemStyle-Width="3%">
                            <ItemTemplate>
                                <asp:Label ID="lblDEL" ToolTip="Del#" runat="server" Text="DEL#"></asp:Label><asp:Label ID="DeliveryNo" runat="server" Text='<%#Eval("DeliveryNo") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Meeting Date" ItemStyle-Width="8%">
                            <ItemTemplate>
                                <asp:Label ID="RevisedDate" ToolTip="Meeting Date" runat="server" Text='<%#Eval("RevisedDate","{0:dd/MMM/yyyy}") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Comment" ItemStyle-Width="8%">
                            <ItemTemplate>
                                <asp:Label ID="Comment" ToolTip="Comment" Font-Size="Small" runat="server" Text='<%#Eval("Comment") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Committed Qty" ItemStyle-HorizontalAlign="Right" ItemStyle-Width="3%">
                            <ItemTemplate>
                                <asp:Label ID="DeliveryQty" ToolTip="Committed Qty" runat="server" Text='<%#Eval("DeliveryQty") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Ship Qty" ItemStyle-HorizontalAlign="Right" ItemStyle-Width="3%">
                            <ItemTemplate>
                                <asp:Label ID="ShippedQty" ToolTip="Ship Qty" runat="server" Text='<%#Eval("ShippedQty") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Var" ItemStyle-HorizontalAlign="Right" ItemStyle-Width="3%">
                            <ItemTemplate>
                                <asp:Label ID="DelDesVar" ToolTip="Var" runat="server" Text='<%#Eval("Varience") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                         <asp:TemplateField HeaderText="SPO/Cum. Ship Var" ItemStyle-HorizontalAlign="Right" ItemStyle-Width="3%">
                            <ItemTemplate>
                                <asp:Label ID="SPOShipVari" ToolTip="Var" runat="server" Text='<%#Eval("SPOShipVari") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Status" ItemStyle-Width="8%">
                            <ItemTemplate>
                                <asp:Label ID="Status" ToolTip="Status" runat="server"></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Date Difference" ItemStyle-Width="">
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
                        <asp:TemplateField HeaderText="Cumulativ Dispatched" Visible="true">
                            <ItemTemplate>
                                <asp:Label ID="SOFARDeliveredQty" runat="server" Visible="true" Text='<%#Eval("SOFARDeliveredQty") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                         <asp:TemplateField HeaderText="CM" ItemStyle-HorizontalAlign="Right"
                            ItemStyle-Width="5%">
                            <ItemTemplate>
                                <asp:Label ID="CM" ToolTip="CM" runat="server" Text='<%#Eval("CM","{0:n}") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Total CM" ItemStyle-HorizontalAlign="Right"
                            ItemStyle-Width="8%">
                            <ItemTemplate>
                                <asp:Label ID="TTLCM_Income" ToolTip="TTLCM_Income"  runat="server" Text='<%#Eval("TTLCM_Income","{0:n2}") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Planned Income" ItemStyle-HorizontalAlign="Right"
                            ItemStyle-Width="8%">
                            <ItemTemplate>
                                <asp:Label ID="PlannedIncome" ToolTip="PlannedIncome" runat="server" Text='<%#Eval("PlannedIncome","{0:n2}") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                         <asp:TemplateField HeaderText="Sewing SMV" ItemStyle-HorizontalAlign="Right"
                                    ItemStyle-Width="5%">
                                    <ItemTemplate>
                                        <asp:Label ID="SewingSMV" ToolTip="SewingSMV" runat="server" Text='<%#Eval("SewingSMV","{0:n}") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="SAH" ItemStyle-HorizontalAlign="Right"
                                    ItemStyle-Width="5%">
                                    <ItemTemplate>
                                        <asp:Label ID="SAH" ToolTip="SAH = (SMV * Shipped Qty)/ 60" runat="server" Text='<%#Eval("SAH","{0:n}") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="EPM" ItemStyle-HorizontalAlign="Right"
                                    ItemStyle-Width="5%">
                                    <ItemTemplate>
                                        <asp:Label ID="EPM" ToolTip="EPM = CM / SMV" runat="server" Text='<%#Eval("EPM","{0:n}") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </ContentTemplate>
        </asp:UpdatePanel>
    </form>
</body>
</html>
