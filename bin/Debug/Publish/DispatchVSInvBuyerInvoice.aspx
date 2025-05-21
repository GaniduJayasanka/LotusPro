<%@ page language="C#" autoeventwireup="true" inherits="DispatchVSInvBuyerInvoice, App_Web_10bhy3il" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>MSP Dispatch vs Invoice Rpt</title>
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

         <div class="col-md-12">
            
            <asp:Label ID="lblOrderNo" runat="server" Visible="False"></asp:Label>
            <div class="row">
                <div class="col-md-12">
                    <div class="col-md-1">
                        <br />
                        <asp:ImageButton ID="btnHome" runat="server" ImageUrl="~/images/Tohome.png" Height="35px"
                            Width="35px" PostBackUrl="~/Allreports.aspx" />
                      
                    </div>
                    <div class="col-md-11">
                        <h3 style="text-align: center">Buyer Wise Debit Note Summary</h3>
                    </div>
                    <%-- <div class="col-md-2">
                     <a href="MSPCommercialRpt.aspx"  target="_blank">  <asp:Label ID="Label3" runat="server" ToolTip="Buyer Summary for All Buyers" Text="Buyer Summary" type="button"></asp:Label>   </a>
                         </div>--%>
                     
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
       
              
             </div>
        <div>
             <div class="col-md-12">

             <asp:Panel ID="Panel1" runat="server" HorizontalAlign="Left">
                
 <br />
                  <asp:GridView ID="GVBuyerSummary" runat="server" FooterStyle-HorizontalAlign="Right" ShowFooter="true" Height="25px"  OnRowDataBound="GVBuyerSummary_RowDataBound" OnRowCreated="GVBuyerSummary_RowCreated"
      AutoGenerateColumns="False" BackColor="White" BorderColor="#cccccc"
                                BorderWidth="1px" CellPadding="4" ForeColor="Black" AllowSorting="True"
                                EnableModelValidation="True"  Width="900px" >
                <FooterStyle CssClass="GridViewFooterStyle" />
                <RowStyle CssClass="GridViewRowStyle" />    
                <SelectedRowStyle CssClass="GridViewSelectedRowStyle" />
                <PagerStyle CssClass="GridViewPagerStyle" />
                <AlternatingRowStyle CssClass="GridViewAlternatingRowStyle" />
                <HeaderStyle CssClass="GridViewHeaderStyle" /> 
      
                             <Columns>
                                 <%-- 0 --%>    
                                <asp:TemplateField HeaderText="Buyer" ControlStyle-Width="250px">
                                    <ItemTemplate>  
                                         <asp:LinkButton ID="LinkBuyerName"   runat="server" Text=' <%#Eval("BuyerName")%>'></asp:LinkButton>                                        
                                        <asp:Label ID="BuyerName" Visible="false" runat="server" Text='<%#Eval("BuyerName") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>                                
                                  
                                 


                                   <%-- 14 --%>   
                                   <asp:TemplateField HeaderText="As At Date DB Note Value" HeaderStyle-CssClass="text-right" ItemStyle-HorizontalAlign="Right"    SortExpression="" >
                                <ItemTemplate>                                    
                                    <asp:Label ID="AADDBValue" runat="server" Visible="true"   Text=' <%#Eval("DBValue","{0:#,##0.00}")%>'     ></asp:Label>                            
                                </ItemTemplate>
                                <FooterTemplate>                                 
                                          <asp:Label ID="lblTotDBValueAsAtDate" ForeColor="#ffffff" Font-Bold="false" Font-Size="Smaller"    runat="server" ></asp:Label>
                                        <%--  <asp:Label ID="lblTotPendingReceivble"    runat="server" />  --%>
                                </FooterTemplate>
                                </asp:TemplateField>
                                   <%-- 15 --%>   
                                   <asp:TemplateField HeaderText="As At Date DB Note Settled" HeaderStyle-CssClass="text-right" ItemStyle-HorizontalAlign="Right"    SortExpression="" >
                                <ItemTemplate>                                    
                                    <asp:Label ID="DBSettled" runat="server" Visible="true"  Text=' <%#Eval("DBValueSettled","{0:#,##0.00}")%>'     ></asp:Label>                            
                                </ItemTemplate>
                                <FooterTemplate>                                 
                                          <asp:Label ID="lblTotDBSettled" ForeColor="#ffffff" Font-Bold="false"  Font-Size="Smaller"   runat="server" ></asp:Label>
                                        <%--  <asp:Label ID="lblTotPendingReceivble"    runat="server" />  --%>
                                </FooterTemplate>
                                </asp:TemplateField>
                                   <%-- 16 --%>   
                                   <asp:TemplateField HeaderText="As At Date DB Note Balance" HeaderStyle-CssClass="text-right" ItemStyle-HorizontalAlign="Right"    SortExpression="" >
                                <ItemTemplate>                                    
                                    <asp:Label ID="DBBalance" runat="server" Visible="true"   Text=' <%#Eval("DBValueBalance","{0:#,##0.00}")%>'     ></asp:Label>                            
                                </ItemTemplate>
                                <FooterTemplate>                                 
                                          <asp:Label ID="lblTotDBBalance" ForeColor="#ffffff" Font-Bold="false"  Font-Size="Smaller"   runat="server" ></asp:Label>
                                        <%--  <asp:Label ID="lblTotPendingReceivble"    runat="server" />  --%>
                                </FooterTemplate>
                                </asp:TemplateField>
                                
                                  
                                </Columns>
                                <%--<SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />--%>
                                <FooterStyle BackColor="#9f9b9b" Font-Bold="false" ForeColor="White" CssClass="GVFixedFooter" />
                                <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />                             
                            </asp:GridView>
                 <br />
                            </asp:Panel>
        </div>
            </div>

          <asp:Label ID="Label1" runat="server"  class="col-md-9 control-label" ForeColor="#e34225" Font-Bold="true"> *** Please Note :- This report includes all active & inactive buyers. ***</asp:Label>
                      

        <asp:Label ID="lblWeekName1" runat="server" Text="Label" Visible="false"></asp:Label>
                  <asp:Label ID="lblWeekName2" runat="server" Text="Label" Visible="false"></asp:Label>
                  <asp:Label ID="lblWeekName3" runat="server" Text="Label" Visible="false"></asp:Label>
                  <asp:Label ID="lblWeekName4" runat="server" Text="Label" Visible="false"></asp:Label>
    </form>
</body>
</html>
