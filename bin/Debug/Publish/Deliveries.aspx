<%@ page language="C#" autoeventwireup="true" inherits="Deliveries, App_Web_10bhy3il" %>

<%@ Register Assembly="BasicFrame.WebControls.BasicDatePicker" Namespace="BasicFrame.WebControls" TagPrefix="BDP" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Deliveries</title>
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

    <style type="text/css">
        .GVFixedHeader {
            font-weight: bold;
            background-color: Green;
            position: relative;
            top: expression(this.parentNode.parentNode.parentNode.scrollTop-1);
        }

        .GVFixedFooter {
            font-weight: bold;
            background-color: Green;
            position: relative;
            bottom: expression(getScrollBottom(this.parentNode.parentNode.parentNode.parentNode));
        }
    </style>

    <script language="javascript" type="text/javascript">
        function MakeStaticHeader(gridId, height, width, headerHeight, isFooter) {
            var tbl = document.getElementById(gridId);
            if (tbl) {
                var DivHR = document.getElementById('DivHeaderRow');
                var DivMC = document.getElementById('DivMainContent');
                var DivFR = document.getElementById('DivFooterRow');

                //*** Set divheaderRow Properties ****
                DivHR.style.height = headerHeight + 'px';
                DivHR.style.width = (parseInt(width) - 16) + 'px';
                DivHR.style.position = 'relative';
                DivHR.style.top = '0px';
                DivHR.style.zIndex = '10';
                DivHR.style.verticalAlign = 'top';

                //*** Set divMainContent Properties ****
                DivMC.style.width = width + 'px';
                DivMC.style.height = height + 'px';
                DivMC.style.position = 'relative';
                DivMC.style.top = -headerHeight + 'px';
                DivMC.style.zIndex = '1';

                //*** Set divFooterRow Properties ****
                DivFR.style.width = (parseInt(width) - 16) + 'px';
                DivFR.style.position = 'relative';
                DivFR.style.top = -headerHeight + 'px';
                DivFR.style.verticalAlign = 'top';
                DivFR.style.paddingtop = '2px';

                if (isFooter) {
                    var tblfr = tbl.cloneNode(true);
                    tblfr.removeChild(tblfr.getElementsByTagName('tbody')[0]);
                    var tblBody = document.createElement('tbody');
                    tblfr.style.width = '100%';
                    tblfr.cellSpacing = "0";
                    tblfr.border = "0px";
                    tblfr.rules = "none";
                    //*****In the case of Footer Row *******
                    tblBody.appendChild(tbl.rows[tbl.rows.length - 1]);
                    tblfr.appendChild(tblBody);
                    DivFR.appendChild(tblfr);
                }
                //****Copy Header in divHeaderRow****
                DivHR.appendChild(tbl.cloneNode(true));
            }
        }
    </script>

    <style type="text/css">
        .modalBackground {
            background-color: Gray;
            filter: alpha(opacity=80);
            opacity: 0.8;
            z-index: 10000;
        }

        .BigCheckBox input {
            width: 20px;
            height: 20px;
        }

        .auto-style1 {
            color: #FF0000;
        }
    </style>
</head>

<body>
    <form id="form1" runat="server">
        <asp:ToolkitScriptManager ID="ScriptManager1" runat="server">
        </asp:ToolkitScriptManager>
        <asp:HiddenField ID="hfRemainingValue" runat="server" />
        <div class="col-md-12">
            <div class="row">
                <div class="col-md-1">
                    <br />
                    <asp:ImageButton ID="btnHome" runat="server" ImageUrl="~/images/Tohome.png" Height="35px"
                        Width="35px" OnClick="btnHome_Click" />
                </div>
                <div class="col-md-11">
                    <center><h3>Deliveries</h3></center>
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
                                            <label class="col-md-1 control-label">Date Set Up </label>
                                            <div class="col-md-2">
                                                <span class="auto-style1"></span>
                                                <BDP:BasicDatePicker ID="DatePickerFromDate" ToolTip="Commited Date" runat="server" CssClass="form-control" />
                                            </div>
                                            <label class="col-md-1 control-label">To</label>
                                            <div class="col-md-2">
                                                <span class="auto-style1"></span>
                                                <BDP:BasicDatePicker ID="DatePickerToDate" ToolTip="Commited Date" runat="server" CssClass="form-control" />
                                            </div>
                                            <label class="col-md-1 control-label">Plant</label>
                                            <div class="col-md-1">
                                                <asp:DropDownList ID="DDLPlant" runat="server" CssClass="form-control">
                                                </asp:DropDownList>
                                            </div>
                                            <div class="col-md-2">
                                                <asp:Button ID="BtnSearch" runat="server" CssClass="btn btn-info" OnClick="btnSearch_Click" Text="Find" Width="50px" />
                                                <asp:Button ID="BtnReset" runat="server" CssClass="btn btn-warning" OnClick="BtnReset_Click" Text="Reset" Width="60px" />
                                                <asp:Button ID="BtnDataUpdate" runat="server" CssClass="btn btn-success" OnClick="BtnDataUpdate_Click" Text="Update" Width="60px" OnClientClick=" return confirm('Do you want to update all the records of this table ? And It will be change the color in to Yellow');" />
                                            </div>
                                            <label class="col-md-1 control-label">Without Cancelled:</label>
                                            <div class="col-md-1">
                                                <asp:CheckBox ID="CheckBox1" runat="server" Checked="true" />
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="box-body">
                                        <div class="form-group">
                                            <label class="col-md-1 control-label">Buyer</label>
                                            <div class="col-md-2">
                                                <asp:DropDownList ID="DDLBUYER" AutoPostBack="true" CssClass="form-control" runat="server" OnSelectedIndexChanged="DDLBUYER_SelectedIndexChanged">
                                                </asp:DropDownList>
                                            </div>
                                            <label class="col-md-1 control-label">Style</label>
                                            <div class="col-md-2">
                                                <asp:DropDownList ID="DDLStyle" AutoPostBack="true" runat="server" CssClass="form-control" OnSelectedIndexChanged="DDLStyle_SelectedIndexChanged">
                                                </asp:DropDownList>
                                            </div>
                                            <label class="col-md-1 control-label">Buy</label>
                                            <div class="col-md-1">
                                                <asp:DropDownList ID="DDLBUY" AutoPostBack="true" runat="server" CssClass="form-control" OnSelectedIndexChanged="DDLStyle_SelectedIndexChanged">
                                                    <asp:ListItem></asp:ListItem>
                                                    <asp:ListItem>1</asp:ListItem>
                                                    <asp:ListItem>2</asp:ListItem>
                                                    <asp:ListItem>3</asp:ListItem>
                                                    <asp:ListItem>4</asp:ListItem>
                                                    <asp:ListItem>5</asp:ListItem>
                                                    <asp:ListItem>6</asp:ListItem>
                                                    <asp:ListItem>7</asp:ListItem>
                                                    <asp:ListItem>8</asp:ListItem>
                                                    <asp:ListItem>9</asp:ListItem>
                                                    <asp:ListItem>10</asp:ListItem>
                                                    <asp:ListItem>11</asp:ListItem>
                                                    <asp:ListItem>12</asp:ListItem>
                                                    <asp:ListItem>12</asp:ListItem>
                                                    <asp:ListItem>14</asp:ListItem>
                                                    <asp:ListItem>15</asp:ListItem>
                                                    <asp:ListItem>16</asp:ListItem>
                                                </asp:DropDownList>
                                            </div>
                                            <label class="col-md-1 control-label">BPO</label>
                                            <div class="col-md-1">
                                                <asp:DropDownList ID="DDLBPO" runat="server" CssClass="form-control">
                                                </asp:DropDownList>
                                            </div>
                                            <label class="col-md-1 control-label">Color</label>
                                            <div class="col-md-1">
                                                <asp:DropDownList ID="DDLColor" runat="server" CssClass="form-control">
                                                </asp:DropDownList>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </asp:Panel>
        <div class="col-md-11">
            <div class="form-group">
                <label class="col-md-3 control-label">
                    <img src="images/blue1.PNG" width="35" height="20" />
                    : Partial Shipment
                </label>
                <label class="col-md-2 control-label">
                    <img src="images/offWhite.PNG" width="35" height="20" />
                    : Cancelled</label>
                <label class="col-md-3 control-label">
                    <img src="images/brown.PNG" width="35" height="20" />
                    : Cancel Request</label>
                <label class="col-md-2 control-label">
                    <img src="images/Yelow.PNG" width="35" height="20" />
                    : Updated</label>
            </div>
        </div>
        <div class="col-md-12">
            <div id="DivRoot" align="left">
                <div style="overflow: hidden;" id="DivHeaderRow">
                </div>
                <div>
                    <%--<div style="overflow:auto;" onscroll="OnScrollDiv(this)" id="DivMainContent" >--%>
                    <asp:GridView ID="GVMSPShedule" runat="server" ShowFooter="true" DataKeyNames="OrderNo" AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC"
                        BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" OnRowDataBound="GVMSPShedule_RowDataBound"
                        AllowSorting="True" OnSorting="GVMSPShedule_Sorting" Style="max-width: 100%; min-width: 90%" Font-Size="Small"
                        EnableModelValidation="True">
                        <Columns>
                            <asp:TemplateField HeaderText="" SortExpression="" Visible="false">
                                <ItemTemplate>
                                    <asp:ImageButton ID="imgbtnAdd0" Visible="false" OnClick="imgbtnAdd0_Click" runat="server" Height="30px" ImageUrl="~/images/remove3.png" ToolTip="Add new Item" Width="30px" />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="" SortExpression="" Visible="false">
                                <ItemTemplate>
                                    <asp:ImageButton ID="imgbtnRevise" OnClick="imgbtnRevise_Click" runat="server" Height="30px" ImageUrl="~/images/Revise.png" ToolTip="Revise" Width="30px" />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="DID" SortExpression="" Visible="true">
                                <ItemTemplate>
                                    <asp:Label ID="DID" runat="server" Text='<%#Eval("DID") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="BPOID" SortExpression="" Visible="false">
                                <ItemTemplate>
                                    <asp:Label ID="BPOID" runat="server" Text='<%#Eval("BPOID") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="OrderNo" SortExpression="" Visible="false">
                                <ItemTemplate>
                                    <asp:Label ID="OrderNo" runat="server" Text='<%#Eval("OrderNo") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="BPOSEQ" SortExpression="" Visible="false">
                                <ItemTemplate>
                                    <asp:Label ID="BPOSEQ" runat="server" Text='<%#Eval("BPOSEQ") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="SDID" SortExpression="" Visible="false">
                                <ItemTemplate>
                                    <asp:Label ID="SDID" runat="server" Text='<%#Eval("SDID") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="SDSEQ" SortExpression="" Visible="false">
                                <ItemTemplate>
                                    <asp:Label ID="SDSEQ" runat="server" Text='<%#Eval("SDSEQ") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Buyer" SortExpression="BuyerName" Visible="true">
                                <ItemTemplate>
                                    <asp:Label ID="BuyerName" runat="server" Text='<%#Eval("BuyerName") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Style" SortExpression="StyleNo">
                                <ItemTemplate>
                                    <asp:Label ID="StyleNo" runat="server" Text='<%#Eval("StyleNo") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="BPONo" Visible="true" SortExpression="BuyerPONo">
                                <ItemTemplate>
                                    <asp:Label ID="BuyerPONo" runat="server" Text='<%#Eval("BuyerPONo") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Color" Visible="true" SortExpression="ColorName">
                                <ItemTemplate>
                                    <asp:Label ID="ColorName" runat="server" Text='<%#Eval("ColorName") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Contract #" Visible="true" SortExpression="ContractNo">
                                <ItemTemplate>
                                    <asp:Label ID="Label1" runat="server" Text='<%#Eval("ContractNo") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Plant" Visible="true" SortExpression="Plant">
                                <ItemTemplate>
                                    <asp:Label ID="lblPlant" runat="server" Text='<%#Eval("Plant") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Ex. Ship Date" Visible="true" SortExpression="ExtendedShipDate">
                                <ItemTemplate>
                                    <asp:Label ID="ExtendedShipDate" runat="server" Text='<%#Eval("ExtendedShipDate","{0:dd/MMM/yyyy}") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="BPOQty" Visible="true" SortExpression="BPOQty">
                                <ItemTemplate>
                                    <asp:Label ID="BPOQty" runat="server" Text='<%#Eval("BPOQty") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="SPOQty" Visible="true" SortExpression="SPOQty">
                                <ItemTemplate>
                                    <asp:Label ID="SumithraPOQty" ToolTip='<%#Eval("CAStatus")%>' runat="server" Text='<%#Eval("SumithraPOQty") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Del #" Visible="true" SortExpression="DeliveryNo">
                                <ItemTemplate>
                                    <asp:Label ID="ContractNo" runat="server" Text='<%#Eval("DeliveryNo") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Commited Qty" Visible="true" SortExpression="DeliveryQty">
                                <ItemTemplate>
                                    <asp:TextBox ID="txtPromisedQty" Enabled="false" runat="server" Text='<%#Eval("DeliveryQty") %>' Width="90px" />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Commited Date" Visible="true" SortExpression="DeliveryDate">
                                <ItemTemplate>
                                    <asp:Label ID="DeliveryDate" runat="server" Visible="false" Text='<%#Eval("DeliveryDate") %>'></asp:Label>
                                    <BDP:BasicDatePicker ID="BDPDeliveryDate" Text='<%# Eval("DeliveryDate", "{0:dd/MM/yyyy}") %>' runat="server" CssClass="form-control" />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Comment" Visible="true" SortExpression="Comment">
                                <ItemTemplate>
                                    <asp:TextBox ID="txtgvComment" runat="server" Text='<%#Eval("Comment") %>' Width="300px" />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="">
                                <ItemTemplate>
                                    <asp:Button ID="btnUpdate" runat="server" Text="Update" CssClass="btn btn-success" OnClick="btnUpdate_Click1" />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="">
                                <ItemTemplate>
                                    <asp:Button ID="btnRemove" Enabled="false" runat="server" Text="Trash" CssClass="btn btn-danger" OnClick="btnRemove_Click" />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="rowcunts" Visible="false">
                                <ItemTemplate>
                                    <asp:Label ID="rowcunts" runat="server" Text='<%#Eval("rowcunts") %>' />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="DNo" Visible="false">
                                <ItemTemplate>
                                    <asp:Label ID="DNo" runat="server" Text='<%#Eval("DNo") %>' />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="RevisedDate" Visible="true" SortExpression="RevisedDate">
                                <ItemTemplate>
                                    <asp:Label ID="RevisedDate" runat="server" Visible="true" Text='<%#Eval("RevisedDate") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Cancel Remarks" Visible="true" SortExpression="Comment">
                                <ItemTemplate>
                                    <asp:Label ID="lblCancelRemark" runat="server" Visible="true" Text='<%#Eval("CancelRemarks") %>'></asp:Label>
                                    <%--<asp:TextBox ID="txtcancelRemarks" runat="server"  Text='<%#Eval("CancelRemarks") %>'  Width="200px" />--%>
                                  <%--  <asp:DropDownList ID="DDLCancelRemarks" runat="server" Width="200px">
                                        <asp:ListItem Value="0">Choice Offer</asp:ListItem>
                                        <asp:ListItem Value="1">Stock Lot Buyer Offer</asp:ListItem>
                                        <asp:ListItem Value="2">Other</asp:ListItem>
                                    </asp:DropDownList>--%>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <%--<asp:TemplateField HeaderText="Shipment Cancellation" SortExpression="">
                                <ItemTemplate>
                                    <asp:ImageButton ID="imgbtnSHipmentCancel" OnClick="imgbtnSHipmentCancel_Click" runat="server" Height="40px" ImageUrl="~/images/CancelShip.png" ToolTip="Shipment Cancellation" Width="55px" />
                                </ItemTemplate>
                            </asp:TemplateField>--%>
                            <asp:TemplateField HeaderText="Cancel" Visible="false" SortExpression="Cancel">
                                <ItemTemplate>
                                    <asp:Label ID="Cancel" runat="server" Visible="true" Text='<%#Eval("Cancel") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="CancelRequest" Visible="false" SortExpression="Cancel">
                                <ItemTemplate>
                                    <asp:Label ID="CancelRequest" runat="server" Visible="true" Text='<%#Eval("CancelRequest") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="PartialShipmentStatus" Visible="false" SortExpression="PartialShipmentStatus">
                                <ItemTemplate>
                                    <asp:Label ID="PartialShipmentStatus" runat="server" Visible="true" Text='<%#Eval("PartialShipmentStatus") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Pending" Visible="false" SortExpression="Pending">
                                <ItemTemplate>
                                    <asp:Label ID="Pending" runat="server" Visible="true" Text='<%#Eval("Pending") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="POType" Visible="true" SortExpression="POType">
                                <ItemTemplate>
                                    <asp:Label ID="POType" runat="server" Visible="true" Text='<%#Eval("POType") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="PlantID" Visible="false" SortExpression="PlantID">
                                <ItemTemplate>
                                    <asp:Label ID="PlantID" runat="server" Visible="true" Text='<%#Eval("PlantID") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                        <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
                        <%-- <HeaderStyle Wrap="true" BackColor="#333333" Font-Bold="True" ForeColor="White" />--%>
                        <FooterStyle BackColor="#333333" Font-Bold="True" ForeColor="White" CssClass="GVFixedFooter" />
                        <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" CssClass="GVFixedHeader" />
                    </asp:GridView>
                </div>
                <div id="DivFooterRow" style="overflow: hidden">
                </div>
            </div>
            <asp:Label ID="lblOrderNo" runat="server" Text="" Visible="false"></asp:Label>
            <asp:Label ID="lblBPOID" runat="server" Text="" Visible="false"></asp:Label>
            <asp:Label ID="lblBPOSEQ" runat="server" Text="" Visible="false"></asp:Label>
            <asp:Label ID="lblSDID" runat="server" Text="" Visible="false"></asp:Label>
            <asp:Label ID="lblSDSEQ" runat="server" Text="" Visible="false"></asp:Label>
            <asp:Label ID="lblSuPOQty" runat="server" Text="" Visible="false"></asp:Label>
            <asp:Label ID="lblSPlantID" runat="server" Text="" Visible="false"></asp:Label>
            <asp:Label ID="lblBPOQty" runat="server" Text="" Visible="false"></asp:Label>
            <asp:Label ID="lblTTLCommited" runat="server" Text="" Visible="false"></asp:Label>
            <asp:Label ID="lblDeliveryCount" runat="server" Text="" Visible="false"></asp:Label>
            <br />
        </div>
        <asp:Button ID="btnShowPopup" runat="server" Style="display: none" />
        <asp:ModalPopupExtender ID="MPEDBdown" runat="server" TargetControlID="btnShowPopup" PopupControlID="pnlpopup"
            CancelControlID="btnCancel" BackgroundCssClass="modalBackground">
        </asp:ModalPopupExtender>
        <asp:Panel ID="pnlpopup" runat="server" BackColor="White" Height="500px" Width="1200px"
            Style="display: none; overflow: scroll; border: Solid 3px #D55500;">
            <div class="container">
                <div class="row">
                    <div class="col-md-11">
                        <h3 style="text-align: center">Delivery Breakdown</h3>
                    </div>
                    <div class="col-md-1">
                        <br />
                        <asp:ImageButton ID="btnCancel" runat="server" ImageUrl="~/images/Cancel.png" Width="20" Height="20" CssClass="pull-right" />
                    </div>
                </div>
                <div class="panel panel-default">
                    <br />
                    <div class="row">
                        <div class="col-md-12">
                            <div class="col-md-4">
                                <strong>
                                    <asp:Label ID="Label16" runat="server" Text="Style:"></asp:Label>
                                </strong>&nbsp;<asp:Label ID="lblStyle" runat="server"></asp:Label>
                            </div>
                            <div class="col-md-4">
                                <strong>
                                    <asp:Label ID="Label1" runat="server" Text="Buyer PO No:"></asp:Label>
                                </strong>&nbsp;<asp:Label ID="lblBPO" runat="server"></asp:Label>
                            </div>
                            <div class="col-md-4">
                                <strong>
                                    <asp:Label ID="Label3" runat="server" Text="Contract No :"></asp:Label>
                                    &nbsp;</strong><asp:Label ID="lblContractNo" runat="server"></asp:Label>
                            </div>
                        </div>
                    </div>
                    <br />
                    <div class="row">
                        <div class="col-md-12">
                            <div class="col-md-3">
                                <strong>
                                    <asp:Label ID="Label5" runat="server" Text="Color :"></asp:Label>
                                    &nbsp; </strong>
                                <asp:Label ID="lblColorName" runat="server"></asp:Label>
                            </div>
                            <div class="col-md-3">
                                <strong>
                                    <asp:Label ID="Label7" runat="server" Text="Sumithra PO Qty :"></asp:Label>
                                    &nbsp;</strong><asp:Label ID="lblSPOQty" runat="server"></asp:Label>
                            </div>
                            <div class="col-md-3">
                                <strong>
                                    <asp:Label ID="Label2" runat="server" Text="Buyer PO Qty :"></asp:Label>
                                    &nbsp;</strong><asp:Label ID="LabelBuyerPOQty" runat="server"></asp:Label>
                            </div>
                            <div class="col-md-2">
                                <asp:Button ID="BtnsaveNCal" runat="server" CssClass="btn btn-success" OnClick="BtnsaveNCal_Click" Text="Save & Calculate" Width="150px" />
                            </div>
                            <br />
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12">
                        <div class="card" style="width: 100%; height: 100%">
                            <ul class="nav nav-tabs" role="tablist">
                                <%-- <li role="presentation" class="active"><a href="#add" aria-controls="add" role="tab" data-toggle="tab">Add</a></li>--%>
                                <%--   <li role="presentation"><a href="#view" aria-controls="view" role="tab" data-toggle="tab">View</a></li>--%>
                                <%--<li role="presentation"><a href="#summary" aria-controls="summary" role="tab" data-toggle="tab">Delivery History</a></li>--%>
                            </ul>
                            <div class="tab-content">
                                <div role="tabpanel" class="tab-pane active" id="add">
                                    <div class="col-md-12">
                                        <asp:GridView ID="GridViewMultipleDeleveries" runat="server" AutoGenerateColumns="False"
                                            OnRowDataBound="GridViewMultipleDeleveries_RowDataBound"
                                            BackColor="White" BorderWidth="1px" CellPadding="4"
                                            EnableModelValidation="True" ForeColor="Black" Width="90%">
                                            <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White"
                                                Wrap="False" />
                                            <Columns>
                                                <asp:TemplateField HeaderText="DID">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblDIDNO" runat="server" Text='<%#Eval("DID") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Delivery#">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblDeliveryNO" runat="server" Text='<%#Eval("DeliveryNo") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Promissed Qty">
                                                    <ItemTemplate>
                                                        <asp:TextBox ID="txtPromQty" Text='<%#Eval("DeliveryQty") %>' runat="server" Width="90px" />
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Delivery Date">
                                                    <ItemTemplate>
                                                        <asp:Label ID="LabelDDate" runat="server" Visible="True" Text='<%#Eval("DeliveryDate", "{0:dd/MM/yyyy}") %>'></asp:Label>
                                                        <%--   <BDP:BasicDatePicker  ID="BDPMDDeliveryDate"  Text='<%# Eval("DeliveryDate", "{0:dd/MM/yyyy}") %>'  runat="server" CssClass="form-control" />
                                                        --%>
                                                        <%-- <asp:Label ID="DeliveryDate" runat="server" Text='<%#Eval("DeliveryDate") %>' Width="90px" />--%>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Comment">
                                                    <ItemTemplate>
                                                        <asp:Label ID="LbblComment" runat="server" Text='<%#Eval("Comment") %>' Width="300px" />
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Plant">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblPlant" runat="server" Text='<%# Eval("Plant") %>' Visible="true" />
                                                        <%--<asp:DropDownList ID="ddlPlant" runat="server">
                                                                    </asp:DropDownList>--%>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                            </Columns>
                                        </asp:GridView>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </asp:Panel>
    </form>
</body>
</html>


