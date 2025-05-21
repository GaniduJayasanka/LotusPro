<%@ page language="C#" autoeventwireup="true" inherits="ShipmentCancellationApproval, App_Web_34neb3g4" %>

<%@ Register Assembly="BasicFrame.WebControls.BasicDatePicker" Namespace="BasicFrame.WebControls" TagPrefix="BDP" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Shipment Cancellation</title>
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
.GVFixedHeader { font-weight:bold; background-color: Green; position:relative; 
                 top:expression(this.parentNode.parentNode.parentNode.scrollTop-1);}

.GVFixedFooter { font-weight:bold; background-color: Green; position:relative;
                 bottom:expression(getScrollBottom(this.parentNode.parentNode.parentNode.parentNode));} 
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
                    <center><h3>Shipment Cancellation Approval - Management</h3></center>
                </div>
            </div>
        </div>
      
        <div class="col-md-12">
            <div id="DivRoot" align="left">
<div style="overflow: hidden;" id="DivHeaderRow">
</div>
                <div>
<%--<div style="overflow:auto;" onscroll="OnScrollDiv(this)" id="DivMainContent" >--%>
            <asp:GridView ID="GVMSPShedule" runat="server" ShowFooter="true"   DataKeyNames="OrderNo" AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" 
                BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" 
                AllowSorting="True"  Style="max-width: 100%; min-width: 90%; margin-bottom: 0px;" Font-Size="Small"
                EnableModelValidation="True"  >
               
                <Columns>
                     <asp:TemplateField HeaderText="" >
                        <ItemTemplate>
                            <asp:Button ID="btnApprove"  runat="server" Text="Approve"  CssClass="btn btn-success"  OnClick="btnApprove_Click" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="" >
                        <ItemTemplate>
                            <asp:Button ID="btnDisapprove"  runat="server" Text="Dissapprove"  CssClass="btn btn-danger"  OnClick="btnDisapprove_Click" />
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
                            <asp:Label ID="BuyerName"  runat="server" Text='<%#Eval("BuyerName") %>'></asp:Label>
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
                            <asp:Label ID="ExtendedShipDate" runat="server"  Text='<%#Eval("ExtendedShipDate","{0:dd/MMM/yyyy}") %>' ></asp:Label>
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
                     <asp:TemplateField HeaderText="Commited Qty" Visible="true" SortExpression="CommitedQty">
                        <ItemTemplate>  
                             <asp:Label ID="CommitedQty" runat="server" Text='<%#Eval("DeliveryQty") %>'></asp:Label>                         
                            
                        </ItemTemplate>
                    </asp:TemplateField>
                     <asp:TemplateField HeaderText="DeliveryDate" Visible="true" SortExpression="DeliveryDate">
                        <ItemTemplate>
                            <asp:Label ID="DeliveryDate" runat="server" Visible="true" Text='<%#Eval("DeliveryDate") %>'></asp:Label>
                           
                        </ItemTemplate>
                    </asp:TemplateField>
                     <asp:TemplateField HeaderText="Comment" Visible="true" SortExpression="Comment">
                        <ItemTemplate> 
                            <asp:Label ID="Comment" runat="server" Visible="true" Text='<%#Eval("Comment") %>'></asp:Label>                         
                    
                        </ItemTemplate>
                    </asp:TemplateField>
                 <asp:TemplateField HeaderText="Cancel Remarks" Visible="true" SortExpression="CancelRemarks">
                        <ItemTemplate> 
                            <asp:Label ID="CancelRemarks" runat="server" Visible="true" Text='<%#Eval("CancelRemarks") %>'></asp:Label>                         
                    
                        </ItemTemplate>
                    </asp:TemplateField>
                   
                   
                    
                </Columns>
                <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
               <%-- <HeaderStyle Wrap="true" BackColor="#333333" Font-Bold="True" ForeColor="White" />--%>
                <FooterStyle BackColor="#333333" Font-Bold="True" ForeColor="White"  CssClass="GVFixedFooter"/>
                <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" CssClass="GVFixedHeader" />

            </asp:GridView>
    </div>
<div id="DivFooterRow" style="overflow:hidden">
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
            <br />
        </div>
        <asp:Button ID="btnShowPopup" runat="server" Style="display: none" />
        <asp:ModalPopupExtender ID="MPEDBdown" runat="server" TargetControlID="btnShowPopup" PopupControlID="pnlpopup"
            CancelControlID="btnCancel" BackgroundCssClass="modalBackground">
        </asp:ModalPopupExtender>
      
    </form>
</body>
</html>

