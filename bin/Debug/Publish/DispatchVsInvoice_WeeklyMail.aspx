<%@ page language="C#" autoeventwireup="true" inherits="DispatchVsInvoice_WeeklyMail, App_Web_cjp5ygzm" %>

<%@ Register Assembly="BasicFrame.WebControls.BasicDatePicker" Namespace="BasicFrame.WebControls" TagPrefix="BDP" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Dispatched Vs Invoiced</title>
    <script src="js/jquery-1.9.1.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/jquery.min.js"></script>

    <script src="js/jquery-1.4.1.min.js" type="text/javascript"></script>
    <script type="text/javascript" src="js/jQuery-1.8.3.js"></script>
    <script src="js/bootstrap.min.js" type="text/javascript"></script>

    <link href="CSS/jquery.autocomplete.css" rel="stylesheet" type="text/css" />
    <script src="js/jquery.autocomplete.js" type="text/javascript"></script>   

    <script type="text/javascript">
        var oldgridcolor;
        function SetMouseOver(element) {
            oldgridcolor = element.style.backgroundColor;
            element.style.backgroundColor = '#ADEBFF';
            //element.style.cursor = 'pointer';

        }
        function SetMouseOut(element) {
            element.style.backgroundColor = oldgridcolor;
            element.style.textDecoration = 'none';
        }
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
            color: #333333;
            font-size:x-small;
            font-family:Cambria;
            font-weight: bold;                        
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
        .auto-style1 {
            height: 23px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
     
             <asp:ScriptManager ID="ScriptManager1" runat="server">
</asp:ScriptManager>  
        <div class="col-md-12">
            <div class="row">
                <div class="col-md-1">
                    <br />
                    <asp:ImageButton ID="btnHome" runat="server" ImageUrl="~/images/Tohome.png" Height="35px" PostBackUrl="http://192.168.1.20/ApmasERP/ManagementInformationCentre.aspx" Width="35px" />
                </div>
            </div>
        </div>    
        <div class="col-md-12">
        <table width="100%">
            <tr>
                <td style="font-family:Bahnschrift">Shipment Dispatch Vs Invoice - notification</td>
            </tr>
            <tr>
                <td>
                <asp:Panel ID="Panel3" runat="server">
                <div>
            <asp:Panel ID="Panel4" runat="server">
        <div>
            <asp:GridView ID="GV_1" CssClass="GridViewStyle" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" 
                BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" Width="900px" ShowFooter="true"              
                AllowSorting="True"  Style="max-width: 100%; min-width: 90% "
                EnableModelValidation="True" HeaderStyle-Height="10px" OnRowCreated="GV_1_RowCreated" OnRowDataBound="GV_1_RowDataBound" > 
                <FooterStyle CssClass="GridViewFooterStyle" HorizontalAlign="Right" ForeColor="Black" />
                <RowStyle CssClass="GridViewRowStyle" />    
                <SelectedRowStyle CssClass="GridViewSelectedRowStyle" />
                <PagerStyle CssClass="GridViewPagerStyle" />
                <AlternatingRowStyle CssClass="GridViewAlternatingRowStyle" />
                <HeaderStyle CssClass="GridViewHeaderStyle" />  
                                                                                                           
                <Columns>
                <asp:TemplateField HeaderStyle-BackColor="Gray" HeaderText="No" ItemStyle-BackColor="Gray">
                <ItemTemplate>
                <%# Container.DataItemIndex + 1 %>
                </ItemTemplate>
                <ItemStyle BackColor="Gray"></ItemStyle>
                <HeaderStyle Width="20px" />
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Buyer" SortExpression="" Visible="true" HeaderStyle-Width="500px">
                    <ItemTemplate>
                        <asp:Label ID="BuyerName" runat="server" Text='<%#Eval("BuyerName") %>'  Width="250px"></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:Label ID="BuyerName" runat="server" Text='<%#Eval("BuyerName") %>'  Width="250px"></asp:Label>
                    </EditItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Dispatched Qty" SortExpression="" Visible="true" ItemStyle-HorizontalAlign="Right" HeaderStyle-BackColor="LightGray" ItemStyle-BackColor="LightGray" FooterStyle-BackColor="LightGray">
                    <ItemTemplate>
                        <asp:Label ID="DispatchedQty_LW" runat="server" Text='<%#Eval("DispatchedQty_LW","{0:#,##0}") %>'  Width="50px"></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:Label ID="DispatchedQty_LW" runat="server" Text='<%#Eval("DispatchedQty_LW","{0:#,##0}") %>'  Width="50px"></asp:Label>
                    </EditItemTemplate>
                    <FooterTemplate>
                        <asp:Label ID="TotDispatched_LW" runat="server" ItemStyle-HorizontalAlign="Right" Font-Bold="true"></asp:Label>
                    </FooterTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Invoice Qty" SortExpression="" Visible="true" ItemStyle-HorizontalAlign="Right" HeaderStyle-BackColor="LightGray" ItemStyle-BackColor="LightGray" FooterStyle-BackColor="LightGray">
                    <ItemTemplate>
                        <asp:Label ID="InvoiceQty_LW" runat="server" Text='<%#Eval("InvoiceQty_LW","{0:#,##0}") %>'  Width="50px"></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:Label ID="InvoiceQty_LW" runat="server" Text='<%#Eval("InvoiceQty_LW","{0:#,##0}") %>'  Width="50px"></asp:Label>
                    </EditItemTemplate>
                    <FooterTemplate>
                        <asp:Label ID="TotInvoiceQty_LW" runat="server" ItemStyle-HorizontalAlign="Right" Font-Bold="true"></asp:Label>
                    </FooterTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Qty Variance" SortExpression="" Visible="true" ItemStyle-HorizontalAlign="Right" HeaderStyle-BackColor="LightGray" ItemStyle-BackColor="LightGray" FooterStyle-BackColor="LightGray">
                    <ItemTemplate>
                        <asp:Label ID="BalanceQty_LW" runat="server" Text='<%#Eval("BalanceQty_LW","{0:#,##0}") %>'  Width="50px" ></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:Label ID="BalanceQty_LW" runat="server" Text='<%#Eval("BalanceQty_LW","{0:#,##0}") %>'  Width="50px" ></asp:Label>
                    </EditItemTemplate>
                    <FooterTemplate>
                        <asp:Label ID="TotBalanceQty_LW" runat="server" ItemStyle-HorizontalAlign="Right" Font-Bold="true"></asp:Label>
                    </FooterTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Dispatched Qty" SortExpression="" Visible="true" ItemStyle-HorizontalAlign="Right" HeaderStyle-BackColor="LightGray" ItemStyle-BackColor="LightGray" FooterStyle-BackColor="LightGray">
                    <ItemTemplate>
                        <asp:Label ID="DispatchedQty_FY" runat="server" Text='<%#Eval("DispatchedQty_FY","{0:#,##0}") %>'  Width="50px" ></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:Label ID="DispatchedQty_FY" runat="server" Text='<%#Eval("DispatchedQty_FY","{0:#,##0}") %>'  Width="50px" ></asp:Label>
                    </EditItemTemplate>
                    <FooterTemplate>
                        <asp:Label ID="TotDispatchedQty_FY" runat="server" ItemStyle-HorizontalAlign="Right" Font-Bold="true"></asp:Label>
                    </FooterTemplate>
                </asp:TemplateField>
                   
                <asp:TemplateField HeaderText="Invoiced Qty"  Visible="true" ItemStyle-HorizontalAlign="Right" HeaderStyle-BackColor="LightGray" ItemStyle-BackColor="LightGray" FooterStyle-BackColor="LightGray">
                    <ItemTemplate>
                        <asp:Label ID="InvoiceQty_FY" runat="server" Text='<%#Eval("InvoiceQty_FY","{0:#,##0}") %>'  Width="50px" ></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:Label ID="InvoiceQty_FY" runat="server" Text='<%#Eval("InvoiceQty_FY","{0:#,##0}") %>'  Width="50px" ></asp:Label>
                    </EditItemTemplate>
                    <FooterTemplate>
                        <asp:Label ID="TotInvoiceQty_FY" runat="server" ItemStyle-HorizontalAlign="Right" Font-Bold="true"></asp:Label>
                    </FooterTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Qty Variance" SortExpression="" Visible="true" ItemStyle-HorizontalAlign="Right" HeaderStyle-BackColor="LightGray" ItemStyle-BackColor="LightGray" FooterStyle-BackColor="LightGray">
                    <ItemTemplate>
                        <asp:Label ID="BalanceQty_FY" runat="server" Text='<%#Eval("BalanceQty_FY","{0:#,##0}") %>'  Width="50px" ></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:Label ID="BalanceQty_FY" runat="server" Text='<%#Eval("BalanceQty_FY","{0:#,##0}") %>'  Width="50px" ></asp:Label>
                    </EditItemTemplate>
                    <FooterTemplate>
                        <asp:Label ID="TotBalanceQty_FY" runat="server" ItemStyle-HorizontalAlign="Right" Font-Bold="true"></asp:Label>
                    </FooterTemplate>
                </asp:TemplateField>
                   
                <asp:TemplateField HeaderText="Invoiced Value"  Visible="true" ItemStyle-HorizontalAlign="Right">
                    <ItemTemplate>
                        <asp:Label ID="InvoiceValue_LW" runat="server" Text='<%#Eval("InvoiceValue_LW","{0:#,##0.00}") %>'  Width="80px" ></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:Label ID="InvoiceValue_LW" runat="server" Text='<%#Eval("InvoiceValue_LW","{0:#,##0.00}") %>'  Width="80px" ></asp:Label>
                    </EditItemTemplate>
                    <FooterTemplate>
                        <asp:Label ID="TotInvoiceValue_LW" runat="server" ItemStyle-HorizontalAlign="Right" Font-Bold="true"></asp:Label>
                    </FooterTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Payments Received"  Visible="true" ItemStyle-HorizontalAlign="Right" >
                    <ItemTemplate>
                        <asp:Label ID="PaymentsReceived_LW" runat="server" Text='<%#Eval("PaymentsReceived_LW","{0:#,##0.00}") %>'  Width="80px" ></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:Label ID="PaymentsReceived_LW" runat="server" Text='<%#Eval("PaymentsReceived_LW","{0:#,##0.00}") %>'  Width="80px" ></asp:Label>
                    </EditItemTemplate>
                    <FooterTemplate>
                        <asp:Label ID="TotPaymentsReceived_LW" runat="server" ItemStyle-HorizontalAlign="Right" Font-Bold="true"></asp:Label>
                    </FooterTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Invoiced Value"  Visible="true" ItemStyle-HorizontalAlign="Right">
                    <ItemTemplate>
                        <asp:Label ID="InvoiceValue_FY" runat="server" Text='<%#Eval("InvoiceValue_FY","{0:#,##0.00}") %>'  Width="80px" ></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:Label ID="InvoiceValue_FY" runat="server" Text='<%#Eval("InvoiceValue_FY","{0:#,##0.00}") %>'  Width="80px" ></asp:Label>
                    </EditItemTemplate>
                    <FooterTemplate>
                        <asp:Label ID="TotInvoiceValue_FY" runat="server" ItemStyle-HorizontalAlign="Right" Font-Bold="true"></asp:Label>
                    </FooterTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Payments Received"  Visible="true" ItemStyle-HorizontalAlign="Right">
                    <ItemTemplate>
                        <asp:Label ID="PaymentsReceived_FY" runat="server" Text='<%#Eval("PaymentsReceived_FY","{0:#,##0.00}") %>'  Width="80px" ></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:Label ID="PaymentsReceived_FY" runat="server" Text='<%#Eval("PaymentsReceived_FY","{0:#,##0.00}") %>'  Width="80px" ></asp:Label>
                    </EditItemTemplate>
                    <FooterTemplate>
                        <asp:Label ID="TotPaymentsReceived_FY" runat="server" ItemStyle-HorizontalAlign="Right" Font-Bold="true"></asp:Label>
                    </FooterTemplate>
                </asp:TemplateField>
                    
                <asp:TemplateField HeaderText="Pending Receivables"  Visible="true" ItemStyle-HorizontalAlign="Right">
                    <ItemTemplate>
                        <asp:Label ID="PendingReceivable_FY" runat="server" Text='<%#Eval("PendingReceivable_FY","{0:#,##0.00}") %>'  Width="80px" ></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:Label ID="PendingReceivable_FY" runat="server" Text='<%#Eval("PendingReceivable_FY","{0:#,##0.00}") %>'  Width="80px" ></asp:Label>
                    </EditItemTemplate>
                    <FooterTemplate>
                        <asp:Label ID="TotPendingReceivable_FY" runat="server" ItemStyle-HorizontalAlign="Right" Font-Bold="true"></asp:Label>
                    </FooterTemplate>
                </asp:TemplateField>
                                                                                             
                </Columns>
                </asp:GridView> 
            </div>
        </asp:Panel> 
            </div>
        </asp:Panel>
                    </td>
                </tr>

            </table>                        
        
            </div>
    </form>
</body>
</html>
