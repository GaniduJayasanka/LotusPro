<%@ page language="C#" autoeventwireup="true" inherits="Dashboard, App_Web_cjp5ygzm" %>

<%@ Register Assembly="BasicFrame.WebControls.BasicDatePicker" Namespace="BasicFrame.WebControls" TagPrefix="BDP" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Dashboard</title>


 

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

       <script src="js/jquery-2.1.1.js"></script>
      <script language="javascript" >
          $(document).ready(function () {
              var gridHeader = $('#<%=GVMSPShedule.ClientID%>').clone(true); // Here Clone Copy of Gridview with style
              $(gridHeader).find("tr:gt(0)").remove(); // Here remove all rows except first row (header row)
              $('#<%=GVMSPShedule.ClientID%> tr th').each(function (i) {
                  // Here Set Width of each th from gridview to new table(clone table) th 
                  $("th:nth-child(" + (i + 1) + ")", gridHeader).css('width', ($(this).width()).toString() + "px");
              });
              $('#GHead').css('position', 'absolute');
              $("#GHead").append(gridHeader);
         
             // $('#GHead').css('top', $('#<%=GVMSPShedule.ClientID%>').offset().top);

          });
            </script>

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
                    <center><h3>MSP Dashboard</h3></center>
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
                                            <label class="col-md-2 control-label">Ship Date   From<span style="color: red">*</span></label>
                                            <div class="col-md-3">
                                                <span class="auto-style1"></span>
                                                <BDP:BasicDatePicker ID="DatePickerFromDate" runat="server" CssClass="form-control" />
                                            </div>
                                            <label class="col-md-1 control-label">To <span style="color: red">*</span></label>
                                            <div class="col-md-3">
                                                <span class="auto-style1"></span>
                                                <BDP:BasicDatePicker ID="DatePickerToDate" runat="server" CssClass="form-control" />
                                            </div>
                                            <label class="col-md-1 control-label">Plant <span style="color: red">*</span></label>
                                            <div class="col-md-1">
                                                <%--SELECT SEQ AS ID,CASE Seq when 1 then 'SUB' when 2 then 'SP'when 3 then 'SW'when 4 then 'SH'when 5 then 'SN'  "
 + "  END AS Plant FROM Commercial.dbo.Company Where SEQ NOT IN (6,1--%>
                                                <asp:DropDownList ID="DDLPlant" runat="server" CssClass="form-control">
                                                    <asp:ListItem Value="1">All</asp:ListItem>
                                                    <asp:ListItem Value="2">SP</asp:ListItem>
                                                    <asp:ListItem Value="3">SW</asp:ListItem>
                                                    <asp:ListItem Value="4">SH</asp:ListItem>
                                                    <asp:ListItem Value="5">SN</asp:ListItem>
                                                </asp:DropDownList>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="box-body">
                                        <div class="form-group">
                                            <label class="col-md-2 control-label">Type</label>
                                            <div class="col-md-2">
                                                <asp:DropDownList ID="ddlType" runat="server" CssClass="form-control">
                                                    <%-- <asp:ListItem> </asp:ListItem>--%>
                                                    <asp:ListItem Value="1">Cumulative Shipments</asp:ListItem>
                                                    <asp:ListItem Value="2">Over Shipments</asp:ListItem>
                                                    <asp:ListItem Value="3">Short Shipments</asp:ListItem>
                                                </asp:DropDownList>
                                            </div>
                                            <div class="col-md-4">
                                                <asp:Button ID="Button1" runat="server" CssClass="btn btn-info" OnClick="btnSearch_Click" Text="Search" Width="100px" />
                                                <asp:Button ID="Button2" runat="server" CssClass="btn btn-warning" Text="Reset" Width="100px" OnClick="Button2_Click" />
                                            </div>
                                            <label class="col-md-3 control-label" style="font-size: larger; border: solid; padding: 5px 5px 5px 5px;">
                                                Total Exp.Inc ($) :
                            <asp:Label ID="lblTotalExpInc" runat="server"></asp:Label></label>
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
                
                   <div style="width:13000px;">
                    <div id="GHead"></div> 
                    <%-- This GHead is added for Store Gridview Header  --%>
                    <div style="height:370px; overflow:auto">
                    <asp:GridView ID="GVMSPShedule" OnRowDataBound="GVMSPShedule_RowDataBound" runat="server" OnSorting="GVMSPShedule_Sorting" AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC"
                        BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black"
                        AllowSorting="True" Font-Size="Small"
                        EnableModelValidation="True" Width="1285px">
                        <Columns>
                            <asp:TemplateField HeaderText="" SortExpression="">
                                <ItemTemplate>
                                    <asp:ImageButton ID="imgbtnView" OnClick="imgbtnView_Click" runat="server" Height="30px" ImageUrl="~/images/DPlus.png" ToolTip="Add new Item" Width="30px" />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField Visible="false" HeaderText="No" ItemStyle-BackColor="DarkGray" HeaderStyle-BackColor="Olive">
                                <ItemTemplate>
                                    <asp:Label ID="No" runat="server" Text='<%# Container.DataItemIndex + 1 %>'></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle BackColor="Olive"></HeaderStyle>
                                <ItemStyle BackColor="DarkGray"></ItemStyle>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="BuyerID" SortExpression="BuyerID" Visible="false">
                                <ItemTemplate>
                                    <asp:Label ID="BuyerID" runat="server" Text='<%#Eval("BuyerID") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Buyer" SortExpression="BuyerName" Visible="true">
                                <ItemTemplate>
                                    <asp:Label ID="BuyerName" runat="server" Text='<%#Eval("BuyerName") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="BPOQTY" SortExpression="BPOQTY" Visible="true">
                                <ItemTemplate>
                                    <asp:Label ID="BPOQTY" runat="server" Text='<%#Eval("BPOQTY") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="No. Of Styles" Visible="true" ItemStyle-HorizontalAlign="Right" SortExpression="NoOfStyles">
                                <ItemTemplate>
                                    <asp:Label ID="NoOfStyles" runat="server" Text='<%#Eval("NoOfStyles") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="SPO Qty" Visible="true" ItemStyle-HorizontalAlign="Right" SortExpression="SPOQty">
                                <ItemTemplate>
                                    <asp:Label ID="SPOQty" runat="server" Text='<%#Eval("SPOQty") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Commited Qty" Visible="true" ItemStyle-HorizontalAlign="Right" SortExpression="CommitedQty">
                                <ItemTemplate>
                                    <asp:Label ID="CommitedQty" runat="server" Text='<%#Eval("CommitedQty") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Shipped Qty" Visible="true" ItemStyle-HorizontalAlign="Right" SortExpression="ShippedQty">
                                <ItemTemplate>
                                    <asp:Label ID="ShippedQty" runat="server" Text='<%#Eval("ShippedQty") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Short/Over Qty" Visible="true" ItemStyle-HorizontalAlign="Right" SortExpression="ShortOver_Qty">
                                <ItemTemplate>
                                    <asp:Label ID="ShortOver_Qty" runat="server" Text='<%#Eval("ShortOver_Qty") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="%" Visible="true" ItemStyle-HorizontalAlign="Right" SortExpression="Percentage">
                                <ItemTemplate>
                                    <asp:Label ID="Percentage" ToolTip="(Short/Over Qty X 100) / Commited Qty" runat="server" Text='<%#Eval("Percentage","{0:n}")%>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Short/Over Ship Value ($)" Visible="true" ItemStyle-HorizontalAlign="Right" SortExpression="ShortShipValue">
                                <ItemTemplate>
                                    <asp:Label ID="ShortShipValue" runat="server" Text=' <%#Eval("ShortShipValue","{0:n}")%>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Waved OFF Qty" Visible="false" ItemStyle-HorizontalAlign="Right" SortExpression="WavedOFFQty">
                                <ItemTemplate>
                                    <asp:Label ID="WavedOFFQty" runat="server" Text='<%#Eval("WavedOFFQty") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                        <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
                        <%-- <HeaderStyle Wrap="true" BackColor="#333333" Font-Bold="True" ForeColor="White" />--%>
                        <FooterStyle BackColor="#333333" Font-Bold="True" ForeColor="White" CssClass="GVFixedFooter" />
                        <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" CssClass="GVFixedHeader" />
                    </asp:GridView>
                        </div>
                       </div>
                    
                </div>
                <div>
                    <asp:Panel ID="PanelBuyerDetails" runat="server">
                        <div class="col-md-12">
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="panel panel-default">
                                        <div class="panel-body">
                                            <div class="row">
                                                <div class="box-body">
                                                    <div class="form-group">
                                                        <label class="col-md-1 control-label">Buyer</label>
                                                        <div class="col-md-4">
                                                            <asp:Label ID="lblBuyer" runat="server" Text=""></asp:Label>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="box-body">
                                                    <div class="form-group">
                                                        <%-- <div class="col-md-1">
                                                        </div>--%>
                                                        <div class="col-md-11">
                                                            <asp:GridView ID="GVBuyerDetails" OnRowDataBound="GVBuyerDetails_RowDataBound" runat="server" AllowSorting="True" AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" EnableModelValidation="True" Font-Size="Small" ForeColor="Black" Style="max-width: 100%; min-width: 90%">
                                                                <Columns>
                                                                    <asp:TemplateField Visible="true">
                                                                        <ItemTemplate>
                                                                            <asp:ImageButton ID="imgbtnBuyerView" runat="server" Height="30px" ImageUrl="~/images/DPlus.png" OnClick="imgbtnBuyerView_Click" ToolTip="Add new Item" Width="30px" />
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="OrderNo" Visible="false">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="OrderNo" runat="server" Text='<%#Eval("OrderNo") %>'></asp:Label>
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="StyleNo">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="StyleNo" runat="server" Text='<%#Eval("StyleNo") %>'></asp:Label>
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="SSNo" Visible="true">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="SSNo" runat="server" Text='<%#Eval("SSNo") %>'></asp:Label>
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="BPOQTY" Visible="true">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="BPOQTY" runat="server" Text='<%#Eval("BPOQTY") %>'></asp:Label>
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="SPO Qty" ItemStyle-HorizontalAlign="Right" Visible="true">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="SPOQty" runat="server" Text='<%#Eval("SPOQty") %>'></asp:Label>
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="Commited Qty" ItemStyle-HorizontalAlign="Right" Visible="true">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="CommitedQty" runat="server" Text='<%#Eval("CommitedQty") %>'></asp:Label>
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="Shipped Qty" ItemStyle-HorizontalAlign="Right" Visible="true">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="ShippedQty" runat="server" Text='<%#Eval("ShippedQty","{0:n}") %>'></asp:Label>
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="Short/Over Qty" ItemStyle-HorizontalAlign="Right" Visible="true">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="ShortOver_Qty" runat="server" Text='<%#Eval("ShortOver_Qty") %>'></asp:Label>
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="%" Visible="true" ItemStyle-HorizontalAlign="Right">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="Percentage" ToolTip="(Short/Over Qty X 100) / Commited Qty" runat="server" Text='<%#Eval("Percentage","{0:n}")%>'></asp:Label>
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="Short/Over Ship Value ($)" ItemStyle-HorizontalAlign="Right" Visible="true">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="ShortShipValue" runat="server" Text=' <%#Eval("ShortShipValue","{0:n}")%>'></asp:Label>
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="FOB ($)" ItemStyle-HorizontalAlign="Right" Visible="true">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="FOB" runat="server" Text='<%#Eval("FC","{0:n}") %>'></asp:Label>
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="Waved OFF Qty" ItemStyle-HorizontalAlign="Right" Visible="true">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="WavedOFFQty" runat="server" Text='<%#Eval("WavedOFFQty") %>'></asp:Label>
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                </Columns>
                                                                <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
                                                                <FooterStyle BackColor="#333333" CssClass="GVFixedFooter" Font-Bold="True" ForeColor="White" />
                                                                <HeaderStyle BackColor="#333333" CssClass="GVFixedHeader" Font-Bold="True" ForeColor="White" />
                                                            </asp:GridView>
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
                </div>
                <div>
                    <asp:Panel ID="PanelStyleDetails" runat="server">
                        <div class="col-md-12">
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="panel panel-default">
                                        <div class="panel-body">
                                            <div class="row">
                                                <div class="box-body">
                                                    <div class="form-group">
                                                        <label class="col-md-1 control-label">Style</label>
                                                        <div class="col-md-4">
                                                            <asp:Label ID="lblStyleNo" runat="server" Text=""></asp:Label>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="box-body">
                                                    <div class="form-group">
                                                        <%--<div class="col-md-1">
                                                        </div>--%>
                                                        <div class="col-md-11">
                                                            <asp:GridView ID="GVStyleDetails" OnRowDataBound="GVStyleDetails_RowDataBound" runat="server" AllowSorting="True" AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" EnableModelValidation="True" Font-Size="Small" ForeColor="Black" Style="max-width: 100%; min-width: 90%">
                                                                <Columns>
                                                                    <asp:TemplateField Visible="true">
                                                                        <ItemTemplate>
                                                                            <asp:ImageButton ID="imgbtnStyleView" runat="server" Height="30px" ImageUrl="~/images/DPlus.png" OnClick="imgbtnStyleView_Click" ToolTip="Add new Item" Width="30px" />
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="StyleNo" Visible="false">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="StyleNo" runat="server" Text='<%#Eval("StyleNo") %>'></asp:Label>
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="OrderNo" Visible="false">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="OrderNo" runat="server" Text='<%#Eval("OrderNo") %>'></asp:Label>
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="POID" Visible="false">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="POID" runat="server" Text='<%#Eval("POID") %>'></asp:Label>
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="BuyerPONo" Visible="true">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="BuyerPONo" runat="server" Text='<%#Eval("BuyerPONo") %>'></asp:Label>
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="ContractNo" Visible="true">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="ContractNo" runat="server" Text='<%#Eval("ContractNo") %>'></asp:Label>
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="BPOQTY" Visible="true">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="BPOQTY" runat="server" Text='<%#Eval("BPOQTY") %>'></asp:Label>
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="SPO Qty" ItemStyle-HorizontalAlign="Right" Visible="true">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="SPOQty" runat="server" Text='<%#Eval("SPOQty") %>'></asp:Label>
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="Commited Qty" ItemStyle-HorizontalAlign="Right" Visible="true">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="CommitedQty" runat="server" Text='<%#Eval("CommitedQty") %>'></asp:Label>
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="Shipped Qty" ItemStyle-HorizontalAlign="Right" Visible="true">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="ShippedQty" runat="server" Text='<%#Eval("ShippedQty") %>'></asp:Label>
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="Short/Over Qty" ItemStyle-HorizontalAlign="Right" Visible="true">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="ShortOver_Qty" runat="server" Text='<%#Eval("ShortOver_Qty") %>'></asp:Label>
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="%" Visible="true" ItemStyle-HorizontalAlign="Right">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="Percentage" ToolTip="(Short/Over Qty X 100) / Commited Qty" runat="server" Text='<%#Eval("Percentage","{0:n}")%>'></asp:Label>
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="Short/Over Ship Value ($)" ItemStyle-HorizontalAlign="Right" Visible="true">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="ShortShipValue" runat="server" Text=' <%#Eval("ShortShipValue","{0:n}")%>'></asp:Label>
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="FOB ($)" ItemStyle-HorizontalAlign="Right" Visible="true">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="FOB" runat="server" Text='<%#Eval("FC","{0:n}") %>'></asp:Label>
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="Waved OFF Qty" ItemStyle-HorizontalAlign="Right" Visible="true">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="WavedOFFQty" runat="server" Text='<%#Eval("WavedOFFQty") %>'></asp:Label>
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                </Columns>
                                                                <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
                                                                <FooterStyle BackColor="#333333" CssClass="GVFixedFooter" Font-Bold="True" ForeColor="White" />
                                                                <HeaderStyle BackColor="#333333" CssClass="GVFixedHeader" Font-Bold="True" ForeColor="White" />
                                                            </asp:GridView>
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
                </div>
                <div>
                    <asp:Panel ID="PanelColorDetails" runat="server">
                        <div class="col-md-12">
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="panel panel-default">
                                        <div class="panel-body">
                                            <div class="row">
                                                <div class="box-body">
                                                    <div class="form-group">
                                                        <label class="col-md-1 control-label">Style</label>
                                                        <div class="col-md-4">
                                                            <asp:Label ID="LblStyle" runat="server" Text=""></asp:Label>
                                                        </div>
                                                        <label class="col-md-1 control-label">BPO No</label>
                                                        <div class="col-md-2">
                                                            <asp:Label ID="LblBuyerPONo" runat="server" Text=""></asp:Label>
                                                        </div>
                                                        <label class="col-md-1 control-label">ContractNo</label>
                                                        <div class="col-md-2">
                                                            <asp:Label ID="LblContractNo" runat="server" Text=""></asp:Label>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="box-body">
                                                    <div class="form-group">
                                                        <%--<div class="col-md-1">
                                                        </div>--%>
                                                        <div class="col-md-11">
                                                            <asp:GridView ID="GVColorDetails" OnRowDataBound="GVColorDetails_RowDataBound" runat="server" AllowSorting="True" AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" EnableModelValidation="True" Font-Size="Small" ForeColor="Black" Style="max-width: 100%; min-width: 90%">
                                                                <Columns>
                                                                    <asp:TemplateField Visible="true">
                                                                        <ItemTemplate>
                                                                            <asp:ImageButton ID="imgbtnColorView" runat="server" Height="30px" ImageUrl="~/images/DPlus.png" OnClick="imgbtnColorView_Click" ToolTip="Add new Item" Width="30px" />
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="OrderNo" Visible="false">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="OrderNo" runat="server" Text='<%#Eval("OrderNo") %>'></asp:Label>
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="StyleNo" Visible="false">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="StyleNo" runat="server" Text='<%#Eval("StyleNo") %>'></asp:Label>
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="SSNo" Visible="false">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="SSNo" runat="server" Text='<%#Eval("SSNo") %>'></asp:Label>
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="BuyerName" Visible="false">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="BuyerName" runat="server" Text='<%#Eval("BuyerName") %>'></asp:Label>
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="BuyerPONo" Visible="true">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="BuyerPONo" runat="server" Text='<%#Eval("BuyerPONo") %>'></asp:Label>
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="ContractNo" Visible="true">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="ContractNo" runat="server" Text='<%#Eval("ContractNo") %>'></asp:Label>
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="ColorCode" Visible="true">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="ColorCode" runat="server" Text='<%#Eval("ColorCode") %>'></asp:Label>
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="ColorName" Visible="true">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="ColorName" runat="server" Text='<%#Eval("ColorName") %>'></asp:Label>
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="POID" Visible="false">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="POID" runat="server" Text='<%#Eval("POID") %>'></asp:Label>
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="BuyerID" Visible="false">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="BuyerID" runat="server" Text='<%#Eval("BuyerID") %>'></asp:Label>
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="NoOfStyles" Visible="false">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="NoOfStyles" runat="server" Text='<%#Eval("NoOfStyles") %>'></asp:Label>
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="BPOQTY" Visible="true">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="BPOQTY" runat="server" Text='<%#Eval("BPOQTY") %>'></asp:Label>
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="SPO Qty" ItemStyle-HorizontalAlign="Right" Visible="true">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="SPOQty" runat="server" Text='<%#Eval("SPOQty") %>'></asp:Label>
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="Commited Qty" ItemStyle-HorizontalAlign="Right" Visible="true">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="CommitedQty" runat="server" Text='<%#Eval("CommitedQty") %>'></asp:Label>
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="Shipped Qty" ItemStyle-HorizontalAlign="Right" Visible="true">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="ShippedQty" runat="server" Text='<%#Eval("ShippedQty","{0:n}") %>'></asp:Label>
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="Short/Over Qty" ItemStyle-HorizontalAlign="Right" Visible="true">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="ShortOver_Qty" runat="server" Text='<%#Eval("ShortOver_Qty") %>'></asp:Label>
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="%" Visible="true" ItemStyle-HorizontalAlign="Right">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="Percentage" ToolTip="(Short/Over Qty X 100) / Commited Qty" runat="server" Text='<%#Eval("Percentage","{0:n}")%>'></asp:Label>
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="Short/Over Ship Value ($)" ItemStyle-HorizontalAlign="Right" Visible="true">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="ShortShipValue" runat="server" Text=' <%#Eval("ShortShipValue","{0:n}")%>'></asp:Label>
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="FOB ($)" ItemStyle-HorizontalAlign="Right" Visible="true">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="FOB" runat="server" Text='<%#Eval("FC","{0:n}") %>'></asp:Label>
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="Waved OFF Qty" ItemStyle-HorizontalAlign="Right" Visible="true">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="WavedOFFQty" runat="server" Text='<%#Eval("WavedOFFQty") %>'></asp:Label>
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="StyleID" Visible="true">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="StyleID" runat="server" Text='<%#Eval("StyleID") %>'></asp:Label>
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="SDSEQ" Visible="true">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="SDSEQ" runat="server" Text='<%#Eval("SDSEQ") %>'></asp:Label>
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                </Columns>
                                                                <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
                                                                <FooterStyle BackColor="#333333" CssClass="GVFixedFooter" Font-Bold="True" ForeColor="White" />
                                                                <HeaderStyle BackColor="#333333" CssClass="GVFixedHeader" Font-Bold="True" ForeColor="White" />
                                                            </asp:GridView>
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
                </div>
                <div>
                    <asp:Panel ID="PanelDeliveryDetails" runat="server">
                        <div class="col-md-12">
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="panel panel-default">
                                        <div class="panel-body">
                                            <div class="row">
                                                <div class="box-body">
                                                    <div class="form-group">
                                                        <div class="col-md-12">
                                                            <div class="row">
                                                                <label class="col-md-1 control-label">Style</label>
                                                                <div class="col-md-4">
                                                                    <asp:Label ID="LbStyle" runat="server" Text=""></asp:Label>
                                                                </div>
                                                                <label class="col-md-1 control-label">BPO No</label>
                                                                <div class="col-md-2">
                                                                    <asp:Label ID="LbBPONo" runat="server" Text=""></asp:Label>
                                                                </div>
                                                            </div>
                                                            <div class="row">
                                                                <label class="col-md-1 control-label">Color Name</label>
                                                                <div class="col-md-4">
                                                                    <asp:Label ID="LblColorName" runat="server" Text=""></asp:Label>
                                                                </div>
                                                                <label class="col-md-1 control-label">ContractNo</label>
                                                                <div class="col-md-2">
                                                                    <asp:Label ID="LbContractNo" runat="server" Text=""></asp:Label>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="box-body">
                                                    <div class="form-group">
                                                        <%-- <div class="col-md-1">
                                                        </div>--%>
                                                        <div class="col-md-11">
                                                            <asp:GridView ID="GVDeliveryDetails" OnRowDataBound="GVDeliveryDetails_RowDataBound" runat="server" AllowSorting="True" AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" EnableModelValidation="True" Font-Size="Small" ForeColor="Black" Style="max-width: 100%; min-width: 90%">
                                                                <Columns>
                                                                    <asp:TemplateField HeaderText="OrderNo" Visible="false">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="OrderNo" runat="server" Text='<%#Eval("OrderNo") %>'></asp:Label>
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="StyleNo" Visible="false">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="StyleNo" runat="server" Text='<%#Eval("StyleNo") %>'></asp:Label>
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="SSNo" Visible="false">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="SSNo" runat="server" Text='<%#Eval("SSNo") %>'></asp:Label>
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="BuyerName" Visible="false">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="BuyerName" runat="server" Text='<%#Eval("BuyerName") %>'></asp:Label>
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="BuyerPONo" Visible="true">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="BuyerPONo" runat="server" Text='<%#Eval("BuyerPONo") %>'></asp:Label>
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="ContractNo" Visible="true">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="ContractNo" runat="server" Text='<%#Eval("ContractNo") %>'></asp:Label>
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="ColorCode" Visible="true">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="ColorCode" runat="server" Text='<%#Eval("ColorCode") %>'></asp:Label>
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="ColorName" Visible="true">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="ColorName" runat="server" Text='<%#Eval("ColorName") %>'></asp:Label>
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="POID" Visible="false">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="POID" runat="server" Text='<%#Eval("POID") %>'></asp:Label>
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="BuyerID" Visible="false">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="BuyerID" runat="server" Text='<%#Eval("BuyerID") %>'></asp:Label>
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="NoOfStyles" Visible="false">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="NoOfStyles" runat="server" Text='<%#Eval("NoOfStyles") %>'></asp:Label>
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="DeliveryNo" Visible="true">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="DeliveryNo" runat="server" Text='<%#Eval("DeliveryNo") %>'></asp:Label>
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="BPOQTY" Visible="true">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="BPOQTY" runat="server" Text='<%#Eval("BPOQTY") %>'></asp:Label>
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="SPO Qty" ItemStyle-HorizontalAlign="Right" Visible="true">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="SPOQty" runat="server" Text='<%#Eval("SPOQty") %>'></asp:Label>
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="Commited Qty" ItemStyle-HorizontalAlign="Right" Visible="true">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="CommitedQty" runat="server" Text='<%#Eval("CommitedQty") %>'></asp:Label>
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="Shipped Qty" ItemStyle-HorizontalAlign="Right" Visible="true">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="ShippedQty" runat="server" Text='<%#Eval("ShippedQty","{0:n}") %>'></asp:Label>
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="Short/Over Qty" ItemStyle-HorizontalAlign="Right" Visible="true">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="ShortOver_Qty" runat="server" Text='<%#Eval("ShortOver_Qty") %>'></asp:Label>
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="%" Visible="true" ItemStyle-HorizontalAlign="Right">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="Percentage" ToolTip="(Short/Over Qty X 100) / Commited Qty" runat="server" Text='<%#Eval("Percentage","{0:n}")%>'></asp:Label>
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="Short/Over Ship Value ($)" ItemStyle-HorizontalAlign="Right" Visible="true">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="ShortShipValue" runat="server" Text=' <%#Eval("ShortShipValue","{0:n}")%>'></asp:Label>
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="FOB ($)" ItemStyle-HorizontalAlign="Right" Visible="true">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="FOB" runat="server" Text='<%#Eval("FC","{0:n}") %>'></asp:Label>
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="Waved OFF Qty" ItemStyle-HorizontalAlign="Right" Visible="true">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="WavedOFFQty" runat="server" Text='<%#Eval("WavedOFFQty") %>'></asp:Label>
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="Short Reason" ItemStyle-HorizontalAlign="Right" Visible="true">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="ShortReason" runat="server" Text='<%#Eval("ShortReason") %>'></asp:Label>
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                </Columns>
                                                                <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
                                                                <FooterStyle BackColor="#333333" CssClass="GVFixedFooter" Font-Bold="True" ForeColor="White" />
                                                                <HeaderStyle BackColor="#333333" CssClass="GVFixedHeader" Font-Bold="True" ForeColor="White" />
                                                            </asp:GridView>
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
                </div>
                <div id="DivFooterRow" style="overflow: hidden">
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
            <asp:Label ID="lblPOID" runat="server" Text="" Visible="false"></asp:Label>
            <asp:Label ID="LblColorCode" runat="server" Text="" Visible="false"></asp:Label>
            <asp:Label ID="LblSDSEQs" runat="server" Text="" Visible="false"></asp:Label>
            <br />
        </div>
        <asp:Button ID="btnShowPopup" runat="server" Style="display: none" />
        <%-- <asp:ModalPopupExtender ID="MPEDBdown" runat="server" TargetControlID="btnShowPopup" PopupControlID="pnlpopup"
            CancelControlID="btnCancel" BackgroundCssClass="modalBackground">           
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </asp:ModalPopupExtender>--%>
    </form>
</body>
</html>

