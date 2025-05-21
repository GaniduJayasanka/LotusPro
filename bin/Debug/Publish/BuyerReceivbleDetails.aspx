<%@ page language="C#" autoeventwireup="true" inherits="BuyerReceivbleDetails, App_Web_cjp5ygzm" %>

<%@ Register Assembly="BasicFrame.WebControls.BasicDatePicker" Namespace="BasicFrame.WebControls" TagPrefix="BDP" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Buyer wise Receivables age Analysis - Detail View</title>
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
                        <h2 style="font-family:Bahnschrift;text-align: center" >Buyer Wise Receivables age Analysis  - Detail View</h2>
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

                <asp:GridView ID="GVReceivbleDetail" OnRowCreated="GVReceivbleDetail_RowCreated" runat="server"  ShowFooter="false" AutoGenerateColumns="true" BackColor="White"
                BorderColor="#999999" OnRowDataBound="GVReceivbleDetail_RowDataBound"  HeaderStyle-ForeColor="#ffffff"
                BorderWidth="2px"   ForeColor="Black" FooterStyle-HorizontalAlign="Right" AllowSorting="True"
                Style="max-width: 100%;  font-size:small; min-width: 85%"
                EnableModelValidation="True" Width="1085px" RowStyle-HorizontalAlign="Right"  >
                     <Columns>
                 <%--  <asp:TemplateField HeaderText="Buyer" ItemStyle-HorizontalAlign="Left" ControlStyle-Width="150px">
                                    <ItemTemplate>  
                                                                                
                                        <asp:Label ID="BuyerName" runat="server" Text='<%#Eval("BuyerName") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>   --%>
                         </Columns>
                <FooterStyle CssClass="GridViewFooterStyle" />
                <RowStyle CssClass="GridViewRowStyle" />    
                <SelectedRowStyle CssClass="GridViewSelectedRowStyle" />
                <PagerStyle CssClass="GridViewPagerStyle" />
                <AlternatingRowStyle CssClass="GridViewAlternatingRowStyle" />
                <HeaderStyle CssClass="GridViewHeaderStyle" />                  
                <Columns>
                
                    
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
