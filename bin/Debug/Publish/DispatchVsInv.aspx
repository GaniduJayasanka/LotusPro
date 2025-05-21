<%@ page language="C#" autoeventwireup="true" inherits="DispatchVsInv, App_Web_11yxmj2e" enableeventvalidation="false" %>

<%@ Register Assembly="BasicFrame.WebControls.BasicDatePicker" Namespace="BasicFrame.WebControls" TagPrefix="BDP" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>MSP Dispatch vs Invoice Rpt</title>
    <link href="CSS/bootstrap.css" rel="stylesheet" />

    <link href="CSS/jquery.autocomplete.css" rel="stylesheet" type="text/css" />
    <script src="js/jquery-1.4.1.min.js" type="text/javascript"></script>
    <script src="js/jquery.autocomplete.js" type="text/javascript"></script>

    <script type="text/javascript">
        $(document).ready(function () {
            $("#<%=txtStyle.ClientID%>").autocomplete('AutoCompletes/SearchStyle.ashx', {
                extraParams: { "type": "Style" }
            });

        });
    </script>
<style type="text/css">
        GridViewStyle
        {
            border-right: 2px solid #A7A6AA;
            border-bottom: 2px solid #A7A6AA;
            border-left: 2px solid white;
            border-top: 2px solid white;
            padding: 4px;
            font-size:x-small;
        }

        .GridViewStyle a
        {
            color: #FFFFFF;
        }

        .GridViewHeaderStyle th
        {
            border-left: 1px solid #EBE9ED;
            border-right: 1px solid #EBE9ED;
        }

        .GridViewHeaderStyle
        {
            background-color: #4d4d4d;
            font-weight: bold;
            color: White;
            font-size:x-small;
            font-family:Cambria;
        }

        .GridViewFooterStyle
        {
            background-color: #000000;
            font-weight: normal;
            color: White;
            font-size:xx-small;
        }

        .GridViewRowStyle
        {
            background-color: #F7F6F3;
            color: #333333;
            font-size:x-small;
            font-family:Cambria;
            font-weight: bold;
        }

        .GridViewAlternatingRowStyle 
        {
            background-color: #FFFFFF;
            color: #333333;
            font-size:x-small;
            font-family:Cambria;
            font-weight: bold;
        }

        .GridViewRowStyle td, .GridViewAlternatingRowStyle td
        {
            border: 1px solid #EBE9ED;
        }

        .GridViewSelectedRowStyle
        {
            background-color: #E2DED6;
            font-weight: bold;
            color: #333333;
        }

        .GridViewPagerStyle
        {
            background-color: #284775;
            color: #FFFFFF;
        }

        .GridViewPagerStyle table /* to center the paging links*/
        {
            margin: 0 auto 0 auto;
        }
    </style>
    <style type="text/css">


        .auto-style1 {
            width: 100%;
        }

        .auto-style5 {
            width: 116px;
        }

        .auto-style7 {
            width: 208px;
        }

        .auto-style14 {
            width: 60px;
        }

        .auto-style17 {
            width: 7px;
        }

        .auto-style20 {
            width: 138px;
        }

        .auto-style22 {
            width: 122px;
        }

        .auto-style24 {
            width: 120px;
        }

        .auto-style25 {
            width: 129px;
        }
    </style>
    <style type="text/css">
        .Gridtxt {
            width: 100px;
        }

        .gridHeader {
            text-align: right;
            font-weight: bold;
        }

        .panel {
            margin-bottom: 5px !important;
        }

        .form-group {
            margin-bottom: 5px !important;
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

        .auto-style15 {
            width: 120%;
            height: 79px;
        }

        .auto-style16 {
            width: 16px;
        }

        .auto-style21 {
            width: 893px;
        }

        .auto-style22 {
            font-weight: normal;
        }

        .auto-style26 {
            position: relative;
            min-height: 1px;
            float: left;
            width: 91.66666667%;
            left: 0px;
            top: 0px;
            padding-left: 15px;
            padding-right: 15px;
        }

        /*.HeaderFreez {
            position: relative;
            top: expression(this.offsetParent.scrollTop);
            z-index: 10;
        }*/
        /*.HeaderFreez {
            Position: Fixed;
            Top: 165px;
            Left: 14px;
        }*/
    </style>
  <%--  <style type="text/css">
        .GVFixedHeader {
            font-weight: bold;
            background-color: Green;
            position: relative;
            top: expression(this.parentNode.parentNode.parentNode.scrollTop-1);
        }

        .GVFixedFooter {
            font-weight: bold;
            background-color: Green;
            position: relative;
            bottom: expression(getScrollBottom(this.parentNode.parentNode.parentNode.parentNode));
        }
    </style>
    <script language="javascript">
        $(document).ready(function () {
            var gridHeader = $('#<%=GVResults.ClientID%>').clone(true); // Here Clone Copy of Gridview with style
            $(gridHeader).find("tr:gt(0)").remove(); // Here remove all rows except first row (header row)
            $('#<%=GVResults.ClientID%> tr th').each(function (i) {
                // Here Set Width of each th from gridview to new table(clone table) th 
                $("th:nth-child(" + (i + 1) + ")", gridHeader).css('width', ($(this).width()).toString() + "px");
            });
            $("#GHead").append(gridHeader);
            $('#GHead').css('position', 'absolute');
            //$('#GHead').css('top', $('#<%=GVResults.ClientID%>').offset().top);

        });
    </script>--%>
   <%-- <script type="text/javascript">

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
    </script>--%>

<style type="text/css">
        GridViewStyle
        {
            border-right: 2px solid #A7A6AA;
            border-bottom: 2px solid #A7A6AA;
            border-left: 2px solid white;
            border-top: 2px solid white;
            padding: 4px;
            font-size:small;
        }

        .GridViewStyle a
        {
            color: #FFFFFF;
        }

        .GridViewHeaderStyle th
        {
            border-left: 1px solid #EBE9ED;
            border-right: 1px solid #EBE9ED;
        }

        .GridViewHeaderStyle
        {
            background-color: #4d4d4d;
            font-weight: bold;
            color: White;
            font-size:small;
            font-family:Cambria;
        }

        .GridViewFooterStyle
        {
            background-color: #000000;
            font-weight: normal;
            color: White;
            font-size:small;
        }

        .GridViewRowStyle
        {
            background-color: #F7F6F3;
            color: #333333;
            font-size:small;
            font-family:Cambria;
            font-weight: bold;
        }

        .GridViewAlternatingRowStyle 
        {
            background-color: #FFFFFF;
            color: #333333;
            font-size:small;
            font-family:Cambria;
            font-weight: bold;
        }

        .GridViewRowStyle td, .GridViewAlternatingRowStyle td
        {
            border: 1px solid #EBE9ED;
        }

        .GridViewSelectedRowStyle
        {
            background-color: #E2DED6;
            font-weight: bold;
            color: #333333;
        }

        .GridViewPagerStyle
        {
            background-color: #284775;
            color: #FFFFFF;
        }

        .GridViewPagerStyle table /* to center the paging links*/
        {
            margin: 0 auto 0 auto;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <asp:ToolkitScriptManager ID="ScriptManager1" runat="server">
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
        <div class="col-md-12">
            <asp:Panel ID="p" runat="server" DefaultButton="btnsearch">
      <%--  <asp:Panel ID="pnlsearch" runat="server">--%>
            <asp:Label ID="lblOrderNo" runat="server" Visible="False"></asp:Label>
            <div class="row">
                <div class="col-md-12">
                    <div class="col-md-2">
                        <br />
                        <asp:ImageButton ID="btnHome" runat="server" ImageUrl="~/images/Tohome.png" Height="35px"
                            Width="35px" PostBackUrl="~/Allreports.aspx" />
                        <asp:ImageButton ID="btnback" runat="server" ImageUrl="~/images/Back.png" Height="35px"
                            Width="35px" PostBackUrl="~/report.aspx" />
                    </div>
                    <div class="col-md-8">
                        <h3 style="text-align: center">Dispatched vs Invoiced Report</h3>
                    </div>
                     <div class="col-md-2">
                     <a href="DispatchVSInvBuyerInvoice.aspx"  target="_blank">  <asp:Label ID="Label3" runat="server" ToolTip="Buyer Wise Debit Note Summary" Text="DB Note Summary" type="button"></asp:Label>   </a>
                         </div>
                     
                         <%-- <asp:LinkButton ID="LinkButton4" PostBackUrl="~/DashboardFourLevel.aspx" runat="server" ToolTip="MSP Dashboard">Dashboard </asp:LinkButton> |
                        <asp:LinkButton ID="LinkButton1" PostBackUrl="~/StyleWiseHistory.aspx" runat="server" ToolTip="Log Report">Log Report </asp:LinkButton> |--%>
                       <%-- <asp:LinkButton ID="LinkButton2" PostBackUrl="~/PlantWiseDeliveryRep.aspx" ToolTip="Drill Down Report" runat="server">Drill Down </asp:LinkButton>  |
                        <asp:LinkButton ID="LinkButton3" PostBackUrl="~/SerialNoWiseDeliveryRpt.aspx" runat="server" ToolTip="Serial No Wise Delivery Plan">Serial No </asp:LinkButton>   |
                          <asp:LinkButton ID="LinkButton5" PostBackUrl="~/PlantWiseDeliveryReport.aspx" runat="server" ToolTip="Plant Wise Delivery Report">Plant </asp:LinkButton> 
                        --%>
                           
                     <%--<div class="col-md-1">
                         <a href="MSPCommercialRpt.aspx"  target="_blank">  <asp:Label ID="Label8" runat="server" ToolTip="Dispatched Vs Invoiced Report - BPO Wise" Text="BPO Wise" Visible="true" type="button"></asp:Label>   </a>
                       </div>--%>
                </div>
            </div>
            <div class="col-md-12">
                <div class="panel panel-default">
                    <div class="panel-body">
                        <div class="box-body">
                            <div class="row">
                                <div class="form-group">
                                    <label class="col-md-2 control-label">Dispatched Date - From:</label>
                                    <div class="col-md-3">
                                        <BDP:BasicDatePicker ID="DatePickerFromDate" runat="server" CssClass="form-control" />
                                    </div>
                                    <label class="col-md-1 control-label">To:</label>
                                    <div class="col-md-3">
                                        <BDP:BasicDatePicker ID="DatePickerToDate" runat="server" CssClass="form-control" />
                                    </div>
                                    <label class="col-md-2 control-label">View Doc Sent QTY:</label>
                                     <div class="col-md-1">
                                         <asp:CheckBox ID="chkViewDocSent" runat="server" />
                                         </div>
                                </div>
                            </div>
                            
                             <div class="row">
                                <div class="box-body">
                                    <div class="form-group">
                                        
                                             <label class="col-md-2 control-label">Buyer:</label>
                                        <div class="col-md-3">
                                            <asp:DropDownList ID="DDLBUYER" CssClass="form-control" runat="server"
                                                AutoPostBack="true" OnSelectedIndexChanged="DDLBUYER_SelectedIndexChanged">
                                            </asp:DropDownList>
                                        
                                            </div>
                                         <div class="col-md-6">
                                        <asp:Button ID="btnsearch" CssClass="btn btn-success" runat="server" Text="Search" OnClick="btnsearch_Click" />
                                        <asp:Button ID="BtnExport" runat="server" Text="Export" OnClick="BtnExport_Click" CssClass="btn btn-info" />
                                        <asp:Button ID="BtnReset" runat="server" Text="Reset" OnClick="BtnReset_Click" CssClass="btn btn-warning" />
                                          <asp:Button ID="Btnsummary" runat="server"   CssClass="btn bg-primary" Width="158px"                    
                    style="background-position: right;  background-image: url('Images/user.png'); text-align: left; background-repeat: no-repeat;" 
                    Text="Buyer Summary" OnClick="Btnsummary_Click"  />
                                              <asp:Button ID="BtnEmbDispatchvsInv" runat="server"   CssClass="btn btn-danger" Width="105px"                    
                    style="background-position: right;  background-image: url('Images/embrpt.png'); text-align: left; background-repeat: no-repeat;" 
                    Text="Embroidery" OnClick="BtnEmbDispatchvsInv_Click"  />

                                                <asp:Button ID="BtnRevenueDetails" runat="server"   CssClass="btn btn-info" Width="145px"                    
                    style="background-position: right;  background-image: url('Images/revenue.png'); text-align: left; background-repeat: no-repeat;" 
                    Text="Revenue Details" OnClick="BtnRevenueDetails_Click"  />
                                    </div>
                                        </div>
                                    </div>
                                  </div>
                            
                            <div class="row">
                                <div class="box-body">
                                    <div class="form-group">
                                        <%--                                        <label class="col-md-2 control-label">Plant:</label>
                                        <div class="col-md-3">
                                            <asp:DropDownList ID="DDLPlant" runat="server" CssClass="form-control"
                                                AutoPostBack="true" OnSelectedIndexChanged="DDLPlant_SelectedIndexChanged">
                                            </asp:DropDownList>
                                        </div>
                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; --%>
                                      
                                        <label class="col-md-2 control-label">Style :</label>
                                        <div class="col-md-3">
                                            <asp:TextBox ID="txtStyle" OnTextChanged="txtStyle_TextChanged" CssClass="form-control" runat="server" Width="290px"></asp:TextBox>
                                        </div>
                                        <label class="col-md-1 control-label" runat="server" visible="true" id="fv">Status</label>
                                        <div class="col-md-3">
                                            <asp:DropDownList ID="drpdwnStatus" runat="server" CssClass="form-control"
                                                OnSelectedIndexChanged="drpdwnStatus_SelectedIndexChanged" AutoPostBack="true" Visible="true">
                                                <asp:ListItem Value=""></asp:ListItem>
                                                <asp:ListItem Value="1">Dispatched not Invoiced</asp:ListItem>
                                               <%-- <asp:ListItem Value="2">Invoiced not Dispatched</asp:ListItem>--%>
                                                <asp:ListItem Value="3">Under Invoiced</asp:ListItem>
                                                <asp:ListItem Value="4">Over Invoiced</asp:ListItem>
                                            </asp:DropDownList>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <%--<div class="row">
                                <div class="box-body">
                                    <div class="form-group">
                                        <label class="col-md-1 control-label">Style :</label>
                                        <div class="col-md-6">
                                            <asp:TextBox ID="txtStyle" CssClass="form-control" runat="server" Width="250px"></asp:TextBox>
                                        </div>
<%--                                        <div class="col-md-1">
                                        </div>
                                        <div class="col-md-2">
                                        </div>
                                        <div class="col-md-2">
                                        </div>
                                        <div class="col-md-2">
                                        </div>--%>

                                <asp:Label ID="Label1" runat="server"  class="col-md-9 control-label" ForeColor="#e34225" Font-Bold="true"> *** Pending Receivebles removing Waved Off Amounts *** / *** DB Note Value - irrespective of the date range ***</asp:Label>
                        </div>
                    </div>
                </div>
                <%--                            <div class="box-body">
                                <div class="form-group">
                                    <label class="col-md-2 control-label">
                                    </label>
                                    <label class="col-md-2 control-label">
                                    </label>
                                    <label class="col-md-2 control-label">
                                    </label>
                                    <label class="col-md-2 control-label">
                                    </label>
                                    <label class="col-md-2 control-label">
                                    </label>
                                    <label class="col-md-3 control-label">
                                    </label>
                                    <label class="col-md-3 control-label">
                                    </label>
                                    <label class="col-md-3 control-label">
                                    </label>
                                    <label class="col-md-3 control-label" style="border-style: solid; border-color: inherit; border-width: medium; font-size: larger; padding: 5px 5px 5px 5px; left: 0px; top: 0px; width: 300px;">
                                        Total <span class="auto-style22" style="color: rgb(0, 0, 0); font-family: &quot; Helvetica Neue&quot; , Helvetica, Arial, sans-serif; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; letter-spacing: normal; orphans: 5; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;"><strong>Value Variance (Commited vs Despatched) $</strong></span> :&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;
                            <asp:Label ID="lblTotalPromQun" runat="server"></asp:Label></label>
                                </div>
                            </div>--%>
            </div>
            <%--  </div>
                </div>
            </div>--%>
        <%--</asp:Panel>--%>
 <%--       </div>--%>
                </asp:Panel>
      
             <asp:Panel ID="Panel1" runat="server" HorizontalAlign="Left">
                
 <br />
                  <asp:GridView ID="GVBuyerSummary" runat="server" FooterStyle-HorizontalAlign="Right" ShowFooter="true" Height="25px" 
      AutoGenerateColumns="False" BackColor="White" BorderColor="#cccccc"
                                BorderWidth="1px" CellPadding="4" ForeColor="Black" AllowSorting="True"
                                EnableModelValidation="True" OnRowDataBound="GVBuyerSummary_RowDataBound" OnRowCreated="GVBuyerSummary_RowCreated" Width="900px" >
                <FooterStyle CssClass="GridViewFooterStyle" />
                <RowStyle CssClass="GridViewRowStyle" />    
                <SelectedRowStyle CssClass="GridViewSelectedRowStyle" />
                <PagerStyle CssClass="GridViewPagerStyle" />
                <AlternatingRowStyle CssClass="GridViewAlternatingRowStyle" />
                <HeaderStyle CssClass="GridViewHeaderStyle" /> 
      
                             <Columns>
                                 <%-- 0 --%>    
                                <asp:TemplateField HeaderText="Buyer" ControlStyle-Width="150px">
                                    <ItemTemplate>  
                                         <asp:LinkButton ID="LinkBuyerName"  OnClick="LinkBuyerName_Click" runat="server" Text=' <%#Eval("BuyerName")%>'></asp:LinkButton>                                        
                                        <asp:Label ID="BuyerName" Visible="false" runat="server" Text='<%#Eval("BuyerName") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>                                
                                  <%-- 1 --%>    
                                <asp:TemplateField HeaderText="Dispatched Qty"  HeaderStyle-CssClass="text-right"  ItemStyle-HorizontalAlign="Right"    SortExpression="" Visible="true">
                                <ItemTemplate>
                                    <asp:Label ID="TShippedQty" runat="server"    Text=' <%#Eval("DispatchedQty","{0:#,##0}")%>'     ></asp:Label>
                                </ItemTemplate>
                                <FooterTemplate>
                                    <div>  <asp:Label ID="lblTTShippedQty" Font-Size="Smaller"   runat="server" /> </div> 
                                </FooterTemplate>
                                </asp:TemplateField>                                  
                                 <%-- 2 --%>    
                                <asp:TemplateField HeaderText="Invoiced Qty" HeaderStyle-CssClass="text-right"  ItemStyle-HorizontalAlign="Right"    SortExpression="" Visible="true">
                                <ItemTemplate>
                                    <asp:Label ID="lblInvoicedQty" runat="server"   Text=' <%#Eval("InvoiceQty","{0:#,##0}")%>'   ></asp:Label>
                                </ItemTemplate>
                                <FooterTemplate>
                                    <div>  <asp:Label ID="lblTTInvoicedQty" Font-Size="Smaller" ForeColor="Black"  runat="server" /> </div> 
                                </FooterTemplate>
                                </asp:TemplateField>
                                 <%-- 3 --%>    
                                <asp:TemplateField HeaderText="Invoiced Vs Dispatched" HeaderStyle-CssClass="text-right"  ItemStyle-HorizontalAlign="Right"    SortExpression="" Visible="true">
                                <ItemTemplate>
                                     <asp:LinkButton ID="LinkInvVsDispatched"  OnClick="LinkInvVsDispatched_Click" runat="server" Text=' <%#Eval("BalanceQty","{0:#,##0}")%>'></asp:LinkButton>
                                    <asp:Label ID="InvoicedVsDispatched" runat="server" Visible="false"  Width="100px" Text=' <%#Eval("BalanceQty","{0:#,##0}")%>'   ></asp:Label>
                                </ItemTemplate>
                                <FooterTemplate>
                                    <div>  <asp:Label ID="lblTTInvoicedVsDispatched" Font-Size="Smaller"   runat="server" /> </div> 
                                </FooterTemplate>
                                </asp:TemplateField> 
                                 <%-- 4 --%>    
                                <asp:TemplateField HeaderText="Avg Planned Inv Value" HeaderStyle-CssClass="text-right" ItemStyle-HorizontalAlign="Right"    SortExpression="" Visible="true">
                                <ItemTemplate>
                                    <asp:Label ID="AvgPlannedInvValue" runat="server"   Text=' <%#Eval("PlannedInvoiceValue","{0:#,##0.00}")%>'     ></asp:Label>
                                </ItemTemplate>
                                <FooterTemplate>
                                    <div>  <asp:Label ID="lblAvgPlannedInvValue"  Font-Size="Smaller" ForeColor="Black"   runat="server" /> </div> 
                                </FooterTemplate>
                                </asp:TemplateField>
                                 <%-- 5 --%>    
                                <asp:TemplateField HeaderText="Actual Inv Value" HeaderStyle-CssClass="text-right" ItemStyle-HorizontalAlign="Right"    SortExpression="" Visible="true">
                                <ItemTemplate>
                                    <asp:Label ID="ActualInvValue" runat="server"   Text=' <%#Eval("ActualInvoiceValue","{0:#,##0.00}")%>'     ></asp:Label>
                                </ItemTemplate>
                                <FooterTemplate>
                                    <div>  <asp:Label ID="lblActualInvValue" Font-Size="Smaller"   runat="server" /> </div> 
                                </FooterTemplate>
                                </asp:TemplateField>
                                  <%-- 6 --%>    
                                <asp:TemplateField HeaderText="Variance" HeaderStyle-CssClass="text-right" ItemStyle-HorizontalAlign="Right"    SortExpression="" Visible="true">
                                <ItemTemplate>
                                <asp:Label ID="PlanVsActualVariance" runat="server"  Text=' <%#Eval("Variance","{0:#,##0.00}")%>'     ></asp:Label>
                                </ItemTemplate>
                                <FooterTemplate>
                                <div>  <asp:Label ID="lblPlanVsActualVariance"  Font-Size="Smaller" ForeColor="Black"    runat="server" /> </div> 
                                </FooterTemplate>
                                </asp:TemplateField>
                                   <%-- 7 --%>    
                                <asp:TemplateField HeaderText="Received Amount" HeaderStyle-CssClass="text-right" ItemStyle-HorizontalAlign="Right"    SortExpression="" Visible="true">
                                <ItemTemplate>
                                    <asp:Label ID="ReceivedAmount" runat="server"   Text=' <%#Eval("ReceivedAmount","{0:#,##0.00}")%>'     ></asp:Label>
                                </ItemTemplate>
                                <FooterTemplate>
                                    <div>  <asp:Label ID="lblTotReceivedAmount"   runat="server" Font-Size="Smaller"  /> </div> 
                                </FooterTemplate>
                                </asp:TemplateField>
                                   <%-- 8 --%>    
                                  <asp:TemplateField HeaderText="Pending Receivable" HeaderStyle-CssClass="text-right" ItemStyle-HorizontalAlign="Right"    SortExpression="" Visible="true">
                                <ItemTemplate>
                                     <asp:LinkButton ID="LinkPendingReceivble" Visible="true"  OnClick="LinkPendingReceivble_Click1" runat="server" Text=' <%#Eval("PR2","{0:#,##0.00}")%>'></asp:LinkButton>
                                    <%-- <asp:LinkButton ID="LinkPendingReceivble" Visible="false"  OnClick="LinkPendingReceivble_Click1" runat="server" Text=' <%#Eval("PendingReceivble","{0:#,##0.00}")%>'></asp:LinkButton>--%>
                                    <asp:Label ID="PR2" runat="server" Visible="false"  Width="100px" Text=' <%#Eval("PR2","{0:#,##0.00}")%>'     ></asp:Label>
                            
                                </ItemTemplate>
                                <FooterTemplate>
                                    <div>
                                          <asp:LinkButton ID="lblTotPendingReceivble2"  Font-Bold="false" ForeColor="Black"  Font-Size="Smaller"  OnClick="LinkPendingReceivble_Click"   runat="server" ></asp:LinkButton>
                                        <%--  <asp:LinkButton ID="lblTotPendingReceivble2" ForeColor="#ffffff" Font-Bold="true"  OnClick="LinkPendingReceivble_Click" runat="server" ></asp:LinkButton>--%>
                                        <%--  <asp:Label ID="lblTotPendingReceivble"    runat="server" /> </div> --%>
                                </FooterTemplate>
                                </asp:TemplateField>
                             <%-- 9 --%>  
                                <asp:TemplateField HeaderText="Doc. Sent Qty" ItemStyle-HorizontalAlign="Right" HeaderStyle-CssClass="gridHeader" Visible="true">
                                <ItemTemplate>
                                    <asp:Label ID="TotFOB" runat="server" Text=' <%#Eval("TotFOB","{0:#,##0}")%>' Width="100px" ></asp:Label>
                                </ItemTemplate>
                                <FooterTemplate>
                                    <div>
                                        <asp:Label Font-Bold="true" ID="lblTotFOB" runat="server" />
                                    </div>
                                </FooterTemplate>
                                </asp:TemplateField>   
                                  <%-- 10 --%>   
                                 <asp:TemplateField HeaderText="BuyerID" Visible="false" ControlStyle-Width="150px">
                                    <ItemTemplate>                                          
                                        <asp:Label ID="BuyerID" runat="server" Text='<%#Eval("BuyerID") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField> 
                                   <%-- 11 --%>   
                                  <asp:TemplateField HeaderText="Pending Receivable" HeaderStyle-CssClass="text-right" ItemStyle-HorizontalAlign="Right"    SortExpression="" Visible="false">
                                <ItemTemplate>
                                    
                                    <asp:Label ID="PendingReceivble" runat="server" Visible="true"  Width="100px" Text=' <%#Eval("PendingReceivble","{0:#,##0.00}")%>'     ></asp:Label>
                            
                                </ItemTemplate>
                                <FooterTemplate>
                                    <div>
                                          <asp:LinkButton ID="lblTotPendingReceivble" ForeColor="#ffffff" Font-Bold="false" Font-Size="Smaller"   OnClick="LinkPendingReceivble_Click" runat="server" ></asp:LinkButton>
                                        <%--  <asp:Label ID="lblTotPendingReceivble"    runat="server" /> </div> --%>
                                </FooterTemplate>
                                </asp:TemplateField>

                                  
                                  

                                  <%-- 12 --%>   
                                 <asp:TemplateField HeaderText="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" HeaderStyle-CssClass="text-right" ItemStyle-HorizontalAlign="Right"    SortExpression="" >
                                     </asp:TemplateField>

                                  <%-- 13 --%>   
                                   <asp:TemplateField HeaderText="Invoiced CM" HeaderStyle-CssClass="text-right" ItemStyle-HorizontalAlign="Right"    SortExpression="" >
                                <ItemTemplate>                                    
                                    <asp:Label ID="InvoicedCM" runat="server" Visible="true"  Text=' <%#Eval("InvoicedCM","{0:#,##0.00}")%>'     ></asp:Label>                            
                                </ItemTemplate>
                                <FooterTemplate>   
                                    <asp:Label ID="lblTotInvoicedCM" runat="server" Visible="true" Font-Size="Smaller"   Width="100px"     ></asp:Label>
                                </FooterTemplate>
                                </asp:TemplateField>


                                   <%-- 14 --%>   
                                   <asp:TemplateField HeaderText="As At Date DB Note Value" HeaderStyle-CssClass="text-right" ItemStyle-HorizontalAlign="Right" Visible ="false"   SortExpression="" >
                                <ItemTemplate>                                    
                                    <asp:Label ID="AADDBValue" runat="server" Visible="true"   Text=' <%#Eval("DBValue","{0:#,##0.00}")%>'     ></asp:Label>                            
                                </ItemTemplate>
                                <FooterTemplate>                                 
                                          <asp:Label ID="lblTotDBValueAsAtDate" ForeColor="#ffffff" Font-Bold="false" Font-Size="Smaller"    runat="server" ></asp:Label>
                                        <%--  <asp:Label ID="lblTotPendingReceivble"    runat="server" />  --%>
                                </FooterTemplate>
                                </asp:TemplateField>
                                   <%-- 15 --%>   
                                   <asp:TemplateField HeaderText="As At Date DB Note Settled" HeaderStyle-CssClass="text-right" ItemStyle-HorizontalAlign="Right"  Visible ="false"     SortExpression="" >
                                <ItemTemplate>                                    
                                    <asp:Label ID="DBSettled" runat="server" Visible="true"  Text=' <%#Eval("DBValueSettled","{0:#,##0.00}")%>'     ></asp:Label>                            
                                </ItemTemplate>
                                <FooterTemplate>                                 
                                          <asp:Label ID="lblTotDBSettled" ForeColor="#ffffff" Font-Bold="false"  Font-Size="Smaller"   runat="server" ></asp:Label>
                                        <%--  <asp:Label ID="lblTotPendingReceivble"    runat="server" />  --%>
                                </FooterTemplate>
                                </asp:TemplateField>
                                   <%-- 16 --%>   
                                   <asp:TemplateField HeaderText="As At Date DB Note Balance" HeaderStyle-CssClass="text-right" ItemStyle-HorizontalAlign="Right" Visible ="false"     SortExpression="" >
                                <ItemTemplate>                                    
                                    <asp:Label ID="DBBalance" runat="server" Visible="true"   Text=' <%#Eval("DBValueBalance","{0:#,##0.00}")%>'     ></asp:Label>                            
                                </ItemTemplate>
                                <FooterTemplate>                                 
                                          <asp:Label ID="lblTotDBBalance" ForeColor="#ffffff" Font-Bold="false"  Font-Size="Smaller"   runat="server" ></asp:Label>
                                        <%--  <asp:Label ID="lblTotPendingReceivble"    runat="server" />  --%>
                                </FooterTemplate>
                                </asp:TemplateField>
                                   <%-- 17 --%>   
                                 <asp:TemplateField HeaderText="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" HeaderStyle-CssClass="text-right" ItemStyle-HorizontalAlign="Right"    SortExpression="" >
                                     </asp:TemplateField>
                                   <%-- 18 --%>   
                                  <asp:TemplateField HeaderText="Week 1" HeaderStyle-CssClass="text-right" ItemStyle-HorizontalAlign="Right"    SortExpression="" >
                                <ItemTemplate>                                    
                                    <asp:Label ID="Week1" runat="server" Visible="true"   Width="100px"  Text=' <%#Eval("week1","{0:#,##0.00}")%>'     ></asp:Label>                            
                                </ItemTemplate>
                                       <FooterTemplate>                                 
                                          <asp:Label ID="lblTotWeek1" ForeColor="Black"   Font-Size="Smaller"   runat="server" ></asp:Label>                                       
                                </FooterTemplate>
                                </asp:TemplateField>
                                  <asp:TemplateField HeaderText="Week 2" HeaderStyle-CssClass="text-right" ItemStyle-HorizontalAlign="Right"    SortExpression="" >
                                <ItemTemplate>                                    
                                    <asp:Label ID="Week2" runat="server" Visible="true"   Width="100px" Text=' <%#Eval("week2","{0:#,##0.00}")%>'     ></asp:Label>                            
                                </ItemTemplate>   
                                      <FooterTemplate>                                 
                                          <asp:Label ID="lblTotWeek2" ForeColor="#ffffff" Font-Bold="false"  Font-Size="Smaller"   runat="server" ></asp:Label>                                       
                                </FooterTemplate>
                                </asp:TemplateField>
                                  <asp:TemplateField HeaderText="Week 3" HeaderStyle-CssClass="text-right" ItemStyle-HorizontalAlign="Right"    SortExpression="" >
                                <ItemTemplate>                                    
                                    <asp:Label ID="Week3" runat="server" Visible="true"  Width="100px"  Text=' <%#Eval("week3","{0:#,##0.00}")%>'    ></asp:Label>                            
                                </ItemTemplate>  
                                      <FooterTemplate>                                 
                                          <asp:Label ID="lblTotWeek3" ForeColor="Black"  Font-Bold="false"  Font-Size="Smaller"   runat="server" ></asp:Label>                                       
                                </FooterTemplate>
                                </asp:TemplateField>
                                  <asp:TemplateField HeaderText="Week 4" HeaderStyle-CssClass="text-right" ItemStyle-HorizontalAlign="Right"    SortExpression="" >
                                <ItemTemplate>                                    
                                    <asp:Label ID="Week4" runat="server" Visible="true"  Width="100px" Text=' <%#Eval("week4","{0:#,##0.00}")%>'  ></asp:Label>                            
                                </ItemTemplate>    
                                      <FooterTemplate>                                 
                                          <asp:Label ID="lblTotWeek4" ForeColor="#ffffff" Font-Bold="false"  Font-Size="Smaller"  runat="server" ></asp:Label>                                       
                                </FooterTemplate>
                                </asp:TemplateField>
                                  
                                </Columns>
                                <%--<SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />--%>
                                <FooterStyle BackColor="#9f9b9b" Font-Bold="false" ForeColor="White" CssClass="GVFixedFooter" />
                                <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />                             
                            </asp:GridView>
                 <br />
                            </asp:Panel>
        <div class="col-md-12">
            <div id="DivRoot" align="left">
                <div style="overflow: hidden;" id="DivHeaderRow">
                </div>
                <div>
                    <div style="width: 1600px;">
                       
                        <div id="GHead"></div>
                        <div style="height: 1800px; overflow: auto">
                            <asp:GridView ID="GVResults" runat="server" FooterStyle-HorizontalAlign="Right" 
                                ShowFooter="true" Height="25px" AutoGenerateColumns="False" BackColor="White"
                                 BorderColor="#cccccc"
                                BorderWidth="1px" CellPadding="4" ForeColor="Black" AllowSorting="True"
                                EnableModelValidation="True" Width="1300px" OnRowDataBound="GVResults_RowDataBound">
                <FooterStyle CssClass="GridViewFooterStyle" />
                <RowStyle CssClass="GridViewRowStyle" />    
                <SelectedRowStyle CssClass="GridViewSelectedRowStyle" />
                <PagerStyle CssClass="GridViewPagerStyle" />
                <AlternatingRowStyle CssClass="GridViewAlternatingRowStyle" />
                <HeaderStyle CssClass="GridViewHeaderStyle" />

                             <Columns>
                                       <asp:TemplateField HeaderText="OrderNo" SortExpression="" Visible="false">
                            <ItemTemplate>
                                 <asp:Label ID="OrderNo" runat="server" Text='<%#Eval("OrderNo") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                                     <asp:TemplateField HeaderText="Buyer" ItemStyle-HorizontalAlign="Left" HeaderStyle-HorizontalAlign="Left">
                                        <ItemTemplate>
                                            <asp:Label ID="BuyerCode"  Width="200px" runat="server" Text='<%#Eval("BuyerName") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Style No">
                                        <ItemTemplate>
                                            <asp:LinkButton ID="LinkStyle"  Width="230px" OnClick="LinkStyle_Click" runat="server" Text='<%#Eval("StyleNo") %>'></asp:LinkButton>
                                           <%-- <asp:Label ID="StyleNo" runat="server" Text='<%#Eval("StyleNo") %>'></asp:Label>--%>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                                                     
                                    <asp:TemplateField HeaderText="Dispatched Qty" ItemStyle-HorizontalAlign="Right" HeaderStyle-CssClass="gridHeader">
                                        <ItemTemplate>
                                            <asp:Label ID="DispatchedQty"  Width="70px" runat="server" Text='<%#Eval("DispatchedQty") %>'></asp:Label>
                                        </ItemTemplate>
                                        <FooterTemplate>
                                            <div>
                                                <asp:Label Font-Bold="true" ID="LblDispatchedQty" runat="server" />
                                            </div>
                                        </FooterTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Invoiced QTY" ItemStyle-HorizontalAlign="Right" HeaderStyle-CssClass="gridHeader">
                                        <ItemTemplate>
                                            <asp:Label ID="InvoiceQTY"  Width="70px" runat="server" Text='<%#Eval("InvoiceQTY") %>'></asp:Label>
                                        </ItemTemplate>
                                        <FooterTemplate>
                                            <div>
                                                <asp:Label Font-Bold="true" ID="LblInvoiceQTY" runat="server" />
                                            </div>
                                        </FooterTemplate>
                                    </asp:TemplateField>
                                   
                                   
                                    <asp:TemplateField HeaderText="Invoiced Vs Dispatched" ItemStyle-HorizontalAlign="Right" HeaderStyle-CssClass="gridHeader" Visible="true">
                                        <ItemTemplate>
                                            <asp:Label ID="InvoicedVsDispatched"  Width="70px" runat="server" Text='<%#Eval("BalanceQty") %>'></asp:Label>
                                        </ItemTemplate>
                                        <FooterTemplate>
                                            <div>
                                                <asp:Label Font-Bold="true" ID="LblInvoicedVsDispatched" runat="server" />
                                            </div>
                                        </FooterTemplate>
                                    </asp:TemplateField>
                                    

                                     <asp:TemplateField HeaderText="Planned Invoice Value" ItemStyle-HorizontalAlign="Right" HeaderStyle-CssClass="gridHeader" Visible="true">
                                        <ItemTemplate> 
                                            <asp:Label ID="AvgPlannedInvValue"  Width="100px" runat="server" Text=' <%#Eval("PlannedInvoiceValue","{0:n}")%>' ></asp:Label>
                                        </ItemTemplate>
                                        <FooterTemplate>
                                            <div>
                                                <asp:Label Font-Bold="true" ID="LblTotAvgPlannedInvValue" runat="server" />
                                            </div>
                                        </FooterTemplate>
                                    </asp:TemplateField>
                                   <asp:TemplateField HeaderText="Actual Invoice Value" ItemStyle-HorizontalAlign="Right" HeaderStyle-CssClass="gridHeader" Visible="true">
                                        <ItemTemplate>
                                            <asp:Label ID="ActualInvValue"  Width="100px" runat="server" Text=' <%#Eval("ActualInvoiceValue","{0:n}")%>' ></asp:Label>
                                        </ItemTemplate>
                                        <FooterTemplate>
                                            <div>
                                                <asp:Label Font-Bold="true" ID="LblTotActualInvValue" runat="server" />
                                            </div>
                                        </FooterTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Variance" ItemStyle-HorizontalAlign="Right" HeaderStyle-CssClass="gridHeader" Visible="true">
                                        <ItemTemplate>
                                            <asp:Label ID="PlanVsActualVariance"  Width="100px" runat="server" Text=' <%#Eval("Variance","{0:n}")%>' ></asp:Label>
                                        </ItemTemplate>
                                        <FooterTemplate>
                                            <div>
                                                <asp:Label Font-Bold="true" ID="LblTotPlanVsActualVariancee" runat="server" />
                                            </div>
                                        </FooterTemplate>
                                    </asp:TemplateField>

                                       <asp:TemplateField HeaderText="Received Amount" ItemStyle-HorizontalAlign="Right" HeaderStyle-CssClass="gridHeader" Visible="true">
                                        <ItemTemplate>
                                            <asp:Label ID="ReceivedAmount"  Width="100px" runat="server" Text=' <%#Eval("ReceivedAmount","{0:n}")%>' ></asp:Label>
                                        </ItemTemplate>
                                        <FooterTemplate>
                                            <div>
                                                <asp:Label Font-Bold="true" ID="LblTotReceivedAmount" runat="server" />
                                            </div>
                                        </FooterTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Pending Receivable" ItemStyle-HorizontalAlign="Right" HeaderStyle-CssClass="gridHeader" Visible="true">
                                        <ItemTemplate>
                                            <asp:Label ID="PR2"  Width="100px" runat="server" Text=' <%#Eval("PR2","{0:n}")%>' ></asp:Label>
                                        </ItemTemplate>
                                        <FooterTemplate>
                                            <div>
                                                <asp:Label Font-Bold="true" ID="LblTotPendingReceivblee2" runat="server" />
                                            </div>
                                        </FooterTemplate>
                                    </asp:TemplateField>

                                 
                                    
                                  <asp:TemplateField HeaderText="AVG FOB" ItemStyle-HorizontalAlign="Right" HeaderStyle-CssClass="gridHeader" Visible="true">
                                        <ItemTemplate>
                                            <asp:Label ID="AVGFOB" runat="server"  Width="70px" Text=' <%#Eval("AVGFOB","{0:n}")%>' ></asp:Label>
                                        </ItemTemplate>
                                        <FooterTemplate>
                                            <div>
                                                <asp:Label Font-Bold="true" ID="LblTotAVGFOB" runat="server" />
                                            </div>
                                        </FooterTemplate>
                                    </asp:TemplateField> 

                                  <asp:TemplateField HeaderText="Doc. Sent Qty" ItemStyle-HorizontalAlign="Right" HeaderStyle-CssClass="gridHeader" Visible="true">
                                        <ItemTemplate>
                                            <asp:Label ID="TotFOB" runat="server"  Width="70px" Text=' <%#Eval("TotFOB","{0:#,##0}")%>' ></asp:Label>
                                        </ItemTemplate>
                                        <FooterTemplate>
                                            <div>
                                                <asp:Label Font-Bold="true" ID="lblTotFOB" runat="server" />
                                            </div>
                                        </FooterTemplate>
                                    </asp:TemplateField> 

                                  <asp:TemplateField HeaderText="Pending Receivable" ItemStyle-HorizontalAlign="Right" HeaderStyle-CssClass="gridHeader" Visible="false">
                                        <ItemTemplate>
                                            <asp:Label ID="PendingReceivble"  Width="100px" runat="server" Text=' <%#Eval("PendingReceivble","{0:n}")%>' ></asp:Label>
                                        </ItemTemplate>
                                        <FooterTemplate>
                                            <div>
                                                <asp:Label Font-Bold="true" ID="LblTotPendingReceivblee" runat="server" />
                                            </div>
                                        </FooterTemplate>
                                    </asp:TemplateField>

                                   <asp:TemplateField HeaderText="CM" ItemStyle-HorizontalAlign="Right" HeaderStyle-CssClass="gridHeader" Visible="true">
                                        <ItemTemplate>
                                            <asp:Label ID="CM"  Width="100px" runat="server" Text=' <%#Eval("CM","{0:#,##0.0000}")%>' ></asp:Label>
                                        </ItemTemplate>                                        
                                    </asp:TemplateField>
                                 <asp:TemplateField HeaderText="Invoiced CM" ItemStyle-HorizontalAlign="Right" HeaderStyle-CssClass="gridHeader" Visible="true">
                                        <ItemTemplate>
                                            <asp:Label ID="InvoicedCM"  Width="100px" runat="server" Text=' <%#Eval("InvoicedCM","{0:n}")%>' ></asp:Label>
                                        </ItemTemplate>
                                        <FooterTemplate>
                                            <div>
                                                <asp:Label Font-Bold="true" ID="LblTotInvoicedCM" runat="server" />
                                            </div>
                                        </FooterTemplate>
                                    </asp:TemplateField>

                                 <%--************ This DB Note Value Column is incorrect due to this DB Note Value is depend on the style *********************************** --%>
                                   <asp:TemplateField HeaderText="DB Note Value" Visible="false" ItemStyle-HorizontalAlign="Right" HeaderStyle-CssClass="gridHeader" >
                                        <ItemTemplate>
                                            <asp:Label ID="DBValue"  Width="70px" runat="server" Text=' <%#Eval("DBValue","{0:n}")%>' ></asp:Label>
                                        </ItemTemplate>
                                        <FooterTemplate>
                                            <div>
                                                <asp:Label Font-Bold="true" ID="LblTotDBValue" runat="server" />
                                            </div>
                                        </FooterTemplate>
                                    </asp:TemplateField>
                                 
                                </Columns>
                                <%--<SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />--%>
                                <%--<FooterStyle BackColor="#333333" Font-Bold="True" ForeColor="White" CssClass="GVFixedFooter" />
                                <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />--%>
                                <%--<HeaderStyle CssClass="HeaderFreez"  BackColor="#333333" Font-Bold="True" ForeColor="White"  />--%>
                            </asp:GridView>
                          </div>
                        </div>
                    </div>
                           

                        
        </div></div>

        <asp:Button ID="btnShowPopup" runat="server" Style="display: none" />
         <asp:ModalPopupExtender ID="MPESL" runat="server" TargetControlID="btnShowPopup" PopupControlID="pnlpopup"
            CancelControlID="btnMPECancel" BackgroundCssClass="modalBackground">
        </asp:ModalPopupExtender>
         <asp:Panel ID="pnlpopup" runat="server" BackColor="White" Height="500px" Width="1250px"
            Style=" overflow: scroll; border: Solid 3px #0026ff;">
             <div class="container" style="max-width: 1200px">
                <div class="row">
                   
                    <div class="col-md-12">
                        <br />
                        <asp:ImageButton ID="btnMPECancel" runat="server" ImageUrl="~/images/Cancel.png"
                            Width="20" Height="20" CssClass="pull-right" />
                    </div>
                
                <div class="row">
                    <div class="auto-style26">
                    <table class="auto-style1">
                            <tr>
                                <td class="auto-style17">&nbsp; </td>
                                <td class="auto-style14"><strong>Style&nbsp; :</strong></td>
                                <td class="auto-style7">&nbsp;
                                   <asp:Label ID="LabpopStylepop" runat="server"></asp:Label>
                                </td>
                               <%-- <td class="auto-style22">&nbsp;&nbsp;&nbsp; <strong>Buyer&nbsp;&nbsp;PO :</strong>&nbsp; </td>                                
                                <td class="auto-style20">
                                    <asp:Label ID="Labcolour" runat="server"></asp:Label>
                                </td>                                
                                <td class="auto-style25">
                                    <span style="color: rgb(0, 0, 0); font-family: &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; font-size: small; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; letter-spacing: normal; orphans: 2; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;"><strong>Contract </strong></span>
                                    <span style="color: rgb(0, 0, 0); font-family: &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; font-size: small; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 700; letter-spacing: normal; orphans: 2; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;">&nbsp;:</span></td>                                
                                <td class="auto-style24">
                                    <asp:Label ID="LabcolourQty" runat="server"></asp:Label>
                                </td>
                                <td>
                                 <asp:Label ID="LabCCode" runat="server" Visible="false"></asp:Label><asp:Label ID="LabCName" runat="server" Visible="false"></asp:Label>
                                </td>      --%>                          
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
                                <td>&nbsp;</td>
                            </tr>
                        </table>
                    </div>
                </div>
            
                <div class="row">
                   

                        <asp:GridView ID="GridSuReport" runat="server"  ShowFooter="true" AutoGenerateColumns="False" BackColor="White" BorderColor="#999999" 
                BorderWidth="2px"  OnRowDataBound="GridSuReport_RowDataBound" ForeColor="Black" FooterStyle-HorizontalAlign="Right" AllowSorting="True"
                  OnRowCreated="GridSuReport_RowCreated"  Style="max-width: 100%;  font-size:smaller; min-width: 90%"
                EnableModelValidation="True" Width="980px"  >
               
                <Columns>
                    <%--<asp:TemplateField HeaderText="orderno" ItemStyle-HorizontalAlign="Center" SortExpression="" Visible="false">
                        <ItemTemplate>
                            <asp:Label ID="orderno" runat="server" Text='<%#Eval("orderno") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>--%>
                     <asp:TemplateField HeaderText="DID" ItemStyle-HorizontalAlign="Center" SortExpression="" Visible="true">
                        <ItemTemplate>
                            <asp:Label ID="labDID" runat="server" Text='<%#Eval("DID") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                     <asp:TemplateField HeaderText="Plant"   SortExpression="" Visible="true">
                        <ItemTemplate>
                        <asp:Label ID="labPlant" runat="server"   Text='<%#Eval("Plant") %>' ></asp:Label>
                        </ItemTemplate>                       
                    </asp:TemplateField>
                     <asp:TemplateField HeaderText="Dispatch No"   SortExpression="" Visible="true">
                        <ItemTemplate>
                        <asp:Label ID="labDispatchNo" runat="server"   Text='<%#Eval("DispatchNo") %>' ></asp:Label>
                        </ItemTemplate>                       
                    </asp:TemplateField>
                     
                       <asp:TemplateField HeaderText="Dispatched On"  SortExpression="" Visible="true">
                        <ItemTemplate>
                            <asp:Label ID="DespatchedOn" runat="server"  Text='<%#Eval("DespatchedOn","{0:dd/MMM/yyyy}") %>' ></asp:Label>                        
                        </ItemTemplate>                       
                    </asp:TemplateField>
                      <asp:TemplateField HeaderText="Buyer"  SortExpression="" Visible="false">
                        <ItemTemplate>
                        <asp:Label ID="labBuyerName" runat="server"   Text='<%#Eval("BuyerName") %>' ></asp:Label>
                        </ItemTemplate>                       
                    </asp:TemplateField>
                        <asp:TemplateField HeaderText="Style" SortExpression="" Visible="false">
                        <ItemTemplate>
                        <asp:Label ID="StyleNo" runat="server"   Text='<%#Eval("StyleNo") %>'></asp:Label>
                        </ItemTemplate>                       
                    </asp:TemplateField>
                     <asp:TemplateField HeaderText="Invoice No"   SortExpression="" Visible="true">
                        <ItemTemplate>
                        <asp:Label ID="INVNumber" runat="server"   Text='<%#Eval("INVNumber") %>' ></asp:Label>
                        </ItemTemplate>
                         </asp:TemplateField>
                   <asp:TemplateField HeaderText="Dispatched Qty" ItemStyle-HorizontalAlign="Right"    SortExpression="" Visible="true">
                        <ItemTemplate>
                        <asp:Label ID="ShippedQty" runat="server" Text=' <%#Eval("DispatchedQty")%>'></asp:Label>
                        </ItemTemplate>
                        <FooterTemplate>
                              <div>  <asp:Label ID="lblTotShippedQty"   runat="server" /> </div> 
                                </FooterTemplate>
                         </asp:TemplateField>
                     <asp:TemplateField HeaderText="Invoice QTY" ItemStyle-HorizontalAlign="Right"  SortExpression="" Visible="true">
                        <ItemTemplate>
                        <asp:Label ID="INvQTY" runat="server"  Text=' <%#Eval("InvoiceQty")%>'   ></asp:Label>
                        </ItemTemplate>
                         <FooterTemplate>
                              <div>  <asp:Label ID="lblTotInvQty"   runat="server" /> </div> 
                                </FooterTemplate>
                         </asp:TemplateField>
                     <asp:TemplateField HeaderText="Variance" ItemStyle-HorizontalAlign="Right"  SortExpression="" Visible="true">
                        <ItemTemplate>
                        <asp:Label ID="variance" runat="server"    Text='<%#Eval("Variance") %>' ></asp:Label>
                        </ItemTemplate>
                         <FooterTemplate>
                              <div>  <asp:Label ID="lblQtyvariance"   runat="server" /> </div> 
                                </FooterTemplate>
                         </asp:TemplateField>

                      <asp:TemplateField HeaderText="Status"  SortExpression="" Visible="true">
                        <ItemTemplate>
                        <asp:Label ID="labStatus" runat="server"   Text='<%#Eval("Status") %>' ></asp:Label>
                        </ItemTemplate>                       
                    </asp:TemplateField>
                   
                        <asp:TemplateField HeaderText="Status Updated On"   SortExpression="" Visible="true">
                        <ItemTemplate>
                            <asp:Label ID="SupdatedOn" runat="server"  Text='<%#Eval("StatusDate","{0:dd/MMM/yyyy}") %>' ></asp:Label>                       
                        </ItemTemplate>                       
                    </asp:TemplateField>

                  
                   <asp:TemplateField HeaderText="Invoice Sent On"  ItemStyle-HorizontalAlign="Right"    Visible="true">
                        <ItemTemplate>
                        <asp:Label ID="InvoiceSendDate" runat="server"  Text='<%#Eval("InvoiceSendDate","{0:dd/MMM/yyyy}") %>'   ></asp:Label>
                        </ItemTemplate>
                         </asp:TemplateField>
                     <asp:TemplateField HeaderText="Invoice Amount" ItemStyle-HorizontalAlign="Right"    SortExpression="" Visible="true">
                        <ItemTemplate>
                        <asp:Label ID="lblInvoiceAmount" runat="server" Text=' <%#Eval("InvoiceAmount","{0:n}")%>'      ></asp:Label>
                        </ItemTemplate>
                        <FooterTemplate>
                              <div>  <asp:Label ID="lblTotInvoiceAmount"   runat="server" /> </div> 
                                </FooterTemplate>
                         </asp:TemplateField> 
                     <asp:TemplateField HeaderText="Received Amount" ItemStyle-HorizontalAlign="Right"    SortExpression="" Visible="true">
                        <ItemTemplate>
                        <asp:Label ID="lblReceiveAmount" runat="server" Text=' <%#Eval("ReceivedAmount","{0:n}")%>'      ></asp:Label>
                        </ItemTemplate>
                        <FooterTemplate>
                              <div>  <asp:Label ID="lblTotREQAMOUNTs"   runat="server" /> </div> 
                                </FooterTemplate>
                         </asp:TemplateField>

                     <asp:TemplateField HeaderText="Pending Receivable" ItemStyle-HorizontalAlign="Right"    SortExpression="" Visible="true">
                        <ItemTemplate>
                        <asp:Label ID="lblReceivedAmount" runat="server" Text=' <%#Eval("PendingReceivble","{0:n}")%>'      ></asp:Label>
                        </ItemTemplate>
                        <FooterTemplate>
                              <div>  <asp:Label ID="lblTotREQAMOUNT"   runat="server" /> </div> 
                                </FooterTemplate>
                         </asp:TemplateField>

                      <asp:TemplateField HeaderText="Shotage Reason"   SortExpression="" Visible="true">
                        <ItemTemplate>
                        <asp:Label ID="labShotageReason" runat="server"   Text='<%#Eval("ShotageReason") %>' ></asp:Label>
                        </ItemTemplate>                       
                    </asp:TemplateField>

                     <asp:TemplateField HeaderText="Dispatched To Invoice Sent Date"   SortExpression="" Visible="true">
                        <ItemTemplate>
                        <asp:Label ID="labDispatchToInvoiceSendDate" runat="server"   Text='<%#Eval("DispatchToInvoiceSendDate") %>' ></asp:Label>
                        </ItemTemplate>                       
                    </asp:TemplateField>
                     <asp:TemplateField HeaderText="Shipped To Invoice Sent Date"   SortExpression="" Visible="true">
                        <ItemTemplate>
                        <asp:Label ID="labShipToInvoiceSendDate" runat="server"   Text='<%#Eval("ShipToInvoiceSendDate") %>' ></asp:Label>
                        </ItemTemplate>                       
                    </asp:TemplateField>
                     <asp:TemplateField HeaderText="Payment Due On Date"   SortExpression="" Visible="true">
                        <ItemTemplate>
                        <asp:Label ID="labPaymentDueOnDate" runat="server"   Text='<%#Eval("PaymentDueOnDate","{0:dd/MMM/yyyy}") %>' ></asp:Label>
                        </ItemTemplate>                       
                    </asp:TemplateField>
                     <asp:TemplateField HeaderText="Payment Received Date"   SortExpression="" Visible="true">
                        <ItemTemplate>
                        <asp:Label ID="labPaymentReceivedDatee" runat="server"   Text='<%#Eval("PaymentReceivedDate","{0:dd/MMM/yyyy}") %>' ></asp:Label>
                        </ItemTemplate>                       
                    </asp:TemplateField>

                </Columns>
                <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
                             <FooterStyle BackColor="#333333" Font-Bold="True" ForeColor="White" CssClass="GVFixedFooter" />
  <HeaderStyle BackColor="#333333" CssClass="GVFixedHeader" Font-Bold="True" ForeColor="White" />
            </asp:GridView>
                        <br />
                        <br />
                      
                    </div>

                </div>         
                 <asp:Label ID="LabOrderNo" runat="server" Text="" Visible="false">

                 </asp:Label><asp:Label ID="LablblPOID" runat="server" Text="Label" Visible="false"></asp:Label>
                 <asp:Label ID="lblWeekName1" runat="server" Text="Label" Visible="false"></asp:Label>
                  <asp:Label ID="lblWeekName2" runat="server" Text="Label" Visible="false"></asp:Label>
                  <asp:Label ID="lblWeekName3" runat="server" Text="Label" Visible="false"></asp:Label>
                  <asp:Label ID="lblWeekName4" runat="server" Text="Label" Visible="false"></asp:Label>
                  <asp:Label ID="Label2" runat="server" Text="Label" Visible="false"></asp:Label>

                     



             
             
            </asp:Panel>

    </form>
</body>
</html>
