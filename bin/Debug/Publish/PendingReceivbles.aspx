<%@ page language="C#" autoeventwireup="true" inherits="PendingReceivbles, App_Web_10bhy3il" %>

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
                        <h2 style="font-family:Bahnschrift;text-align: center">Pending Receivables</h2>
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
                   
                   

                        <asp:GridView ID="GridSuReport"  runat="server"  ShowFooter="true" AutoGenerateColumns="False" BackColor="White" BorderColor="#999999" 
                BorderWidth="2px"  OnRowDataBound="GridSuReport_RowDataBound" ForeColor="Black" FooterStyle-HorizontalAlign="Right" AllowSorting="True"
                  OnRowCreated="GridSuReport_RowCreated"  Style="max-width: 100%;  font-size:smaller; min-width: 90%"
                EnableModelValidation="True" Width="980px"  >
               
                <Columns>
                    <%--<asp:TemplateField HeaderText="orderno" ItemStyle-HorizontalAlign="Center" SortExpression="" Visible="false">
                        <ItemTemplate>
                            <asp:Label ID="orderno" runat="server" Text='<%#Eval("orderno") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>--%>
                    <%-- <asp:TemplateField HeaderText="DID" ItemStyle-HorizontalAlign="Center" SortExpression="" Visible="true">
                        <ItemTemplate>
                            <asp:Label ID="labDID" runat="server" Text='<%#Eval("DID") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>--%>
                      <asp:TemplateField HeaderText="StyleNo" ItemStyle-HorizontalAlign="Left" SortExpression="" Visible="true">
                        <ItemTemplate>
                            <asp:Label ID="labStyleNo" runat="server" Text='<%#Eval("StyleNo") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <%-- <asp:TemplateField HeaderText="Plant"   SortExpression="" Visible="true">
                        <ItemTemplate>
                        <asp:Label ID="labPlant" runat="server"   Text='<%#Eval("Plant") %>' ></asp:Label>
                        </ItemTemplate>                       
                    </asp:TemplateField>--%>
                    <%-- <asp:TemplateField HeaderText="Dispatch No"   SortExpression="" Visible="true">
                        <ItemTemplate>
                        <asp:Label ID="labDispatchNo" runat="server"   Text='<%#Eval("DispatchNo") %>' ></asp:Label>
                        </ItemTemplate>                       
                    </asp:TemplateField>--%>
                     
                      <%-- <asp:TemplateField HeaderText="Dispatched On"  SortExpression="" Visible="true">
                        <ItemTemplate>
                            <asp:Label ID="DespatchedOn" runat="server"  Text='<%#Eval("DespatchedOn","{0:dd/MMM/yyyy}") %>' ></asp:Label>                        
                        </ItemTemplate>                       
                    </asp:TemplateField>--%>
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
                     <asp:TemplateField HeaderText="Plan vs Actual Value Variance" ItemStyle-HorizontalAlign="Right"  SortExpression="" Visible="true">
                        <ItemTemplate>
                        <asp:Label ID="variance" runat="server"    Text='<%#Eval("Variance") %>' ></asp:Label>
                        </ItemTemplate>
                         <FooterTemplate>
                              <div>  <asp:Label ID="lblQtyvariance"   runat="server" /> </div> 
                                </FooterTemplate>
                         </asp:TemplateField>

                <%--      <asp:TemplateField HeaderText="Status"  SortExpression="" Visible="true">
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
                         </asp:TemplateField>--%>
                     <asp:TemplateField HeaderText="Invoice Amount" ItemStyle-HorizontalAlign="Right"    SortExpression="" Visible="true">
                        <ItemTemplate>
                        <asp:Label ID="lblInvoiceAmount" runat="server" Text=' <%#Eval("ActualInvoiceValue","{0:n}")%>'      ></asp:Label>
                        </ItemTemplate>
                        <FooterTemplate>
                              <div>  <asp:Label ID="lblTotInvoiceAmount"   runat="server" /> </div> 
                                </FooterTemplate>
                         </asp:TemplateField> 
                     <asp:TemplateField HeaderText="Received Amount" ItemStyle-HorizontalAlign="Right"    SortExpression="" Visible="true">
                        <ItemTemplate>
                        <asp:Label ID="lblRecAmount" runat="server" Text=' <%#Eval("ReceivedAmount","{0:n}")%>'      ></asp:Label>
                        </ItemTemplate>
                        <FooterTemplate>
                              <div>  <asp:Label ID="lblTotREceiveAMOUNT"   runat="server" /> </div> 
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

                     <%-- <asp:TemplateField HeaderText="Shotage Reason"   SortExpression="" Visible="true">
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
                    </asp:TemplateField>--%>

                </Columns>
                <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
                             <FooterStyle BackColor="#333333" Font-Bold="True" ForeColor="White" CssClass="GVFixedFooter" />
  <HeaderStyle BackColor="#333333" CssClass="GVFixedHeader" Font-Bold="True" ForeColor="White" />
            </asp:GridView>
                    </label>
                        <br />
                        <br />
                      
                    </div> 
            </div>

             <div class="col-md-12">
              <label class="col-md-2 control-label"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </label>
               <div class="row">
                   
                   

                        <asp:GridView ID="GridView1" Caption="Waved Off Invoices" runat="server"  ShowFooter="true" AutoGenerateColumns="False" BackColor="White" BorderColor="#999999" 
                BorderWidth="2px"  OnRowDataBound="GridView1_RowDataBound" ForeColor="Black" FooterStyle-HorizontalAlign="Right" AllowSorting="True"
                  OnRowCreated="GridView1_RowCreated"  Style="max-width: 100%;  font-size:smaller; min-width: 90%"
                EnableModelValidation="True" Width="980px"  >
               
                <Columns>
                    <%--<asp:TemplateField HeaderText="orderno" ItemStyle-HorizontalAlign="Center" SortExpression="" Visible="false">
                        <ItemTemplate>
                            <asp:Label ID="orderno" runat="server" Text='<%#Eval("orderno") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>--%>
                    <%-- <asp:TemplateField HeaderText="DID" ItemStyle-HorizontalAlign="Center" SortExpression="" Visible="true">
                        <ItemTemplate>
                            <asp:Label ID="labDID" runat="server" Text='<%#Eval("DID") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>--%>
                      <asp:TemplateField HeaderText="StyleNo" ItemStyle-HorizontalAlign="Left" SortExpression="" Visible="true">
                        <ItemTemplate>
                            <asp:Label ID="labStyleNo" runat="server" Text='<%#Eval("StyleNo") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <%-- <asp:TemplateField HeaderText="Plant"   SortExpression="" Visible="true">
                        <ItemTemplate>
                        <asp:Label ID="labPlant" runat="server"   Text='<%#Eval("Plant") %>' ></asp:Label>
                        </ItemTemplate>                       
                    </asp:TemplateField>--%>
                    <%-- <asp:TemplateField HeaderText="Dispatch No"   SortExpression="" Visible="true">
                        <ItemTemplate>
                        <asp:Label ID="labDispatchNo" runat="server"   Text='<%#Eval("DispatchNo") %>' ></asp:Label>
                        </ItemTemplate>                       
                    </asp:TemplateField>--%>
                     
                      <%-- <asp:TemplateField HeaderText="Dispatched On"  SortExpression="" Visible="true">
                        <ItemTemplate>
                            <asp:Label ID="DespatchedOn" runat="server"  Text='<%#Eval("DespatchedOn","{0:dd/MMM/yyyy}") %>' ></asp:Label>                        
                        </ItemTemplate>                       
                    </asp:TemplateField>--%>
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

                <%--      <asp:TemplateField HeaderText="Status"  SortExpression="" Visible="true">
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
                         </asp:TemplateField>--%>
                     <asp:TemplateField HeaderText="Invoice Amount" ItemStyle-HorizontalAlign="Right"    SortExpression="" Visible="true">
                        <ItemTemplate>
                        <asp:Label ID="lblInvoiceAmount" runat="server" Text=' <%#Eval("ActualInvoiceValue","{0:n}")%>'      ></asp:Label>
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

                     <%-- <asp:TemplateField HeaderText="Shotage Reason"   SortExpression="" Visible="true">
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
                    </asp:TemplateField>--%>

                </Columns>
                <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
                             <FooterStyle BackColor="#333333" Font-Bold="True" ForeColor="White" CssClass="GVFixedFooter" />
  <HeaderStyle BackColor="#333333" CssClass="GVFixedHeader" Font-Bold="True" ForeColor="White" />
            </asp:GridView>
                    </label>
                        <br />
                        <br />
                      
                    </div> 
            </div>
            </div>
            </form>
</body>
    </html>
