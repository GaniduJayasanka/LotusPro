<%@ page language="C#" autoeventwireup="true" inherits="BuyerInvVsDispatch, App_Web_11yxmj2e" %>

<%@ Register Assembly="BasicFrame.WebControls.BasicDatePicker" Namespace="BasicFrame.WebControls" TagPrefix="BDP" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>MSP Dispatch vs Invoice Rpt</title>
    <link href="CSS/bootstrap.css" rel="stylesheet" />

    <link href="CSS/jquery.autocomplete.css" rel="stylesheet" type="text/css" />
    <script src="js/jquery-1.4.1.min.js" type="text/javascript"></script>
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
                    <div class="col-md-2">
                        <br />
                        <asp:ImageButton ID="btnHome" runat="server" ImageUrl="~/images/Tohome.png" Height="35px"
                            Width="35px" PostBackUrl="~/Allreports.aspx" />
                        <asp:ImageButton ID="btnback" runat="server" ImageUrl="~/images/Back.png" Height="35px"
                            Width="35px" PostBackUrl="~/report.aspx" />
                    </div>
                    <div class="col-md-9">
                        <h2 style="font-family:Bahnschrift;text-align: center">Buyer Wise Dispatched & Not Invoiced Age Analysis</h2>
                    </div>
                   
                </div>
            </div>
            <div class="col-md-12">
                <div class="panel panel-default">
                    <div class="panel-body">
                        <div class="box-body">
                                                       
                             <div class="row">
                                <div class="box-body">
                                    <div class="form-group">
                                        
                                             <label class="col-md-1 control-label">Buyer:</label>
                                        <div class="col-md-4">
                                            <asp:Label ID="lblBuyer" runat="server" Text="Label"></asp:Label>
                                        
                                            </div>
                                         <label class="col-md-2 control-label">Date Range:</label>
                                         <div class="col-md-3">
                                               <asp:Label ID="DatePickerFromDate" runat="server"  Text=""></asp:Label>
                                              <asp:Label ID="Label1" runat="server"  Text="  -  "></asp:Label>
                                              <asp:Label ID="DatePickerToDate"  runat="server" Text=""></asp:Label>
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
          <div class="col-md-12">
              <label class="col-md-2 control-label"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </label>
               <div class="row">
                    <label class="col-md-2 control-label"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </label>
                   <label class="col-md-2 control-label"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </label>
                        <asp:GridView ID="GridSuReport"
                          
                             runat="server"  ShowFooter="true" AutoGenerateColumns="False" BackColor="White"
                             BorderColor="#999999" OnRowDataBound="GridSuReport_RowDataBound"
                BorderWidth="2px"   ForeColor="Black" FooterStyle-HorizontalAlign="Right" AllowSorting="True"
                  Style="max-width: 100%;  font-size:smaller; min-width: 90%"
                EnableModelValidation="True" Width="1100px"  >
                <FooterStyle CssClass="GridViewFooterStyle" />
                <RowStyle CssClass="GridViewRowStyle" />    
                <SelectedRowStyle CssClass="GridViewSelectedRowStyle" />
                <PagerStyle CssClass="GridViewPagerStyle" />
                <AlternatingRowStyle CssClass="GridViewAlternatingRowStyle" />
                <HeaderStyle CssClass="GridViewHeaderStyle" />     
                                           
                <Columns>
                    
                     <asp:TemplateField HeaderText="DID" ItemStyle-HorizontalAlign="Center" SortExpression="" Visible="true">
                        <ItemTemplate>
                            <asp:Label ID="DID" runat="server" Text='<%#Eval("DID") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <%-- <asp:TemplateField HeaderText="BuyerName"   SortExpression="" Visible="true">
                        <ItemTemplate>
                        <asp:Label ID="BuyerName" runat="server"   Text='<%#Eval("BuyerName") %>' Width="180px" ></asp:Label>
                        </ItemTemplate>                       
                    </asp:TemplateField>--%>
                   
                    <asp:TemplateField HeaderText="Style" SortExpression="" Visible="true">
                        <ItemTemplate>
                            <asp:Label ID="StyleNo" runat="server"   Text='<%#Eval("StyleNo") %>' Width="100px"></asp:Label>
                        </ItemTemplate>                       
                    </asp:TemplateField>

                     <asp:TemplateField HeaderText="BuyerPONo" SortExpression="" Visible="true">
                        <ItemTemplate>
                        <asp:Label ID="BuyerPONo" runat="server"   Text='<%#Eval("BuyerPONo") %>'></asp:Label>
                        </ItemTemplate>                       
                    </asp:TemplateField>
                     <asp:TemplateField HeaderText="ContractNo" SortExpression="" Visible="true">
                        <ItemTemplate>
                        <asp:Label ID="ContractNo" runat="server"   Text='<%#Eval("ContractNo") %>'></asp:Label>
                        </ItemTemplate>                       
                    </asp:TemplateField>
                     <asp:TemplateField HeaderText="Color" SortExpression="" Visible="true">
                        <ItemTemplate>
                        <asp:Label ID="ColorName" runat="server"   Text='<%#Eval("ColorName") %>'></asp:Label>
                        </ItemTemplate>                       
                    </asp:TemplateField>
                     <asp:TemplateField HeaderText="Qty" ItemStyle-HorizontalAlign="Right" SortExpression="" Visible="true">
                        <ItemTemplate>
                        <asp:Label ID="ShippedQty" runat="server"   Text='<%#Eval("ToBeInvoiceQty","{0:#,##0}") %>'></asp:Label>
                        </ItemTemplate>  
                         <FooterTemplate>
                              <asp:Label ID="lblTotShippedQty" runat="server"  ></asp:Label>
                         </FooterTemplate>                     
                    </asp:TemplateField>
                     <asp:TemplateField HeaderText="Amount" ItemStyle-HorizontalAlign="Right" SortExpression="" Visible="true">
                        <ItemTemplate>
                        <asp:Label ID="ToBeInvoiceAmount" runat="server"   Text='<%#Eval("ToBeInvoiceAmount","{0:n2}") %>'></asp:Label>
                        </ItemTemplate>  
                         <FooterTemplate>
                              <asp:Label ID="lblTotShippedAmount" runat="server"  ></asp:Label>
                         </FooterTemplate>                     
                    </asp:TemplateField>
                     <asp:TemplateField HeaderText="Dispatched On" SortExpression="" Visible="true" ItemStyle-HorizontalAlign="Center">
                        <ItemTemplate>
                        <asp:Label ID="DespatchedOn" runat="server"    Text='<%#Eval("DespatchedOn","{0:dd/MMM/yyyy}") %>' Width="100px"></asp:Label>
                        </ItemTemplate>                       
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Date Diff" SortExpression="" Visible="true">
                        <ItemTemplate>
                        <asp:Label ID="DateDiff" runat="server"   Text='<%#Eval("DateDiff") %>'></asp:Label>
                        </ItemTemplate>                       
                    </asp:TemplateField>
                     <asp:TemplateField HeaderText="< 7 days" ItemStyle-BackColor="White" ItemStyle-HorizontalAlign="Right" SortExpression="" Visible="true">
                        <ItemTemplate>
                        <asp:Label ID="lessthan7" runat="server"   Text='<%#Eval("lessthan7","{0:n2}") %>'></asp:Label>
                        </ItemTemplate> 
                          <FooterTemplate>
                              <asp:Label ID="lblTotlessthan7" runat="server"  ></asp:Label>
                         </FooterTemplate>                         
                    </asp:TemplateField>
                     <asp:TemplateField HeaderText=" >7 & <14" ItemStyle-BackColor="#ffff66" ItemStyle-HorizontalAlign="Right" SortExpression="" Visible="true">
                        <ItemTemplate>
                        <asp:Label ID="between7And14" runat="server"   Text='<%#Eval("between7And14","{0:n2}") %>'></asp:Label>
                        </ItemTemplate> 
                         <FooterTemplate>
                              <asp:Label ID="lblTotbetween7And14" runat="server"  ></asp:Label>
                         </FooterTemplate>                      
                    </asp:TemplateField>
                     <asp:TemplateField HeaderText=" >14 & <21" ItemStyle-BackColor="#ccffff" ItemStyle-HorizontalAlign="Right" SortExpression="" Visible="true">
                        <ItemTemplate>
                        <asp:Label ID="between14And21" runat="server"   Text='<%#Eval("between14And21","{0:n2}") %>'></asp:Label>
                        </ItemTemplate>
                         <FooterTemplate>
                              <asp:Label ID="lblTotbetween14And21" runat="server"  ></asp:Label>
                         </FooterTemplate>                       
                    </asp:TemplateField>
                     <asp:TemplateField HeaderText=">21 days" ItemStyle-BackColor="Red" ItemStyle-ForeColor="White" ItemStyle-HorizontalAlign="Right" SortExpression="" Visible="true">
                        <ItemTemplate>
                        <asp:Label ID="GreaterThan21" runat="server"   Text='<%#Eval("GreaterThan21","{0:n2}") %>'></asp:Label>
                        </ItemTemplate> 
                         <FooterTemplate>
                              <asp:Label ID="lblTotGreaterThan21" runat="server"  ></asp:Label>
                         </FooterTemplate>                      
                    </asp:TemplateField>
                     <asp:TemplateField HeaderText="FOB" ItemStyle-HorizontalAlign="Right" SortExpression="" Visible="true">
                        <ItemTemplate>
                        <asp:Label ID="FC" runat="server"   Text='<%#Eval("FC","{0:n2}") %>'></asp:Label>
                        </ItemTemplate>                       
                    </asp:TemplateField>
                </Columns>
                <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
                             <FooterStyle BackColor="#696765" Font-Bold="True" ForeColor="White" CssClass="GVFixedFooter" />
  <HeaderStyle BackColor="#333333" CssClass="GVFixedHeader" Font-Bold="True" ForeColor="White" />
            </asp:GridView>
                        <br />
                        <br />
                      
                    </div> 
            </div>
            </div>
            </form>
</body>
    </html>
