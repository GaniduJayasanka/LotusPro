<%@ page language="C#" autoeventwireup="true" inherits="ShipmentAlert, App_Web_11yxmj2e" %>

<%@ Register Assembly="BasicFrame.WebControls.BasicDatePicker" Namespace="BasicFrame.WebControls" TagPrefix="BDP" %>
<%--<%@ Register Assembly="TimePicker" Namespace="MKB.TimePicker" TagPrefix="cc1" %>--%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">


    <title>MSP Shipment Alert</title>
    <link href="CSS/SPSStyle.css" rel="stylesheet" />
    <link href="CSS/bootstrap.css" rel="stylesheet" />
    <link href="CSS/font-awesome.css" rel="stylesheet" />

    <script language="javascript" type="text/javascript">
        function AssignExportHTML() {
            document.getElementById("<%= GVShipmentAlert.ClientID %>").value = htmlEscape(forExport.innerHTML);
        }
        function htmlEscape(str) {
            return String(str)
            .replace(/&/g, '&amp;')
            .replace(/"/g, '&quot;')
            .replace(/'/g, '&#39;')
            .replace(/</g, '&lt;')
            .replace(/>/g, '&gt;');
        }
    </script>

</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
        <div id="divExport" runat="server">


            <div>
                <asp:Panel ID="PnlReport" runat="server" Visible="true">
                    <div class="col-sm-12">
                        <div class="panel panel-default">
                            <div class="form-group">
                                <div>
                                    <asp:GridView ID="GVShipmentAlert" OnDataBound="GVShipmentAlert_DataBound" OnRowCreated="GVShipmentAlert_RowCreated" OnSorting="GVShipmentAlert_Sorting" OnRowDataBound="GVShipmentAlert_RowDataBound" runat="server" AutoGenerateColumns="False" Font-Size="14px" Width="78%" EnableModelValidation="True">
                                        <HeaderStyle BackColor="#333333" ForeColor="White" />
                                        <Columns>
                                            <%--  <asp:TemplateField HeaderText="OTRID" SortExpression="" Visible="False">
                              <ItemTemplate>
                                  <asp:Label ID="LblOTRID" runat="server" Text='<%# Eval("OTRID") %>' />
                              </ItemTemplate>
                            </asp:TemplateField>
                                <asp:TemplateField HeaderText="EmployeeID" SortExpression="" Visible="False">
                              <ItemTemplate>
                                  <asp:Label ID="LblEmployeeID" runat="server" Text='<%# Eval("EmployeeID") %>' />
                              </ItemTemplate>
                            </asp:TemplateField>
                                
                                <asp:TemplateField HeaderText="Request Date">
                                    <ItemTemplate>
                                        <asp:Label ID="LblOTRDate" runat="server" Text='<%#Eval("OTRDate","{0:dd/MMM/yyyy}") %>' />
                                    </ItemTemplate>
                                </asp:TemplateField>--%>

                                            <asp:TemplateField HeaderText="Plant" SortExpression="Plant">
                                                <ItemTemplate>
                                                    <asp:Label ID="Plant" runat="server" Text='<%# Eval("Plant") %>' />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Buyer Name">
                                                <ItemTemplate>
                                                    <asp:Label ID="LblBuyerName" runat="server" Text='<%# Eval("Buyer") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>

                                            <asp:TemplateField HeaderText="Style">
                                                <ItemTemplate>
                                                    <asp:Label ID="LblStyle" runat="server" Text='<%# Eval("Style") %>' />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Buyer PO">
                                                <ItemTemplate>
                                                    <asp:Label ID="BuyerPO" runat="server" Text='<%# Eval("BuyerPO") %>' />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Contract No" Visible="true">
                                                <ItemTemplate>
                                                    <asp:Label ID="ContractNo" runat="server" Text='<%# Eval("ContractNo") %>' />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Color" Visible="true">
                                                <ItemTemplate>
                                                    <asp:Label ID="Color" runat="server" Text='<%# Eval("Color") %>' />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                      
                                            <asp:BoundField DataField="BuyerPOQty" HeaderText="Buyer PO Qty" ItemStyle-Width="60"  ItemStyle-HorizontalAlign="Right" />
                                             
                                             <asp:BoundField DataField="SumithraPOQty" Visible="false"  HeaderText="Sumithra PO Qty" ItemStyle-Width="60"  ItemStyle-HorizontalAlign="Right" />
                                            <asp:BoundField DataField="CommitedQty" HeaderText="Commited Qty" ItemStyle-Width="60"  ItemStyle-HorizontalAlign="Right" />
                                            <asp:BoundField DataField="ShippedQty" HeaderText="Shipped Qty" ItemStyle-Width="60"  ItemStyle-HorizontalAlign="Right" />
                                            <asp:BoundField DataField="Variance" HeaderText="Short/Over Variance" ItemStyle-Width="60"  ItemStyle-HorizontalAlign="Right" />

                                         

                                            <asp:TemplateField HeaderText="   FOB ($)   " ItemStyle-HorizontalAlign="Right" Visible="true" SortExpression="FOB">
                                                <ItemTemplate>
                                                    <asp:Label ID="FOB" runat="server" Text='<%#Eval("FC","{0:n}") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>

                                            <asp:TemplateField HeaderText="Short/Over Ship Value ($)" Visible="false" ItemStyle-HorizontalAlign="Right">
                                                <ItemTemplate>
                                                    <asp:Label ID="ShortShipValue" runat="server" Text='<%#Eval("ShortShipValue","{0:n}") %>' />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:BoundField DataField="ShortShipValue" HeaderText="Short/Over Ship Value ($)" ItemStyle-Width="60" DataFormatString="{0:N2}" ItemStyle-HorizontalAlign="Right" />
                                             <asp:BoundField DataField="CumulativShippedQty" HeaderText="Cum. Shipped Qty" ItemStyle-Width="60"  ItemStyle-HorizontalAlign="Right" />
                                              <asp:BoundField DataField="BPOSHippedVariance" HeaderText="BPO/Cum. SHIP Variance" ItemStyle-Width="60"  ItemStyle-HorizontalAlign="Right" />


                                            <%-- <asp:BoundField DataField="SPOShipped" HeaderText="SPO/SHIP Variance" ItemStyle-Width="60"  ItemStyle-HorizontalAlign="Right" />--%>

                                      
                                            <asp:TemplateField HeaderText="Remarks" Visible="true">
                                                <ItemTemplate>
                                                    <asp:Label ID="Remarks" runat="server" Text='<%# Eval("Remarks") %>' />
                                                     <asp:Label ID="OverShortReason" runat="server" Text='<%# Eval("OverShortReason") %>' />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="var" Visible="false" ItemStyle-HorizontalAlign="Right">
                                                <ItemTemplate>
                                                    <asp:Label ID="var" runat="server" Text='<%# Eval("var") %>' />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="PlantID" Visible="false">
                                                <ItemTemplate>
                                                    <asp:Label ID="PlantID" runat="server" Text='<%# Eval("PlantID") %>' />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                             <asp:TemplateField HeaderText="Partial Ship." Visible="true">
                                                <ItemTemplate>
                                                    <asp:Label ID="PartialShipment" runat="server" Text='<%# Eval("PartialShipment") %>' />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                        <asp:TemplateField HeaderText="Buyer's PO Date" SortExpression="ExtendedShipDate" Visible="true">
                        <ItemTemplate>
                            <asp:Label ID="ExtendedShipDate" runat="server" Font-Bold="true" Font-Size="Small" Text='<%#Eval("ExtendedShipDate","{0:dd/MMM/yyyy}") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                                            <asp:TemplateField HeaderText="Physically Dispatched Date" SortExpression="PhysicallyDisDate" Visible="true">
                                            <ItemTemplate>
                                                <asp:Label ID="PhysicallyDisDate" runat="server" Font-Bold="true" Text='<%#Eval("PhysicallyDisDate","{0:dd/MMM/yyyy}") %>'></asp:Label>
                                            </ItemTemplate>
                                            </asp:TemplateField>

                                            <asp:TemplateField HeaderText="Reason for Delayed update" SortExpression="ReasonDelay" Visible="true">
                                            <ItemTemplate>
                                                <asp:Label ID="ReasonDelay" runat="server" Font-Bold="true" Text='<%#Eval("ReasonDelay") %>'></asp:Label>
                                            </ItemTemplate>
                                            </asp:TemplateField>

                                            <asp:TemplateField HeaderText="Date Gap" SortExpression="DateGap" Visible="true">
                                            <ItemTemplate>
                                                <asp:Label ID="DateGap" runat="server" Font-Bold="true" Text='<%#Eval("DateGap") %>'></asp:Label>
                                            </ItemTemplate>
                                            </asp:TemplateField>
                                            <%--  <asp:TemplateField HeaderText="OT Rate" ItemStyle-HorizontalAlign="Right">
                                    <ItemTemplate>
                                        <asp:Label ID="OTHoursRate" runat="server"  Text=' <%#Eval("OTHoursRate","{0:n}")%>' />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                  <asp:TemplateField HeaderText="OT Amount" ItemStyle-HorizontalAlign="Right">
                                    <ItemTemplate>
                                        <asp:Label ID="OTAmount" runat="server"  />
                                    </ItemTemplate>
                                </asp:TemplateField>
                               <asp:TemplateField HeaderText="Reason for OT" Visible="true">
                                    <ItemTemplate>
                                        <asp:Label ID="LblReason" runat="server" Text='<%# Eval("Reason") %>' />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                            --%>

                                                  
                                            <asp:TemplateField HeaderText="Buyer PO Qty" Visible="false" ItemStyle-HorizontalAlign="Right">
                                                <ItemTemplate>
                                                    <asp:Label ID="BuyerPOQty"  Font-Bold="true" Font-Size="Large"  runat="server" Text='<%# Eval("BuyerPOQty") %>' />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Sumithra PO Qty" Visible="false" ItemStyle-HorizontalAlign="Right">
                                                <ItemTemplate>
                                                    <asp:Label ID="SumithraPOQty" runat="server" Text='<%# Eval("SumithraPOQty") %>' />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                                                                        
                                <asp:TemplateField HeaderText="Commited Qty" Visible="false" ItemStyle-HorizontalAlign="Right">
                                       <ItemTemplate>
                                    <asp:Label ID="CommitedQty" runat="server" Text='<%# Eval("CommitedQty") %>' />
                                            </ItemTemplate>
                                           </asp:TemplateField>

                                               <asp:TemplateField HeaderText="Shipped Qty" Visible="false" ItemStyle-HorizontalAlign="Right">
                                                <ItemTemplate>
                                                    <asp:Label ID="ShippedQty" runat="server" Text='<%# Eval("ShippedQty") %>' />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Short/Over Variance" Visible="false" ItemStyle-HorizontalAlign="Right">
                                                <ItemTemplate>
                                                    <asp:Label ID="Variance" runat="server" Text='<%# Eval("Variance") %>' />
                                                </ItemTemplate>
                                            </asp:TemplateField>

                                        </Columns>
                                    </asp:GridView>
                                </div>
                                <div>
                                    <br />
                                    <asp:GridView ID="GVShipmentAlertSW" OnDataBound="GVShipmentAlertSW_DataBound"
                                         OnRowCreated="GVShipmentAlertSW_RowCreated" OnSorting="GVShipmentAlertSW_Sorting"
                                         OnRowDataBound="GVShipmentAlertSW_RowDataBound" runat="server" AutoGenerateColumns="False"
                                         Font-Size="14px" Width="80%" EnableModelValidation="True" ShowFooter="true">
                                        <HeaderStyle BackColor="#333333" ForeColor="White" />
                                        <Columns>
                                            <%--  <asp:TemplateField HeaderText="OTRID" SortExpression="" Visible="False">
                              <ItemTemplate>
                                  <asp:Label ID="LblOTRID" runat="server" Text='<%# Eval("OTRID") %>' />
                              </ItemTemplate>
                            </asp:TemplateField>
                                <asp:TemplateField HeaderText="EmployeeID" SortExpression="" Visible="False">
                              <ItemTemplate>
                                  <asp:Label ID="LblEmployeeID" runat="server" Text='<%# Eval("EmployeeID") %>' />
                              </ItemTemplate>
                            </asp:TemplateField>
                                
                                <asp:TemplateField HeaderText="Request Date">
                                    <ItemTemplate>
                                        <asp:Label ID="LblOTRDate" runat="server" Text='<%#Eval("OTRDate","{0:dd/MMM/yyyy}") %>' />
                                    </ItemTemplate>
                                </asp:TemplateField>--%>

                                            <asp:TemplateField HeaderText="Plant" SortExpression="Plant">
                                                <ItemTemplate>
                                                    <asp:Label ID="Plant" runat="server" Text='<%# Eval("Plant") %>' />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Buyer Name">
                                                <ItemTemplate>
                                                    <asp:Label ID="LblBuyerName" runat="server" Text='<%# Eval("Buyer") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>

                                            <asp:TemplateField HeaderText="Style">
                                                <ItemTemplate>
                                                    <asp:Label ID="LblStyle" runat="server" Text='<%# Eval("Style") %>' />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Buyer PO">
                                                <ItemTemplate>
                                                    <asp:Label ID="BuyerPO" runat="server" Text='<%# Eval("BuyerPO") %>' />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Contract No" Visible="true">
                                                <ItemTemplate>
                                                    <asp:Label ID="ContractNo" runat="server" Text='<%# Eval("ContractNo") %>' />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Color" Visible="true">
                                                <ItemTemplate>
                                                    <asp:Label ID="Color" runat="server" Text='<%# Eval("Color") %>' />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField FooterStyle-HorizontalAlign="Right" HeaderText="Buyer PO Qty" ItemStyle-HorizontalAlign="Right">
                                                <ItemTemplate>
                                                    <asp:Label ID="BuyerPOQty" Font-Bold="true" runat="server" Text='<%# Eval("BuyerPOQty") %>' />
                                                </ItemTemplate>
                                                 <FooterTemplate >
                                                     <asp:Label ID="LBLFooterBuyerPOQty"  runat="server" ></asp:Label>
                                                </FooterTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField FooterStyle-HorizontalAlign="Right" Visible="false" HeaderText="Sumithra PO Qty" ItemStyle-HorizontalAlign="Right">
                                                <ItemTemplate>
                                                    <asp:Label ID="SumithraPOQty" runat="server" Text='<%# Eval("SumithraPOQty") %>' />
                                                </ItemTemplate>
                                                <FooterTemplate >
                                                     <asp:Label ID="LBLFooterSPOQty"  runat="server" ></asp:Label>
                                                </FooterTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField FooterStyle-HorizontalAlign="Right" HeaderText="Commited Qty" ItemStyle-HorizontalAlign="Right">
                                                <ItemTemplate>
                                                    <asp:Label  ID="CommitedQty" runat="server" Text='<%# Eval("CommitedQty") %>' />
                                                </ItemTemplate>
                                                 <FooterTemplate >
                                                     <asp:Label ID="LBLFooterCommitedQty"  runat="server" ></asp:Label>
                                                </FooterTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField FooterStyle-HorizontalAlign="Right" HeaderText="Shipped Qty" ItemStyle-HorizontalAlign="Right">
                                                <ItemTemplate>
                                                    <asp:Label ID="ShippedQty" runat="server" Text='<%# Eval("ShippedQty") %>' />
                                                </ItemTemplate>
                                                   <FooterTemplate >
                                                     <asp:Label ID="LBLFooterShipOQty"  runat="server" ></asp:Label>
                                                </FooterTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField FooterStyle-HorizontalAlign="Right" HeaderText="Short/Over Variance" ItemStyle-HorizontalAlign="Right">
                                                <ItemTemplate>
                                                    <asp:Label ID="Variance" runat="server" Text='<%# Eval("Variance") %>' />
                                                </ItemTemplate>
                                                   <FooterTemplate >
                                                     <asp:Label ID="LBLFooterVariPOQty"  runat="server" ></asp:Label>
                                                </FooterTemplate>
                                            </asp:TemplateField>

                                            <asp:TemplateField HeaderText="   FOB ($)   " ItemStyle-HorizontalAlign="Right" Visible="true" SortExpression="FOB">
                                                <ItemTemplate>
                                                    <asp:Label ID="FOB" runat="server" Text='<%#Eval("FC","{0:n}") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>

                                            <asp:TemplateField FooterStyle-HorizontalAlign="Right" HeaderText="Short/Over Ship Value ($)" Visible="true" ItemStyle-HorizontalAlign="Right">
                                                <ItemTemplate>
                                                    <asp:Label ID="ShortShipValue" runat="server" Text='<%#Eval("ShortShipValue","{0:N2}") %>' />
                                                </ItemTemplate>
                                                 <FooterTemplate >
                                                     <asp:Label ID="LBLFooterShortShipValue"  runat="server" ></asp:Label>
                                                </FooterTemplate>
                                            </asp:TemplateField>
                                            <%--<asp:BoundField DataField="ShortShipValue" HeaderText="Short/Over Ship Value ($)" ItemStyle-Width="60" DataFormatString="{0:N2}" ItemStyle-HorizontalAlign="Right" />--%>
                                            <asp:TemplateField FooterStyle-HorizontalAlign="Right" HeaderText="Cum. Shipped Qty" ItemStyle-HorizontalAlign="Right">
                                                <ItemTemplate>
                                                    <asp:Label ID="CumulativShippedQty_SW" runat="server" Text='<%# Eval("CumulativShippedQty") %>' />
                                                </ItemTemplate>
                                                   <FooterTemplate >
                                                     <asp:Label ID="LblCumulativShippedQty"  runat="server" ></asp:Label>
                                                </FooterTemplate>
                                            </asp:TemplateField>
                                              <asp:TemplateField FooterStyle-HorizontalAlign="Right" HeaderText="BPO/Cum. SHIP Variance" ItemStyle-HorizontalAlign="Right">
                                                <ItemTemplate>
                                                    <asp:Label ID="SPOShipped_SW" runat="server" Text='<%# Eval("BPOSHippedVariance") %>' />
                                                </ItemTemplate>
                                                   <FooterTemplate >
                                                     <asp:Label ID="LBLSPOShippedVariQty"  runat="server" ></asp:Label>
                                                </FooterTemplate>
                                            </asp:TemplateField>
                                          <%--   <asp:BoundField DataField="SPOSHippedVariance" HeaderText="SPO/SHIP Variance" ItemStyle-Width="60"  ItemStyle-HorizontalAlign="Right" />--%>
                                           <%--  <asp:BoundField DataField="SPOShipped" HeaderText="SPO/SHIP Variance" ItemStyle-Width="60"  ItemStyle-HorizontalAlign="Right" />--%>
                                            <asp:TemplateField HeaderText="Remarks" Visible="true">
                                                <ItemTemplate>
                                                    <asp:Label ID="Remarks" runat="server" Text='<%# Eval("Remarks") %>' />
                                                     <asp:Label ID="OverShortReason" runat="server" Text='<%# Eval("OverShortReason") %>' />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="var" Visible="false" ItemStyle-HorizontalAlign="Right">
                                                <ItemTemplate>
                                                    <asp:Label ID="var" runat="server" Text='<%# Eval("var") %>' />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="PlantID" Visible="false">
                                                <ItemTemplate>
                                                    <asp:Label ID="PlantID" runat="server" Text='<%# Eval("PlantID") %>' />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                             <asp:TemplateField HeaderText="Partial Ship." Visible="true">
                                                <ItemTemplate>
                                                    <asp:Label ID="PartialShipment" runat="server" Text='<%# Eval("PartialShipment") %>' />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Buyer's PO Date" SortExpression="ExtendedShipDate" Visible="true">
                        <ItemTemplate>
                            <asp:Label ID="ExtendedShipDate" runat="server" Font-Bold="true" Text='<%#Eval("ExtendedShipDate","{0:dd/MMM/yyyy}") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                                            <asp:TemplateField HeaderText="Physically Dispatched Date" SortExpression="PhysicallyDisDate" Visible="true">
                                            <ItemTemplate>
                                                <asp:Label ID="PhysicallyDisDate" runat="server" Font-Bold="true" Text='<%#Eval("PhysicallyDisDate","{0:dd/MMM/yyyy}") %>'></asp:Label>
                                            </ItemTemplate>
                                            </asp:TemplateField>

                                            <asp:TemplateField HeaderText="Reason for Delayed update" SortExpression="ReasonDelay" Visible="true">
                                            <ItemTemplate>
                                                <asp:Label ID="ReasonDelay" runat="server" Font-Bold="true" Text='<%#Eval("ReasonDelay") %>'></asp:Label>
                                            </ItemTemplate>
                                            </asp:TemplateField>

                                            <asp:TemplateField HeaderText="Date Gap" SortExpression="DateGap" Visible="true">
                                            <ItemTemplate>
                                                <asp:Label ID="DateGap" runat="server" Font-Bold="true" Text='<%#Eval("DateGap") %>'></asp:Label>
                                            </ItemTemplate>
                                            </asp:TemplateField>

                                            <%--  <asp:TemplateField HeaderText="OT Rate" ItemStyle-HorizontalAlign="Right">
                                    <ItemTemplate>
                                        <asp:Label ID="OTHoursRate" runat="server"  Text=' <%#Eval("OTHoursRate","{0:n}")%>' />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                  <asp:TemplateField HeaderText="OT Amount" ItemStyle-HorizontalAlign="Right">
                                    <ItemTemplate>
                                        <asp:Label ID="OTAmount" runat="server"  />
                                    </ItemTemplate>
                                </asp:TemplateField>
                               <asp:TemplateField HeaderText="Reason for OT" Visible="true">
                                    <ItemTemplate>
                                        <asp:Label ID="LblReason" runat="server" Text='<%# Eval("Reason") %>' />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                            --%>
                                        </Columns>
                                           <FooterStyle BackColor="#333333" Font-Bold="True" ForeColor="White" CssClass="GVFixedFooter" />
                                    </asp:GridView>
                                </div>
                                <div>
                                    <br />

                                    <asp:GridView ID="GVShipmentAlertSP" ShowFooter="true" OnDataBound="GVShipmentAlertSP_DataBound" OnRowCreated="GVShipmentAlertSP_RowCreated" OnSorting="GVShipmentAlertSP_Sorting"
                                         OnRowDataBound="GVShipmentAlertSP_RowDataBound" runat="server" AutoGenerateColumns="False" Font-Size="14px" Width="80%" EnableModelValidation="True">
                                        <HeaderStyle BackColor="#333333" ForeColor="White" />
                                        <Columns>
                                            <asp:TemplateField HeaderText="Plant" SortExpression="Plant">
                                                <ItemTemplate>
                                                    <asp:Label ID="Plant" runat="server" Text='<%# Eval("Plant") %>' />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Buyer Name">
                                                <ItemTemplate>
                                                    <asp:Label ID="LblBuyerName" runat="server" Text='<%# Eval("Buyer") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Style">
                                                <ItemTemplate>
                                                    <asp:Label ID="LblStyle" runat="server" Text='<%# Eval("Style") %>' />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Buyer PO">
                                                <ItemTemplate>
                                                    <asp:Label ID="BuyerPO" runat="server" Text='<%# Eval("BuyerPO") %>' />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Contract No" Visible="true">
                                                <ItemTemplate>
                                                    <asp:Label ID="ContractNo" runat="server" Text='<%# Eval("ContractNo") %>' />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Color" Visible="true">
                                                <ItemTemplate>
                                                    <asp:Label ID="Color" runat="server" Text='<%# Eval("Color") %>' />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField FooterStyle-HorizontalAlign="Right" HeaderText="Buyer PO Qty" ItemStyle-HorizontalAlign="Right">
                                                <ItemTemplate>
                                                    <asp:Label ID="BuyerPOQty" Font-Bold="true" runat="server" Text='<%# Eval("BuyerPOQty") %>' />
                                                </ItemTemplate>
                                                  <FooterTemplate >
                                                     <asp:Label  ID="LBLFooterBuyerPOQtySP"  runat="server" ></asp:Label>
                                                </FooterTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField FooterStyle-HorizontalAlign="Right" Visible="false" HeaderText="Sumithra PO Qty" ItemStyle-HorizontalAlign="Right">
                                                <ItemTemplate>
                                                    <asp:Label ID="SumithraPOQty" runat="server" Text='<%# Eval("SumithraPOQty") %>' />
                                                </ItemTemplate>
                                                <FooterTemplate >
                                                     <asp:Label ID="LBLFooterSPOQtySP"  runat="server" ></asp:Label>
                                                </FooterTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField FooterStyle-HorizontalAlign="Right" HeaderText="Commited Qty" ItemStyle-HorizontalAlign="Right">
                                                <ItemTemplate>
                                                    <asp:Label ID="CommitedQty" runat="server" Text='<%# Eval("CommitedQty") %>' />
                                                </ItemTemplate>
                                                 <FooterTemplate >
                                                     <asp:Label ID="LBLFooterCommitedQtySP"  runat="server" ></asp:Label>
                                                </FooterTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField FooterStyle-HorizontalAlign="Right" HeaderText="Shipped Qty" ItemStyle-HorizontalAlign="Right">
                                                <ItemTemplate>
                                                    <asp:Label ID="ShippedQty" runat="server" Text='<%# Eval("ShippedQty") %>' />
                                                </ItemTemplate>
                                                 <FooterTemplate >
                                                     <asp:Label ID="LBLFooterShipOQtySP"  runat="server" ></asp:Label>
                                                </FooterTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField FooterStyle-HorizontalAlign="Right" HeaderText="Short/Over Variance" ItemStyle-HorizontalAlign="Right">
                                                <ItemTemplate>
                                                    <asp:Label ID="Variance" runat="server" Text='<%# Eval("Variance") %>' />
                                                </ItemTemplate>
                                                   <FooterTemplate >
                                                     <asp:Label ID="LBLFooterVariPOQtySP"  runat="server" ></asp:Label>
                                                </FooterTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="   FOB ($)   " ItemStyle-HorizontalAlign="Right" Visible="true" SortExpression="FOB">
                                                <ItemTemplate>
                                                    <asp:Label ID="FOB" runat="server" Text='<%#Eval("FC","{0:n}") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>

                                            <asp:TemplateField FooterStyle-HorizontalAlign="Right" HeaderText="Short/Over Ship Value ($)" Visible="true" ItemStyle-HorizontalAlign="Right">
                                                <ItemTemplate>
                                                    <asp:Label ID="ShortShipValue" runat="server" Text='<%#Eval("ShortShipValue","{0:N2}") %>' />
                                                </ItemTemplate>
                                                <FooterTemplate >
                                                     <asp:Label ID="LBLFooterShortShipValueSP"  runat="server" ></asp:Label>
                                                </FooterTemplate>
                                            </asp:TemplateField>

                                             <asp:TemplateField FooterStyle-HorizontalAlign="Right" HeaderText="Cum. Shipped Qty" ItemStyle-HorizontalAlign="Right">
                                                <ItemTemplate>
                                                    <asp:Label ID="CumulativShippedQtySP" runat="server" Text='<%# Eval("CumulativShippedQty") %>' />
                                                </ItemTemplate>
                                                   <FooterTemplate >
                                                     <asp:Label ID="LblCumulativShippedQtySP"  runat="server" ></asp:Label>
                                                </FooterTemplate>
                                            </asp:TemplateField>

                                             <asp:TemplateField FooterStyle-HorizontalAlign="Right" HeaderText="BPO/Cum. SHIP Variance" ItemStyle-HorizontalAlign="Right">
                                                <ItemTemplate>
                                                    <asp:Label ID="SPOShippedSP" runat="server" Text='<%# Eval("BPOSHippedVariance") %>' />
                                                </ItemTemplate>
                                                   <FooterTemplate >
                                                     <asp:Label ID="LBLSPOShippedVariQtySP"  runat="server" ></asp:Label>
                                                </FooterTemplate>
                                            </asp:TemplateField>
                                            <%--<asp:BoundField DataField="ShortShipValue" HeaderText="Short/Over Ship Value ($)" ItemStyle-Width="60" DataFormatString="{0:N2}" ItemStyle-HorizontalAlign="Right" />--%>
                                            <asp:TemplateField HeaderText="Remarks" Visible="true">
                                                <ItemTemplate>
                                                    <asp:Label ID="Remarks" runat="server" Text='<%# Eval("Remarks") %>' />
                                                     <asp:Label ID="OverShortReason" runat="server" Text='<%# Eval("OverShortReason") %>' />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="var" Visible="false" ItemStyle-HorizontalAlign="Right">
                                                <ItemTemplate>
                                                    <asp:Label ID="var" runat="server" Text='<%# Eval("var") %>' />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="PlantID" Visible="false">
                                                <ItemTemplate>
                                                    <asp:Label ID="PlantID" runat="server" Text='<%# Eval("PlantID") %>' />
                                                </ItemTemplate>
                                            </asp:TemplateField>  
                                             <asp:TemplateField HeaderText="Partial Ship." Visible="true">
                                                <ItemTemplate>
                                                    <asp:Label ID="PartialShipment" runat="server" Text='<%# Eval("PartialShipment") %>' />
                                                </ItemTemplate>
                                            </asp:TemplateField>  
                                            <asp:TemplateField HeaderText="Buyer's PO Date" SortExpression="ExtendedShipDate" Visible="true">
                        <ItemTemplate>
                            <asp:Label ID="ExtendedShipDate" Font-Bold="true" runat="server" Text='<%#Eval("ExtendedShipDate","{0:dd/MMM/yyyy}") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>      
                                            
                                            <asp:TemplateField HeaderText="Physically Dispatched Date" SortExpression="PhysicallyDisDate" Visible="true">
                                            <ItemTemplate>
                                                <asp:Label ID="PhysicallyDisDate" runat="server" Font-Bold="true" Text='<%#Eval("PhysicallyDisDate","{0:dd/MMM/yyyy}") %>'></asp:Label>
                                            </ItemTemplate>
                                            </asp:TemplateField>

                                            <asp:TemplateField HeaderText="Reason for Delayed update" SortExpression="ReasonDelay" Visible="true">
                                            <ItemTemplate>
                                                <asp:Label ID="ReasonDelay" runat="server" Font-Bold="true" Text='<%#Eval("ReasonDelay") %>'></asp:Label>
                                            </ItemTemplate>
                                            </asp:TemplateField>

                                            <asp:TemplateField HeaderText="Date Gap" SortExpression="DateGap" Visible="true">
                                            <ItemTemplate>
                                                <asp:Label ID="DateGap" runat="server" Font-Bold="true" Text='<%#Eval("DateGap") %>'></asp:Label>
                                            </ItemTemplate>
                                            </asp:TemplateField>
                                                                                                                
                                        </Columns>
                                           <FooterStyle BackColor="#333333" Font-Bold="True" ForeColor="White" CssClass="GVFixedFooter" />
                                    </asp:GridView>
                                </div>
                                 <div>
                                    <br />
                                    <asp:GridView ID="GVShipmentAlertSH" ShowFooter="true" OnDataBound="GVShipmentAlertSH_DataBound" OnRowCreated="GVShipmentAlertSH_RowCreated" OnSorting="GVShipmentAlertSH_Sorting"
                                         OnRowDataBound="GVShipmentAlertSH_RowDataBound" runat="server" AutoGenerateColumns="False" Font-Size="14px" Width="80%" EnableModelValidation="True">
                                        <HeaderStyle BackColor="#333333" ForeColor="White" />
                                        <Columns>
                                            <asp:TemplateField HeaderText="Plant" SortExpression="Plant">
                                                <ItemTemplate>
                                                    <asp:Label ID="Plant" runat="server" Text='<%# Eval("Plant") %>' />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Buyer Name">
                                                <ItemTemplate>
                                                    <asp:Label ID="LblBuyerName" runat="server" Text='<%# Eval("Buyer") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Style">
                                                <ItemTemplate>
                                                    <asp:Label ID="LblStyle" runat="server" Text='<%# Eval("Style") %>' />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Buyer PO">
                                                <ItemTemplate>
                                                    <asp:Label ID="BuyerPO" runat="server" Text='<%# Eval("BuyerPO") %>' />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Contract No" Visible="true">
                                                <ItemTemplate>
                                                    <asp:Label ID="ContractNo" runat="server" Text='<%# Eval("ContractNo") %>' />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Color" Visible="true">
                                                <ItemTemplate>
                                                    <asp:Label ID="Color" runat="server" Text='<%# Eval("Color") %>' />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField FooterStyle-HorizontalAlign="Right" HeaderText="Buyer PO Qty" ItemStyle-HorizontalAlign="Right">
                                                <ItemTemplate>
                                                    <asp:Label ID="BuyerPOQty" Font-Bold="true" runat="server" Text='<%# Eval("BuyerPOQty") %>' />
                                                </ItemTemplate>
                                                <FooterTemplate >
                                                     <asp:Label ID="LBLFooterBuyerPOQtySH"  runat="server" ></asp:Label>
                                                </FooterTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField FooterStyle-HorizontalAlign="Right" Visible="false" HeaderText="Sumithra PO Qty" ItemStyle-HorizontalAlign="Right">
                                                <ItemTemplate>
                                                    <asp:Label ID="SumithraPOQty" runat="server" Text='<%# Eval("SumithraPOQty") %>' />
                                                </ItemTemplate>
                                                <FooterTemplate >
                                                     <asp:Label ID="LBLFooterSPOQtySH"  runat="server" ></asp:Label>
                                                </FooterTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField FooterStyle-HorizontalAlign="Right" HeaderText="Commited Qty" ItemStyle-HorizontalAlign="Right">
                                                <ItemTemplate>
                                                    <asp:Label ID="CommitedQty" runat="server" Text='<%# Eval("CommitedQty") %>' />
                                                </ItemTemplate>
                                                 <FooterTemplate >
                                                     <asp:Label ID="LBLFooterCommitedQtySH"  runat="server" ></asp:Label>
                                                </FooterTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField FooterStyle-HorizontalAlign="Right" HeaderText="Shipped Qty" ItemStyle-HorizontalAlign="Right">
                                                <ItemTemplate>
                                                    <asp:Label ID="ShippedQty" runat="server" Text='<%# Eval("ShippedQty") %>' />
                                                </ItemTemplate>
                                                 <FooterTemplate >
                                                     <asp:Label ID="LBLFooterShipOQtySH"  runat="server" ></asp:Label>
                                                </FooterTemplate>
                                       </asp:TemplateField>
                                            <asp:TemplateField FooterStyle-HorizontalAlign="Right" HeaderText="Short/Over Variance" ItemStyle-HorizontalAlign="Right">
                                                <ItemTemplate>
                                                    <asp:Label ID="Variance" runat="server" Text='<%# Eval("Variance") %>' />
                                                </ItemTemplate>
                                                <FooterTemplate >
                                                     <asp:Label ID="LBLFooterVariPOQtySH"  runat="server" ></asp:Label>
                                                </FooterTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="   FOB ($)   " ItemStyle-HorizontalAlign="Right" Visible="true" SortExpression="FOB">
                                                <ItemTemplate>
                                                    <asp:Label ID="FOB" runat="server" Text='<%#Eval("FC","{0:n}") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField FooterStyle-HorizontalAlign="Right" HeaderText="Short/Over Ship Value ($)" Visible="true" ItemStyle-HorizontalAlign="Right">
                                                <ItemTemplate>
                                                    <asp:Label ID="ShortShipValue" runat="server" Text='<%#Eval("ShortShipValue","{0:N2}") %>' />
                                                </ItemTemplate>
                                                <FooterTemplate >
                                                     <asp:Label ID="LBLFooterShortShipValueSH"  runat="server" ></asp:Label>
                                                </FooterTemplate>
                                            </asp:TemplateField>

                                            <asp:TemplateField FooterStyle-HorizontalAlign="Right" HeaderText="Cum. Shipped Qty" ItemStyle-HorizontalAlign="Right">
                                                <ItemTemplate>
                                                    <asp:Label ID="CumulativShippedQtySH" runat="server" Text='<%# Eval("CumulativShippedQty") %>' />
                                                </ItemTemplate>
                                                   <FooterTemplate >
                                                     <asp:Label ID="LblCumulativShippedQtySH"  runat="server" ></asp:Label>
                                                </FooterTemplate>
                                            </asp:TemplateField>

                                             <asp:TemplateField FooterStyle-HorizontalAlign="Right" HeaderText="BPO/ Cum. SHIP Variance" ItemStyle-HorizontalAlign="Right">
                                                <ItemTemplate>
                                                    <asp:Label ID="SPOShippedSH" runat="server" Text='<%# Eval("BPOSHippedVariance") %>' />
                                                </ItemTemplate>
                                                   <FooterTemplate >
                                                     <asp:Label ID="LBLSPOShippedVariQtySH"  runat="server" ></asp:Label>
                                                </FooterTemplate>
                                            </asp:TemplateField>

                                               
                                            <%--<asp:BoundField DataField="ShortShipValue" HeaderText="Short/Over Ship Value ($)" ItemStyle-Width="60" DataFormatString="{0:N2}" ItemStyle-HorizontalAlign="Right" />--%>
                                            <asp:TemplateField HeaderText="Remarks" Visible="true">
                                                <ItemTemplate>
                                                    <asp:Label ID="Remarks" runat="server" Text='<%# Eval("Remarks") %>' />
                                                     <asp:Label ID="OverShortReason" runat="server" Text='<%# Eval("OverShortReason") %>' />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="var" Visible="false" ItemStyle-HorizontalAlign="Right">
                                                <ItemTemplate>
                                                    <asp:Label ID="var" runat="server" Text='<%# Eval("var") %>' />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="PlantID" Visible="false">
                                                <ItemTemplate>
                                                    <asp:Label ID="PlantID" runat="server" Text='<%# Eval("PlantID") %>' />
                                                </ItemTemplate>
                                            </asp:TemplateField> 
                                             <asp:TemplateField HeaderText="Partial Ship." Visible="true">
                                                <ItemTemplate>
                                                    <asp:Label ID="PartialShipment" runat="server" Text='<%# Eval("PartialShipment") %>' />
                                                </ItemTemplate>
                                            </asp:TemplateField>     
                                            <asp:TemplateField HeaderText="Buyer's PO Date" SortExpression="ExtendedShipDate" Visible="true">
                        <ItemTemplate>
                            <asp:Label ID="ExtendedShipDate" Font-Bold="true" runat="server" Text='<%#Eval("ExtendedShipDate","{0:dd/MMM/yyyy}") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>     
                                            
                                            <asp:TemplateField HeaderText="Physically Dispatched Date" SortExpression="PhysicallyDisDate" Visible="true">
                                            <ItemTemplate>
                                                <asp:Label ID="PhysicallyDisDate" runat="server" Font-Bold="true" Text='<%#Eval("PhysicallyDisDate","{0:dd/MMM/yyyy}") %>'></asp:Label>
                                            </ItemTemplate>
                                            </asp:TemplateField>

                                            <asp:TemplateField HeaderText="Reason for Delayed update" SortExpression="ReasonDelay" Visible="true">
                                            <ItemTemplate>
                                                <asp:Label ID="ReasonDelay" runat="server" Font-Bold="true" Text='<%#Eval("ReasonDelay") %>'></asp:Label>
                                            </ItemTemplate>
                                            </asp:TemplateField>

                                            <asp:TemplateField HeaderText="Date Gap" SortExpression="DateGap" Visible="true">
                                            <ItemTemplate>
                                                <asp:Label ID="DateGap" runat="server" Font-Bold="true" Text='<%#Eval("DateGap") %>'></asp:Label>
                                            </ItemTemplate>
                                            </asp:TemplateField>
                                                                                                               
                                        </Columns>
                                           <FooterStyle BackColor="#333333" Font-Bold="True" ForeColor="White" CssClass="GVFixedFooter" />
                                    </asp:GridView>
                                </div>
                                  <div>
                                    <br />
                                    <asp:GridView ID="GVShipmentAlertSN" ShowFooter="true" OnDataBound="GVShipmentAlertSN_DataBound"
                                         OnRowCreated="GVShipmentAlertSN_RowCreated" OnSorting="GVShipmentAlertSN_Sorting"
                                         OnRowDataBound="GVShipmentAlertSN_RowDataBound" runat="server" AutoGenerateColumns="False" Font-Size="14px" Width="80%" EnableModelValidation="True">
                                        <HeaderStyle BackColor="#333333" ForeColor="White" />
                                        <Columns>
                                            <asp:TemplateField HeaderText="Plant" SortExpression="Plant">
                                                <ItemTemplate>
                                                    <asp:Label ID="Plant" runat="server" Text='<%# Eval("Plant") %>' />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Buyer Name">
                                                <ItemTemplate>
                                                    <asp:Label ID="LblBuyerName" runat="server" Text='<%# Eval("Buyer") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Style">
                                                <ItemTemplate>
                                                    <asp:Label ID="LblStyle" runat="server" Text='<%# Eval("Style") %>' />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Buyer PO">
                                                <ItemTemplate>
                                                    <asp:Label ID="BuyerPO" runat="server" Text='<%# Eval("BuyerPO") %>' />
                                                </ItemTemplate>
                                                 
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Contract No" Visible="true">
                                                <ItemTemplate>
                                                    <asp:Label ID="ContractNo" runat="server" Text='<%# Eval("ContractNo") %>' />
                                                </ItemTemplate>
                                                
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Color" Visible="true">
                                                <ItemTemplate>
                                                    <asp:Label ID="Color" runat="server" Text='<%# Eval("Color") %>' />
                                                </ItemTemplate>
                                                 
                                            </asp:TemplateField>
                                            <asp:TemplateField FooterStyle-HorizontalAlign="Right" HeaderText="Buyer PO Qty" ItemStyle-HorizontalAlign="Right">
                                                <ItemTemplate>
                                                    <asp:Label ID="BuyerPOQty" Font-Bold="true" runat="server" Text='<%# Eval("BuyerPOQty") %>' />
                                                </ItemTemplate>
                                                  <FooterTemplate >
                                                     <asp:Label ID="LBLFooterBuyerPOQtySN"  runat="server" ></asp:Label>
                                                </FooterTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField FooterStyle-HorizontalAlign="Right" Visible="false"  HeaderText="Sumithra PO Qty" ItemStyle-HorizontalAlign="Right">
                                                <ItemTemplate>
                                                    <asp:Label ID="SumithraPOQty" runat="server" Text='<%# Eval("SumithraPOQty") %>' />
                                                </ItemTemplate>
                                                   <FooterTemplate >
                                                     <asp:Label ID="LBLFooterSPOQtySN"  runat="server" ></asp:Label>
                                                </FooterTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField FooterStyle-HorizontalAlign="Right" HeaderText="Commited Qty" ItemStyle-HorizontalAlign="Right">
                                                <ItemTemplate>
                                                    <asp:Label ID="CommitedQty" runat="server" Text='<%# Eval("CommitedQty") %>' />
                                                </ItemTemplate>
                                                <FooterTemplate >
                                                     <asp:Label ID="LBLFooterCommitedQtySN"  runat="server" ></asp:Label>
                                                </FooterTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField FooterStyle-HorizontalAlign="Right" HeaderText="Shipped Qty" ItemStyle-HorizontalAlign="Right">
                                                <ItemTemplate>
                                                    <asp:Label ID="ShippedQty" runat="server" Text='<%# Eval("ShippedQty") %>' />
                                                </ItemTemplate>
                                                 <FooterTemplate >
                                                     <asp:Label ID="LBLFooterShipOQtySN"  runat="server" ></asp:Label>
                                                </FooterTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField  FooterStyle-HorizontalAlign="Right" HeaderText="Short/Over Variance" ItemStyle-HorizontalAlign="Right">
                                                <ItemTemplate>
                                                    <asp:Label ID="Variance" runat="server" Text='<%# Eval("Variance") %>' />
                                                </ItemTemplate>
                                                <FooterTemplate >
                                                     <asp:Label ID="LBLFooterVariPOQtySN"  runat="server" ></asp:Label>
                                                </FooterTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="   FOB ($)   " ItemStyle-HorizontalAlign="Right" Visible="true" SortExpression="FOB">
                                                <ItemTemplate>
                                                    <asp:Label ID="FOB" runat="server" Text='<%#Eval("FC","{0:n}") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField FooterStyle-HorizontalAlign="Right" HeaderText="Short/Over Ship Value ($)" Visible="true" ItemStyle-HorizontalAlign="Right">
                                                <ItemTemplate>
                                                    <asp:Label ID="ShortShipValue" runat="server" Text='<%#Eval("ShortShipValue","{0:N2}") %>' />
                                                </ItemTemplate>
                                                <FooterTemplate >
                                                     <asp:Label ID="LBLFooterShortShipValueSN"  runat="server" ></asp:Label>
                                                </FooterTemplate>
                                            </asp:TemplateField>
                                                
                                             <asp:TemplateField FooterStyle-HorizontalAlign="Right" HeaderText="Cum. Shipped Qty" ItemStyle-HorizontalAlign="Right">
                                                <ItemTemplate>
                                                    <asp:Label ID="CumulativShippedQtySN" runat="server" Text='<%# Eval("CumulativShippedQty") %>' />
                                                </ItemTemplate>
                                                   <FooterTemplate >
                                                     <asp:Label ID="LblCumulativShippedQtySN"  runat="server" ></asp:Label>
                                                </FooterTemplate>
                                            </asp:TemplateField>

                                            <asp:TemplateField FooterStyle-HorizontalAlign="Right" HeaderText="BPO/ Cum. SHIP Variance" ItemStyle-HorizontalAlign="Right">
                                                <ItemTemplate>
                                                    <asp:Label ID="SPOShippedSN" runat="server" Text='<%# Eval("BPOSHippedVariance") %>' />
                                                </ItemTemplate>
                                                   <FooterTemplate >
                                                     <asp:Label ID="LBLSPOShippedVariQtySN"  runat="server" ></asp:Label>
                                                </FooterTemplate>
                                            </asp:TemplateField>
                                            <%--<asp:BoundField DataField="ShortShipValue" HeaderText="Short/Over Ship Value ($)" ItemStyle-Width="60" DataFormatString="{0:N2}" ItemStyle-HorizontalAlign="Right" />--%>
                                            <asp:TemplateField HeaderText="Remarks" Visible="true">
                                                <ItemTemplate>
                                                    <asp:Label ID="Remarks" runat="server" Text='<%# Eval("Remarks") %>' />
                                                     <asp:Label ID="OverShortReason" runat="server" Text='<%# Eval("OverShortReason") %>' />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="var" Visible="false" ItemStyle-HorizontalAlign="Right">
                                                <ItemTemplate>
                                                    <asp:Label ID="var" runat="server" Text='<%# Eval("var") %>' />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="PlantID" Visible="false">
                                                <ItemTemplate>
                                                    <asp:Label ID="PlantID" runat="server" Text='<%# Eval("PlantID") %>' />
                                                </ItemTemplate>
                                            </asp:TemplateField> 
                                             <asp:TemplateField HeaderText="Partial Ship." Visible="true">
                                                <ItemTemplate>
                                                    <asp:Label ID="PartialShipment" runat="server" Text='<%# Eval("PartialShipment") %>' />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Buyer's PO Date" SortExpression="ExtendedShipDate" Visible="true">
                        <ItemTemplate>
                            <asp:Label ID="ExtendedShipDate" Font-Bold="true" runat="server" Text='<%#Eval("ExtendedShipDate","{0:dd/MMM/yyyy}") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>        
                                            
                                            <asp:TemplateField HeaderText="Physically Dispatched Date" SortExpression="PhysicallyDisDate" Visible="true">
                                            <ItemTemplate>
                                                <asp:Label ID="PhysicallyDisDate" runat="server" Font-Bold="true" Text='<%#Eval("PhysicallyDisDate","{0:dd/MMM/yyyy}") %>'></asp:Label>
                                            </ItemTemplate>
                                            </asp:TemplateField>

                                            <asp:TemplateField HeaderText="Reason for Delayed update" SortExpression="ReasonDelay" Visible="true">
                                            <ItemTemplate>
                                                <asp:Label ID="ReasonDelay" runat="server" Font-Bold="true" Text='<%#Eval("ReasonDelay") %>'></asp:Label>
                                            </ItemTemplate>
                                            </asp:TemplateField>

                                            <asp:TemplateField HeaderText="Date Gap" SortExpression="DateGap" Visible="true">
                                            <ItemTemplate>
                                                <asp:Label ID="DateGap" runat="server" Font-Bold="true" Text='<%#Eval("DateGap") %>'></asp:Label>
                                            </ItemTemplate>
                                            </asp:TemplateField>
                                                                                                                 
                                        </Columns>
                                           <FooterStyle BackColor="#333333" Font-Bold="True" ForeColor="White" CssClass="GVFixedFooter" />
                                    </asp:GridView>
                                </div>
                                <div>
                                      <br />
                                    <asp:GridView ID="GVSheduduledNNotShipped" Caption="Scheduled But Pending Deliveries" OnDataBound="GVSheduduledNNotShipped_DataBound" OnRowCreated="GVSheduduledNNotShipped_RowCreated" OnSorting="GVSheduduledNNotShipped_Sorting" OnRowDataBound="GVSheduduledNNotShipped_RowDataBound"   runat="server" AutoGenerateColumns="False" Font-Size="14px" Width="75%" EnableModelValidation="True">
                                        <HeaderStyle BackColor="#333333" ForeColor="White" />
                                        <Columns>
                                   
                                            <asp:TemplateField HeaderText="Plant" SortExpression="Plant">
                                                <ItemTemplate>
                                                    <asp:Label ID="Plant" runat="server" Text='<%# Eval("Plant") %>' />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Buyer Name">
                                                <ItemTemplate>
                                                    <asp:Label ID="LblBuyerName" runat="server" Text='<%# Eval("Buyer") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>

                                            <asp:TemplateField HeaderText="Style">
                                                <ItemTemplate>
                                                    <asp:Label ID="LblStyle" runat="server" Text='<%# Eval("Style") %>' />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Buyer PO">
                                                <ItemTemplate>
                                                    <asp:Label ID="BuyerPO" runat="server" Text='<%# Eval("BuyerPO") %>' />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Contract No" Visible="true">
                                                <ItemTemplate>
                                                    <asp:Label ID="ContractNo" runat="server" Text='<%# Eval("ContractNo") %>' />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Color" Visible="true">
                                                <ItemTemplate>
                                                    <asp:Label ID="Color" runat="server" Text='<%# Eval("Color") %>' />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            
                                            <asp:TemplateField HeaderText="Buyer PO Qty" ItemStyle-HorizontalAlign="Right">
                                                <ItemTemplate>
                                                    <asp:Label ID="BuyerPOQty"  Font-Bold="true" Font-Size="Large"  runat="server" Text='<%# Eval("BuyerPOQty") %>' />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Sumithra PO Qty" Visible="false" ItemStyle-HorizontalAlign="Right">
                                                <ItemTemplate>
                                                    <asp:Label ID="SumithraPOQty" runat="server" Text='<%# Eval("SumithraPOQty") %>' />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Commited Qty" ItemStyle-HorizontalAlign="Right">
                                                <ItemTemplate>
                                                    <asp:Label ID="CommitedQty" runat="server" Text='<%# Eval("CommitedQty") %>' />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Shipped Qty" Visible="false" ItemStyle-HorizontalAlign="Right">
                                                <ItemTemplate>
                                                    <asp:Label ID="ShippedQty" runat="server" Text='<%# Eval("ShippedQty") %>' />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Short/Over Variance" Visible="false" ItemStyle-HorizontalAlign="Right">
                                                <ItemTemplate>
                                                    <asp:Label ID="Variance" runat="server" Text='<%# Eval("Variance") %>' />
                                                </ItemTemplate>
                                            </asp:TemplateField>

                                            <asp:TemplateField HeaderText="   FOB ($)   " ItemStyle-HorizontalAlign="Right" Visible="false" SortExpression="FOB">
                                                <ItemTemplate>
                                                    <asp:Label ID="FOB" runat="server" Text='<%#Eval("FC","{0:n}") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>

                                            <asp:TemplateField HeaderText="Short/Over Ship Value ($)" Visible="false" ItemStyle-HorizontalAlign="Right">
                                                <ItemTemplate>
                                                    <asp:Label ID="ShortShipValue" runat="server" Text='<%#Eval("ShortShipValue","{0:n}") %>' />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:BoundField DataField="ShortShipValue" Visible="false" HeaderText="Short/Over Ship Value ($)" ItemStyle-Width="60" DataFormatString="{0:N2}" ItemStyle-HorizontalAlign="Right" />

                                           
                                            <asp:TemplateField HeaderText="var" Visible="false" ItemStyle-HorizontalAlign="Right">
                                                <ItemTemplate>
                                                    <asp:Label ID="var" runat="server" Text='<%# Eval("var") %>' />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="PlantID" Visible="false">
                                                <ItemTemplate>
                                                    <asp:Label ID="PlantID" runat="server" Text='<%# Eval("PlantID") %>' />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                             <asp:TemplateField HeaderText="Commited Date" Visible="true">
                                                <ItemTemplate>
                                                    <asp:Label ID="DeliveryDate" runat="server" Text='<%#Eval("DeliveryDate","{0:dd/MMM/yyyy}") %>'/>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                        <asp:TemplateField HeaderText="Buyer's PO Date" SortExpression="ExtendedShipDate" Visible="true">
                        <ItemTemplate>
                            <asp:Label ID="ExtendedShipDate" runat="server" Font-Bold="true" Font-Size="Large" Text='<%#Eval("ExtendedShipDate","{0:dd/MMM/yyyy}") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                                            <asp:TemplateField HeaderText="Physically Dispatched Date" SortExpression="PhysicallyDisDate" Visible="true">
                                            <ItemTemplate>
                                                <asp:Label ID="PhysicallyDisDate" runat="server" Font-Bold="true" Text='<%#Eval("PhysicallyDisDate","{0:dd/MMM/yyyy}") %>'></asp:Label>
                                            </ItemTemplate>
                                            </asp:TemplateField>

                                            <asp:TemplateField HeaderText="Reason for Delayed update" SortExpression="ReasonDelay" Visible="true">
                                            <ItemTemplate>
                                                <asp:Label ID="ReasonDelay" runat="server" Font-Bold="true" Text='<%#Eval("ReasonDelay") %>'></asp:Label>
                                            </ItemTemplate>
                                            </asp:TemplateField>

                                            <asp:TemplateField HeaderText="Date Gap" SortExpression="DateGap" Visible="true">
                                            <ItemTemplate>
                                                <asp:Label ID="DateGap" runat="server" Font-Bold="true" Text='<%#Eval("DateGap") %>'></asp:Label>
                                            </ItemTemplate>
                                            </asp:TemplateField>

                                            <%--  <asp:TemplateField HeaderText="OT Rate" ItemStyle-HorizontalAlign="Right">
                                    <ItemTemplate>
                                        <asp:Label ID="OTHoursRate" runat="server"  Text=' <%#Eval("OTHoursRate","{0:n}")%>' />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                  <asp:TemplateField HeaderText="OT Amount" ItemStyle-HorizontalAlign="Right">
                                    <ItemTemplate>
                                        <asp:Label ID="OTAmount" runat="server"  />
                                    </ItemTemplate>
                                </asp:TemplateField>
                               <asp:TemplateField HeaderText="Reason for OT" Visible="true">
                                    <ItemTemplate>
                                        <asp:Label ID="LblReason" runat="server" Text='<%# Eval("Reason") %>' />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                            --%>
                                        </Columns>
                                    </asp:GridView>
                                </div>
                                 <div>
                                    <br />
                                    <asp:GridView ID="GVShipmentSW_NotShipped" Caption="SW- Scheduled But Pending Deliveries" OnDataBound="GVShipmentSW_NotShipped_DataBound" OnRowCreated="GVShipmentSW_NotShipped_RowCreated" OnSorting="GVShipmentSW_NotShipped_Sorting" OnRowDataBound="GVShipmentSW_NotShipped_RowDataBound" runat="server" AutoGenerateColumns="False" Font-Size="14px" Width="80%" EnableModelValidation="True">
                                        <HeaderStyle BackColor="#333333" ForeColor="White" />
                                        <Columns>
                                            <asp:TemplateField HeaderText="Plant" SortExpression="Plant">
                                                <ItemTemplate>
                                                    <asp:Label ID="Plant" runat="server" Text='<%# Eval("Plant") %>' />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Buyer Name">
                                                <ItemTemplate>
                                                    <asp:Label ID="LblBuyerName" runat="server" Text='<%# Eval("Buyer") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>

                                            <asp:TemplateField HeaderText="Style">
                                                <ItemTemplate>
                                                    <asp:Label ID="LblStyle" runat="server" Text='<%# Eval("Style") %>' />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Buyer PO">
                                                <ItemTemplate>
                                                    <asp:Label ID="BuyerPO" runat="server" Text='<%# Eval("BuyerPO") %>' />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Contract No" Visible="true">
                                                <ItemTemplate>
                                                    <asp:Label ID="ContractNo" runat="server" Text='<%# Eval("ContractNo") %>' />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Color" Visible="true">
                                                <ItemTemplate>
                                                    <asp:Label ID="Color" runat="server" Text='<%# Eval("Color") %>' />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Buyer PO Qty" ItemStyle-HorizontalAlign="Right">
                                                <ItemTemplate>
                                                    <asp:Label ID="BuyerPOQty" Font-Bold="true" runat="server" Text='<%# Eval("BuyerPOQty") %>' />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Sumithra PO Qty" Visible="false" ItemStyle-HorizontalAlign="Right">
                                                <ItemTemplate>
                                                    <asp:Label ID="SumithraPOQty" runat="server" Text='<%# Eval("SumithraPOQty") %>' />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Commited Qty" ItemStyle-HorizontalAlign="Right">
                                                <ItemTemplate>
                                                    <asp:Label ID="CommitedQty" runat="server" Text='<%# Eval("CommitedQty") %>' />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Shipped Qty" Visible="false" ItemStyle-HorizontalAlign="Right">
                                                <ItemTemplate>
                                                    <asp:Label ID="ShippedQty" runat="server" Text='<%# Eval("ShippedQty") %>' />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Short/Over Variance" Visible="false" ItemStyle-HorizontalAlign="Right">
                                                <ItemTemplate>
                                                    <asp:Label ID="Variance" runat="server" Text='<%# Eval("Variance") %>' />
                                                </ItemTemplate>
                                            </asp:TemplateField>

                                            <asp:TemplateField HeaderText="   FOB ($)   "  ItemStyle-HorizontalAlign="Right" Visible="false" SortExpression="FOB">
                                                <ItemTemplate>
                                                    <asp:Label ID="FOB" runat="server" Text='<%#Eval("FC","{0:n}") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>

                                            <asp:TemplateField HeaderText="Short/Over Ship Value ($)" Visible="false" ItemStyle-HorizontalAlign="Right">
                                                <ItemTemplate>
                                                    <asp:Label ID="ShortShipValue" runat="server" Text='<%#Eval("ShortShipValue","{0:n}") %>' />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:BoundField DataField="ShortShipValue" HeaderText="Short/Over Ship Value ($)" Visible="false" ItemStyle-Width="60" DataFormatString="{0:N2}" ItemStyle-HorizontalAlign="Right" />

                                           <%-- <asp:TemplateField HeaderText="Remarks" Visible="true">
                                                <ItemTemplate>
                                                    <asp:Label ID="Remarks" runat="server" Text='<%# Eval("Remarks") %>' />
                                                </ItemTemplate>
                                            </asp:TemplateField>--%>
                                            <asp:TemplateField HeaderText="var" Visible="false" ItemStyle-HorizontalAlign="Right">
                                                <ItemTemplate>
                                                    <asp:Label ID="var" runat="server" Text='<%# Eval("var") %>' />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="PlantID" Visible="false">
                                                <ItemTemplate>
                                                    <asp:Label ID="PlantID" runat="server" Text='<%# Eval("PlantID") %>' />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <%-- <asp:TemplateField HeaderText="Partial Ship." Visible="true">
                                                <ItemTemplate>
                                                    <asp:Label ID="PartialShipment" runat="server" Text='<%# Eval("PartialShipment") %>' />
                                                </ItemTemplate>
                                            </asp:TemplateField>--%>
                                            <asp:TemplateField HeaderText="Buyer's PO Date" SortExpression="ExtendedShipDate" Visible="true">
                        <ItemTemplate>
                            <asp:Label ID="ExtendedShipDate" runat="server" Font-Bold="true" Text='<%#Eval("ExtendedShipDate","{0:dd/MMM/yyyy}") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                                            <asp:TemplateField HeaderText="Physically Dispatched Date" SortExpression="PhysicallyDisDate" Visible="true">
                                            <ItemTemplate>
                                                <asp:Label ID="PhysicallyDisDate" runat="server" Font-Bold="true" Text='<%#Eval("PhysicallyDisDate","{0:dd/MMM/yyyy}") %>'></asp:Label>
                                            </ItemTemplate>
                                            </asp:TemplateField>

                                            <asp:TemplateField HeaderText="Reason for Delayed update" SortExpression="ReasonDelay" Visible="true">
                                            <ItemTemplate>
                                                <asp:Label ID="ReasonDelay" runat="server" Font-Bold="true" Text='<%#Eval("ReasonDelay") %>'></asp:Label>
                                            </ItemTemplate>
                                            </asp:TemplateField>

                                            <asp:TemplateField HeaderText="Date Gap" SortExpression="DateGap" Visible="true">
                                            <ItemTemplate>
                                                <asp:Label ID="DateGap" runat="server" Font-Bold="true" Text='<%#Eval("DateGap") %>'></asp:Label>
                                            </ItemTemplate>
                                            </asp:TemplateField>

                                            <%--  <asp:TemplateField HeaderText="OT Rate" ItemStyle-HorizontalAlign="Right">
                                    <ItemTemplate>
                                        <asp:Label ID="OTHoursRate" runat="server"  Text=' <%#Eval("OTHoursRate","{0:n}")%>' />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                  <asp:TemplateField HeaderText="OT Amount" ItemStyle-HorizontalAlign="Right">
                                    <ItemTemplate>
                                        <asp:Label ID="OTAmount" runat="server"  />
                                    </ItemTemplate>
                                </asp:TemplateField>
                               <asp:TemplateField HeaderText="Reason for OT" Visible="true">
                                    <ItemTemplate>
                                        <asp:Label ID="LblReason" runat="server" Text='<%# Eval("Reason") %>' />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                            --%>
                                        </Columns>
                                    </asp:GridView>
                                </div>
                                <div>
                                    <br />
                                    <asp:GridView ID="GVShipmentSP_NotShipped" Caption="SP- Scheduled But Pending Deliveries" OnDataBound="GVShipmentSP_NotShipped_DataBound" OnRowCreated="GVShipmentSP_NotShipped_RowCreated" OnSorting="GVShipmentSP_NotShipped_Sorting" OnRowDataBound="GVShipmentSP_NotShipped_RowDataBound" runat="server" AutoGenerateColumns="False" Font-Size="14px" Width="70%" EnableModelValidation="True">
                                        <HeaderStyle BackColor="#333333" ForeColor="White" />
                                        <Columns>
                                            <asp:TemplateField HeaderText="Plant" SortExpression="Plant">
                                                <ItemTemplate>
                                                    <asp:Label ID="Plant" runat="server" Text='<%# Eval("Plant") %>' />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Buyer Name">
                                                <ItemTemplate>
                                                    <asp:Label ID="LblBuyerName" runat="server" Text='<%# Eval("Buyer") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>

                                            <asp:TemplateField HeaderText="Style">
                                                <ItemTemplate>
                                                    <asp:Label ID="LblStyle" runat="server" Text='<%# Eval("Style") %>' />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Buyer PO">
                                                <ItemTemplate>
                                                    <asp:Label ID="BuyerPO" runat="server" Text='<%# Eval("BuyerPO") %>' />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Contract No" Visible="true">
                                                <ItemTemplate>
                                                    <asp:Label ID="ContractNo" runat="server" Text='<%# Eval("ContractNo") %>' />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Color" Visible="true">
                                                <ItemTemplate>
                                                    <asp:Label ID="Color" runat="server" Text='<%# Eval("Color") %>' />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Buyer PO Qty" ItemStyle-HorizontalAlign="Right">
                                                <ItemTemplate>
                                                    <asp:Label ID="BuyerPOQty" Font-Bold="true" runat="server" Text='<%# Eval("BuyerPOQty") %>' />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Sumithra PO Qty" Visible="false" ItemStyle-HorizontalAlign="Right">
                                                <ItemTemplate>
                                                    <asp:Label ID="SumithraPOQty" runat="server" Text='<%# Eval("SumithraPOQty") %>' />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Commited Qty" ItemStyle-HorizontalAlign="Right">
                                                <ItemTemplate>
                                                    <asp:Label ID="CommitedQty" runat="server" Text='<%# Eval("CommitedQty") %>' />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Shipped Qty" Visible="false" ItemStyle-HorizontalAlign="Right">
                                                <ItemTemplate>
                                                    <asp:Label ID="ShippedQty" runat="server" Text='<%# Eval("ShippedQty") %>' />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Short/Over Variance" Visible="false" ItemStyle-HorizontalAlign="Right">
                                                <ItemTemplate>
                                                    <asp:Label ID="Variance" runat="server" Text='<%# Eval("Variance") %>' />
                                                </ItemTemplate>
                                            </asp:TemplateField>

                                            <asp:TemplateField HeaderText="   FOB ($)   " ItemStyle-HorizontalAlign="Right" Visible="false" SortExpression="FOB">
                                                <ItemTemplate>
                                                    <asp:Label ID="FOB" runat="server" Text='<%#Eval("FC","{0:n}") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>

                                            <asp:TemplateField HeaderText="Short/Over Ship Value ($)" Visible="false" ItemStyle-HorizontalAlign="Right">
                                                <ItemTemplate>
                                                    <asp:Label ID="ShortShipValue" runat="server" Text='<%#Eval("ShortShipValue","{0:n}") %>' />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:BoundField DataField="ShortShipValue" Visible="false" HeaderText="Short/Over Ship Value ($)" ItemStyle-Width="60" DataFormatString="{0:N2}" ItemStyle-HorizontalAlign="Right" />

                                           <%-- <asp:TemplateField HeaderText="Remarks" Visible="true">
                                                <ItemTemplate>
                                                    <asp:Label ID="Remarks" runat="server" Text='<%# Eval("Remarks") %>' />
                                                </ItemTemplate>
                                            </asp:TemplateField>--%>
                                            <asp:TemplateField HeaderText="var" Visible="false" ItemStyle-HorizontalAlign="Right">
                                                <ItemTemplate>
                                                    <asp:Label ID="var" runat="server" Text='<%# Eval("var") %>' />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="PlantID" Visible="false">
                                                <ItemTemplate>
                                                    <asp:Label ID="PlantID" runat="server" Text='<%# Eval("PlantID") %>' />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <%-- <asp:TemplateField HeaderText="Partial Ship." Visible="true">
                                                <ItemTemplate>
                                                    <asp:Label ID="PartialShipment" runat="server" Text='<%# Eval("PartialShipment") %>' />
                                                </ItemTemplate>
                                            </asp:TemplateField>--%>
                                            <asp:TemplateField HeaderText="Buyer's PO Date" SortExpression="ExtendedShipDate" Visible="true">
                        <ItemTemplate>
                            <asp:Label ID="ExtendedShipDate" runat="server" Font-Bold="true" Text='<%#Eval("ExtendedShipDate","{0:dd/MMM/yyyy}") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                                            <asp:TemplateField HeaderText="Physically Dispatched Date" SortExpression="PhysicallyDisDate" Visible="true">
                                            <ItemTemplate>
                                                <asp:Label ID="PhysicallyDisDate" runat="server" Font-Bold="true" Text='<%#Eval("PhysicallyDisDate","{0:dd/MMM/yyyy}") %>'></asp:Label>
                                            </ItemTemplate>
                                            </asp:TemplateField>

                                            <asp:TemplateField HeaderText="Reason for Delayed update" SortExpression="ReasonDelay" Visible="true">
                                            <ItemTemplate>
                                                <asp:Label ID="ReasonDelay" runat="server" Font-Bold="true" Text='<%#Eval("ReasonDelay") %>'></asp:Label>
                                            </ItemTemplate>
                                            </asp:TemplateField>

                                            <asp:TemplateField HeaderText="Date Gap" SortExpression="DateGap" Visible="true">
                                            <ItemTemplate>
                                                <asp:Label ID="DateGap" runat="server" Font-Bold="true" Text='<%#Eval("DateGap") %>'></asp:Label>
                                            </ItemTemplate>
                                            </asp:TemplateField>

                                            <%--  <asp:TemplateField HeaderText="OT Rate" ItemStyle-HorizontalAlign="Right">
                                    <ItemTemplate>
                                        <asp:Label ID="OTHoursRate" runat="server"  Text=' <%#Eval("OTHoursRate","{0:n}")%>' />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                  <asp:TemplateField HeaderText="OT Amount" ItemStyle-HorizontalAlign="Right">
                                    <ItemTemplate>
                                        <asp:Label ID="OTAmount" runat="server"  />
                                    </ItemTemplate>
                                </asp:TemplateField>
                               <asp:TemplateField HeaderText="Reason for OT" Visible="true">
                                    <ItemTemplate>
                                        <asp:Label ID="LblReason" runat="server" Text='<%# Eval("Reason") %>' />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                            --%>
                                        </Columns>
                                    </asp:GridView>
                                </div>
                                 <div>
                                    <br />
                                    <asp:GridView ID="GVShipmentSH_NotShipped" Caption="SH- Scheduled But Pending Deliveries" OnDataBound="GVShipmentSH_NotShipped_DataBound" OnRowCreated="GVShipmentSH_NotShipped_RowCreated" OnSorting="GVShipmentSH_NotShipped_Sorting" OnRowDataBound="GVShipmentSH_NotShipped_RowDataBound" runat="server" AutoGenerateColumns="False" Font-Size="14px" Width="70%" EnableModelValidation="True">
                                        <HeaderStyle BackColor="#333333" ForeColor="White" />
                                        <Columns>
                                            <asp:TemplateField HeaderText="Plant" SortExpression="Plant">
                                                <ItemTemplate>
                                                    <asp:Label ID="Plant" runat="server" Text='<%# Eval("Plant") %>' />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Buyer Name">
                                                <ItemTemplate>
                                                    <asp:Label ID="LblBuyerName" runat="server" Text='<%# Eval("Buyer") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>

                                            <asp:TemplateField HeaderText="Style">
                                                <ItemTemplate>
                                                    <asp:Label ID="LblStyle" runat="server" Text='<%# Eval("Style") %>' />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Buyer PO">
                                                <ItemTemplate>
                                                    <asp:Label ID="BuyerPO" runat="server" Text='<%# Eval("BuyerPO") %>' />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Contract No" Visible="true">
                                                <ItemTemplate>
                                                    <asp:Label ID="ContractNo" runat="server" Text='<%# Eval("ContractNo") %>' />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Color" Visible="true">
                                                <ItemTemplate>
                                                    <asp:Label ID="Color" runat="server" Text='<%# Eval("Color") %>' />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Buyer PO Qty" ItemStyle-HorizontalAlign="Right">
                                                <ItemTemplate>
                                                    <asp:Label ID="BuyerPOQty" Font-Bold="true" runat="server" Text='<%# Eval("BuyerPOQty") %>' />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Sumithra PO Qty" Visible="false" ItemStyle-HorizontalAlign="Right">
                                                <ItemTemplate>
                                                    <asp:Label ID="SumithraPOQty" runat="server" Text='<%# Eval("SumithraPOQty") %>' />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Commited Qty" ItemStyle-HorizontalAlign="Right">
                                                <ItemTemplate>
                                                    <asp:Label ID="CommitedQty" runat="server" Text='<%# Eval("CommitedQty") %>' />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Shipped Qty" Visible="false" ItemStyle-HorizontalAlign="Right">
                                                <ItemTemplate>
                                                    <asp:Label ID="ShippedQty" runat="server" Text='<%# Eval("ShippedQty") %>' />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Short/Over Variance" Visible="false" ItemStyle-HorizontalAlign="Right">
                                                <ItemTemplate>
                                                    <asp:Label ID="Variance" runat="server" Text='<%# Eval("Variance") %>' />
                                                </ItemTemplate>
                                            </asp:TemplateField>

                                            <asp:TemplateField HeaderText="   FOB ($)   "  ItemStyle-HorizontalAlign="Right" Visible="false" SortExpression="FOB">
                                                <ItemTemplate>
                                                    <asp:Label ID="FOB" runat="server" Text='<%#Eval("FC","{0:n}") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>

                                            <asp:TemplateField HeaderText="Short/Over Ship Value ($)" Visible="false" ItemStyle-HorizontalAlign="Right">
                                                <ItemTemplate>
                                                    <asp:Label ID="ShortShipValue" runat="server" Text='<%#Eval("ShortShipValue","{0:n}") %>' />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:BoundField DataField="ShortShipValue" Visible="false" HeaderText="Short/Over Ship Value ($)" ItemStyle-Width="60" DataFormatString="{0:N2}" ItemStyle-HorizontalAlign="Right" />

                                           <%-- <asp:TemplateField HeaderText="Remarks" Visible="true">
                                                <ItemTemplate>
                                                    <asp:Label ID="Remarks" runat="server" Text='<%# Eval("Remarks") %>' />
                                                </ItemTemplate>
                                            </asp:TemplateField>--%>
                                            <asp:TemplateField HeaderText="var" Visible="false" ItemStyle-HorizontalAlign="Right">
                                                <ItemTemplate>
                                                    <asp:Label ID="var" runat="server" Text='<%# Eval("var") %>' />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="PlantID" Visible="false">
                                                <ItemTemplate>
                                                    <asp:Label ID="PlantID" runat="server" Text='<%# Eval("PlantID") %>' />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <%-- <asp:TemplateField HeaderText="Partial Ship." Visible="true">
                                                <ItemTemplate>
                                                    <asp:Label ID="PartialShipment" runat="server" Text='<%# Eval("PartialShipment") %>' />
                                                </ItemTemplate>
                                            </asp:TemplateField>--%>
                                            <asp:TemplateField HeaderText="Buyer's PO Date" SortExpression="ExtendedShipDate" Visible="true">
                        <ItemTemplate>
                            <asp:Label ID="ExtendedShipDate" runat="server" Font-Bold="true" Text='<%#Eval("ExtendedShipDate","{0:dd/MMM/yyyy}") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                                            <asp:TemplateField HeaderText="Physically Dispatched Date" SortExpression="PhysicallyDisDate" Visible="true">
                                            <ItemTemplate>
                                                <asp:Label ID="PhysicallyDisDate" runat="server" Font-Bold="true" Text='<%#Eval("PhysicallyDisDate","{0:dd/MMM/yyyy}") %>'></asp:Label>
                                            </ItemTemplate>
                                            </asp:TemplateField>

                                            <asp:TemplateField HeaderText="Reason for Delayed update" SortExpression="ReasonDelay" Visible="true">
                                            <ItemTemplate>
                                                <asp:Label ID="ReasonDelay" runat="server" Font-Bold="true" Text='<%#Eval("ReasonDelay") %>'></asp:Label>
                                            </ItemTemplate>
                                            </asp:TemplateField>

                                            <asp:TemplateField HeaderText="Date Gap" SortExpression="DateGap" Visible="true">
                                            <ItemTemplate>
                                                <asp:Label ID="DateGap" runat="server" Font-Bold="true" Text='<%#Eval("DateGap") %>'></asp:Label>
                                            </ItemTemplate>
                                            </asp:TemplateField>

                                            <%--  <asp:TemplateField HeaderText="OT Rate" ItemStyle-HorizontalAlign="Right">
                                    <ItemTemplate>
                                        <asp:Label ID="OTHoursRate" runat="server"  Text=' <%#Eval("OTHoursRate","{0:n}")%>' />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                  <asp:TemplateField HeaderText="OT Amount" ItemStyle-HorizontalAlign="Right">
                                    <ItemTemplate>
                                        <asp:Label ID="OTAmount" runat="server"  />
                                    </ItemTemplate>
                                </asp:TemplateField>
                               <asp:TemplateField HeaderText="Reason for OT" Visible="true">
                                    <ItemTemplate>
                                        <asp:Label ID="LblReason" runat="server" Text='<%# Eval("Reason") %>' />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                            --%>
                                        </Columns>
                                    </asp:GridView>
                                </div>
                                 <div>
                                    <br />
                                    <asp:GridView ID="GVShipmentSN_NotShipped" Caption="SN- Scheduled But Pending Deliveries" OnDataBound="GVShipmentSN_NotShipped_DataBound" OnRowCreated="GVShipmentSN_NotShipped_RowCreated" OnSorting="GVShipmentSN_NotShipped_Sorting" OnRowDataBound="GVShipmentSN_NotShipped_RowDataBound" runat="server" AutoGenerateColumns="False" Font-Size="14px" Width="80%" EnableModelValidation="True">
                                        <HeaderStyle BackColor="#333333" ForeColor="White" />
                                        <Columns>
                                            <asp:TemplateField HeaderText="Plant" SortExpression="Plant">
                                                <ItemTemplate>
                                                    <asp:Label ID="Plant" runat="server" Text='<%# Eval("Plant") %>' />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Buyer Name">
                                                <ItemTemplate>
                                                    <asp:Label ID="LblBuyerName" runat="server" Text='<%# Eval("Buyer") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>

                                            <asp:TemplateField HeaderText="Style">
                                                <ItemTemplate>
                                                    <asp:Label ID="LblStyle" runat="server" Text='<%# Eval("Style") %>' />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Buyer PO">
                                                <ItemTemplate>
                                                    <asp:Label ID="BuyerPO" runat="server" Text='<%# Eval("BuyerPO") %>' />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Contract No" Visible="true">
                                                <ItemTemplate>
                                                    <asp:Label ID="ContractNo" runat="server" Text='<%# Eval("ContractNo") %>' />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Color" Visible="true">
                                                <ItemTemplate>
                                                    <asp:Label ID="Color" runat="server" Text='<%# Eval("Color") %>' />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Buyer PO Qty" ItemStyle-HorizontalAlign="Right">
                                                <ItemTemplate>
                                                    <asp:Label ID="BuyerPOQty" Font-Bold="true" runat="server" Text='<%# Eval("BuyerPOQty") %>' />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Sumithra PO Qty" Visible="false" ItemStyle-HorizontalAlign="Right">
                                                <ItemTemplate>
                                                    <asp:Label ID="SumithraPOQty" runat="server" Text='<%# Eval("SumithraPOQty") %>' />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Commited Qty" ItemStyle-HorizontalAlign="Right">
                                                <ItemTemplate>
                                                    <asp:Label ID="CommitedQty" runat="server" Text='<%# Eval("CommitedQty") %>' />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Shipped Qty" Visible="false" ItemStyle-HorizontalAlign="Right">
                                                <ItemTemplate>
                                                    <asp:Label ID="ShippedQty" runat="server" Text='<%# Eval("ShippedQty") %>' />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Short/Over Variance" Visible="false" ItemStyle-HorizontalAlign="Right">
                                                <ItemTemplate>
                                                    <asp:Label ID="Variance" runat="server" Text='<%# Eval("Variance") %>' />
                                                </ItemTemplate>
                                            </asp:TemplateField>

                                            <asp:TemplateField HeaderText="   FOB ($)   " ItemStyle-HorizontalAlign="Right" Visible="false" SortExpression="FOB">
                                                <ItemTemplate>
                                                    <asp:Label ID="FOB" runat="server" Text='<%#Eval("FC","{0:n}") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>

                                            <asp:TemplateField HeaderText="Short/Over Ship Value ($)" Visible="false" ItemStyle-HorizontalAlign="Right">
                                                <ItemTemplate>
                                                    <asp:Label ID="ShortShipValue" runat="server" Text='<%#Eval("ShortShipValue","{0:n}") %>' />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:BoundField DataField="ShortShipValue" HeaderText="Short/Over Ship Value ($)" Visible="false" ItemStyle-Width="60" DataFormatString="{0:N2}" ItemStyle-HorizontalAlign="Right" />

                                           <%-- <asp:TemplateField HeaderText="Remarks" Visible="true">
                                                <ItemTemplate>
                                                    <asp:Label ID="Remarks" runat="server" Text='<%# Eval("Remarks") %>' />
                                                </ItemTemplate>
                                            </asp:TemplateField>--%>
                                            <asp:TemplateField HeaderText="var" Visible="false" ItemStyle-HorizontalAlign="Right">
                                                <ItemTemplate>
                                                    <asp:Label ID="var" runat="server" Text='<%# Eval("var") %>' />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="PlantID" Visible="false">
                                                <ItemTemplate>
                                                    <asp:Label ID="PlantID" runat="server" Text='<%# Eval("PlantID") %>' />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <%-- <asp:TemplateField HeaderText="Partial Ship." Visible="true">
                                                <ItemTemplate>
                                                    <asp:Label ID="PartialShipment" runat="server" Text='<%# Eval("PartialShipment") %>' />
                                                </ItemTemplate>
                                            </asp:TemplateField>--%>
                                            <asp:TemplateField HeaderText="Buyer's PO Date" SortExpression="ExtendedShipDate" Visible="true">
                        <ItemTemplate>
                            <asp:Label ID="ExtendedShipDate" runat="server" Font-Bold="true" Text='<%#Eval("ExtendedShipDate","{0:dd/MMM/yyyy}") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                                            <asp:TemplateField HeaderText="Physically Dispatched Date" SortExpression="PhysicallyDisDate" Visible="true">
                                            <ItemTemplate>
                                                <asp:Label ID="PhysicallyDisDate" runat="server" Font-Bold="true" Text='<%#Eval("PhysicallyDisDate","{0:dd/MMM/yyyy}") %>'></asp:Label>
                                            </ItemTemplate>
                                            </asp:TemplateField>

                                            <asp:TemplateField HeaderText="Reason for Delayed update" SortExpression="ReasonDelay" Visible="true">
                                            <ItemTemplate>
                                                <asp:Label ID="ReasonDelay" runat="server" Font-Bold="true" Text='<%#Eval("ReasonDelay") %>'></asp:Label>
                                            </ItemTemplate>
                                            </asp:TemplateField>

                                            <asp:TemplateField HeaderText="Date Gap" SortExpression="DateGap" Visible="true">
                                            <ItemTemplate>
                                                <asp:Label ID="DateGap" runat="server" Font-Bold="true" Text='<%#Eval("DateGap") %>'></asp:Label>
                                            </ItemTemplate>
                                            </asp:TemplateField>

                                            <%--  <asp:TemplateField HeaderText="OT Rate" ItemStyle-HorizontalAlign="Right">
                                    <ItemTemplate>
                                        <asp:Label ID="OTHoursRate" runat="server"  Text=' <%#Eval("OTHoursRate","{0:n}")%>' />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                  <asp:TemplateField HeaderText="OT Amount" ItemStyle-HorizontalAlign="Right">
                                    <ItemTemplate>
                                        <asp:Label ID="OTAmount" runat="server"  />
                                    </ItemTemplate>
                                </asp:TemplateField>
                               <asp:TemplateField HeaderText="Reason for OT" Visible="true">
                                    <ItemTemplate>
                                        <asp:Label ID="LblReason" runat="server" Text='<%# Eval("Reason") %>' />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                            --%>
                                        </Columns>
                                    </asp:GridView>
                                </div>
                                <asp:Label ID="LblOTRID" runat="server" Text="" Visible="false"></asp:Label>
                                <asp:Label ID="LblOTRIDs" runat="server" Text="" Visible="false"></asp:Label>
                                <asp:Label ID="lblStarting" runat="server" Text="Label" Visible="false"></asp:Label>
                                <asp:Label ID="lblEnding" runat="server" Text="Label" Visible="false"></asp:Label>
                                <asp:Label ID="lblUserID" runat="server" Text="0" Visible="false"></asp:Label>
                                <asp:Label ID="lblEmpID" runat="server" Text="0" Visible="false"></asp:Label>
                            </div>
                        </div>
                    </div>
                </asp:Panel>
            </div>

        </div>
    </form>
</body>
</html>

