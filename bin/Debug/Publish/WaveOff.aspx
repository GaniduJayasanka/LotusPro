<%@ page language="C#" autoeventwireup="true" inherits="WaveOff, App_Web_euilynsb" %>

<%@ Register Assembly="BasicFrame.WebControls.BasicDatePicker" Namespace="BasicFrame.WebControls" TagPrefix="BDP" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Wave Off</title>
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


   
  
  <%--  <script language="Javascript">
        function isNumberKey(evt) {
            var charCode = (evt.which) ? evt.which : evt.keyCode;
            if (charCode != 46 && charCode > 31
              && (charCode < 48 || charCode > 57))
                return false;

            return true;
        }
        $(document).ready(function () {
            $($("#<%=txtQty.ClientID %>")).on('keyup', function () {
                $r = $("#<%=hfRemainingValue.ClientID %>");
                $p = $("#<%=txtQty.ClientID %>");
                var remaining = parseInt($r.val()) || 0;
                var present = parseInt($p.val()) || 0;
                if (remaining < present) {
                    $p.val('');
                    $("#<%=lblRemainingQty.ClientID %>").text(remaining);
                }
                else {
                    $("#<%=lblRemainingQty.ClientID %>").text(remaining - present);
                }
            });
        });
    </script>--%>


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
                    <center><h3>Short Shipments Wave Off </h3></center>
                </diMSP Dashboard</h3></center>
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
                                           
                                            <div class="col-xs-6 col-sm-2">
                                              <asp:RadioButtonList  AutoPostBack="true" ID="RadioButtonDateCategory" runat="Server" OnSelectedIndexChanged="RadioButtonList1_SelectedIndexChanged">
                            <asp:ListItem Text="30 days & 60 Days" Value="1"></asp:ListItem>
                            <asp:ListItem Text="60 days & 90 Days" Value="2"></asp:ListItem>
                            <asp:ListItem Text="90 days & 120 Days" Value="3"></asp:ListItem>
                            <asp:ListItem Text="Customize" Value="4"></asp:ListItem>
                        </asp:RadioButtonList>
                                            </div>

                                            <label class="col-md-1 control-label">Date Range <span style="color: red">*</span></label>
                                            <div class="col-md-2">
                                               <span class="auto-style1"></span> <BDP:BasicDatePicker ID="DatePickerFromDate" runat="server" CssClass="form-control" />
                                            </div>
                                            <label class="col-md-1 control-label">To <span style="color: red">*</span></label>
                                            <div class="col-md-2">
                                              <span class="auto-style1"></span>  <BDP:BasicDatePicker ID="DatePickerToDate" runat="server" CssClass="form-control" />
                                            </div>
                                             
                                            
                                           
                                          
                                             <label class="col-md-1 control-label">Buyer</label>
                                              <div class="col-xs-6 col-sm-3">
                                            <asp:DropDownList ID="DDLBUYER" AutoPostBack="true" CssClass="form-control" runat="server" >
                                                </asp:DropDownList>
                                            </div>
                                            <div class="col-md-4">
                                                <asp:Button ID="Button1" runat="server" CssClass="btn btn-info" OnClick="btnSearch_Click" Text="Search" Width="100px" />
                                                <asp:Button ID="Button2" runat="server" CssClass="btn btn-warning"  Text="Reset" Width="100px" OnClick="Button2_Click" />
                                               
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
        <div class="col-md-12">
            <div id="DivRoot" align="left">
<div style="overflow: hidden;" id="DivHeaderRow">
</div>
                <div>
<%--<div style="overflow:auto;" onscroll="OnScrollDiv(this)" id="DivMainContent" >--%>
            <asp:GridView ID="GVMSPWaveOff" runat="server"    AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" 
                BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" 
                AllowSorting="True"  Style="max-width: 100%; min-width: 90%" Font-Size="Small"
                EnableModelValidation="True" OnRowDataBound="GVMSPWaveOff_RowDataBound"  >
               
                <Columns>
                     <asp:TemplateField HeaderText="" SortExpression="" >
                        <ItemTemplate>
                    <asp:Button ID="btnWaveOff"  runat="server" Text="Wave Off"  CssClass="btn btn-success"  OnClick="btnWaveOff_Click" />
                     </ItemTemplate>
                    </asp:TemplateField> 
                    <asp:TemplateField Visible="false" HeaderText="No" ItemStyle-BackColor="DarkGray" HeaderStyle-BackColor="Olive">
                        <ItemTemplate>
                                                        <asp:Label ID="No"  runat="server" Text='<%# Container.DataItemIndex + 1 %>'></asp:Label>
                            </ItemTemplate>
                        <HeaderStyle BackColor="Olive"></HeaderStyle>
                        <ItemStyle BackColor="DarkGray"></ItemStyle>
                    </asp:TemplateField>
                     <asp:TemplateField HeaderText="DID" SortExpression="DID" Visible="false">
                        <ItemTemplate>
                            <asp:Label ID="DID"  runat="server" Text='<%#Eval("DID") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>  
                    <asp:TemplateField HeaderText="Buyer" SortExpression="BuyerName" Visible="true">
                        <ItemTemplate>
                            <asp:Label ID="BuyerName"  runat="server" Text='<%#Eval("BuyerName") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>                
                    
                     <asp:TemplateField HeaderText="Style " Visible="true" SortExpression="StyleNo">
                        <ItemTemplate>
                            <asp:Label ID="StyleNo"  runat="server" Text='<%#Eval("StyleNo") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                      <asp:TemplateField HeaderText="Buyer PO" Visible="true" SortExpression="StyleNo">
                        <ItemTemplate>
                            <asp:Label ID="BuyerPONo"  runat="server" Text='<%#Eval("BuyerPONo") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Contract No" Visible="true" SortExpression="ContractNo">
                        <ItemTemplate>
                            <asp:Label ID="ContractNo"  runat="server" Text='<%#Eval("ContractNo") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    
                     <asp:TemplateField HeaderText="Color Name" Visible="true" SortExpression="ColorName">
                        <ItemTemplate>
                            <asp:Label ID="ColorName"  runat="server" Text='<%#Eval("ColorName") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Del #" Visible="true" SortExpression="DeliveryNo">
                        <ItemTemplate>
                            <asp:Label ID="DeliveryNo" runat="server" Text='<%#Eval("DeliveryNo") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    
                   
                    <asp:TemplateField HeaderText="Plant" Visible="true" SortExpression="Plant">
                        <ItemTemplate>
                            <asp:Label ID="Plant"  runat="server" Text='<%#Eval("Plant") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    
               <asp:TemplateField HeaderText="Ex. Ship Date" Visible="true" SortExpression="ExtendedShipDate">
                        <ItemTemplate>
                            <asp:Label ID="ExtendedShipDate" runat="server"  Text='<%#Eval("ExtendedShipDate","{0:dd/MMM/yyyy}") %>' ></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                       <asp:TemplateField HeaderText="BPO Qty" ItemStyle-HorizontalAlign="Right" Visible="true" SortExpression="BPOQty">
                        <ItemTemplate>
                            <asp:Label ID="BPOQty" runat="server" Text='<%#Eval("BPOQty") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    
                     <asp:TemplateField HeaderText="SPO Qty" ItemStyle-HorizontalAlign="Right" Visible="true" SortExpression="SPOQty">
                        <ItemTemplate>
                            <asp:Label ID="SumithraPOQty" ToolTip='<%#Eval("CAStatus")%>' runat="server" Text='<%#Eval("SumithraPOQty") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Commited Qty" ItemStyle-HorizontalAlign="Right" Visible="true" SortExpression="DeliveryQty">
                        <ItemTemplate>
                            <asp:Label ID="DeliveryQty" ToolTip='<%#Eval("CAStatus")%>' runat="server" Text='<%#Eval("DeliveryQty") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                   <asp:TemplateField HeaderText="Shipped Qty" ItemStyle-HorizontalAlign="Right" Visible="true" SortExpression="ShippedQty">
                        <ItemTemplate>
                            <asp:Label ID="ShippedQty" ToolTip='<%#Eval("CAStatus")%>' runat="server" Text='<%#Eval("ShippedQty") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                     <asp:TemplateField HeaderText="Short Ship Qty" ItemStyle-HorizontalAlign="Right" Visible="true" SortExpression="SS_OSQty">
                        <ItemTemplate>
                            <asp:Label ID="SS_OSQty" ToolTip='<%#Eval("CAStatus")%>' runat="server" Text='<%#Eval("SS_OSQty") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                      <asp:TemplateField HeaderText="Cancel" Visible="false">
                            <ItemTemplate>                           
                                <asp:Label ID="labCancel" runat="server" Visible="true" Text='<%#Eval("Cancel") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                                      <asp:TemplateField HeaderText="Cancel"  Visible="true">
                            <ItemTemplate>                           
                                <asp:Label ID="labCancelRemarks" runat="server" Visible="true" Text='<%#Eval("CancelRe") %>'></asp:Label>
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
            <asp:Label ID="lblBuyerID" runat="server" Text="" Visible="false"></asp:Label>
             <asp:Label ID="lblBPOID" runat="server" Text="" Visible="false"></asp:Label>
             <asp:Label ID="lblBPOSEQ" runat="server" Text="" Visible="false"></asp:Label>
             <asp:Label ID="lblSDID" runat="server" Text="" Visible="false"></asp:Label>
             <asp:Label ID="lblSDSEQ" runat="server" Text="" Visible="false"></asp:Label>
            <asp:Label ID="lblSuPOQty" runat="server" Text="" Visible="false"></asp:Label>
            <asp:Label ID="lblSPlantID" runat="server" Text="" Visible="false"></asp:Label>
            <asp:Label ID="lblOrderNo" runat="server" Text="" Visible="false"></asp:Label>
            <br />
        </div>
        <asp:Button ID="btnShowPopup" runat="server" Style="display: none" />
       <%-- <asp:ModalPopupExtender ID="MPEDBdown" runat="server" TargetControlID="btnShowPopup" PopupControlID="pnlpopup"
            CancelControlID="btnCancel" BackgroundCssClass="modalBackground">
            
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </asp:ModalPopupExtender>--%>
      
    </form>
</body>
</html>


