<%@ page language="C#" autoeventwireup="true" inherits="DebitNoteDetailReport, App_Web_b2ychy0x" enableeventvalidation="false" %>
<%@ Register Assembly="BasicFrame.WebControls.BasicDatePicker" Namespace="BasicFrame.WebControls" TagPrefix="BDP" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Debit Note Detail Report</title>
    <link href="CSS/bootstrap.css" rel="stylesheet" />

    <link href="CSS/jquery.autocomplete.css" rel="stylesheet" type="text/css" />
    <script src="js/jquery-1.4.1.min.js" type="text/javascript"></script>
    <script src="js/jquery.autocomplete.js" type="text/javascript"></script>

  
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
            <asp:Panel ID="pnl" runat="server" >
      <%--  <asp:Panel ID="pnlsearch" runat="server">--%>
            <asp:Label ID="lblOrderNo" runat="server" Visible="False"></asp:Label>
            <div class="row">
                <div class="col-md-12">
                    <div class="col-md-2">
                        <br />
                        <asp:ImageButton ID="btnHome" runat="server" ImageUrl="~/images/Tohome.png" Height="35px"
                            Width="35px" PostBackUrl="~/Allreports.aspx" />
                      
                    </div>
                    <div class="col-md-9">
                        <h3 style="text-align: center">Debit Note Detail Report</h3>
                    </div>
                      <div class="col-md-1">
                         <%-- <asp:LinkButton ID="LinkButton4" PostBackUrl="~/DashboardFourLevel.aspx" runat="server" ToolTip="MSP Dashboard">Dashboard </asp:LinkButton> |
                        <asp:LinkButton ID="LinkButton1" PostBackUrl="~/StyleWiseHistory.aspx" runat="server" ToolTip="Log Report">Log Report </asp:LinkButton> |--%>
                       <%-- <asp:LinkButton ID="LinkButton2" PostBackUrl="~/PlantWiseDeliveryRep.aspx" ToolTip="Drill Down Report" runat="server">Drill Down </asp:LinkButton>  |
                        <asp:LinkButton ID="LinkButton3" PostBackUrl="~/SerialNoWiseDeliveryRpt.aspx" runat="server" ToolTip="Serial No Wise Delivery Plan">Serial No </asp:LinkButton>   |
                          <asp:LinkButton ID="LinkButton5" PostBackUrl="~/PlantWiseDeliveryReport.aspx" runat="server" ToolTip="Plant Wise Delivery Report">Plant </asp:LinkButton> 
                        --%>
                       
                       </div>
                </div>
            </div>

                         <div class="col-md-12">
                <div class="panel panel-default">
                    <div class="panel-body">
                        <div class="box-body">
                            <div class="row">
                                <div class="form-group">
                                    <label class="col-md-3 control-label">Debit Note Approved Date - From:</label>
                                    <div class="col-md-3">
                                        <BDP:BasicDatePicker ID="DatePickerFromDate" runat="server" CssClass="form-control" />
                                    </div>
                                    <label class="col-md-1 control-label">To:</label>
                                    <div class="col-md-2">
                                        <BDP:BasicDatePicker ID="DatePickerToDate" runat="server" CssClass="form-control" />
                                    </div>
                                 
                            
                                           
                                         <div class="col-md-3">
                                        <asp:Button ID="btnsearch" CssClass="btn btn-success" runat="server" Text="Search" OnClick="btnsearch_Click" />
                                        <asp:Button ID="BtnExport" runat="server" Text="Export" OnClick="BtnExport_Click" CssClass="btn btn-info" />
                                        <asp:Button ID="BtnReset" runat="server" Text="Reset" OnClick="BtnReset_Click" CssClass="btn btn-warning" />
                                    
                                    </div>
                                        </div>
                                    </div>
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
                </asp:Panel>
                <asp:Panel ID="Panel1" runat="server" HorizontalAlign="Left">
                
 <br />
                  <asp:GridView ID="GVDebitNoteDetail" runat="server" FooterStyle-HorizontalAlign="Right" ShowFooter="false" Height="25px" 
      AutoGenerateColumns="False" BackColor="White" BorderColor="#cccccc" Font-Size="XX-Small"
                                BorderWidth="1px" CellPadding="4" ForeColor="Black" AllowSorting="True"
                                EnableModelValidation="True"   >
                <FooterStyle CssClass="GridViewFooterStyle" />
                <RowStyle CssClass="GridViewRowStyle" />    
                <SelectedRowStyle CssClass="GridViewSelectedRowStyle" />
                <PagerStyle CssClass="GridViewPagerStyle" />
                <AlternatingRowStyle CssClass="GridViewAlternatingRowStyle" />
                <HeaderStyle CssClass="GridViewHeaderStyle" /> 
      
                             <Columns>
                                     
                                <asp:TemplateField HeaderText="Buyer" >
                                    <ItemTemplate>  
                                                                   
                                        <asp:Label ID="BuyerName"  runat="server" Text='<%#Eval("BuyerName") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>   
                                    <asp:TemplateField HeaderText="Style No" >
                                    <ItemTemplate>                                                                           
                                        <asp:Label ID="StyleNo"  runat="server" Text='<%#Eval("StyleNo") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>  
                                    <asp:TemplateField HeaderText="DEB. Number" >
                                    <ItemTemplate> 
                                         <%--  <asp:LinkButton ID="LinkDEBNumber"  OnClick="LinkDEBNumber_Click" runat="server" Text=' <%#Eval("DEBNumber")%>'></asp:LinkButton>           --%>
                                        <asp:Label ID="DEBNumber"  runat="server" Text='<%#Eval("DEBNumber") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>  
                                   <asp:TemplateField HeaderText="DEB. Date"  SortExpression="DEBDate">
                        <ItemTemplate>
                            <asp:Label ID="DEBDate" runat="server"  Text='<%#Eval("DEBDate","{0:dd/MMM/yyyy}") %>' ></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                                   <asp:TemplateField HeaderText="ItemDescription" >
                                    <ItemTemplate>                                                                           
                                        <asp:Label ID="ItemDescription"  Width="200px"   runat="server" Text='<%#Eval("ItemDescription") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>  
                                   <asp:TemplateField HeaderText="UOM" >
                                    <ItemTemplate>                                                                           
                                        <asp:Label ID="UOM"  runat="server" Text='<%#Eval("UOM") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>  
                                <asp:TemplateField HeaderText="Debit Qty"  HeaderStyle-CssClass="text-right"  ItemStyle-HorizontalAlign="Right"    SortExpression="" Visible="true">
                                <ItemTemplate>
                                    <asp:Label ID="LibQty" runat="server"  Width="100px" Text=' <%#Eval("LibQty","{0:#,##0}")%>'     ></asp:Label>
                                </ItemTemplate>                               
                                </asp:TemplateField> 
                                 
                                 <asp:TemplateField HeaderText="Unit Price" HeaderStyle-CssClass="text-right" ItemStyle-HorizontalAlign="Right"    SortExpression="" Visible="true">
                                <ItemTemplate>
                                    <asp:Label ID="UnitPrice" runat="server"  Width="100px" Text=' <%#Eval("UnitPrice","{0:#,##0.00}")%>'     ></asp:Label>
                                </ItemTemplate>                               
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="Debit Note Value" HeaderStyle-CssClass="text-right" ItemStyle-HorizontalAlign="Right"    SortExpression="" Visible="true">
                                <ItemTemplate>
                                    <asp:Label ID="DebitNoteValue" runat="server"  Width="100px" Text=' <%#Eval("DebitNoteValue","{0:#,##0.00}")%>'     ></asp:Label>
                                </ItemTemplate>                                
                                </asp:TemplateField>
                                   <asp:TemplateField HeaderText="Curruncy" >
                                    <ItemTemplate>                                                                           
                                        <asp:Label ID="Curruncy"  runat="server" Text='<%#Eval("Curruncy") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>  
                                    <asp:TemplateField HeaderText="Address" >
                                    <ItemTemplate>                                                                           
                                        <asp:Label ID="Address"  runat="server" Text='<%#Eval("Address") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>  
                                  <asp:TemplateField HeaderText="Attention" >
                                    <ItemTemplate>                                                                           
                                        <asp:Label ID="Att"  runat="server" Text='<%#Eval("Att") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>  
                              <asp:TemplateField HeaderText="Comment" >
                                    <ItemTemplate>                                                                           
                                        <asp:Label ID="Comment"  runat="server" Text='<%#Eval("Comment") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>  
                                  <asp:TemplateField HeaderText="Company" >
                                    <ItemTemplate>                                                                           
                                        <asp:Label ID="Company"  runat="server" Text='<%#Eval("Company") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>  
                                    <asp:TemplateField HeaderText="Our Merchandiser Name" >
                                    <ItemTemplate>                                                                           
                                        <asp:Label ID="OurMerchandiserName"  runat="server" Text='<%#Eval("OurMerchandiserName") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField> 
                                    <asp:TemplateField HeaderText="Contract No" >
                                    <ItemTemplate>                                                                           
                                        <asp:Label ID="ContractNo"  runat="server" Text='<%#Eval("ContractNo") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField> 
                                    <asp:TemplateField HeaderText="Approved Date"  SortExpression="ApproveDEBDate">
                        <ItemTemplate>
                            <asp:Label ID="ApproveDEBDate" runat="server"  Text='<%#Eval("ApproveDEBDate","{0:dd/MMM/yyyy}") %>' ></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                                   <asp:TemplateField HeaderText="Approved User" >
                                    <ItemTemplate>                                                                           
                                        <asp:Label ID="DEBAppUser"  runat="server" Text='<%#Eval("DEBAppUser") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField> 

                                </Columns>
                                <%--<SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />--%>
                                <FooterStyle BackColor="#9f9b9b" Font-Bold="false" ForeColor="White" CssClass="GVFixedFooter" />
                                <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />                             
                            </asp:GridView>
                 <br />
                            </asp:Panel>
        </div>
    </form>
</body>
</html>
