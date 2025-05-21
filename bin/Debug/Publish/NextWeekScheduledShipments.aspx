<%@ page language="C#" autoeventwireup="true" inherits="NextWeekScheduledShipments, App_Web_cjp5ygzm" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">


    <title>MSP Shipment Alert</title>
    <link href="CSS/SPSStyle.css" rel="stylesheet" />
    <link href="CSS/bootstrap.css" rel="stylesheet" />
    <link href="CSS/font-awesome.css" rel="stylesheet" />

   

</head>
<body>
 <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>  
    <div>
      <div>
                                      <br />
                                    <asp:GridView ID="GVSheduduledNNotShipped" OnDataBound="GVSheduduledNNotShipped_DataBound" OnRowCreated="GVSheduduledNNotShipped_RowCreated" OnSorting="GVSheduduledNNotShipped_Sorting" OnRowDataBound="GVSheduduledNNotShipped_RowDataBound" Caption="Scheduled Deliveries"    runat="server" AutoGenerateColumns="False" Font-Size="14px" Width="100%" EnableModelValidation="True">
                                        <HeaderStyle BackColor="#333333" ForeColor="White" />
                                        <Columns>
                                   <asp:TemplateField HeaderText="DID" SortExpression="DID">
                                                <ItemTemplate>
                                                    <asp:Label ID="DID" runat="server" Text='<%# Eval("DID") %>' />
                                                </ItemTemplate>
                                            </asp:TemplateField>
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
                                              <asp:TemplateField HeaderText="Comment" Visible="true">
                                                <ItemTemplate>
                                                    <asp:Label ID="Comment" runat="server" Text='<%# Eval("Comment") %>' />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                           <%-- <asp:TemplateField HeaderText="Physically Dispatched Date" SortExpression="PhysicallyDisDate" Visible="true">
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
                                            </asp:TemplateField>--%>

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
    </div>
    </form>
</body>
</html>
