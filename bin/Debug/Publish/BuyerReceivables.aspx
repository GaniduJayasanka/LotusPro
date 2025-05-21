<%@ page language="C#" autoeventwireup="true" inherits="BuyerReceivables, App_Web_cjp5ygzm" %>

<%@ Register Assembly="BasicFrame.WebControls.BasicDatePicker" Namespace="BasicFrame.WebControls" TagPrefix="BDP" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Buyer wise Receivables age Analysis</title>
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
                        <h2 style="font-family:Bahnschrift;text-align: center" >Buyer Wise Receivables age Analysis</h2>
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
                                        
                                            <%-- <label class="col-md-1 control-label">Buyer:</label>
                                        <div class="col-md-4">
                                            <asp:Label ID="lblBuyer" runat="server" Text="Label"></asp:Label>
                                        
                                            </div>--%>
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
            <%--<div   class="col-md-12">
                <div   class="col-md-2">
                    </div>
                <div   class="col-md-4">
             <asp:Image ImageUrl="~/images/under-construction.png" Width="150px" runat="server" />
                    </div>
                </div>--%>
          <div class="col-md-12">
              <label class="col-md-2 control-label"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </label>
               <div class="row">
                    <label class="col-md-2 control-label"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </label>
                   <label class="col-md-2 control-label"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </label>

                <asp:GridView ID="GridSuReport" OnRowCreated="GridSuReport_RowCreated" runat="server"  ShowFooter="true" AutoGenerateColumns="False" BackColor="White"
                BorderColor="#999999" OnRowDataBound="GridSuReport_RowDataBound"
                BorderWidth="2px"   ForeColor="Black" FooterStyle-HorizontalAlign="Right" AllowSorting="True"
                Style="max-width: 100%;  font-size:small; min-width: 85%"
                EnableModelValidation="True" Width="1085px"  >

                <FooterStyle CssClass="GridViewFooterStyle" />
                <RowStyle CssClass="GridViewRowStyle" />    
                <SelectedRowStyle CssClass="GridViewSelectedRowStyle" />
                <PagerStyle CssClass="GridViewPagerStyle" />
                <AlternatingRowStyle CssClass="GridViewAlternatingRowStyle" />
                <HeaderStyle CssClass="GridViewHeaderStyle" />                  
                <Columns>
                    
                     
                     <asp:TemplateField HeaderText="Buyer Name"   SortExpression="" Visible="true">
                        <ItemTemplate>
                        <asp:Label ID="BuyerName" runat="server"   Text='<%#Eval("BuyerName") %>' ></asp:Label>
                        </ItemTemplate>  
                          <FooterTemplate>
                              <asp:Label ID="lblTOT" Text="TOTAL" runat="server"  ></asp:Label>
                         </FooterTemplate>                       
                    </asp:TemplateField>
                   
                       
                     <asp:TemplateField HeaderText="Pending Receivble" ItemStyle-HorizontalAlign="Right" SortExpression="" Visible="true">
                        <ItemTemplate>
                        <asp:Label ID="PendingReceivble" runat="server"   Text='<%#Eval("PR2","{0:n2}") %>'></asp:Label>
                        </ItemTemplate>  
                         <FooterTemplate>
                              <asp:Label ID="lblTotPendingReceivble" runat="server"  ></asp:Label>
                         </FooterTemplate>                     
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText=" > 90 days" ItemStyle-BackColor="#FF0000" ItemStyle-ForeColor="White" ItemStyle-HorizontalAlign="Right" SortExpression="" Visible="true">
                        <ItemTemplate>
                        <asp:Label ID="LessThanMinus90" runat="server"    Text='<%#Eval("LessThanMinus90","{0:n2}") %>'></asp:Label>
                        </ItemTemplate> 
                          <FooterTemplate>
                              <asp:Label ID="lblTotLessThanMinus90" runat="server"  ></asp:Label>
                         </FooterTemplate>                         
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="90 < 60 days" ItemStyle-BackColor="#FF0000" ItemStyle-ForeColor="White" ItemStyle-HorizontalAlign="Right" SortExpression="" Visible="true">
                        <ItemTemplate>
                        <asp:Label ID="betweenminus60Andminus90" runat="server" Text='<%#Eval("betweenminus60Andminus90","{0:n2}") %>'></asp:Label>
                        </ItemTemplate> 
                          <FooterTemplate>
                              <asp:Label ID="lblTotbetweenminus60Andminus90" runat="server"  ></asp:Label>
                         </FooterTemplate>                         
                    </asp:TemplateField>
                      <asp:TemplateField HeaderText="60 < 30 days" ItemStyle-BackColor="#FF0000" ItemStyle-ForeColor="White" ItemStyle-HorizontalAlign="Right" SortExpression="" Visible="true">
                        <ItemTemplate>
                        <asp:Label ID="betweenminus30Andminus60" runat="server"   Text='<%#Eval("betweenminus30Andminus60","{0:n2}") %>'></asp:Label>
                        </ItemTemplate> 
                          <FooterTemplate>
                              <asp:Label ID="lblTotbetweenminus30Andminus60" runat="server"  ></asp:Label>
                         </FooterTemplate>                         
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="30 < 0 days" ItemStyle-BackColor="#FF0000" ItemStyle-ForeColor="White" ItemStyle-HorizontalAlign="Right" SortExpression="" Visible="true">
                        <ItemTemplate>
                        <asp:Label ID="between0Andminus30" runat="server" Text='<%#Eval("between0Andminus30","{0:n2}") %>'></asp:Label>
                        </ItemTemplate> 
                          <FooterTemplate>
                              <asp:Label ID="lblTotbetween0Andminus30" runat="server"  ></asp:Label>
                         </FooterTemplate>                         
                    </asp:TemplateField>
                     <asp:TemplateField HeaderText="0 > 7 days"  ItemStyle-BackColor="White" ItemStyle-HorizontalAlign="Right" SortExpression="" Visible="true">
                        <ItemTemplate>
                        <asp:Label ID="lessthan7" runat="server" Text='<%#Eval("between0And7","{0:n2}") %>'></asp:Label>
                        </ItemTemplate> 
                           <FooterTemplate>
                                    <div>
                                          <asp:LinkButton ID="lblTotlessthan7" ForeColor="#ffffff" Font-Bold="true"  OnClick="lblTotlessthan7_Click" runat="server" ></asp:LinkButton>
                                        <%--  <asp:Label ID="lblTotPendingReceivble"    runat="server" /> </div> --%>
                                </FooterTemplate>

                                             
                    </asp:TemplateField>
                     <asp:TemplateField HeaderText="7 > 14 days" ItemStyle-BackColor="#ffcccc" ItemStyle-HorizontalAlign="Right" SortExpression="" Visible="true">
                        <ItemTemplate>
                        <asp:Label ID="between7And14" runat="server"   Text='<%#Eval("between7And14","{0:n2}") %>'></asp:Label>
                        </ItemTemplate> 
                         <FooterTemplate>
                             <asp:LinkButton ID="lblTotbetween7And14" ForeColor="#ffffff" Font-Bold="true"  OnClick="lblfot7and14_Click" runat="server" ></asp:LinkButton>
                              <%--<asp:Label ID="lblTotbetween7And14" runat="server"  ></asp:Label>--%>
                         </FooterTemplate>                      
                    </asp:TemplateField>
                     <asp:TemplateField HeaderText="14 > 21 days"  ItemStyle-BackColor="#ccffff" ItemStyle-HorizontalAlign="Right" SortExpression="" Visible="true">
                        <ItemTemplate>
                        <asp:Label ID="between14And21" runat="server"   Text='<%#Eval("between14And21","{0:n2}") %>'></asp:Label>
                        </ItemTemplate>
                         <FooterTemplate>
                              <asp:Label ID="lblTotbetween14And21" runat="server"  ></asp:Label>
                         </FooterTemplate>                       
                    </asp:TemplateField>
                     <asp:TemplateField HeaderText="21 > 30 days"  ItemStyle-BackColor="#ffff00" ItemStyle-HorizontalAlign="Right" SortExpression="" Visible="true">
                        <ItemTemplate>
                        <asp:Label ID="between30And21" runat="server"   Text='<%#Eval("between30And21","{0:n2}") %>'></asp:Label>
                        </ItemTemplate> 
                         <FooterTemplate>
                              <asp:Label ID="lblTotbetween30And21" runat="server"  ></asp:Label>
                         </FooterTemplate>                      
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="30 > 60 days"  ItemStyle-BackColor="#ffcc99" ItemStyle-HorizontalAlign="Right" SortExpression="" Visible="true">
                        <ItemTemplate>
                        <asp:Label ID="between30And60" runat="server"   Text='<%#Eval("between30And60","{0:n2}") %>'></asp:Label>
                        </ItemTemplate> 
                         <FooterTemplate>
                              <asp:Label ID="lblTotbetween30And60" runat="server"  ></asp:Label>
                         </FooterTemplate>                      
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="60 > 90 days" ItemStyle-BackColor="#ff99ff" ItemStyle-HorizontalAlign="Right" SortExpression="" Visible="true">
                        <ItemTemplate>
                        <asp:Label ID="between60And90" runat="server"   Text='<%#Eval("between60And90","{0:n2}") %>'></asp:Label>
                        </ItemTemplate> 
                         <FooterTemplate>
                              <asp:Label ID="lblTotbetween60And90" runat="server"  ></asp:Label>
                         </FooterTemplate>                      
                    </asp:TemplateField>
                     <asp:TemplateField HeaderText="> 90 days"  ItemStyle-BackColor="#99ff99" ItemStyle-HorizontalAlign="Right" SortExpression="" Visible="true">
                        <ItemTemplate>
                        <asp:Label ID="greaterThan90" runat="server"   Text='<%#Eval("greaterThan90","{0:n2}") %>'></asp:Label>
                        </ItemTemplate> 
                         <FooterTemplate>
                              <asp:Label ID="lblTotgreaterThan90" runat="server"  ></asp:Label>
                         </FooterTemplate>                      
                    </asp:TemplateField>
                   <%--  <asp:TemplateField HeaderText="FOB" ItemStyle-HorizontalAlign="Right" SortExpression="" Visible="true">
                        <ItemTemplate>
                        <asp:Label ID="FC" runat="server"   Text='<%#Eval("FC","{0:n2}") %>'></asp:Label>
                        </ItemTemplate>                       
                    </asp:TemplateField>--%>
                </Columns>
                <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
            </asp:GridView>
                        <br />
                        <br />
                      
                    </div> 
            </div>
            </div>
            </form>
</body>
    </html>
