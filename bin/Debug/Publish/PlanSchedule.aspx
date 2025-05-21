<%@ page language="C#" autoeventwireup="true" inherits="MSPSchedule, App_Web_10bhy3il" %>

<%@ Register Assembly="BasicFrame.WebControls.BasicDatePicker" Namespace="BasicFrame.WebControls" TagPrefix="BDP" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>MSP Schedule</title>
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


    <script type="text/javascript">
        $("[src*=Plus]").live("click", function () {
            $(this).closest("tr").after("<tr><td></td><td colspan = '999'>" + $(this).next().html() + "</td></tr>")
            $(this).attr("src", "Images/Minus.png");
        });
        $("[src*=Minus]").live("click", function () {
            $(this).attr("src", "Images/Plus.png");
            $(this).closest("tr").next().remove();
        });
    </script>
    <script type="text/javascript">
        $(document).ready(function () {
            $("#<%=txtStyle.ClientID%>").autocomplete('SearchStyle.ashx');
        });
    </script>
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
                    <center><h3>Monthly Shipping Schedule</h3></center>
                </div>
            </div>
        </div>
        <asp:Panel ID="pnlsearch" runat="server">
            <div class="col-md-12">
                <div class="row">
                    <div class="col-md-8">
                        <div class="panel panel-default">
                            <div class="panel-body">
                                
                                <div class="row">
                                    <div class="box-body">
                                        <div class="form-group">
                                            <label class="col-md-1 control-label">Date Range </label>
                                            <div class="col-md-3">
                                               <span class="auto-style1">*</span> <BDP:BasicDatePicker ID="DatePickerFromDate" runat="server" CssClass="form-control" />
                                            </div>
                                            <label class="col-md-1 control-label">To</label>
                                            <div class="col-md-3">
                                              <span class="auto-style1">*</span>  <BDP:BasicDatePicker ID="DatePickerToDate" runat="server" CssClass="form-control" />
                                            </div>
                                            <div class="col-md-4">
                                                <asp:Button ID="BtnSearch" CssClass="btn btn-info" Width="100px" runat="server" Text="Search" OnClick="btnSearch_Click" />
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="box-body">
                                        <div class="form-group">
                                            <label class="col-md-1 control-label">Buyer</label>
                                            <div class="col-md-3">
                                                <asp:DropDownList ID="DDLBUYER" CssClass="form-control" runat="server">
                                                </asp:DropDownList>
                                            </div>
                                            <label class="col-md-1 control-label">Style</label>
                                            <div class="col-md-3">
                                                <asp:TextBox ID="txtStyle" runat="server" CssClass="form-control"></asp:TextBox>
                                            </div>
                                            <div class="col-md-4">
                                                <asp:Button ID="BtnStyleSearch" runat="server" CssClass="btn btn-primary"
                                                    Text="Style Search" Width="117px" OnClick="BtnStyleSearch_Click" />
                                                <asp:Button ID="BtnReset" runat="server" CssClass="btn btn-warning" OnClick="BtnReset_Click" Text="Reset" Width="100px" />
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="panel panel-default">
                            <div class="panel-body">
                                <div class="row">
                                    <div class="box-body">
                                        <div class="form-group">
                                            <label class="col-md-2 control-label">Plant</label>
                                            <div class="col-md-5">
                                                <asp:DropDownList ID="DDLPlant" runat="server" CssClass="form-control">
                                                </asp:DropDownList>
                                            </div>
                                            <div class="col-md-4">
                                                <asp:Button ID="BtnSet" CssClass="btn btn-success" runat="server" Width="110px" Text="Set" OnClick="BtnSet_Click" />
                                            </div>
                                             <div class="col-md-9">
                                                 <strong>UPSQ - </strong>Unplanned Ship Qty 
                                                 </div>
                                            <div class="col-md-9">
                                                 <strong>Ex Date - </strong>Extended Ship Date 
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
<div style="overflow:auto;" onscroll="OnScrollDiv(this)" id="DivMainContent" >
            <asp:GridView ID="GVMSPShedule" runat="server" ShowFooter="true"  OnRowDataBound="GVMSPReport_RowDataBound" DataKeyNames="OrderNo"
                AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" OnSorting="GVMSPReport_Sorting" OnPageIndexChanging="GVMSPReport_PageIndexChanging"
                BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black"
                AllowSorting="True" Style="max-width: 100%; min-width: 90%" Font-Size="Small"
                EnableModelValidation="True" OnSelectedIndexChanged="GVMSPShedule_SelectedIndexChanged">
               
                <Columns>
                    <asp:TemplateField HeaderText="No" ItemStyle-BackColor="DarkGray" HeaderStyle-BackColor="Olive">
                        <ItemTemplate><%# Container.DataItemIndex + 1 %></ItemTemplate>
                        <HeaderStyle BackColor="Olive"></HeaderStyle>
                        <ItemStyle BackColor="DarkGray"></ItemStyle>
                    </asp:TemplateField>
                    <asp:BoundField DataField="DBID" HeaderText="DBID" Visible="false" />
                    <asp:BoundField DataField="OrderNo" HeaderText="OrderNo" Visible="false" />
                    <asp:TemplateField Visible="false">
                        <ItemTemplate>
                            <img alt="" style="cursor: pointer" src="Images/Plus.png" />
                            <asp:Panel ID="pnlChild" runat="server" Style="display: none">
                                <asp:GridView ID="gvItemUpcharge" runat="server" AutoGenerateColumns="false" HeaderStyle-BackColor="#c1bcbc" RowStyle-Wrap="False" Width="60%">
                                    <Columns>
                                        <asp:BoundField DataField="DBID" HeaderText="DBID" Visible="false" />
                                        <asp:BoundField DataField="OrderNo" HeaderText="OrderNo" Visible="false" />
                                        <asp:TemplateField HeaderText="DeliveryNo" ItemStyle-Width="100">
                                            <ItemTemplate>
                                                <asp:Label ID="DeliveryNo" runat="server" Text='<%#Eval("DELNO") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="DeliveryQty" ItemStyle-Width="100">
                                            <ItemTemplate>
                                                <asp:Label ID="DeliveryQty" runat="server" Text='<%#Eval("DeliveryQty") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="PromisedQty" ItemStyle-Width="100">
                                            <ItemTemplate>
                                                <asp:Label ID="PromisedQty" runat="server" Text='<%#Eval("PromisedQty") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="RevisedDate" ItemStyle-Width="100">
                                            <ItemTemplate>
                                                <asp:Label ID="RevisedDate" runat="server" Text='<%#Eval("RevisedDate","{0:dd/MMM/yyyy}") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="DeliveryDate" ItemStyle-Width="100">
                                            <ItemTemplate>
                                                <asp:Label ID="DeliveryDate" runat="server" Text='<%#Eval("DeliveryDate","{0:dd/MMM/yyyy}") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Comment" ItemStyle-Width="100">
                                            <ItemTemplate>
                                                <asp:Label ID="Comment" runat="server" Text='<%#Eval("Comment") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                </asp:GridView>
                            </asp:Panel>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <%--<asp:TemplateField HeaderText="CAABID" SortExpression="CAABID" Visible="false">
                                <ItemTemplate>
                                <asp:Label ID="CAABID" runat="server" Text='<%#Eval("CAABID") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>--%>
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
                     <asp:TemplateField HeaderText="Delivery" >
                        <ItemTemplate>
                            <asp:Button ID="BtnSingleBreakDown"  runat="server" Text="Single" OnClick="BtnSingleBreakDown_Click" CssClass="btn btn-info" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Delivery">
                        <ItemTemplate>
                            <asp:Button ID="BtnBreakDown" runat="server" Text="Multiple" OnClick="BtnBreakDown_Click" CssClass="btn btn-warning" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="">
                        <ItemTemplate>
                            <asp:CheckBox ID="Tick" runat="server" CssClass="BigCheckBox" AutoPostBack="false" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Buyer" Visible="true">
                        <ItemTemplate>
                            <asp:Label ID="BuyerName" runat="server" Text='<%#Eval("BuyerName") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Style">
                        <ItemTemplate>
                            <asp:Label ID="StyleNo" runat="server" Text='<%#Eval("StyleNo") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Item" Visible="true">
                        <ItemTemplate>
                            <asp:Label ID="ItemDescription" runat="server" Text='<%#Eval("ItemDescription") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Department" SortExpression="" Visible="true">
                        <ItemTemplate>
                            <asp:Label ID="DeptName" runat="server" Text='<%#Eval("DeptName") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="S Mode" SortExpression="" Visible="true">
                        <ItemTemplate>
                            <asp:Label ID="ShipMode" runat="server" Text='<%#Eval("ShipMode") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Color" Visible="true">
                        <ItemTemplate>
                            <asp:Label ID="ColorName" runat="server" Text='<%#Eval("ColorName") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="BPONo" Visible="true">
                        <ItemTemplate>
                            <asp:Label ID="BuyerPONo" runat="server" Text='<%#Eval("BuyerPONo") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Contract #" Visible="true">
                        <ItemTemplate>
                            <asp:Label ID="ContractNo" runat="server" Text='<%#Eval("ContractNo") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="BPO Qty" Visible="true">
                        <ItemTemplate>
                            <asp:Label ID="BuyerPOQty" runat="server" Text='<%#Eval("BuyerPOQty") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="SPO Qty " Visible="true">
                        <ItemTemplate>
                            <asp:Label ID="SumithraPOQty" runat="server" Text='<%#Eval("SumithraPOQty") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="POShipDate" Visible="false">
                        <ItemTemplate>
                            <asp:Label ID="POShipDate" runat="server" Text='<%#Eval("POShipDate","{0:dd/MMM/yyyy}") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Ex Date" Visible="true">
                        <ItemTemplate>
                            <asp:Label ID="ShipDate" runat="server" Text='<%#Eval("ExtendedShipDate","{0:dd/MMM/yyyy}") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="WRH" Visible="true">
                        <ItemTemplate>
                            <asp:Label ID="WRH" runat="server" Text='<%#Eval("WRH") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="FOB" Visible="true">
                        <ItemTemplate>
                            <asp:Label ID="FOB" runat="server" Text='<%#Eval("FOB","{0:0.00}") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Scheduled" Visible="true">
                        <ItemTemplate>
                            <asp:Label ID="Scheduled" runat="server" Text='<%#Eval("ScheduledFactory") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="US Qty" Visible="true">
                        <ItemTemplate>
                            <asp:Label ID="UnplannedShipQty" runat="server" Text='<%#Eval("UnplannedShipQty") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                     <%-- <asp:TemplateField HeaderText="">
                        <ItemTemplate>
                            <asp:Button ID="BtnView" CssClass="btn btn-primary" runat="server" Text="View" OnClick="BtnView_Click" />
                        </ItemTemplate>
                    </asp:TemplateField>--%>
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
                <div class="row">
                    <div class="col-md-12">
                        <div class="panel panel-default">
                            <div class="panel-body">
                                <div class="col-md-3">
                                    <strong>
                                        <asp:Label ID="Label1" runat="server" Text="BuyerPONo:"></asp:Label>
                                    </strong>&nbsp;<asp:Label ID="lblBPO" runat="server"></asp:Label>
                                </div>
                                <div class="col-md-3">
                                    <strong>
                                        <asp:Label ID="Label3" runat="server" Text="ContractNo :"></asp:Label>
                                        &nbsp;</strong><asp:Label ID="lblContractNo" runat="server"></asp:Label>
                                </div>
                                <div class="col-md-3">
                                    <strong>
                                        <asp:Label ID="Label5" runat="server" Text="ColorName  :"></asp:Label>
                                        &nbsp; </strong>
                                    <asp:Label ID="lblColorName" runat="server"></asp:Label>
                                </div>
                                <div class="col-md-3">
                                    <strong>
                                        <asp:Label ID="Label7" runat="server" Text="SumithraPOQty :"></asp:Label>
                                        &nbsp;</strong><asp:Label ID="lblSPOQty" runat="server"></asp:Label>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12">
                        <div class="card" style="width: 100%; height: 100%">
                            <ul class="nav nav-tabs" role="tablist">
                                <li role="presentation" class="active"><a href="#add" aria-controls="add" role="tab" data-toggle="tab">Add</a></li>
                                <li role="presentation"><a href="#view" aria-controls="view" role="tab" data-toggle="tab">View</a></li>
                                <%--<li role="presentation"><a href="#summary" aria-controls="summary" role="tab" data-toggle="tab">Delivery History</a></li>--%>
                            </ul>
                            <div class="tab-content">
                                <div role="tabpanel" class="tab-pane active" id="add">
                                    <div class="col-md-12">
                                        <div class="box-body">
                                            <div class="form-group">
                                                <label class="col-md-2 control-label">Promissed Qty :</label>
                                                <div class="col-md-2">
                                                    <asp:TextBox ID="txtQty" runat="server" CssClass="form-control" ></asp:TextBox>
                                             <%--           onkeypress="return isNumberKey(event)"></asp:TextBox>--%>
                                                </div>
                                                <div class="col-md-3" style="color: #006600">
                                                    (Unplanned Ship Qty :<strong><asp:Label ID="lblRemainingQty" runat="server"
                                                        ForeColor="#006600"></asp:Label></strong>)
                                                </div>
                                                <div class="col-md-3">
                                                    <asp:RequiredFieldValidator ID="RFVQty" runat="server" ValidationGroup="addbtn" ForeColor="Red"
                                                        ErrorMessage="* Required" ControlToValidate="txtQty"></asp:RequiredFieldValidator>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                   
                                    <div class="col-md-12">
                                        <div class="box-body">
                                            <div class="form-group">
                                                <label class="col-md-2 control-label">Promissed Date :</label>
                                                <div class="col-md-2">
                                                    <BDP:BasicDatePicker ID="BDPDate" runat="server" onvaluechanged="DatePickerDueDate_ValueChanged" />
                                                </div>
                                                <div class="col-md-1">
                                                    <%--   <asp:RequiredFieldValidator ID="RFVDate" runat="server" ValidationGroup="addbtn" ForeColor="Red"
                                                        ErrorMessage="* Required" ControlToValidate="BDPDate"></asp:RequiredFieldValidator>--%>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-12">
                                        <div class="box-body">
                                            <div class="form-group">
                                                <label class="col-md-2 control-label">Comment :</label>
                                                <div class="col-md-5">
                                                    <asp:TextBox ID="txtComment" TextMode="MultiLine" runat="server" Rows="3" CssClass="form-control"></asp:TextBox>
                                                </div>
                                                <div class="col-md-3">
                                                    <asp:Button ID="btnUpdate" CssClass="btn btn-primary" runat="server" Text="Update" OnClick="btnUpdate_Click" Visible="false" />
                                                    <asp:Button ID="btnupdateCancel" CssClass="btn btn-warning" runat="server" Text="Cancel" OnClick="btncancel_Click" Visible="false" />
                                                    <asp:Button ID="btnAdd" CssClass="btn btn-success" runat="server" ValidationGroup="addbtn" Text="Add" OnClick="btnAdd_Click" />

                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div role="tabpanel" class="tab-pane" id="view">
                                    <div class="col-md-12">
                                        <div class="box-body">
                                          
                                            <div class="col-md-12">
                                                <asp:GridView ID="gvDeliveryBD" runat="server" AutoGenerateColumns="False" OnRowDataBound="gvDeliveryBD_RowDataBound" DataKeyNames="DID"
                                              OnSorting="gvDeliveryBD_Sorting" OnPageIndexChanging="gvDeliveryBD_PageIndexChanging"
                                                    BackColor="White" BorderWidth="1px" CellPadding="4"
                                                    EnableModelValidation="True" ForeColor="Black" Width="90%">
                                                    <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White"
                                                        Wrap="False" />
                                                    <Columns>
                                                         <asp:TemplateField>
                        <ItemTemplate>
                            <img alt="" style="cursor: pointer" src="Images/Plus.png" />
                            <asp:Panel ID="pnlChild" runat="server" Style="display: none">
                                <asp:GridView ID="gvSubDeliveries" runat="server" AutoGenerateColumns="false" HeaderStyle-BackColor="#c1bcbc" RowStyle-Wrap="False" Width="60%">
                                    <Columns>
                                        <asp:BoundField DataField="DID" HeaderText="DID" Visible="false" />
                                         <asp:TemplateField HeaderText="RevisedDate" ItemStyle-Width="100">
                                            <ItemTemplate>
                                                <asp:Label ID="RevisedDate" runat="server" Text='<%#Eval("RevisedDate","{0:dd/MMM/yyyy}") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="DeliveryNo" ItemStyle-Width="100">
                                            <ItemTemplate>
                                                 
                                                <asp:Label ID="DeliveryNo" runat="server" Text='<%#Eval("DeliveryNo") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="DeliveryQty" ItemStyle-Width="100">
                                            <ItemTemplate>
                                             
                                                <asp:Label ID="DeliveryQty" runat="server" Text='<%#Eval("DeliveryQty") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                       
                                        <asp:TemplateField HeaderText="DeliveryDate" ItemStyle-Width="100">
                                            <ItemTemplate>
                                              
                                                <asp:Label ID="DeliveryDate" runat="server" Text='<%#Eval("DeliveryDate","{0:dd/MMM/yyyy}") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                       
                                        <asp:TemplateField HeaderText="Comment" ItemStyle-Width="100">
                                            <ItemTemplate>
                                                <asp:Label ID="Comment" runat="server" Text='<%#Eval("Comment") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                </asp:GridView>
                            </asp:Panel>
                        </ItemTemplate>
                    </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="DID" Visible="false">
                                                            <ItemTemplate>
                                                                <asp:Label ID="DID" runat="server" Text='<%#Eval("DID") %>'></asp:Label>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                       
                                                      
                                                        <asp:TemplateField HeaderText="Revised Date">
                                                            <ItemTemplate>
                                                                <asp:Label ID="RevisedDate" runat="server"
                                                                    Text='<%# Eval("RevisedDate", "{0:dd/MM/yyyy}") %>'></asp:Label>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Delivery#">
                                                            <ItemTemplate>
                                                               <asp:Label ID="DeliveryNo" runat="server" Text='<%#Eval("DeliveryNo") %>'></asp:Label>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                       
                                                        <asp:TemplateField HeaderText="Promissed Qty">
                                                            <ItemTemplate>
                                                                  <asp:TextBox ID="txtPromisedQty" runat="server" Text='<%#Eval("DeliveryQty") %>' Width="90px" />
                                                               
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Delivery Date">
                                                            <ItemTemplate>
                                                                <BDP:BasicDatePicker  ID="BDPDeliveryDate"  Text='<%# Eval("DeliveryDate", "{0:dd/MM/yyyy}") %>'  runat="server" CssClass="form-control" />
                                                                <%--<asp:Label ID="DeliveryDate" runat="server" Text='<%#Eval("DeliveryDate") %>' Width="90px" />--%>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Comment">
                                                            <ItemTemplate>
                                                               <asp:TextBox ID="txtgvComment" runat="server" Text='<%#Eval("Comment") %>' Width="90px" />
                                                                
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="" ItemStyle-HorizontalAlign="Center">
                                                            <ItemTemplate>
                                                                <asp:Button ID="btnUpdate" runat="server" CssClass="btn btn-info"
                                                                    OnClick="btnUpdate_Click1" Text="Update" />
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        
                                                    </Columns>
                                                </asp:GridView>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                              <%--  <div role="tabpanel" class="tab-pane" id="summary">
                                    <div class="col-md-12">
                                        <div class="box-body">
                                            <br />
                                            <asp:GridView ID="gvSummaryDeliveryBD" runat="server"
                                                AutoGenerateColumns="False" BackColor="White" BorderWidth="1px" CellPadding="4"
                                                EnableModelValidation="True" ForeColor="Black" Width="90%">
                                                <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White"
                                                    Wrap="False" />
                                                <Columns>
                                                    <asp:TemplateField HeaderText="DBID" Visible="false">
                                                        <ItemTemplate>
                                                            <asp:Label ID="DBID" runat="server" Text='<%#Eval("DBID") %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="OrderNo" Visible="false">
                                                        <ItemTemplate>
                                                            <asp:Label ID="OrderNo" runat="server" Text='<%#Eval("OrderNo") %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="BPOID" Visible="false">
                                                        <ItemTemplate>
                                                            <asp:Label ID="BPOID" runat="server" Text='<%#Eval("BPOID") %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="BPOSEQ" Visible="false">
                                                        <ItemTemplate>
                                                            <asp:Label ID="BPOSEQ" runat="server" Text='<%#Eval("BPOSEQ") %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="SDID" Visible="false">
                                                        <ItemTemplate>
                                                            <asp:Label ID="SDID" runat="server" Text='<%#Eval("SDID") %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="SDSEQ" Visible="false">
                                                        <ItemTemplate>
                                                            <asp:Label ID="SDSEQ" runat="server" Text='<%#Eval("SDSEQ") %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Status" Visible="false">
                                                        <ItemTemplate>
                                                            <asp:Label ID="Status" runat="server" Text='<%#Eval("Status") %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Revised Date">
                                                        <ItemTemplate>
                                                            <asp:Label ID="RevisedDate" runat="server"
                                                                Text='<%# Eval("RevisedDate", "{0:dd/MM/yyyy}") %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Delivery#">
                                                        <ItemTemplate>
                                                            <asp:Label ID="DeliveryNopre" runat="server" Text="Del#"></asp:Label><asp:Label ID="DeliveryNo" runat="server" Text='<%#Eval("DeliveryNo") %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Delivery Qty">
                                                        <ItemTemplate>
                                                              <asp:TextBox ID="txtDeliveryQty" runat="server" Text='<%#Eval("DeliveryQty") %>' Width="90px" />
                                                            <asp:Label ID="DeliveryQty" runat="server" Text='<%#Eval("DeliveryQty") %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Promissed Qty">
                                                        <ItemTemplate>
                                                          <asp:TextBox ID="txtPromisedQty" runat="server" Text='<%#Eval("PromisedQty") %>' Width="90px" />
                                                            <asp:Label ID="PromisedQty" runat="server" Text='<%#Eval("PromisedQty") %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Delivery Date">
                                                        <ItemTemplate>
                                                            <asp:Label ID="DeliveryDate" runat="server"
                                                                Text='<%# Eval("DeliveryDate", "{0:dd/MM/yyyy}") %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Comment">
                                                        <ItemTemplate>
                                                            <asp:Label ID="Comment" runat="server" Text='<%#Eval("Comment") %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                </Columns>
                                            </asp:GridView>
                                        </div>
                                    </div>
                                </div>--%>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </asp:Panel>
    </form>
</body>
</html>
