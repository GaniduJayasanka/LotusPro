<%@ page language="C#" autoeventwireup="true" inherits="EmailShortShipment, App_Web_10bhy3il" %>


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
                                    <asp:GridView ID="GVShipmentAlert" OnDataBound="GVShipmentAlert_DataBound" OnRowCreated="GVShipmentAlert_RowCreated" OnSorting="GVShipmentAlert_Sorting" OnRowDataBound="GVShipmentAlert_RowDataBound" runat="server" AutoGenerateColumns="False" Font-Size="13px" Width="80%" EnableModelValidation="True">
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
                                              <asp:BoundField DataField="SumithraPOQty" HeaderText="Sumithra PO Qty" ItemStyle-Width="60"  ItemStyle-HorizontalAlign="Right" />
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
                                              <asp:BoundField DataField="SPOSHippedVariance" HeaderText="SPO/ Cum. SHIP Variance" ItemStyle-Width="60"  ItemStyle-HorizontalAlign="Right" />
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
                            <asp:Label ID="ExtendedShipDate" runat="server" Font-Bold="true" Font-Size="X-Small" Text='<%#Eval("ExtendedShipDate","{0:dd/MMM/yyyy}") %>'></asp:Label>
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

