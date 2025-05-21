<%@ page language="C#" autoeventwireup="true" inherits="MSPCommercialRpt, App_Web_11yxmj2e" enableeventvalidation="false" %>

<%@ Register Assembly="BasicFrame.WebControls.BasicDatePicker" Namespace="BasicFrame.WebControls" TagPrefix="BDP" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>MSP Commercial Rpt</title>
    <link href="CSS/bootstrap.css" rel="stylesheet" />

    <link href="CSS/jquery.autocomplete.css" rel="stylesheet" type="text/css" />
    <script src="js/jquery-1.4.1.min.js" type="text/javascript"></script>
    <script src="js/jquery.autocomplete.js" type="text/javascript"></script>

    <script type="text/javascript">
        $(document).ready(function () {
            $("#<%=txtStyle.ClientID%>").autocomplete('AutoCompletes/SearchStyle.ashx', {
                extraParams: { "type": "Style" }
            });

        });
    </script>

    <style type="text/css">


        .auto-style1 {
            width: 100%;
        }

        .auto-style5 {
            width: 116px;
        }

        .auto-style7 {
            width: 208px;
        }

        .auto-style14 {
            width: 60px;
        }

        .auto-style17 {
            width: 7px;
        }

        .auto-style20 {
            width: 138px;
        }

        .auto-style22 {
            width: 122px;
        }

        .auto-style24 {
            width: 120px;
        }

        .auto-style25 {
            width: 129px;
        }
    </style>
    <style type="text/css">
        .Gridtxt {
            width: 100px;
        }

        .gridHeader {
            text-align: right;
            font-weight: bold;
        }

        .panel {
            margin-bottom: 5px !important;
        }

        .form-group {
            margin-bottom: 5px !important;
        }
    </style>

    <style type="text/css">
        .ui-tooltip, .arrow:after {
            /*background: #FFFF80;*/
            background-color: rgba(53, 255, 42, 0.9);
            background: rgba(53, 255, 42, 0.9);
            color: rgba(53, 255, 42, 0.9);
            border: 1px solid Black;
            text-align: center;
        }

        .ui-tooltip {
            padding: 10px 10px;
            color: black;
            border-radius: 10px;
            font: bold 16px "Helvetica Neue", Sans-Serif;
            text-transform: uppercase;
            box-shadow: 0 0 7px black;
        }

        .arrow {
            width: 70px;
            height: 16px;
            overflow: hidden;
            position: absolute;
            left: 50%;
            margin-left: -35px;
            bottom: -16px;
        }

            .arrow.top {
                top: -25px;
                bottom: auto;
            }

            .arrow.left {
                left: 20%;
            }

            .arrow:after {
                content: "";
                position: absolute;
                left: 20px;
                top: -20px;
                width: 25px;
                height: 25px;
                box-shadow: 6px 5px 9px -9px black;
                -webkit-transform: rotate(45deg);
                -ms-transform: rotate(45deg);
                transform: rotate(45deg);
            }

            .arrow.top:after {
                bottom: -20px;
                top: auto;
            }

        .auto-style15 {
            width: 120%;
            height: 79px;
        }

        .auto-style16 {
            width: 16px;
        }

        .auto-style21 {
            width: 893px;
        }

        .auto-style22 {
            font-weight: normal;
        }

        .auto-style26 {
            position: relative;
            min-height: 1px;
            float: left;
            width: 91.66666667%;
            left: 0px;
            top: 0px;
            padding-left: 15px;
            padding-right: 15px;
        }

        /*.HeaderFreez {
            position: relative;
            top: expression(this.offsetParent.scrollTop);
            z-index: 10;
        }*/
        /*.HeaderFreez {
            Position: Fixed;
            Top: 165px;
            Left: 14px;
        }*/
    </style>
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
    <script language="javascript">
        $(document).ready(function () {
            var gridHeader = $('#<%=GVResults.ClientID%>').clone(true); // Here Clone Copy of Gridview with style
            $(gridHeader).find("tr:gt(0)").remove(); // Here remove all rows except first row (header row)
            $('#<%=GVResults.ClientID%> tr th').each(function (i) {
                // Here Set Width of each th from gridview to new table(clone table) th 
                $("th:nth-child(" + (i + 1) + ")", gridHeader).css('width', ($(this).width()).toString() + "px");
            });
            $("#GHead").append(gridHeader);
            $('#GHead').css('position', 'absolute');
              //$('#GHead').css('top', $('#<%=GVResults.ClientID%>').offset().top);

        });
    </script>
    <script type="text/javascript">

        $(function () {
            $(document).tooltip({
                position: {
                    my: "center bottom-20",
                    at: "center top",
                    using: function (position, feedback) {
                        $(this).css(position);
                        $("<div>")
            .addClass("arrow")
            .addClass(feedback.vertical)
            .addClass(feedback.horizontal)
            .appendTo(this);
                    }
                }
            });
        });
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <asp:ToolkitScriptManager ID="ScriptManager1" runat="server">
        </asp:ToolkitScriptManager>
        <script type="text/javascript">
            function pageLoad(sender, args) {
                if (!args.get_isPartialLoad()) {
                    //  add our handler to the document's
                    //  keydown event
                    $addHandler(document, "keydown", onKeyDown);
                }
            }

            function onKeyDown(e) {
                if (e && e.keyCode == Sys.UI.Key.esc) {
                    // if the key pressed is the escape key, dismiss the dialog
                    $find('MPESL').hide();
                }
            }
        </script>
        <div class="col-md-12">
      <%--  <asp:Panel ID="pnlsearch" runat="server">--%>
            <asp:Label ID="lblOrderNo" runat="server" Visible="False"></asp:Label>
            <div class="row">
                <div class="col-md-12">
                    <div class="col-md-2">
                        <br />
                        <asp:ImageButton ID="btnHome" runat="server" ImageUrl="~/images/Tohome.png" Height="35px"
                            Width="35px" PostBackUrl="~/Allreports.aspx" />
                        <asp:ImageButton ID="btnback" runat="server" ImageUrl="~/images/Back.png" Height="35px"
                            Width="35px" PostBackUrl="~/report.aspx" />
                    </div>
                    <div class="col-md-8">
                        <h3 style="text-align: center">Dispatched Vs Invoiced Report - BPO Wise</h3>
                    </div>
                </div>
            </div>
            <div class="col-md-12">
                <div class="panel panel-default">
                    <div class="panel-body">
                        <div class="box-body">
                            <div class="row">
                                <div class="form-group">
                                    <label class="col-md-2 control-label">BPO Date - From: <span style="color: red">*</span></label>
                                    <div class="col-md-3">
                                        <BDP:BasicDatePicker ID="DatePickerFromDate" runat="server" CssClass="form-control" />
                                    </div>
                                    <label class="col-md-2 control-label">To: <span style="color: red">*</span></label>
                                    <div class="col-md-3">
                                        <BDP:BasicDatePicker ID="DatePickerToDate" runat="server" CssClass="form-control" />
                                    </div>
                                   
                                </div>
                            </div>
                            <br />
                             <div class="row">
                                <div class="box-body">
                                    <div class="form-group">
                                        
                                             <label class="col-md-2 control-label">Buyer:</label>
                                        <div class="col-md-3">
                                            <asp:DropDownList ID="DDLBUYER" CssClass="form-control" runat="server"
                                                AutoPostBack="true" OnSelectedIndexChanged="DDLBUYER_SelectedIndexChanged">
                                            </asp:DropDownList>
                                        
                                            </div>
                                         <div class="col-md-6">
                                        <asp:Button ID="btnsearch" CssClass="btn btn-success" runat="server" Text="Search" OnClick="btnsearch_Click" />
                                        <asp:Button ID="BtnExport" runat="server" Text="Export" OnClick="BtnExport_Click" CssClass="btn btn-info" />
                                        <asp:Button ID="BtnReset" runat="server" Text="Reset" OnClick="BtnReset_Click" CssClass="btn btn-warning" />
                                          <asp:Button ID="Btnsummary" runat="server"   CssClass="btn bg-primary" Width="158px"                    
                    style="background-position: right;  background-image: url('Images/user.png'); text-align: left; background-repeat: no-repeat;" 
                    Text="Buyer Summary" OnClick="Btnsummary_Click"  />
                                    </div>
                                        </div>
                                    </div>
                                  </div>
                            <br />
                            
                            <div class="row">
                                <div class="box-body">
                                    <div class="form-group">
                                        <%--                                        <label class="col-md-2 control-label">Plant:</label>
                                        <div class="col-md-3">
                                            <asp:DropDownList ID="DDLPlant" runat="server" CssClass="form-control"
                                                AutoPostBack="true" OnSelectedIndexChanged="DDLPlant_SelectedIndexChanged">
                                            </asp:DropDownList>
                                        </div>
                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; --%>
                                      
                                        <label class="col-md-2 control-label">Style :</label>
                                        <div class="col-md-3">
                                            <asp:TextBox ID="txtStyle" OnTextChanged="txtStyle_TextChanged" CssClass="form-control" runat="server" Width="250px"></asp:TextBox>
                                        </div>
                                        <label class="col-md-1 control-label">Status</label>
                                        <div class="col-md-3">
                                            <asp:DropDownList ID="drpdwnStatus" runat="server" CssClass="form-control"
                                                OnSelectedIndexChanged="drpdwnStatus_SelectedIndexChanged" AutoPostBack="true">
                                                <asp:ListItem Value=""></asp:ListItem>
                                                <asp:ListItem Value="1">Dispatched not Invoiced</asp:ListItem>
                                                <asp:ListItem Value="2">Invoiced not Dispatched</asp:ListItem>
                                                <asp:ListItem Value="3">Under Invoiced</asp:ListItem>
                                                <asp:ListItem Value="4">Over Invoiced</asp:ListItem>
                                            </asp:DropDownList>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <%--<div class="row">
                                <div class="box-body">
                                    <div class="form-group">
                                        <label class="col-md-1 control-label">Style :</label>
                                        <div class="col-md-6">
                                            <asp:TextBox ID="txtStyle" CssClass="form-control" runat="server" Width="250px"></asp:TextBox>
                                        </div>
<%--                                        <div class="col-md-1">
                                        </div>
                                        <div class="col-md-2">
                                        </div>
                                        <div class="col-md-2">
                                        </div>
                                        <div class="col-md-2">
                                        </div>--%>
                        </div>
                    </div>
                </div>
                <%--                            <div class="box-body">
                                <div class="form-group">
                                    <label class="col-md-2 control-label">
                                    </label>
                                    <label class="col-md-2 control-label">
                                    </label>
                                    <label class="col-md-2 control-label">
                                    </label>
                                    <label class="col-md-2 control-label">
                                    </label>
                                    <label class="col-md-2 control-label">
                                    </label>
                                    <label class="col-md-3 control-label">
                                    </label>
                                    <label class="col-md-3 control-label">
                                    </label>
                                    <label class="col-md-3 control-label">
                                    </label>
                                    <label class="col-md-3 control-label" style="border-style: solid; border-color: inherit; border-width: medium; font-size: larger; padding: 5px 5px 5px 5px; left: 0px; top: 0px; width: 300px;">
                                        Total <span class="auto-style22" style="color: rgb(0, 0, 0); font-family: &quot; Helvetica Neue&quot; , Helvetica, Arial, sans-serif; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; letter-spacing: normal; orphans: 5; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;"><strong>Value Variance (Commited vs Despatched) $</strong></span> :&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;
                            <asp:Label ID="lblTotalPromQun" runat="server"></asp:Label></label>
                                </div>
                            </div>--%>
            </div>
            <%--  </div>
                </div>
            </div>--%>
        <%--</asp:Panel>--%>
 <%--       </div>--%>
             <asp:Panel ID="Panel1" runat="server">
  <asp:GridView ID="GVBuyerSummary" runat="server" FooterStyle-HorizontalAlign="Right" ShowFooter="true" Height="25px" 
      AutoGenerateColumns="False" BackColor="White" BorderColor="#cccccc"
                                BorderWidth="1px" CellPadding="4" ForeColor="Black" AllowSorting="True"
                                EnableModelValidation="True" OnRowDataBound="GVBuyerSummary_RowDataBound" Width="900px" >
                             <Columns>
                                     
                                    <asp:TemplateField HeaderText="Buyer" ControlStyle-Width="150px">
                                        <ItemTemplate>                                          
                                            <asp:Label ID="BuyerName" runat="server" Text='<%#Eval("BuyerName") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                 <asp:TemplateField HeaderText="BPO Qty" HeaderStyle-CssClass="text-right" ItemStyle-HorizontalAlign="Right"    SortExpression="" Visible="true">
                        <ItemTemplate>
                        <asp:Label ID="BPOQty" runat="server"  Text=' <%#Eval("BPOQty","{0:#,##0}")%>'     ></asp:Label>
                        </ItemTemplate>
                        <FooterTemplate>
                              <div>  <asp:Label ID="lblTTBPOQty"   runat="server" /> </div> 
                                </FooterTemplate>
                         </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Dispatched Qty"  HeaderStyle-CssClass="text-right"  ItemStyle-HorizontalAlign="Right"    SortExpression="" Visible="true">
                        <ItemTemplate>
                        <asp:Label ID="TShippedQty" runat="server"  Text=' <%#Eval("ShippedQty","{0:#,##0}")%>'     ></asp:Label>
                        </ItemTemplate>
                        <FooterTemplate>
                              <div>  <asp:Label ID="lblTTShippedQty"   runat="server" /> </div> 
                                </FooterTemplate>
                         </asp:TemplateField>
                                  <asp:TemplateField HeaderText="Invoiced Qty" HeaderStyle-CssClass="text-right"  ItemStyle-HorizontalAlign="Right"    SortExpression="" Visible="true">
                        <ItemTemplate>
                        <asp:Label ID="lblInvoicedQty" runat="server"  Text=' <%#Eval("InvoiceQTY","{0:#,##0}")%>'   ></asp:Label>
                        </ItemTemplate>
                        <FooterTemplate>
                              <div>  <asp:Label ID="lblTTInvoicedQty"   runat="server" /> </div> 
                                </FooterTemplate>
                         </asp:TemplateField>

                                  <asp:TemplateField HeaderText="Invoiced VS BPO" HeaderStyle-CssClass="text-right" ItemStyle-HorizontalAlign="Right"    SortExpression="" Visible="true">
                        <ItemTemplate>
                        <asp:Label ID="InvoicedVSBPO" runat="server"  Text=' <%#Eval("InvoicedVSBPO","{0:#,##0}")%>'     ></asp:Label>
                        </ItemTemplate>
                        <FooterTemplate>
                              <div>  <asp:Label ID="lblTTInvoicedVSBPO"   runat="server" /> </div> 
                                </FooterTemplate>
                         </asp:TemplateField>

                                  <asp:TemplateField HeaderText="Invoiced Vs Dispatched" HeaderStyle-CssClass="text-right" ItemStyle-HorizontalAlign="Right"    SortExpression="" Visible="true">
                        <ItemTemplate>
                        <asp:Label ID="InvoicedVsDispatched" runat="server"  Text=' <%#Eval("Variance","{0:#,##0}")%>'     ></asp:Label>
                        </ItemTemplate>
                        <FooterTemplate>
                              <div>  <asp:Label ID="lblTTInvoicedVsDispatched"   runat="server" /> </div> 
                                </FooterTemplate>
                         </asp:TemplateField>

                                 <asp:TemplateField HeaderText="Avg Planned Inv Value" HeaderStyle-CssClass="text-right" ItemStyle-HorizontalAlign="Right"    SortExpression="" Visible="true">
                        <ItemTemplate>
                        <asp:Label ID="AvgPlannedInvValue" runat="server"  Text=' <%#Eval("AvgPlannedInvValue","{0:#,##0.00}")%>'     ></asp:Label>
                        </ItemTemplate>
                        <FooterTemplate>
                              <div>  <asp:Label ID="lblAvgPlannedInvValue"   runat="server" /> </div> 
                                </FooterTemplate>
                         </asp:TemplateField>
                                 <asp:TemplateField HeaderText="Actual Inv Value" HeaderStyle-CssClass="text-right" ItemStyle-HorizontalAlign="Right"    SortExpression="" Visible="true">
                        <ItemTemplate>
                        <asp:Label ID="ActualInvValue" runat="server"  Text=' <%#Eval("ActualInvValue","{0:#,##0.00}")%>'     ></asp:Label>
                        </ItemTemplate>
                        <FooterTemplate>
                              <div>  <asp:Label ID="lblActualInvValue"   runat="server" /> </div> 
                                </FooterTemplate>
                         </asp:TemplateField>
                                  <asp:TemplateField HeaderText="Variance" HeaderStyle-CssClass="text-right" ItemStyle-HorizontalAlign="Right"    SortExpression="" Visible="true">
                        <ItemTemplate>
                        <asp:Label ID="PlanVsActualVariance" runat="server"  Text=' <%#Eval("PlanVsActualVariance","{0:#,##0.00}")%>'     ></asp:Label>
                        </ItemTemplate>
                        <FooterTemplate>
                              <div>  <asp:Label ID="lblPlanVsActualVariance"   runat="server" /> </div> 
                                </FooterTemplate>
                                      </asp:TemplateField>
                                </Columns>
                                <%--<SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />--%>
                                <FooterStyle BackColor="#333333" Font-Bold="True" ForeColor="White" CssClass="GVFixedFooter" />
                                <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
                               
                            </asp:GridView>
                            </asp:Panel>
        <div class="col-md-12">
            <div id="DivRoot" align="left">
                <div style="overflow: hidden;" id="DivHeaderRow">
                </div>
                <div>
                    <div style="width: 1300px;">
                       
                        <div id="GHead"></div>
                        <div style="height: 1800px; overflow: auto">
                            <asp:GridView ID="GVResults" runat="server" FooterStyle-HorizontalAlign="Right" 
                                ShowFooter="true" Height="25px" AutoGenerateColumns="False" BackColor="White"
                                 BorderColor="#cccccc"
                                BorderWidth="1px" CellPadding="4" ForeColor="Black" AllowSorting="True"
                                EnableModelValidation="True" Width="1200px" OnRowDataBound="GVResults_RowDataBound">
                                <%--Style="max-width: 100%; min-width: 90%" Font-Size="Small"--%>
                                <%--  <HeaderStyle Height="30px" Width="50px" />
                    <FooterStyle Height="20px" Width="50px" />--%>
                                <%--<RowStyle Height="20px" Width="50px" />--%>
                                <Columns>
                                    <%-- <asp:TemplateField HeaderText="PlantID" SortExpression="" Visible="false">
                            <ItemTemplate>
                                <asp:Label ID="PlantID" runat="server" Text='<%#Eval("PlantID") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>--%>
                                    <%-- <asp:TemplateField HeaderText="BuyerID" SortExpression="" Visible="false">
                            <ItemTemplate>
                                <asp:Label ID="BuyerID" runat="server" Text='<%#Eval("BuyerID") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>--%>
                                       <asp:TemplateField HeaderText="OrderNo" SortExpression="" Visible="false">
                            <ItemTemplate>
                                 <asp:Label ID="OrderNo" runat="server" Text='<%#Eval("OrderNo") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                                     <asp:TemplateField HeaderText="POID" SortExpression="" Visible="false">
                            <ItemTemplate>
                                 <asp:Label ID="POID" runat="server" Text='<%#Eval("POID") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Style No" ControlStyle-Width="150px">
                                        <ItemTemplate>
                                            <asp:LinkButton ID="LinkStyle" OnClick="LinkButton1_Click" runat="server" Text='<%#Eval("StyleNo") %>'></asp:LinkButton>
                                           <%-- <asp:Label ID="StyleNo" runat="server" Text='<%#Eval("StyleNo") %>'></asp:Label>--%>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Buy" Visible="false" ItemStyle-HorizontalAlign="Left" HeaderStyle-CssClass="gridHeader">
                                        <ItemTemplate>
                                            <asp:Label ID="Buy" runat="server" Text='<%#Eval("Buy") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Buyer Code" ItemStyle-HorizontalAlign="Left" HeaderStyle-HorizontalAlign="Left">
                                        <ItemTemplate>
                                            <asp:Label ID="BuyerCode" runat="server" Text='<%#Eval("BuyerCode") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="BPO No" ItemStyle-HorizontalAlign="Left" HeaderStyle-HorizontalAlign="Left">
                                        <ItemTemplate>
                                            <asp:Label ID="BuyerPONo" runat="server" Text='<%#Eval("BuyerPONo") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Contract No" ItemStyle-HorizontalAlign="Left" HeaderStyle-HorizontalAlign="Left">
                                        <ItemTemplate>
                                            <asp:Label ID="ContractNo" runat="server" Text='<%#Eval("ContractNo") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="BPO Date" ItemStyle-HorizontalAlign="Right" HeaderStyle-CssClass="gridHeader" Visible="true">
                                        <ItemTemplate>
                                            <asp:Label ID="ExtendedShipDate" runat="server" Text='<%#Eval("ExtendedShipDate","{0:dd/MMM/yyyy}") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="BPO Qty" ItemStyle-HorizontalAlign="Right" HeaderStyle-CssClass="gridHeader" Visible="true">
                                        <ItemTemplate>
                                            <asp:Label ID="ReqQty" runat="server" Text='<%#Eval("ReqQty") %>'></asp:Label>
                                        </ItemTemplate>
                                        <FooterTemplate>
                                            <div>
                                                <asp:Label Font-Bold="true" ID="LblReqQty" runat="server" />
                                            </div>
                                        </FooterTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Dispatched Qty" ItemStyle-HorizontalAlign="Right" HeaderStyle-CssClass="gridHeader">
                                        <ItemTemplate>
                                            <asp:Label ID="ShippedQty" runat="server" Text='<%#Eval("ShippedQty") %>'></asp:Label>
                                        </ItemTemplate>
                                        <FooterTemplate>
                                            <div>
                                                <asp:Label Font-Bold="true" ID="LblShippedQty" runat="server" />
                                            </div>
                                        </FooterTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Invoiced QTY" ItemStyle-HorizontalAlign="Right" HeaderStyle-CssClass="gridHeader">
                                        <ItemTemplate>
                                            <asp:Label ID="InvoiceQTY" runat="server" Text='<%#Eval("InvoiceQTY") %>'></asp:Label>
                                        </ItemTemplate>
                                        <FooterTemplate>
                                            <div>
                                                <asp:Label Font-Bold="true" ID="LblInvoiceQTY" runat="server" />
                                            </div>
                                        </FooterTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Invoiced Vs BPO" ItemStyle-HorizontalAlign="Right" HeaderStyle-CssClass="gridHeader" Visible="true">
                                        <ItemTemplate>
                                            <asp:Label ID="InvoicedVsBPO" runat="server" Text='<%#Eval("InvoicedVsBPO") %>'></asp:Label>
                                        </ItemTemplate>

                                        <FooterTemplate>
                                            <div>
                                                <asp:Label Font-Bold="true" ID="LblBPOVsInvoiced" runat="server" />
                                            </div>
                                        </FooterTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Dispatched Vs Invoiced" ItemStyle-HorizontalAlign="Right" HeaderStyle-HorizontalAlign="Right" Visible="false" HeaderStyle-ForeColor="Red">
                                        <ItemTemplate>
                                            <asp:Label ID="ShipVsInvoiced" runat="server" Text='<%#Eval("ShipVsInvoiced") %>'></asp:Label>
                                        </ItemTemplate>
                                        <FooterTemplate>
                                            <div>
                                                <asp:Label Font-Bold="true" ID="LblShipVsInvoiced" runat="server" />
                                            </div>
                                        </FooterTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Invoiced Vs Dispatched" ItemStyle-HorizontalAlign="Right" HeaderStyle-CssClass="gridHeader" Visible="true">
                                        <ItemTemplate>
                                            <asp:Label ID="InvoicedVsDispatched" runat="server" Text='<%#Eval("InvoicedVsDispatched") %>'></asp:Label>
                                        </ItemTemplate>
                                        <FooterTemplate>
                                            <div>
                                                <asp:Label Font-Bold="true" ID="LblInvoicedVsDispatched" runat="server" />
                                            </div>
                                        </FooterTemplate>
                                    </asp:TemplateField>
                                    

                                     <asp:TemplateField HeaderText="Planned Invoice Value" ItemStyle-HorizontalAlign="Right" HeaderStyle-CssClass="gridHeader" Visible="true">
                                        <ItemTemplate> 
                                            <asp:Label ID="AvgPlannedInvValue" runat="server" Text=' <%#Eval("AvgPlannedInvValue","{0:n}")%>' ></asp:Label>
                                        </ItemTemplate>
                                        <FooterTemplate>
                                            <div>
                                                <asp:Label Font-Bold="true" ID="LblTotAvgPlannedInvValue" runat="server" />
                                            </div>
                                        </FooterTemplate>
                                    </asp:TemplateField>

                                   <asp:TemplateField HeaderText="Actual Invoice Value" ItemStyle-HorizontalAlign="Right" HeaderStyle-CssClass="gridHeader" Visible="true">
                                        <ItemTemplate>
                                            <asp:Label ID="ActualInvValue" runat="server" Text=' <%#Eval("ActualInvValue","{0:n}")%>' ></asp:Label>
                                        </ItemTemplate>
                                        <FooterTemplate>
                                            <div>
                                                <asp:Label Font-Bold="true" ID="LblTotActualInvValue" runat="server" />
                                            </div>
                                        </FooterTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Variance" ItemStyle-HorizontalAlign="Right" HeaderStyle-CssClass="gridHeader" Visible="true">
                                        <ItemTemplate>
                                            <asp:Label ID="PlanVsActualVariance" runat="server" Text=' <%#Eval("PlanVsActualVariance","{0:n}")%>' ></asp:Label>
                                        </ItemTemplate>
                                        <FooterTemplate>
                                            <div>
                                                <asp:Label Font-Bold="true" ID="LblTotPlanVsActualVariancee" runat="server" />
                                            </div>
                                        </FooterTemplate>
                                    </asp:TemplateField>

                                       <asp:TemplateField HeaderText="Average FOB" ItemStyle-HorizontalAlign="Right" HeaderStyle-CssClass="gridHeader" Visible="true">
                                        <ItemTemplate>
                                            <asp:Label ID="AverageUnitPrice" runat="server" Text=' <%#Eval("AverageUnitPrice","{0:0.0000}")%>' ></asp:Label>
                                        </ItemTemplate>
                                        <FooterTemplate>
                                            <div>
                                                <asp:Label Font-Bold="true" ID="LblAverageUnitPrice" runat="server" />
                                            </div>
                                        </FooterTemplate>
                                    </asp:TemplateField>
                                </Columns>
                                <%--<SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />--%>
                                <FooterStyle BackColor="#333333" Font-Bold="True" ForeColor="White" CssClass="GVFixedFooter" />
                                <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
                                <%--<HeaderStyle CssClass="HeaderFreez"  BackColor="#333333" Font-Bold="True" ForeColor="White"  />--%>
                            </asp:GridView>
                          </div>
                        </div>
                    </div>
                           

                        
        </div></div>

        <asp:Button ID="btnShowPopup" runat="server" Style="display: none" />
         <asp:ModalPopupExtender ID="MPESL" runat="server" TargetControlID="btnShowPopup" PopupControlID="pnlpopup"
            CancelControlID="btnMPECancel" BackgroundCssClass="modalBackground">
        </asp:ModalPopupExtender>
         <asp:Panel ID="pnlpopup" runat="server" BackColor="White" Height="500px" Width="1250px"
            Style=" overflow: scroll; border: Solid 3px #0026ff;">
             <div class="container" style="max-width: 1200px">
                <div class="row">
                   
                    <div class="col-md-12">
                        <br />
                        <asp:ImageButton ID="btnMPECancel" runat="server" ImageUrl="~/images/Cancel.png"
                            Width="20" Height="20" CssClass="pull-right" />
                    </div>
                
                <div class="row">
                    <div class="auto-style26">
                    <table class="auto-style1">
                            <tr>
                                <td class="auto-style17">&nbsp; </td>
                                <td class="auto-style14"><strong>Style&nbsp; :</strong></td>
                                <td class="auto-style7">&nbsp;
                                   <asp:Label ID="LabpopStylepop" runat="server"></asp:Label>
                                </td>
                               <%-- <td class="auto-style22">&nbsp;&nbsp;&nbsp; <strong>Buyer&nbsp;&nbsp;PO :</strong>&nbsp; </td>                                
                                <td class="auto-style20">
                                    <asp:Label ID="Labcolour" runat="server"></asp:Label>
                                </td>                                
                                <td class="auto-style25">
                                    <span style="color: rgb(0, 0, 0); font-family: &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; font-size: small; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; letter-spacing: normal; orphans: 2; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;"><strong>Contract </strong></span>
                                    <span style="color: rgb(0, 0, 0); font-family: &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; font-size: small; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 700; letter-spacing: normal; orphans: 2; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;">&nbsp;:</span></td>                                
                                <td class="auto-style24">
                                    <asp:Label ID="LabcolourQty" runat="server"></asp:Label>
                                </td>
                                <td>
                                 <asp:Label ID="LabCCode" runat="server" Visible="false"></asp:Label><asp:Label ID="LabCName" runat="server" Visible="false"></asp:Label>
                                </td>      --%>                          
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
                   

                        <asp:GridView ID="GridSuReport" runat="server"  ShowFooter="false" AutoGenerateColumns="False" BackColor="White" BorderColor="#999999" 
                BorderWidth="2px"  OnRowDataBound="GridSuReport_RowDataBound" ForeColor="Black" FooterStyle-HorizontalAlign="Right" AllowSorting="True"
                             Style="max-width: 100%;  font-size:smaller; min-width: 90%"
                EnableModelValidation="True" Width="980px"  >
               
                <Columns>
                    <asp:TemplateField HeaderText="orderno" ItemStyle-HorizontalAlign="Center" SortExpression="" Visible="false">
                        <ItemTemplate>
                            <asp:Label ID="orderno" runat="server" Text='<%#Eval("orderno") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                     <asp:TemplateField HeaderText="DID" ItemStyle-HorizontalAlign="Center" SortExpression="" Visible="false">
                        <ItemTemplate>
                            <asp:Label ID="labDID" runat="server" Text='<%#Eval("DID") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                     <asp:TemplateField HeaderText="Invoice No"   SortExpression="" Visible="true">
                        <ItemTemplate>
                        <asp:Label ID="labINVNumber" runat="server"   Text='<%#Eval("INVNumber") %>' ></asp:Label>
                        </ItemTemplate>                       
                    </asp:TemplateField>
             
                              <asp:TemplateField HeaderText="Buyer PO"  SortExpression="" Visible="true">
                        <ItemTemplate>
                        <asp:Label ID="labBuyerPONo" runat="server"   Text='<%#Eval("BuyerPONo") %>' ></asp:Label>
                        </ItemTemplate>                       
                    </asp:TemplateField>
                        <asp:TemplateField HeaderText="Contract No" SortExpression="" Visible="true">
                        <ItemTemplate>
                        <asp:Label ID="ContractNo" runat="server"   Text='<%#Eval("ContractNo") %>'></asp:Label>
                        </ItemTemplate>
                       
                    </asp:TemplateField>
                     <asp:TemplateField HeaderText="Color"   SortExpression="" Visible="true">
                        <ItemTemplate>
                        <asp:Label ID="ColorName" runat="server"   Text='<%#Eval("ColorName") %>' ></asp:Label>
                        </ItemTemplate>
                         </asp:TemplateField>

                    <asp:TemplateField HeaderText="DeliveryNo"   SortExpression="" Visible="false">
                        <ItemTemplate>
                        <asp:Label ID="DeliveryNo" runat="server"   Text='<%#Eval("DeliveryNo") %>' ></asp:Label>
                        </ItemTemplate>
                      
                         </asp:TemplateField>
                    <asp:TemplateField HeaderText="Committed Qty" ItemStyle-HorizontalAlign="Right"    SortExpression="" Visible="false">
                        <ItemTemplate>
                        <asp:Label ID="DeliveryQty" runat="server"   Text='<%#Eval("DeliveryQty") %>' ></asp:Label>
                        </ItemTemplate>
                          <FooterTemplate>
                              <div>  <asp:Label ID="lblTotDeliveryQty"   runat="server" /> </div> 
                                </FooterTemplate>
                         </asp:TemplateField>
                     <asp:TemplateField HeaderText="BPO Qty" ItemStyle-HorizontalAlign="Right"    SortExpression="" Visible="true">
                        <ItemTemplate>
                        <asp:Label ID="lblBPOQTy" runat="server" Text=' <%#Eval("BPOQTy","{0:#,##0}")%>'     ></asp:Label>
                        </ItemTemplate>
                          <FooterTemplate>
                              <div>  <asp:Label ID="lblTotBPOQTy"    runat="server" /> </div> 
                                </FooterTemplate>
                         </asp:TemplateField>
                    <asp:TemplateField HeaderText="Dispatched Qty" ItemStyle-HorizontalAlign="Right"    SortExpression="" Visible="true">
                        <ItemTemplate>
                        <asp:Label ID="ShippedQty" runat="server" Text=' <%#Eval("ShippedQty","{0:#,##0}")%>'    ></asp:Label>
                        </ItemTemplate>
                        <FooterTemplate>
                              <div>  <asp:Label ID="lblTotShippedQty"   runat="server" /> </div> 
                                </FooterTemplate>
                         </asp:TemplateField>
                     <asp:TemplateField HeaderText="Invoice QTY" ItemStyle-HorizontalAlign="Right"  SortExpression="" Visible="true">
                        <ItemTemplate>
                        <asp:Label ID="INvQTY" runat="server"  Text=' <%#Eval("QTY","{0:#,##0}")%>'   ></asp:Label>
                        </ItemTemplate>
                         <FooterTemplate>
                              <div>  <asp:Label ID="lblTotInvQty"   runat="server" /> </div> 
                                </FooterTemplate>
                         </asp:TemplateField>
                     <asp:TemplateField HeaderText="Variance" ItemStyle-HorizontalAlign="Right"  SortExpression="" Visible="true">
                        <ItemTemplate>
                        <asp:Label ID="variance" runat="server"    Text='<%#Eval("Qtyvariance") %>' ></asp:Label>
                        </ItemTemplate>
                         <FooterTemplate>
                              <div>  <asp:Label ID="lblQtyvariance"   runat="server" /> </div> 
                                </FooterTemplate>
                         </asp:TemplateField>
                     <asp:TemplateField HeaderText="FOB" ItemStyle-HorizontalAlign="Right"    SortExpression="" Visible="true">
                        <ItemTemplate>
                        <asp:Label ID="lblUnitPrice" runat="server"   Text='<%#Eval("UNITPRICE") %>' ></asp:Label>
                        </ItemTemplate>
                        <FooterTemplate>
                              <div>  <asp:Label ID="lblTotUNITPRICE"   runat="server" /> </div> 
                                </FooterTemplate>
                         </asp:TemplateField>
                     
                      <asp:TemplateField HeaderText="Planned Invoice Value" ItemStyle-HorizontalAlign="Right"    SortExpression="" Visible="true">
                        <ItemTemplate>
                        <asp:Label ID="lblPlannedInvoiceValue" runat="server"  Text=' <%#Eval("PlannedInvoiceValue","{0:n}")%>'  ></asp:Label>
                        </ItemTemplate>
                        <FooterTemplate>
                              <div>  <asp:Label ID="lblTotPlannedInvoiceValue"   runat="server" /> </div> 
                                </FooterTemplate>
                         </asp:TemplateField>
                       <asp:TemplateField HeaderText="Actual Invoice Value" ItemStyle-HorizontalAlign="Right"    SortExpression="" Visible="true">
                        <ItemTemplate>
                        <asp:Label ID="lblActualInvoiceValue" runat="server"  Text=' <%#Eval("ActualInvoiceValue","{0:n}")%>'  ></asp:Label>
                        </ItemTemplate>
                        <FooterTemplate>
                              <div>  <asp:Label ID="lblTotActualInvoiceValue"   runat="server" /> </div> 
                                </FooterTemplate>
                         </asp:TemplateField>
                       <asp:TemplateField HeaderText="Value Variance" ItemStyle-HorizontalAlign="Right"    SortExpression="" Visible="true">
                        <ItemTemplate>
                        <asp:Label ID="lblValueVariance" runat="server"   Text=' <%#Eval("ValueVariance","{0:n}")%>'  ></asp:Label>
                        </ItemTemplate>
                        <FooterTemplate>
                              <div>  <asp:Label ID="lblTotValueVariance"   runat="server" /> </div> 
                                </FooterTemplate>
                         </asp:TemplateField>
                   <%--  <asp:TemplateField HeaderText="variance"   SortExpression="" Visible="true">
                        <ItemTemplate>
                        <asp:Label ID="variance" runat="server"   Text='<%#Eval("variance") %>' ></asp:Label>
                        </ItemTemplate>
                         <FooterTemplate>
                              <div>  <asp:Label ID="lblTotvariance"   runat="server" /> </div> 
                                </FooterTemplate>
                         </asp:TemplateField>--%>
                        <asp:TemplateField HeaderText="Despatched On"   SortExpression="" Visible="true">
                        <ItemTemplate>
                            <asp:Label ID="DespatchedOn" runat="server"  Text='<%#Eval("DespatchedOn","{0:dd/MMM/yyyy}") %>' ></asp:Label>                       
                        </ItemTemplate>                       
                    </asp:TemplateField>

                     <asp:TemplateField HeaderText="Invoiced On"  SortExpression="" Visible="true">
                        <ItemTemplate>
                            <asp:Label ID="INVDate" runat="server"  Text='<%#Eval("INVDate","{0:dd/MMM/yyyy}") %>' ></asp:Label>                        
                        </ItemTemplate>                       
                    </asp:TemplateField>
                   <asp:TemplateField HeaderText="Date Dif."  ItemStyle-HorizontalAlign="Right"    Visible="true">
                        <ItemTemplate>
                        <asp:Label ID="DateVariance" runat="server"   Text='<%#Eval("DateVariance") %>' ></asp:Label>
                        </ItemTemplate>
                         </asp:TemplateField>
                     
                    <asp:TemplateField HeaderText="Received On"  SortExpression="" Visible="true">
                        <ItemTemplate>
                            <asp:Label ID="RecDate" runat="server"  Text='<%#Eval("RecDate","{0:dd/MMM/yyyy}") %>' ></asp:Label>                        
                        </ItemTemplate>                       
                    </asp:TemplateField>
                     <asp:TemplateField HeaderText="Invoice Amount" ItemStyle-HorizontalAlign="Right"    SortExpression="" Visible="true">
                        <ItemTemplate>
                        <asp:Label ID="lblREQAMOUNT" runat="server" Text=' <%#Eval("REQAMOUNT","{0:n}")%>'      ></asp:Label>
                        </ItemTemplate>
                        <FooterTemplate>
                              <div>  <asp:Label ID="lblTotREQAMOUNT"   runat="server" /> </div> 
                                </FooterTemplate>
                         </asp:TemplateField>
                     <asp:TemplateField HeaderText="Received Amount" ItemStyle-HorizontalAlign="Right"    SortExpression="" Visible="true">
                        <ItemTemplate>
                        <asp:Label ID="lblAMOUNTCREDITED" runat="server"  Text=' <%#Eval("AMOUNTCREDITED","{0:n}")%>'   ></asp:Label>
                        </ItemTemplate>
                        <FooterTemplate>
                              <div>  <asp:Label ID="lblTotAMOUNTCREDITED"   runat="server" /> </div> 
                                </FooterTemplate>
                         </asp:TemplateField>

                       <asp:TemplateField HeaderText="Pending Amount" ItemStyle-HorizontalAlign="Right"    SortExpression="" Visible="true">
                        <ItemTemplate>
                        <asp:Label ID="lblPendingAmount" runat="server" Text=' <%#Eval("PendingAmount","{0:n}")%>'     ></asp:Label>
                        </ItemTemplate>
                        <FooterTemplate>
                              <div>  <asp:Label ID="lblTotPendingAmount"   runat="server" /> </div> 
                                </FooterTemplate>
                         </asp:TemplateField>
                     <asp:TemplateField HeaderText="Invoice Submitted On"   SortExpression="" Visible="true">
                        <ItemTemplate>
                        <asp:Label ID="INVSubmitON" runat="server"  Text='<%#Eval("INVSubmitON","{0:dd/MMM/yyyy}") %>'   ></asp:Label>
                        </ItemTemplate>                       
                    </asp:TemplateField>
                </Columns>
                <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
  <HeaderStyle BackColor="#333333" CssClass="GVFixedHeader" Font-Bold="True" ForeColor="White" />
            </asp:GridView>
                        <br />
                        <br />
                      
                    </div>

                </div>         
                 <asp:Label ID="LabOrderNo" runat="server" Text="" Visible="false">

                 </asp:Label><asp:Label ID="LablblPOID" runat="server" Text="Label" Visible="false"></asp:Label>
                 <asp:Label ID="Label3" runat="server" Text="Label" Visible="false"></asp:Label>

                     



             
             
            </asp:Panel>

    </form>
</body>
</html>
