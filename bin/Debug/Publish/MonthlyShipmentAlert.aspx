<%@ page language="C#" autoeventwireup="true" inherits="MonthlyShipmentAlert, App_Web_b2ychy0x" %>

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
                                    <asp:GridView ID="GVShipmentAlert" OnDataBound="GVShipmentAlert_DataBound" OnRowCreated="GVShipmentAlert_RowCreated" OnSorting="GVShipmentAlert_Sorting" OnRowDataBound="GVShipmentAlert_RowDataBound" runat="server" AutoGenerateColumns="False" Font-Size="14px" Width="100%" EnableModelValidation="True">
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
                            </asp:TemplateField>--%>
                                
                                <asp:TemplateField HeaderText="Dispatched Date">
                                    <ItemTemplate>
                                        <asp:Label ID="DispatchedDate" runat="server" Text='<%#Eval("DispatchedDate","{0:dd/MMM/yyyy}") %>' />
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
                                            <asp:TemplateField HeaderText="Shipped Qty" ItemStyle-HorizontalAlign="Right">
                                                <ItemTemplate>
                                                    <asp:Label ID="ShippedQty" runat="server" Text='<%# Eval("ShippedQty") %>' />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Short/Over Variance" ItemStyle-HorizontalAlign="Right">
                                                <ItemTemplate>
                                                    <asp:Label ID="Variance" runat="server" Text='<%# Eval("Variance") %>' />
                                                </ItemTemplate>
                                            </asp:TemplateField>

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
                            <asp:Label ID="ExtendedShipDate" runat="server" Font-Bold="true" Font-Size="Large" Text='<%#Eval("ExtendedShipDate","{0:dd/MMM/yyyy}") %>'></asp:Label>
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
                                    <asp:GridView ID="GVShipmentAlertSW" Caption="Dispatched Deliveries During The Last Month" OnDataBound="GVShipmentAlertSW_DataBound" OnRowCreated="GVShipmentAlertSW_RowCreated" OnSorting="GVShipmentAlertSW_Sorting" OnRowDataBound="GVShipmentAlertSW_RowDataBound" runat="server" AutoGenerateColumns="False" Font-Size="14px" Width="100%" EnableModelValidation="True">
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
 <asp:TemplateField HeaderText="Dispatched Date">
                                    <ItemTemplate>
                                        <asp:Label ID="DispatchedDate" runat="server" Text='<%#Eval("DispatchedDate","{0:dd/MMM/yyyy}") %>' />
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
                                            <asp:TemplateField HeaderText="Shipped Qty" ItemStyle-HorizontalAlign="Right">
                                                <ItemTemplate>
                                                    <asp:Label ID="ShippedQty" runat="server" Text='<%# Eval("ShippedQty") %>' />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Short/Over Variance" ItemStyle-HorizontalAlign="Right">
                                                <ItemTemplate>
                                                    <asp:Label ID="Variance" runat="server" Text='<%# Eval("Variance") %>' />
                                                </ItemTemplate>
                                            </asp:TemplateField>

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
                                    <asp:GridView ID="GVShipmentAlertSP" Caption="Dispatched Deliveries During The Last Month" OnDataBound="GVShipmentAlertSP_DataBound" OnRowCreated="GVShipmentAlertSP_RowCreated" OnSorting="GVShipmentAlertSP_Sorting" OnRowDataBound="GVShipmentAlertSP_RowDataBound" runat="server" AutoGenerateColumns="False" Font-Size="14px" Width="100%" EnableModelValidation="True">
                                        <HeaderStyle BackColor="#333333" ForeColor="White" />
                                        <Columns>
                                             <asp:TemplateField HeaderText="Dispatched Date">
                                    <ItemTemplate>
                                        <asp:Label ID="DispatchedDate" runat="server" Text='<%#Eval("DispatchedDate","{0:dd/MMM/yyyy}") %>' />
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
                                            <asp:TemplateField HeaderText="Shipped Qty" ItemStyle-HorizontalAlign="Right">
                                                <ItemTemplate>
                                                    <asp:Label ID="ShippedQty" runat="server" Text='<%# Eval("ShippedQty") %>' />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Short/Over Variance" ItemStyle-HorizontalAlign="Right">
                                                <ItemTemplate>
                                                    <asp:Label ID="Variance" runat="server" Text='<%# Eval("Variance") %>' />
                                                </ItemTemplate>
                                            </asp:TemplateField>
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
                                        </Columns>
                                    </asp:GridView>
                                </div>
                                 <div>
                                    <br />
                                    <asp:GridView ID="GVShipmentAlertSH" Caption="Dispatched Deliveries During The Last Month" OnDataBound="GVShipmentAlertSH_DataBound" OnRowCreated="GVShipmentAlertSH_RowCreated" OnSorting="GVShipmentAlertSH_Sorting" OnRowDataBound="GVShipmentAlertSH_RowDataBound" runat="server" AutoGenerateColumns="False" Font-Size="14px" Width="100%" EnableModelValidation="True">
                                        <HeaderStyle BackColor="#333333" ForeColor="White" />
                                        <Columns>
                                             <asp:TemplateField HeaderText="Dispatched Date">
                                    <ItemTemplate>
                                        <asp:Label ID="DispatchedDate" runat="server" Text='<%#Eval("DispatchedDate","{0:dd/MMM/yyyy}") %>' />
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
                                            <asp:TemplateField HeaderText="Shipped Qty" ItemStyle-HorizontalAlign="Right">
                                                <ItemTemplate>
                                                    <asp:Label ID="ShippedQty" runat="server" Text='<%# Eval("ShippedQty") %>' />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Short/Over Variance" ItemStyle-HorizontalAlign="Right">
                                                <ItemTemplate>
                                                    <asp:Label ID="Variance" runat="server" Text='<%# Eval("Variance") %>' />
                                                </ItemTemplate>
                                            </asp:TemplateField>
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
                                        </Columns>
                                    </asp:GridView>
                                </div>
                                  <div>
                                    <br />
                                    <asp:GridView ID="GVShipmentAlertSN" Caption="Dispatched Deliveries During The Last Month" OnDataBound="GVShipmentAlertSN_DataBound" OnRowCreated="GVShipmentAlertSN_RowCreated" OnSorting="GVShipmentAlertSN_Sorting" OnRowDataBound="GVShipmentAlertSN_RowDataBound" runat="server" AutoGenerateColumns="False" Font-Size="14px" Width="100%" EnableModelValidation="True">
                                        <HeaderStyle BackColor="#333333" ForeColor="White" />
                                        <Columns>
                                             <asp:TemplateField HeaderText="Dispatched Date">
                                    <ItemTemplate>
                                        <asp:Label ID="DispatchedDate" runat="server" Text='<%#Eval("DispatchedDate","{0:dd/MMM/yyyy}") %>' />
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
                                            <asp:TemplateField HeaderText="Shipped Qty" ItemStyle-HorizontalAlign="Right">
                                                <ItemTemplate>
                                                    <asp:Label ID="ShippedQty" runat="server" Text='<%# Eval("ShippedQty") %>' />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Short/Over Variance" ItemStyle-HorizontalAlign="Right">
                                                <ItemTemplate>
                                                    <asp:Label ID="Variance" runat="server" Text='<%# Eval("Variance") %>' />
                                                </ItemTemplate>
                                            </asp:TemplateField>
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
                                        </Columns>
                                    </asp:GridView>
                                </div>
                                <div>
                                      <br />
                                    <asp:GridView ID="GVSheduduledNNotShipped" Caption="Scheduled But Pending Deliveries During The Last Month" OnDataBound="GVSheduduledNNotShipped_DataBound" OnRowCreated="GVSheduduledNNotShipped_RowCreated" OnSorting="GVSheduduledNNotShipped_Sorting" OnRowDataBound="GVSheduduledNNotShipped_RowDataBound"   runat="server" AutoGenerateColumns="False" Font-Size="14px" Width="100%" EnableModelValidation="True">
                                        <HeaderStyle BackColor="#333333" ForeColor="White" />
                                        <Columns>
                                    <asp:TemplateField HeaderText="Delivery Date">
                                    <ItemTemplate>
                                        <asp:Label ID="DeliveryDate" runat="server" Text='<%#Eval("DeliveryDate","{0:dd/MMM/yyyy}") %>' />
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
                                    <asp:GridView ID="GVShipmentSW_NotShipped" Caption="Scheduled But Pending Deliveries During The Last Month"  OnDataBound="GVShipmentSW_NotShipped_DataBound" OnRowCreated="GVShipmentSW_NotShipped_RowCreated" OnSorting="GVShipmentSW_NotShipped_Sorting" OnRowDataBound="GVShipmentSW_NotShipped_RowDataBound" runat="server" AutoGenerateColumns="False" Font-Size="14px" Width="100%" EnableModelValidation="True">
                                        <HeaderStyle BackColor="#333333" ForeColor="White" />
                                        <Columns>
                                            <asp:TemplateField HeaderText="Committed Date">
                                    <ItemTemplate>
                                        <asp:Label ID="DeliveryDate" runat="server" Text='<%#Eval("DeliveryDate","{0:dd/MMM/yyyy}") %>' />
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
                                    <asp:GridView ID="GVShipmentSP_NotShipped" Caption="Scheduled But Pending Deliveries During The Last Month"  OnDataBound="GVShipmentSP_NotShipped_DataBound" OnRowCreated="GVShipmentSP_NotShipped_RowCreated" OnSorting="GVShipmentSP_NotShipped_Sorting" OnRowDataBound="GVShipmentSP_NotShipped_RowDataBound" runat="server" AutoGenerateColumns="False" Font-Size="14px" Width="100%" EnableModelValidation="True">
                                        <HeaderStyle BackColor="#333333" ForeColor="White" />
                                        <Columns>
                                            <asp:TemplateField HeaderText="Committed Date">
                                    <ItemTemplate>
                                        <asp:Label ID="DeliveryDate" runat="server" Text='<%#Eval("DeliveryDate","{0:dd/MMM/yyyy}") %>' />
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
                                    <asp:GridView ID="GVShipmentSH_NotShipped" Caption="Scheduled But Pending Deliveries During The Last Month" OnDataBound="GVShipmentSH_NotShipped_DataBound" OnRowCreated="GVShipmentSH_NotShipped_RowCreated" OnSorting="GVShipmentSH_NotShipped_Sorting" OnRowDataBound="GVShipmentSH_NotShipped_RowDataBound" runat="server" AutoGenerateColumns="False" Font-Size="14px" Width="100%" EnableModelValidation="True">
                                        <HeaderStyle BackColor="#333333" ForeColor="White" />
                                        <Columns>
                                            <asp:TemplateField HeaderText="Committed Date">
                                    <ItemTemplate>
                                        <asp:Label ID="DeliveryDate" runat="server" Text='<%#Eval("DeliveryDate","{0:dd/MMM/yyyy}") %>' />
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
                                    <asp:GridView ID="GVShipmentSN_NotShipped" Caption="Scheduled But Pending Deliveries During The Last Month" OnDataBound="GVShipmentSN_NotShipped_DataBound" OnRowCreated="GVShipmentSN_NotShipped_RowCreated" OnSorting="GVShipmentSN_NotShipped_Sorting" OnRowDataBound="GVShipmentSN_NotShipped_RowDataBound" runat="server" AutoGenerateColumns="False" Font-Size="14px" Width="100%" EnableModelValidation="True">
                                        <HeaderStyle BackColor="#333333" ForeColor="White" />
                                        <Columns>
                                            <asp:TemplateField HeaderText="Committed Date">
                                    <ItemTemplate>
                                        <asp:Label ID="DeliveryDate" runat="server" Text='<%#Eval("DeliveryDate","{0:dd/MMM/yyyy}") %>' />
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
                                    <asp:GridView ID="GVSheduledThisMonthSW" Caption="Scheduled Deliveries For This Month" OnDataBound="GVSheduledThisMonthSW_DataBound" OnRowCreated="GVSheduledThisMonthSW_RowCreated" OnSorting="GVSheduledThisMonthSW_Sorting" OnRowDataBound="GVSheduledThisMonthSW_RowDataBound" runat="server" AutoGenerateColumns="False" Font-Size="14px" Width="100%" EnableModelValidation="True">
                                        <HeaderStyle BackColor="#333333" ForeColor="White" />
                                        <Columns>
                                            <asp:TemplateField HeaderText="Committed Date">
                                    <ItemTemplate>
                                        <asp:Label ID="DeliveryDate" runat="server" Text='<%#Eval("DeliveryDate","{0:dd/MMM/yyyy}") %>' />
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
                                            <asp:TemplateField HeaderText="Buyer PO Qty"  ItemStyle-HorizontalAlign="Right">
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
                                    <asp:GridView ID="GVSheduledThisMonthSP" Caption="Scheduled Deliveries For This Month" OnDataBound="GVSheduledThisMonthSP_DataBound"
                                         OnRowCreated="GVSheduledThisMonthSP_RowCreated" OnSorting="GVSheduledThisMonthSP_Sorting" OnRowDataBound="GVSheduledThisMonthSP_RowDataBound" 
                                        runat="server" AutoGenerateColumns="False" Font-Size="14px" Width="100%" EnableModelValidation="True">
                                        <HeaderStyle BackColor="#333333" ForeColor="White" />
                                        <Columns>
                                            <asp:TemplateField HeaderText="Committed Date">
                                    <ItemTemplate>
                                        <asp:Label ID="DeliveryDate" runat="server" Text='<%#Eval("DeliveryDate","{0:dd/MMM/yyyy}") %>' />
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
                                    <asp:GridView ID="GVSheduledThisMonthSH" Caption="Scheduled Deliveries For This Month" OnDataBound="GVSheduledThisMonthSH_DataBound"
                               OnRowCreated="GVSheduledThisMonthSH_RowCreated" OnSorting="GVSheduledThisMonthSH_Sorting" OnRowDataBound="GVSheduledThisMonthSH_RowDataBound" 
                                        runat="server" AutoGenerateColumns="False" Font-Size="14px" Width="100%" EnableModelValidation="True">
                                        <HeaderStyle BackColor="#333333" ForeColor="White" />
                                        <Columns>
                                            <asp:TemplateField HeaderText="Committed Date">
                                    <ItemTemplate>
                                        <asp:Label ID="DeliveryDate" runat="server" Text='<%#Eval("DeliveryDate","{0:dd/MMM/yyyy}") %>' />
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
                                    <asp:GridView ID="GVSheduledThisMonthSN" Caption="Scheduled Deliveries For This Month" OnDataBound="GVSheduledThisMonthSN_DataBound"
                           OnRowCreated="GVSheduledThisMonthSN_RowCreated" OnSorting="GVSheduledThisMonthSN_Sorting" OnRowDataBound="GVSheduledThisMonthSN_RowDataBound" 
                                          runat="server" AutoGenerateColumns="False" Font-Size="14px" Width="100%" EnableModelValidation="True">
                                        <HeaderStyle BackColor="#333333" ForeColor="White" />
                                        <Columns>
                                            <asp:TemplateField HeaderText="Committed Date">
                                    <ItemTemplate>
                                        <asp:Label ID="DeliveryDate" runat="server" Text='<%#Eval("DeliveryDate","{0:dd/MMM/yyyy}") %>' />
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


