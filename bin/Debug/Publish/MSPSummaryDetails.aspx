<%@ page language="C#" autoeventwireup="true" inherits="MSPSummaryDetails, App_Web_b2ychy0x" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>MSP Summary Details</title>
    <link href="CSS/bootstrap.css" rel="stylesheet" />

    <script src="js/jquery-1.9.1.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/jquery.min.js"></script>

    <script src="js/jquery-1.4.1.min.js" type="text/javascript"></script>
    <script type="text/javascript" src="js/jQuery-1.8.3.js"></script>
    <script src="js/bootstrap.min.js" type="text/javascript"></script>
    <script src="js/jquery.autocomplete.js" type="text/javascript"></script>
    <link href="CSS/jquery.autocomplete.css" rel="stylesheet" type="text/css" />
    <link href="CSS/jquery.ui.all.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <div>
         <div class="col-md-12">
            <div class="row">
                <div class="col-md-1">
                    <br />
                    
                </div>
                <div class="col-md-11">
                    <center><h3>MSP - Summary Details</h3></center>
                </div>
            </div>
        </div>
      <asp:Panel ID="pnlsearch" runat="server">
            <div class="col-md-12">
                <div class="row">
                    <div class="col-md-12">
                        <div class="panel panel-default">
                            <div class="panel-body">
                                
                                <div class="row">
                                    <div class="box-body">
                                        <div class="form-group">


            
               
                 
                <div class="row">
                    <div class="auto-style26">
                    <table class="auto-style1">
                            <tr>
                                
                                 <td class="auto-style17"><span class="auto-style1">&nbsp; </span> </td>
                                 <td class="auto-style17"><span class="auto-style1">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span> </td>
                               
                                <td class="auto-style14"><strong>Style&nbsp; :</strong></td>
                                <td class="auto-style7">&nbsp;
                                   <asp:Label ID="LabpopStylepop" runat="server"></asp:Label>
                                </td>
                                 <td class="auto-style7">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                     </td>
                                <td class="auto-style22">&nbsp;&nbsp;&nbsp; <strong>Colour&nbsp;&nbsp; :</strong>&nbsp; </td>                                
                                
                                <td class="auto-style20">
                                    <asp:Label ID="Labcolour" runat="server">&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</asp:Label>
                                </td>                                
                                    <td class="auto-style22">&nbsp;&nbsp;&nbsp; <strong>Colour&nbsp;&nbsp;Qty :</strong>&nbsp; </td>                               
                                <td class="auto-style24">
                                    <asp:Label ID="LabcolourQty" runat="server"></asp:Label>
                                </td>
                                <td>
                                 <asp:Label ID="LabCCode" runat="server" Visible="false"></asp:Label><asp:Label ID="LabCName" runat="server" Visible="false"></asp:Label>
                                    </span>
                                </td> 
                                 <td class="auto-style17">
                                    &nbsp;
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
                                <td>&nbsp;</td>
                            </tr>
                        </table>
                    </div>
                </div>
            
               <div class="row">
                    <label class="col-md-7">

                        <asp:GridView ID="GridSuReport" runat="server"  ShowFooter="true"   AutoGenerateColumns="False" BackColor="White" BorderColor="#cc3300" 
                BorderWidth="2px" CellPadding="4" ForeColor="Black" OnRowDataBound="GridSuReport_RowDataBound"   FooterStyle-HorizontalAlign="Right"   AllowSorting="True"  Style="max-width: 100%; min-width: 90%; font-size: small;"
                EnableModelValidation="True" Width="980px"  >
               
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
                              <asp:TemplateField HeaderText="Buyer PO No"  ItemStyle-HorizontalAlign="Center" SortExpression="" Visible="true">
                        <ItemTemplate>
<%--                            <asp:Label ID="labBuyerPONo" runat="server" Text='<%#Eval("BuyerPONo") %>'></asp:Label>--%>
                        <asp:LinkButton ID="labBuyerPONo" runat="server"  OnClick="GridSuReport_Click"   Text='<%#Eval("BuyerPONo") %>' Width="180px"></asp:LinkButton>
                        </ItemTemplate>
                        <FooterTemplate>
                     <div >  <asp:Label ID="lblTotColourQty"   runat="server" /> </div> 
                                </FooterTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="FOB" ItemStyle-HorizontalAlign="Right" Visible="false" SortExpression="" >
                        <ItemTemplate>
                            <asp:Label ID="labFOB" runat="server" Text='<%#Eval("FOB") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Extended Ship Date"  ItemStyle-HorizontalAlign="Center" SortExpression="" >
                        <ItemTemplate>
                            <asp:Label ID="labExtendedShipDate" runat="server" Text='<%#Eval("ExtendedShipDate") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Committed Date"  ItemStyle-HorizontalAlign="Center" SortExpression="" >
                        <ItemTemplate>
                            <asp:Label ID="labPromisedDate" runat="server" Text='<%#Eval("PromisedDate") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Committed Qty"  ItemStyle-HorizontalAlign="Right" SortExpression="" >
                        <ItemTemplate>
                            <asp:Label ID="labPromisedQty" runat="server" Text='<%#Eval("PromisedQty") %>'></asp:Label>
                        </ItemTemplate>
                        <FooterTemplate>
                     <div >  <asp:Label ID="lblTotPromisedQty"    runat="server" /> </div> 
                                </FooterTemplate>
                    </asp:TemplateField>
                      <asp:TemplateField HeaderText="Despatched Qty"  ItemStyle-HorizontalAlign="Right" SortExpression="" >
                        <ItemTemplate>
                            <asp:Label ID="labDespatchedQty" runat="server" Text='<%#Eval("DespatchedQty") %>'></asp:Label>
                        </ItemTemplate>
                           <FooterTemplate>
                     <div>  <asp:Label ID="lblTotDespatchedQty"   runat="server" /> </div> 
                                </FooterTemplate>
                    </asp:TemplateField>



                 <asp:TemplateField HeaderText="Committed Vs Des"  ItemStyle-HorizontalAlign="Right" Visible="false">
                        <ItemTemplate>
                            <asp:Label ID="labPromisedQtyDetail" runat="server" ></asp:Label>
                        </ItemTemplate>
                            <FooterTemplate>
                              <div>  <asp:Label ID="lblTotPromisedQtyDetailFOBDetail"   runat="server" /> </div> 
                                </FooterTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Committed Vs Des"  ItemStyle-HorizontalAlign="Right" Visible="false">
                        <ItemTemplate>
                            <asp:Label ID="labPromisedQtyFOB" runat="server" ></asp:Label>
                        </ItemTemplate>
                        <FooterTemplate>
                              <div>  <asp:Label ID="lblTotPromisedQtyFOBValue"   runat="server" /> </div> 
                                </FooterTemplate>
                    </asp:TemplateField>


                     <asp:TemplateField HeaderText="Over/Short Qty"  ItemStyle-HorizontalAlign="Right" SortExpression="" >
                        <ItemTemplate>
                            <asp:Label ID="labOSQty" runat="server" Text='<%#Eval("OSQty") %>'></asp:Label>
                        </ItemTemplate>
                         <FooterTemplate>
                     <div>  
                        <asp:Label ID="lblTotOSQty"   runat="server" />                 
                     </div> 
                       </FooterTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Remarks" Visible="true">
                        <ItemTemplate>
                            <asp:Label ID="OverShortReason" runat="server" Text='<%#Eval("OverShortReason") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Despatched On"  ItemStyle-HorizontalAlign="Center" Visible="true">
                        <ItemTemplate>
                            <asp:Label ID="labDespatchedOn" runat="server" Text='<%#Eval("DespatchedOn") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Shipped On"  ItemStyle-HorizontalAlign="Center">
                        <ItemTemplate>
                            <asp:Label ID="labShippedOn" runat="server" Text='<%#Eval("ShippedOn") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                      <asp:TemplateField HeaderText="Pending"  Visible="false" ItemStyle-HorizontalAlign="Center">
                        <ItemTemplate>
                            <asp:Label ID="labPending" runat="server" Text='<%#Eval("Pending") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                     <asp:TemplateField HeaderText="ChildCount"  Visible="false" ItemStyle-HorizontalAlign="Center">
                        <ItemTemplate>
                            <asp:Label ID="labChildCount" runat="server" Text='<%#Eval("ChildCount") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                       <asp:TemplateField HeaderText="POID"  Visible="false" ItemStyle-HorizontalAlign="Center">
                        <ItemTemplate>
                            <asp:Label ID="labPOID" runat="server" Text='<%#Eval("POID") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Cancel" Visible="false">
                            <ItemTemplate>                           
                                <asp:Label ID="labCancel" runat="server" Visible="true" Text='<%#Eval("Cancel") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                                      <asp:TemplateField HeaderText="Cancel"  Visible="true">
                            <ItemTemplate>                           
                                <asp:Label ID="labCancelRemarks" Width="80px" runat="server" Visible="true" Text='<%#Eval("CancelRe") %>'></asp:Label>
                            </ItemTemplate>
                    </asp:TemplateField>
                     <asp:TemplateField HeaderText="Short Reason"  Visible="true">
                            <ItemTemplate>                           
                                <asp:Label ID="labShortReason" Width="80px" runat="server" Visible="true" Text='<%#Eval("ShortReason") %>'></asp:Label>
                            </ItemTemplate>
                    </asp:TemplateField>
                    
                </Columns>
                <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />

            </asp:GridView>
                      <br />
                        <asp:Label ID="Labebpo" runat="server" Text="" style="font-size: small"></asp:Label>
                       

                                     <asp:GridView ID="GridSuReportSub" runat="server"  ShowFooter="true"   AutoGenerateColumns="False" BackColor="White" BorderColor="#cc3300" 
                BorderWidth="2px" CellPadding="4" ForeColor="Black"  OnRowDataBound="GridSuReportSub_RowDataBound" FooterStyle-HorizontalAlign="Right"  AllowSorting="True" Style="max-width: 100%; min-width: 90%; font-size: small;"
                EnableModelValidation="True" Width="980px"  >
               
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
                      <asp:TemplateField HeaderText="Committed Qty" ItemStyle-HorizontalAlign="Right" SortExpression="" >
                        <ItemTemplate>
                            <asp:Label ID="labPromisedQty" runat="server" Text='<%#Eval("PromisedQty") %>'></asp:Label>
                        </ItemTemplate>
                          <FooterTemplate>
                              <div>  <asp:Label ID="lblTotPromisedQty"   runat="server" /> </div> 
                                </FooterTemplate>
                    </asp:TemplateField>
                     <asp:TemplateField HeaderText="DespatchedQty" ItemStyle-HorizontalAlign="Right" SortExpression="" Visible="">
                        <ItemTemplate>
                            <asp:Label ID="labDespatchedQty" runat="server" Text='<%#Eval("DespatchedQty") %>'></asp:Label>
                        </ItemTemplate>
                             <FooterTemplate>
                              <div>  <asp:Label ID="lblTotDespatchedQty"   runat="server" /> </div> 
                                </FooterTemplate>
                    </asp:TemplateField>
                              <asp:TemplateField HeaderText="Over/Short Qty" ItemStyle-HorizontalAlign="Right"  SortExpression="" Visible="true">
                        <ItemTemplate>
                            <asp:Label ID="labOSQty" runat="server" Text='<%#Eval("OSQty") %>'></asp:Label>
                        </ItemTemplate>
                                      <FooterTemplate>
                              <div>  <asp:Label ID="lblTotOSQty"   runat="server" /> </div> 
                                </FooterTemplate>
                    </asp:TemplateField>
                     <asp:TemplateField HeaderText="Cancel" Visible="false">
                            <ItemTemplate>                           
                                <asp:Label ID="labCancel" runat="server" Visible="true" Text='<%#Eval("Cancel") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                                      <asp:TemplateField HeaderText="Cancel"  Visible="true">
                            <ItemTemplate>                           
                                <asp:Label ID="labCancelRemarks" Width="80px" runat="server" Visible="true" Text='<%#Eval("CancelRe") %>'></asp:Label>
                            </ItemTemplate>
                    </asp:TemplateField>
                            
              
                    
                </Columns>
                <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />

            </asp:GridView>

                        <br />
                        <br />
                        <asp:Label ID="Label27" runat="server" Text="BPO Summery" style="font-size: small"></asp:Label>
                        <br />
                        <br />


                          <asp:GridView ID="GridBpoSummery" runat="server"  ShowFooter="false"   AutoGenerateColumns="False" BackColor="White" BorderColor="#cc3300" 
                BorderWidth="2px" CellPadding="4" ForeColor="Black" OnRowDataBound="GridBpoSummery_RowDataBound"  FooterStyle-HorizontalAlign="Right"   AllowSorting="True" Style="max-width: 100%; min-width: 90%; font-size: small;"
                EnableModelValidation="True" Width="980px"  >
               
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
                      <asp:TemplateField HeaderText="BPOQty" ItemStyle-HorizontalAlign="Right" SortExpression="" >
                        <ItemTemplate>
                            <asp:Label ID="ReqQty" runat="server" Text='<%#Eval("ReqQty") %>'></asp:Label>
                        </ItemTemplate>
                          
                    </asp:TemplateField>

                     <asp:TemplateField HeaderText="ShippedQty" ItemStyle-HorizontalAlign="Right" SortExpression="" >
                        <ItemTemplate>
                            <asp:Label ID="ShippedQty" runat="server" Text='<%#Eval("ShippedQty")%>'></asp:Label>
                        </ItemTemplate>
                             
                    </asp:TemplateField>

                     <asp:TemplateField HeaderText="Short / Over Qty" ItemStyle-HorizontalAlign="Right" SortExpression="" Visible="">
                        <ItemTemplate>
                            <asp:Label ID="labShippedQty" runat="server"></asp:Label>
                        </ItemTemplate>
                             
                    </asp:TemplateField>

                              <asp:TemplateField HeaderText="ExtendedShipDate" ItemStyle-HorizontalAlign="Right"  SortExpression="" Visible="true">
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
                       
                        <asp:Label ID="Label30" runat="server" Text="Pending Deliveries" style="font-size: small"></asp:Label>
                       

                          <asp:GridView ID="GridViewShiped" runat="server"  ShowFooter="true"   AutoGenerateColumns="False" BackColor="White" BorderColor="#cc3300" 
                BorderWidth="2px" CellPadding="4" ForeColor="Black"  FooterStyle-HorizontalAlign="Right" OnRowDataBound="GridViewShiped_RowDataBound"  AllowSorting="True" Style="max-width: 100%; min-width: 90%; font-size: small;"
                EnableModelValidation="True" Width="980px"  >
               
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
                     <div >  <asp:Label ID="lblTotColourQty"   runat="server" /> </div> 
                                </FooterTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="FOB" ItemStyle-HorizontalAlign="Right" Visible="false" SortExpression="" >
                        <ItemTemplate>
                            <asp:Label ID="labFOB" runat="server" Text='<%#Eval("FOB") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Extended Ship Date"  ItemStyle-Width="35px" ItemStyle-HorizontalAlign="Center" SortExpression="" >
                        <ItemTemplate>
                            <asp:Label ID="labExtendedShipDate" runat="server" Text='<%#Eval("ExtendedShipDate") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Committed Date"   ItemStyle-Width="60px" ItemStyle-HorizontalAlign="Center" SortExpression="" >
                        <ItemTemplate>
                            <asp:Label ID="labPromisedDate" runat="server" Text='<%#Eval("PromisedDate") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Committed Qty" ItemStyle-Width="63px"  ItemStyle-HorizontalAlign="Right" SortExpression="" >
                        <ItemTemplate>
                            <asp:Label ID="labPromisedQty" runat="server" Text='<%#Eval("PromisedQty") %>'></asp:Label>
                        </ItemTemplate>
                        <FooterTemplate>
                     <div >  <asp:Label ID="lblTotPromisedQty"    runat="server" /> </div> 
                                </FooterTemplate>
                    </asp:TemplateField>
 

                       <asp:TemplateField HeaderText="Despatched Qty"  ItemStyle-Width="40px" ItemStyle-HorizontalAlign="Right" SortExpression="" >
                        <ItemTemplate>
                            <asp:Label ID="labDespatchedQty" runat="server" ></asp:Label>
                        </ItemTemplate>
                           <FooterTemplate>
                     <div>  <asp:Label ID="lblTotDespatchedQty"   runat="server" /> </div> 
                                </FooterTemplate>
                    </asp:TemplateField>



                 <asp:TemplateField HeaderText="Committed Vs Des"  ItemStyle-HorizontalAlign="Right" Visible="false">
                        <ItemTemplate>
                            <asp:Label ID="labPromisedQtyDetail" runat="server" ></asp:Label>
                        </ItemTemplate>
                            <FooterTemplate>
                              <div>  <asp:Label ID="lblTotPromisedQtyDetailFOBDetail"   runat="server" /> </div> 
                                </FooterTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Committed Vs Des"  ItemStyle-HorizontalAlign="Right" Visible="false">
                        <ItemTemplate>
                            <asp:Label ID="labPromisedQtyFOB" runat="server" ></asp:Label>
                        </ItemTemplate>
                        <FooterTemplate>
                              <div>  <asp:Label ID="lblTotPromisedQtyFOBValue"   runat="server" /> </div> 
                                </FooterTemplate>
                    </asp:TemplateField>


                     <asp:TemplateField HeaderText="Over/Short Qty" ItemStyle-Width="70px"  ItemStyle-HorizontalAlign="Right" SortExpression="" >
                        <ItemTemplate>
                            <asp:Label ID="labOSQty" runat="server" ></asp:Label>
                        </ItemTemplate>
                         <FooterTemplate>
                     <div>  
                        <asp:Label ID="lblTotOSQty"   runat="server" />                 
                     </div> 
                       </FooterTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Remarks" Visible="true">
                        <ItemTemplate>
                            <asp:Label ID="OverShortReason" runat="server"></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Despatched On"  ItemStyle-HorizontalAlign="Center" Visible="true">
                        <ItemTemplate>
                            <asp:Label ID="labDespatchedOn" runat="server" ></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Shipped On"  ItemStyle-Width="68px" ItemStyle-HorizontalAlign="Center">
                        <ItemTemplate>
                            <asp:Label ID="labShippedOn" runat="server" ></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                      <asp:TemplateField HeaderText="Pending"  Visible="false" ItemStyle-HorizontalAlign="Center">
                        <ItemTemplate>
                            <asp:Label ID="labPending" runat="server" ></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                     <asp:TemplateField HeaderText="ChildCount"  Visible="false" ItemStyle-HorizontalAlign="Center">
                        <ItemTemplate>
                            <asp:Label ID="labChildCount" runat="server" ></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                       <asp:TemplateField HeaderText="POID"  Visible="false" ItemStyle-HorizontalAlign="Center">
                        <ItemTemplate>
                            <asp:Label ID="labPOID" runat="server" ></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Cancel" Visible="false">
                            <ItemTemplate>                           
                                <asp:Label ID="labCancel" runat="server" Visible="true" ></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                                      <asp:TemplateField HeaderText="Cancel"  Visible="true">
                            <ItemTemplate>                           
                                <asp:Label ID="labCancelRemarks" Width="80px" runat="server" Visible="true" ></asp:Label>
                            </ItemTemplate>
                    </asp:TemplateField>
                     <asp:TemplateField HeaderText="Short Reason"  Visible="true">
                            <ItemTemplate>                           
                                <asp:Label ID="labShortReason" Width="80px" runat="server" Visible="true" ></asp:Label>
                            </ItemTemplate>
                    </asp:TemplateField>
                
                   
                   
                </Columns>
                <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />

            </asp:GridView>


                        <br />
                       
                        <asp:Label ID="Label31" runat="server" Text="Shipment History" style="font-size: small"></asp:Label>
                        
                       
                        <asp:GridView ID="GridViewOtherShipments" runat="server"  ShowFooter="true"   AutoGenerateColumns="False" BackColor="White" BorderColor="#cc3300" 
                BorderWidth="2px" CellPadding="4" ForeColor="Black" OnRowDataBound="GridViewOtherShipments_RowDataBound"  FooterStyle-HorizontalAlign="Right"   AllowSorting="True" Style="max-width: 100%; min-width: 90%; font-size: small;"
                EnableModelValidation="True" Width="980px"  >
               
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
                              <asp:TemplateField HeaderText="Buyer PO No" ItemStyle-Width="180px"  ItemStyle-HorizontalAlign="Center" SortExpression="" Visible="true">
                        <ItemTemplate>
                            <asp:Label ID="labBuyerPONo" runat="server" Text='<%#Eval("BuyerPONo") %>'></asp:Label>
                        </ItemTemplate>
                        <FooterTemplate>
                     <div >  <asp:Label ID="lblTotColourQty"   runat="server" /> </div> 
                                </FooterTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="FOB" ItemStyle-HorizontalAlign="Right" Visible="false" SortExpression="" >
                        <ItemTemplate>
                            <asp:Label ID="labFOB" runat="server" Text='<%#Eval("FOB") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Extended Ship Date"  ItemStyle-Width="35px" ItemStyle-HorizontalAlign="Center" SortExpression="" >
                        <ItemTemplate>
                            <asp:Label ID="labExtendedShipDate" runat="server" Text='<%#Eval("ExtendedShipDate") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Committed Date"  ItemStyle-Width="60px"  ItemStyle-HorizontalAlign="Center" SortExpression="" >
                        <ItemTemplate>
                            <asp:Label ID="labPromisedDate" runat="server" Text='<%#Eval("PromisedDate") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Committed Qty" ItemStyle-Width="63px"  ItemStyle-HorizontalAlign="Right" SortExpression="" >
                        <ItemTemplate>
                            <asp:Label ID="labPromisedQty" runat="server" Text='<%#Eval("PromisedQty") %>'></asp:Label>
                        </ItemTemplate>
                        <FooterTemplate>
                     <div >  <asp:Label ID="lblTotPromisedQty"    runat="server" /> </div> 
                                </FooterTemplate>
                    </asp:TemplateField>
                      <asp:TemplateField HeaderText="Despatched Qty" ItemStyle-Width="40px"  ItemStyle-HorizontalAlign="Right" SortExpression="" >
                        <ItemTemplate>
                            <asp:Label ID="labDespatchedQty" runat="server" Text='<%#Eval("DespatchedQty") %>'></asp:Label>
                        </ItemTemplate>
                           <FooterTemplate>
                     <div>  <asp:Label ID="lblTotDespatchedQty"   runat="server" /> </div> 
                                </FooterTemplate>
                    </asp:TemplateField>



                 <asp:TemplateField HeaderText="Committed Vs Des"  ItemStyle-HorizontalAlign="Right" Visible="false">
                        <ItemTemplate>
                            <asp:Label ID="labPromisedQtyDetail" runat="server" ></asp:Label>
                        </ItemTemplate>
                            <FooterTemplate>
                              <div>  <asp:Label ID="lblTotPromisedQtyDetailFOBDetail"   runat="server" /> </div> 
                                </FooterTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Committed Vs Des"  ItemStyle-HorizontalAlign="Right" Visible="false">
                        <ItemTemplate>
                            <asp:Label ID="labPromisedQtyFOB" runat="server" ></asp:Label>
                        </ItemTemplate>
                        <FooterTemplate>
                              <div>  <asp:Label ID="lblTotPromisedQtyFOBValue"   runat="server" /> </div> 
                                </FooterTemplate>
                    </asp:TemplateField>


                     <asp:TemplateField HeaderText="Over/Short Qty"  ItemStyle-Width="65px" ItemStyle-HorizontalAlign="Right" SortExpression="" >
                        <ItemTemplate>
                            <asp:Label ID="labOSQty" runat="server" Text='<%#Eval("OSQty") %>'></asp:Label>
                        </ItemTemplate>
                         <FooterTemplate>
                     <div>  
                        <asp:Label ID="lblTotOSQty"   runat="server" />                 
                     </div> 
                       </FooterTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Remarks" ItemStyle-Width="10px" Visible="true">
                        <ItemTemplate>
                            <asp:Label ID="OverShortReason" runat="server" Text='<%#Eval("OverShortReason") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Despatched On"  ItemStyle-Width="20px" ItemStyle-HorizontalAlign="Center" Visible="true">
                        <ItemTemplate>
                            <asp:Label ID="labDespatchedOn" runat="server" Text='<%#Eval("DespatchedOn") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Shipped On"  ItemStyle-HorizontalAlign="Center">
                        <ItemTemplate>
                            <asp:Label ID="labShippedOn" runat="server" Text='<%#Eval("ShippedOn") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                            <asp:TemplateField HeaderText="Cancel"  Visible="true">
                            <ItemTemplate>                           
                                <asp:Label ID="labCancelRemarks" Width="80px" runat="server" Visible="true" ></asp:Label>
                            </ItemTemplate>
                    </asp:TemplateField>
                     <asp:TemplateField HeaderText="Short Reason"  ItemStyle-HorizontalAlign="Center">
                        <ItemTemplate>
                            <asp:Label ID="ShortReason" runat="server" Text='<%#Eval("ShortReason") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
                <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />

            </asp:GridView>
                         <br />
                        <asp:Label ID="Label32" runat="server" Text="Debit Notes" style="font-size: small"></asp:Label>
                          
                        <asp:GridView ID="GridViewDebitNotes" ShowFooter="true" OnRowDataBound="GridViewDebitNotes_RowDataBound" runat="server"    AutoGenerateColumns="False" BackColor="White" BorderColor="#cc3300" 
                BorderWidth="2px" CellPadding="4" ForeColor="Black"   FooterStyle-HorizontalAlign="Right"   AllowSorting="True" Style="max-width: 100%; min-width: 90%; font-size: small;"
                EnableModelValidation="True" Width="980px"  >
               
                <Columns>
                    
                    <asp:TemplateField HeaderText="DB Note"  SortExpression="" >
                        <ItemTemplate>
                            <asp:Label ID="DEBNumber" runat="server" Text='<%#Eval("DEBNumber") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                     <asp:TemplateField HeaderText="Style"  SortExpression="" >
                        <ItemTemplate>
                            <asp:Label ID="STYLE" runat="server" Text='<%#Eval("STYLE") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Item Description"  SortExpression="" >
                        <ItemTemplate>
                            <asp:Label ID="ItemDescription" runat="server" Text='<%#Eval("ItemDescription") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="DB Note Date">
                            <ItemTemplate>
                                <asp:Label ID="DEBDate" runat="server" Text='<%#Eval("DB_NOTE_DATE","{0:dd/MMM/yyyy}") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>

                    <asp:TemplateField HeaderText="AGAINST"   SortExpression="" >
                        <ItemTemplate>
                            <asp:Label ID="Address" runat="server" Text='<%#Eval("AGAINST") %>'></asp:Label>
                        </ItemTemplate>                        
                    </asp:TemplateField>
                               
                    <asp:TemplateField HeaderText="DESCRIPTION"   Visible="true">
                        <ItemTemplate>
                            <asp:Label ID="DESCRIPTION" runat="server" Text='<%#Eval("DESCRIPTION") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                  <asp:TemplateField HeaderText="Merchandiser"   Visible="true">
                        <ItemTemplate>
                            <asp:Label ID="OurMerchandiserName" runat="server" Text='<%#Eval("MERCHANDISER") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    
                     <asp:TemplateField HeaderText="DB Note Quantity"  ItemStyle-HorizontalAlign="Right"  Visible="true">
                        <ItemTemplate>
                            <asp:Label ID="QUANTITY" runat="server" Text='<%#Eval("QUANTITY") %>'></asp:Label>
                        </ItemTemplate>
                          <FooterTemplate>
                     <div>  <asp:Label ID="lblTotDebQUANTITY"   runat="server" /> </div> 
                                </FooterTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Amount"   Visible="true">
                        <ItemTemplate>
                            <asp:Label ID="AMOUNT" runat="server" Text='<%#Eval("AMOUNT") %>'></asp:Label>
                        </ItemTemplate>
                          <FooterTemplate>
                     <div>  <asp:Label ID="lblTotDebAMOUNT"   runat="server" /> </div> 
                                </FooterTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Acknowledge Quantity"  ItemStyle-HorizontalAlign="Right"  Visible="true">
                        <ItemTemplate>
                            <asp:Label ID="AcknowledgeQty" runat="server" Text='<%#Eval("AcknowledgeQty") %>'></asp:Label>
                        </ItemTemplate>
                        <FooterTemplate>
                     <div>  <asp:Label ID="lblAcknowledgeQty"   runat="server" /> </div> 
                                </FooterTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Currrency"   Visible="true">
                        <ItemTemplate>
                            <asp:Label ID="CURRENCY" runat="server" Text='<%#Eval("CURRENCY") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Approve Comment"   Visible="true">
                        <ItemTemplate>
                            <asp:Label ID="ShortShipmentApprovalComment" runat="server" Text='<%#Eval("ShortShipmentApprovalComment") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
                <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />

            </asp:GridView>
                        <br />
                                                  <asp:Label ID="Label6" runat="server" Text="Sample Dispatch Notes" style="font-size: small"></asp:Label>
                         <asp:GridView ID="GVSampleDespatchNote" ShowFooter="true" runat="server"    AutoGenerateColumns="False" BackColor="White" BorderColor="#cc3300" 
                BorderWidth="2px" CellPadding="4" ForeColor="Black"  OnRowDataBound="GVSampleDespatchNote_RowDataBound"   FooterStyle-HorizontalAlign="Right"   AllowSorting="True" Style="max-width: 100%; min-width: 90%; font-size: small;"
                EnableModelValidation="True" Width="980px"  >
               
                <Columns>
                    
                   <asp:TemplateField HeaderText="Sample Despatch No"  SortExpression="" >
                        <ItemTemplate>
                            <asp:Label ID="SampleDespatchNo" runat="server" Text='<%#Eval("SampleDespatchNo") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                     <asp:TemplateField HeaderText="Style"  SortExpression="" >
                        <ItemTemplate>
                            <asp:Label ID="STYLE" runat="server" Text='<%#Eval("StyleNo") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Color"  SortExpression="" >
                        <ItemTemplate>
                            <asp:Label ID="ColorName" runat="server" Text='<%#Eval("ColorName") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                   

                    <asp:TemplateField HeaderText="Sample Type"   SortExpression="" >
                        <ItemTemplate>
                            <asp:Label ID="SampleType" runat="server" Text='<%#Eval("SampleType") %>'></asp:Label>
                        </ItemTemplate>                        
                    </asp:TemplateField>
                       <asp:TemplateField HeaderText="Despatched Qty"  ItemStyle-HorizontalAlign="Right"  Visible="true">
                        <ItemTemplate>
                            <asp:Label ID="DespatchedQty" runat="server" Text='<%#Eval("DespatchedQty") %>'></asp:Label>
                        </ItemTemplate>
                            <FooterTemplate>
                     <div>  <asp:Label ID="lblTotDespatchedQty"   runat="server" /> </div> 
                                </FooterTemplate>
                    </asp:TemplateField> 
                     <asp:TemplateField HeaderText="Received QTy"  ItemStyle-HorizontalAlign="Right"  Visible="true">
                        <ItemTemplate>
                            <asp:Label ID="ReceivedQTy" runat="server" Text='<%#Eval("ReceivedQTy") %>'></asp:Label>
                        </ItemTemplate>
                          <FooterTemplate>
                     <div>  <asp:Label ID="lblTotReceivedQTy"   runat="server" /> </div> 
                                </FooterTemplate>
                    </asp:TemplateField> 
                    <asp:TemplateField HeaderText="Remaining Qty"  ItemStyle-HorizontalAlign="Right"  Visible="true">
                        <ItemTemplate>
                            <asp:Label ID="RemainingQty" runat="server" Text='<%#Eval("RemainingQty") %>'></asp:Label>
                        </ItemTemplate>
                         <FooterTemplate>
                     <div>  <asp:Label ID="lblTotRemainingQty"   runat="server" /> </div> 
                                </FooterTemplate>
                    </asp:TemplateField> 
                      <asp:TemplateField HeaderText="Despatched To"   Visible="true">
                        <ItemTemplate>
                            <asp:Label ID="DespatchCompany" runat="server" Text='<%#Eval("DespatchCompany") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField> 
                     <asp:TemplateField HeaderText="Despatched Date">
                            <ItemTemplate>
                                <asp:Label ID="DespatchedDate" runat="server" Text='<%#Eval("DespatchedDate","{0:dd/MMM/yyyy}") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>      
                    <asp:TemplateField HeaderText="Despatch Comment"   Visible="true">
                        <ItemTemplate>
                            <asp:Label ID="DespatchComment" runat="server" Text='<%#Eval("DespatchComment") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                <asp:TemplateField HeaderText="Location"   Visible="true">
                        <ItemTemplate>
                            <asp:Label ID="Send_Plant" runat="server" Text='<%#Eval("Send_Plant") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    
                     
                </Columns>
                <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />

            </asp:GridView>
                    </label>
                   
                </div>
                <div class="row">
                    <div class="col-md-4">
                       
                    </div>
                    <div class="col-md-7">
                      


                    <%--</div>--%>
                    <div class="col-md-5">
                       
                    </div>
                </div>
                    </div>
                <div class="row">&nbsp;</div>
             </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
             
          </asp:Panel>

        <asp:Label ID="LabColorCode" runat="server" Text="" Visible="false"></asp:Label>
        <asp:Label ID="ColorCode" runat="server" Text="" Visible="false"></asp:Label>
         <asp:Label ID="lblOrderNo" runat="server" Text="" Visible="false"></asp:Label>
    </div>
    </form>
</body>
</html>
