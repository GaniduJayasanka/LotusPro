<%@ page language="C#" autoeventwireup="true" inherits="PlantWiseDeliveryRep, App_Web_b2ychy0x" %>

<%@ Register Assembly="BasicFrame.WebControls.BasicDatePicker" Namespace="BasicFrame.WebControls" TagPrefix="BDP" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Delivery Breakdown</title>

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
            text-align: center;
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
    </style>
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
    <link href="CSS/bootstrap.css" rel="stylesheet" />
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
        <asp:Label ID="lblOrderNo" runat="server" Visible="False"></asp:Label>
        <asp:Label ID="lblBPOID" runat="server" Visible="False"></asp:Label>
        <asp:Label ID="lblBPOSEQ" runat="server" Visible="False"></asp:Label>
        <asp:Label ID="lblSDID" runat="server" Visible="False"></asp:Label>
        <asp:Label ID="lblSDSEQ" runat="server" Visible="False"></asp:Label>
        <asp:Label ID="LabPOQty" runat="server" Visible="False"></asp:Label>
        <asp:HiddenField ID="hfRemainingValue" runat="server" />
        <asp:Label ID="LabBuyer" runat="server" Visible="False"></asp:Label>
        <asp:Label ID="Labelstyle" runat="server" Visible="False"></asp:Label>
        <asp:Label ID="LabelDSID" runat="server" Visible="False"></asp:Label>
        <asp:Label ID="Labepromised" runat="server" Visible="False"></asp:Label>
        <asp:Label ID="LabeBpoNo" runat="server" Visible="False"></asp:Label>
        <asp:Panel ID="pnlsearch" runat="server">
            <div class="row">
                <div class="col-md-12">
                    <div class="col-md-2">
                        <br />
                        <asp:ImageButton ID="btnHome" runat="server" ImageUrl="~/images/Tohome.png" Height="35px"
                            Width="35px" PostBackUrl="~/home.aspx" />
                        <asp:ImageButton ID="btnback" runat="server" ImageUrl="~/images/Back.png" Height="35px"
                            Width="35px" PostBackUrl="~/report.aspx" />
                    </div>
                    <div class="col-md-8">
                        <h3 style="text-align: center">Style Delivery Drill Down Report</h3>
                    </div>
                </div>
            </div>
            <div class="col-md-12">
                <div class="panel panel-default">
                    <div class="panel-body">
                        <div class="box-body">
                            <div class="row">
                                <div class="form-group">
                                    <label class="col-md-2 control-label">Date Range - From: <span style="color: red">*</span></label>
                                    <div class="col-md-3">
                                        <BDP:BasicDatePicker ID="DatePickerFromDate" runat="server" CssClass="form-control" />
                                    </div>
                                    <label class="col-md-1 control-label">To: <span style="color: red">*</span></label>
                                    <div class="col-md-3">
                                        <BDP:BasicDatePicker ID="DatePickerToDate" runat="server" CssClass="form-control" />
                                    </div>
                                    <div class="col-md-2">
                                        <asp:Button ID="btnsearch" CssClass="btn btn-info" runat="server" Text="Search" OnClick="btnsearch_Click" />
                                    </div>
                                </div>
                            </div>
                            <br />
                            <div class="row">
                                <div class="box-body">
                                    <div class="form-group">
                                        <label class="col-md-2 control-label">Plant:</label>
                                        <div class="col-md-3">
                                            <asp:DropDownList ID="DDLPlant" runat="server" CssClass="form-control"
                                                AutoPostBack="true" OnSelectedIndexChanged="DDLPlant_SelectedIndexChanged">
                                            </asp:DropDownList>
                                        </div>
                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
                                    <label class="col-md-1 control-label">Buyer:</label>
                                        <div class="col-md-2">
                                            <asp:DropDownList ID="DDLBUYER" CssClass="form-control" runat="server"
                                                AutoPostBack="true" OnSelectedIndexChanged="DDLBUYER_SelectedIndexChanged">
                                            </asp:DropDownList>
                                        </div>
                                        <div class="col-md-12">
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="box-body">
                                    <div class="form-group">
                                        <label class="col-md-2 control-label" style="left: 0px; top: 0px">Style :</label>
                                        <div class="col-md-2">
                                            <asp:TextBox ID="txtStyle" CssClass="form-control" runat="server" Width="250px"></asp:TextBox>
                                        </div>
                                        <div class="col-md-1">
                                        </div>
                                        <div class="col-md-2">
                                        </div>
                                        <div class="col-md-2">
                                        </div>
                                        <div class="col-md-2">
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="box-body">
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
                            </div>
                        </div>
                    </div>
                </div>
        </asp:Panel>
        <asp:Panel ID="pnlResults" runat="server">
            <div class="auto-style21">
                <asp:Panel ID="PanelHeader" runat="server" BorderColor="#CCFFFF" Visible="False">
                    <div class="text-right">
                        <table class="auto-style15">
                            <tr>
                                <td class="auto-style16">&nbsp;</td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td class="auto-style16">&nbsp;</td>
                                <td class="text-left">
                                    <strong>
                                        <asp:Label ID="Label1" runat="server" Text="Style :  "></asp:Label>
                                    </strong>
                                    <asp:Label ID="Labestyle" runat="server" Font-Bold="True"
                                        ForeColor="Blue"></asp:Label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                     <asp:LinkButton ID="labStyleDeliveryStatus" runat="server" OnClick="labStyleDeliveryStatus_Click">Overall</asp:LinkButton>
                                    &nbsp;&nbsp;&nbsp;
                                     <asp:DropDownList ID="DDLStylePlant" runat="server" AutoPostBack="true"
                                         CssClass="form-control" OnSelectedIndexChanged="DDLStylePlant_SelectedIndexChanged">
                                     </asp:DropDownList>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style16">&nbsp;</td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td class="auto-style16">&nbsp;</td>
                                <td>
                                    <asp:GridView ID="GridViewColourWise" FooterStyle-Font-Bold="true" runat="server" AllowSorting="True" AutoGenerateColumns="False" BackColor="White" BorderColor="#cccccc" BorderWidth="2px" CellPadding="4" EnableModelValidation="True" Font-Size="Small" ForeColor="Black" Height="96px" OnRowDataBound="GridViewColourWise_RowDataBound" ShowFooter="true" Width="866px" OnRowCreated="GridViewColourWise_RowCreated" OnRowDeleted="GridViewColourWise_RowDeleted">
                                        <Columns>
                                            <asp:TemplateField HeaderText="FOB" Visible="false" ItemStyle-HorizontalAlign="Left" SortExpression="">
                                                <ItemTemplate>
                                                    <asp:Label ID="labFOB" runat="server" Text='<%#Eval("FOB") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Color Code" ItemStyle-HorizontalAlign="Left" SortExpression="">
                                                <ItemTemplate>
                                                    <asp:Label ID="labColorCode" runat="server" Text='<%#Eval("ColorCode") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Color" ItemStyle-HorizontalAlign="Left" ItemStyle-Width="120px">
                                                <ItemTemplate>
                                                    <asp:LinkButton ID="labColorNames" runat="server" OnClick="lnkbtnColour_Click" Text='<%#Eval("ColorName") %>' Width="180px"></asp:LinkButton>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Colour Qty" SortExpression="">
                                                <ItemTemplate>
                                                    <asp:Label ID="labColourQtys" runat="server" Text='<%#Eval("ColourQty") %>'></asp:Label>
                                                </ItemTemplate>
                                                <FooterTemplate>
                                                    <div>
                                                        <asp:Label ID="lblTotColourQtys" runat="server" Font-Bold="true" />
                                                    </div>
                                                </FooterTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Commited Qty" SortExpression="">
                                                <ItemTemplate>
                                                    <asp:Label ID="labPromisedQtys" runat="server" Text='<%#Eval("PromisedQty") %>'></asp:Label>
                                                </ItemTemplate>
                                                <FooterTemplate>
                                                    <div>
                                                        <asp:Label ID="lblTotPromisedQtys" runat="server" Font-Bold="true" />
                                                    </div>
                                                </FooterTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Despatched Qty" ItemStyle-HorizontalAlign="Right" SortExpression="">
                                                <ItemTemplate>
                                                    <asp:Label ID="labDespatchedQtys" runat="server" Text='<%#Eval("DespatchedQty") %>'></asp:Label>
                                                </ItemTemplate>
                                                <FooterTemplate>
                                                    <div>
                                                        <asp:Label ID="lblTotDespatchedQty" runat="server" Font-Bold="true" />
                                                    </div>
                                                </FooterTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Colour Vs Des" ItemStyle-HorizontalAlign="Right" ItemStyle-BackColor="#00FFCC" Visible="true">
                                                <ItemTemplate>
                                                    <asp:Label ID="labColourQty" runat="server"></asp:Label>
                                                </ItemTemplate>
                                                <FooterTemplate>
                                                    <div>
                                                        <asp:Label ID="lblTotColourQty" runat="server" Font-Bold="true" />
                                                    </div>
                                                </FooterTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Committed Vs Des" ItemStyle-HorizontalAlign="Right" ItemStyle-BackColor="#33CCFF" Visible="true">
                                                <ItemTemplate>
                                                    <asp:Label ID="labPromisedQty" runat="server"></asp:Label>
                                                </ItemTemplate>
                                                <FooterTemplate>
                                                    <div>
                                                        <asp:Label ID="lblTotPromisedQty" runat="server" Font-Bold="true" />
                                                    </div>
                                                </FooterTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Colour Vs Des" ItemStyle-HorizontalAlign="Right" Visible="true">
                                                <ItemTemplate>
                                                    <asp:Label ID="labColourQtyFOB" runat="server"></asp:Label>
                                                </ItemTemplate>
                                                <FooterTemplate>
                                                    <div>
                                                        <asp:Label ID="lblTotColourQtyFOB" runat="server" Font-Bold="true" />
                                                    </div>
                                                </FooterTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Committed Vs Des" ItemStyle-HorizontalAlign="Right" Visible="true">
                                                <ItemTemplate>
                                                    <asp:Label ID="labPromisedQtyFOB" runat="server"></asp:Label>
                                                </ItemTemplate>
                                                <FooterTemplate>
                                                    <div>
                                                        <asp:Label ID="lblTotPromisedQtyFOB" runat="server" Font-Bold="true" />
                                                    </div>
                                                </FooterTemplate>
                                            </asp:TemplateField>
                                            <%--<asp:TemplateField HeaderText="Cancel" Visible="false">
                            <ItemTemplate>                           
                                <asp:Label ID="labCancel" runat="server" Visible="true" Text='<%#Eval("Cancel") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                                      <asp:TemplateField HeaderText="Cancel"  Visible="true">
                            <ItemTemplate>                           
                                <asp:Label ID="labCancelRemarks" Width="80px" runat="server" Visible="true" Text='<%#Eval("CancelRe") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>--%>
                                        </Columns>
                                       <SelectedRowStyle ForeColor="White" Font-Bold="True" BackColor="#738A9C" />
                                    </asp:GridView>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style16">&nbsp;</td>
                            </tr>
                        </table>
                    </div>
                </asp:Panel>
            </div>
            <div class="col-md-12">
               <asp:GridView ID="Gridresults" runat="server" FooterStyle-HorizontalAlign="Right" ShowFooter="true" Height="264px" DataKeyNames="OrderNo" AutoGenerateColumns="False" BackColor="White" BorderColor="#cccccc"
                    BorderWidth="2px" CellPadding="4" ForeColor="Black" AllowSorting="True" Style="max-width: 100%; min-width: 90%" Font-Size="Small"
                    EnableModelValidation="True" Width="873px" OnRowDataBound="Gridresults_RowDataBound" OnRowCreated="Gridresults_RowCreated">
                    <Columns>
                        <asp:TemplateField HeaderText="OrderNo" SortExpression="" Visible="false">
                            <ItemTemplate>
                                <asp:Label ID="OrderNo" runat="server" Text='<%#Eval("OrderNo") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Buyer Code" SortExpression="">
                            <ItemTemplate>
                                <asp:Label ID="labBuyerCode" runat="server" Text='<%#Eval("BuyerCode") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Style No" SortExpression="">
                            <ItemTemplate>
                                <asp:LinkButton ID="labStyleNo" Width="140px" OnClick="lnkbtnBPO_Click" runat="server" Text='<%#Eval("StyleNo") %>'></asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Color Name" SortExpression="">
                            <ItemTemplate>
                                <asp:Label ID="labColorName" runat="server" Text='<%#Eval("ColorName") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="FOB" ItemStyle-HorizontalAlign="Right" SortExpression="">
                            <ItemTemplate>
                                <asp:Label ID="labFOB" runat="server" Text='<%#Eval("FOB") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Color Qty" ItemStyle-HorizontalAlign="Right" SortExpression="">
                            <ItemTemplate>
                                <asp:Label ID="labOrderQty" runat="server" Text='<%#Eval("ColourQty") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Committed Qty" ItemStyle-HorizontalAlign="Right" Visible="true">
                            <ItemTemplate>
                                <asp:Label ID="labPromisedQtys" runat="server" Text='<%#Eval("PromisedQty") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Despatched Qty" ItemStyle-HorizontalAlign="Right" Visible="true">
                            <ItemTemplate>
                                <asp:Label ID="labDespatchedQtys" runat="server" Text='<%#Eval("DespatchedQty") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Order Vs Des" ItemStyle-HorizontalAlign="Right" ItemStyle-BackColor="#00FFCC" Visible="false">
                            <ItemTemplate>
                                <asp:Label ID="labBPOVsDosos" runat="server"></asp:Label>
                            </ItemTemplate>
                            <FooterTemplate>
                                <div>
                                    <asp:Label ID="lblTotBPOVsDososM1" runat="server" Font-Bold="true" />
                                </div>
                            </FooterTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Committed Vs Des" ItemStyle-HorizontalAlign="Right" ItemStyle-BackColor="#66CCFF" Visible="true">
                            <ItemTemplate>
                                <asp:Label ID="labPromisedQty" runat="server"></asp:Label>
                            </ItemTemplate>
                            <FooterTemplate>
                                <div>
                                    <asp:Label ID="lblTotPromisedQtyM1" runat="server" Font-Bold="true" />
                                </div>
                            </FooterTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Order Vs Des" ItemStyle-HorizontalAlign="Right" Visible="false">
                            <ItemTemplate>
                                <asp:Label ID="labOrderQtyFOB" runat="server"></asp:Label>
                            </ItemTemplate>
                            <FooterTemplate>
                                <div>
                                    <asp:Label Font-Bold="true" ID="lblTotOrderQtyFOBM1" runat="server" />
                                </div>
                            </FooterTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Committed Vs Des(Val)" ItemStyle-HorizontalAlign="Right">
                            <ItemTemplate>
                                <asp:Label ID="labPromisedQtyFOB" runat="server"></asp:Label>
                            </ItemTemplate>
                            <FooterTemplate>
                                <div>
                                    <asp:Label Font-Bold="true" ID="lblTotPromisedQtyFOBM1" runat="server" />
                                </div>
                            </FooterTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
                </asp:GridView>
                <br />
            </div>
        </asp:Panel>
        <asp:Button ID="btnShowPopup" runat="server" Style="display: none" />
        <asp:ModalPopupExtender ID="MPESL" runat="server" TargetControlID="btnShowPopup" PopupControlID="pnlpopup"
            CancelControlID="btnMPECancel" BackgroundCssClass="modalBackground">
        </asp:ModalPopupExtender>
        <asp:Panel ID="pnlpopup" runat="server" BackColor="White" Height="500px" Width="1100px"
            Style="overflow: scroll; border: Solid 3px #0026ff;">
            <div class="container" style="max-width: 1050px">
                <div class="row">
                    <div class="col-md-11">
                        <h4></h4>
                    </div>
                </div>
                <div class="row">
                    <asp:Label ID="LabcolourQty" Visible="false" runat="server"></asp:Label>
                    <asp:Label ID="LabCCode" Visible="false" runat="server"></asp:Label>
                    <div class="auto-style26">
                       <div class="col-md-10">
                            <h4 style="text-align: center">Color Wise Summary</h4>
                        </div>
                        <div class="col-md-2">
                            <asp:ImageButton ID="btnMPECancel" runat="server" ImageUrl="~/images/Cancel.png"
                                Width="20" Height="20" CssClass="pull-right" />
                            &nbsp; &nbsp;
                         <asp:ImageButton ID="ImageButton1" ToolTip="Print View" runat="server" Height="35px" ImageUrl="~/images/Printer-icon.png" OnClick="ImageButton1_Click" OnClientClick="" Width="35px" />
                        </div>
                        <asp:Label ID="LabCName" Visible="false" runat="server"></asp:Label>
                        <asp:Label ID="Labcolour" Visible="false" runat="server"></asp:Label>
                    </div>
                </div>
                <div class="col-md-12">
                    <div class="panel panel-default">
                        <div class="panel-body">
                            <div class="box-body">
                                <div class="row">
                                    <div class="box-body">
                                        <div class="form-group">
                                            <label class="col-md-1 control-label">Buyer:</label>
                                            <div class="col-md-2">
                                                <asp:Label ID="lblBuyer" runat="server" Text="Label"></asp:Label>
                                            </div>
                                            <label class="col-md-1 control-label">Style:</label>
                                            <div class="col-md-2">
                                                <asp:Label ID="LabpopStylepop" runat="server" Text="Label"></asp:Label>
                                            </div>
                                            <label class="col-md-1 control-label">Color:</label>
                                            <div class="col-md-2">
                                                <asp:Label ID="labelColorName" runat="server" Text="Label"></asp:Label>
                                            </div>
                                            <label class="col-md-2 control-label">BPO Qty:</label>
                                            <div class="col-md-1">
                                                <asp:Label ID="Label9" runat="server" Visible="true" Text=""></asp:Label>
                                            </div>
                                            <div class="col-md-1">
                                                <asp:Label ID="lblBuyerID" runat="server" Visible="false" Text=""></asp:Label>
                                                <asp:Label ID="lblStatus" runat="server" Visible="false" Text=""></asp:Label>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <br />
                <div class="row">
                    <label class="col-md-7">
                        <asp:GridView ID="GridSuReport" runat="server" ShowFooter="true" AutoGenerateColumns="False" BackColor="White" BorderColor="#cc3300"
                            BorderWidth="2px" CellPadding="4" ForeColor="Black" OnRowCreated="GridSuReport_RowCreated" FooterStyle-HorizontalAlign="Right" OnRowDataBound="GridSuReport_RowDataBound" AllowSorting="True" Style="max-width: 100%; min-width: 90%"
                            EnableModelValidation="True" Width="980px">
                            <Columns>
                                <asp:TemplateField HeaderText="DID" ItemStyle-HorizontalAlign="Center" SortExpression="" Visible="false">
                                    <ItemTemplate>
                                        <asp:Label ID="labDID" runat="server" Text='<%#Eval("DID") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="MDID" ItemStyle-HorizontalAlign="Center" SortExpression="" Visible="false">
                                    <ItemTemplate>
                                        <asp:Label ID="labMDID" runat="server" Text='<%#Eval("MDID") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="PendingDID" ItemStyle-HorizontalAlign="Center" SortExpression="" Visible="false">
                                    <ItemTemplate>
                                        <asp:Label ID="labPendingDID" runat="server" Text='<%#Eval("PendingDID") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="PlantID" ItemStyle-HorizontalAlign="Center" SortExpression="" Visible="false">
                                    <ItemTemplate>
                                        <asp:Label ID="PlantID" runat="server" Text='<%#Eval("PlantID") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Plant" ItemStyle-HorizontalAlign="Center" SortExpression="" Visible="true">
                                    <ItemTemplate>
                                        <asp:Label ID="Plant" runat="server" Text='<%#Eval("Plant") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Delivery No" ItemStyle-HorizontalAlign="Center" SortExpression="" Visible="true">
                                    <ItemTemplate>
                                        <asp:Label ID="labDeliveryNo" runat="server" Text='<%#Eval("DeliveryNo") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Buyer PO No" ItemStyle-HorizontalAlign="Center" SortExpression="" Visible="true">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="labBuyerPONo" runat="server" OnClick="GridSuReport_Click" Text='<%#Eval("BuyerPONo") %>' Width="180px"></asp:LinkButton>
                                    </ItemTemplate>
                                    <FooterTemplate>
                                        <div>
                                            <asp:Label ID="lblTotColourQty" runat="server" />
                                        </div>
                                    </FooterTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="FOB" ItemStyle-HorizontalAlign="Right" Visible="false" SortExpression="">
                                    <ItemTemplate>
                                        <asp:Label ID="labFOB" runat="server" Text='<%#Eval("FOB") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Extended Ship Date" ItemStyle-HorizontalAlign="Center" SortExpression="">
                                    <ItemTemplate>
                                        <asp:Label ID="labExtendedShipDate" runat="server" Text='<%#Eval("ExtendedShipDate") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Committed Date" ItemStyle-HorizontalAlign="Center" SortExpression="">
                                    <ItemTemplate>
                                        <asp:Label ID="labPromisedDate" runat="server" Text='<%#Eval("PromisedDate") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Committed Qty" ItemStyle-HorizontalAlign="Right" SortExpression="">
                                    <ItemTemplate>
                                        <asp:Label ID="labPromisedQty" runat="server" Text='<%#Eval("PromisedQty") %>'></asp:Label>
                                    </ItemTemplate>
                                    <FooterTemplate>
                                        <div>
                                            <asp:Label ID="lblTotPromisedQty" runat="server" />
                                        </div>
                                    </FooterTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Despatched Qty" ItemStyle-HorizontalAlign="Right" SortExpression="">
                                    <ItemTemplate>
                                        <asp:Label ID="labDespatchedQty" runat="server" Text='<%#Eval("DespatchedQty") %>'></asp:Label>
                                    </ItemTemplate>
                                    <FooterTemplate>
                                        <div>
                                            <asp:Label ID="lblTotDespatchedQty" runat="server" />
                                        </div>
                                    </FooterTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Committed Vs Des" ItemStyle-HorizontalAlign="Right" Visible="false">
                                    <ItemTemplate>
                                        <asp:Label ID="labPromisedQtyDetail" runat="server"></asp:Label>
                                    </ItemTemplate>
                                    <FooterTemplate>
                                        <div>
                                            <asp:Label ID="lblTotPromisedQtyDetailFOBDetail" runat="server" />
                                        </div>
                                    </FooterTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Committed Vs Des" ItemStyle-HorizontalAlign="Right" Visible="false">
                                    <ItemTemplate>
                                        <asp:Label ID="labPromisedQtyFOB" runat="server"></asp:Label>
                                    </ItemTemplate>
                                    <FooterTemplate>
                                        <div>
                                            <asp:Label ID="lblTotPromisedQtyFOBValue" runat="server" />
                                        </div>
                                    </FooterTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Over/Short Qty" ItemStyle-HorizontalAlign="Right" SortExpression="">
                                    <ItemTemplate>
                                        <asp:Label ID="labOSQty" runat="server" Text='<%#Eval("OSQty") %>'></asp:Label>
                                    </ItemTemplate>
                                    <FooterTemplate>
                                        <div>
                                            <asp:Label ID="lblTotOSQty" runat="server" />
                                        </div>
                                    </FooterTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Remarks" Visible="true">
                                    <ItemTemplate>
                                        <asp:Label ID="OverShortReason" runat="server" Text='<%#Eval("OverShortReason") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Despatched On" ItemStyle-HorizontalAlign="Center" Visible="true">
                                    <ItemTemplate>
                                        <asp:Label ID="labDespatchedOn" runat="server" Text='<%#Eval("DespatchedOn") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Shipped On" ItemStyle-HorizontalAlign="Center">
                                    <ItemTemplate>
                                        <asp:Label ID="labShippedOn" runat="server" Text='<%#Eval("ShippedOn") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Pending" Visible="false" ItemStyle-HorizontalAlign="Center">
                                    <ItemTemplate>
                                        <asp:Label ID="labPending" runat="server" Text='<%#Eval("Pending") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="ChildCount" Visible="false" ItemStyle-HorizontalAlign="Center">
                                    <ItemTemplate>
                                        <asp:Label ID="labChildCount" runat="server" Text='<%#Eval("ChildCount") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="POID" Visible="false" ItemStyle-HorizontalAlign="Center">
                                    <ItemTemplate>
                                        <asp:Label ID="labPOID" runat="server" Text='<%#Eval("POID") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Cancel" Visible="false">
                                    <ItemTemplate>
                                        <asp:Label ID="labCancel" runat="server" Visible="true" Text='<%#Eval("Cancel") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Cancel" Visible="true">
                                    <ItemTemplate>
                                        <asp:Label ID="labCancelRemarks" Width="80px" runat="server" Visible="true" Text='<%#Eval("CancelRe") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Short Reason" Visible="true">
                                    <ItemTemplate>
                                        <asp:Label ID="labShortReason" Width="80px" runat="server" Visible="true" Text='<%#Eval("ShortReason") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                            <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
                        </asp:GridView>
                        <br />
                        <br />
                        <asp:Label ID="Labebpo" runat="server" Text=""></asp:Label>
                        <br />
                        <br />
                        <asp:GridView ID="GridSuReportSub" runat="server" ShowFooter="true" AutoGenerateColumns="False" BackColor="White" BorderColor="#cc3300"
                            BorderWidth="2px" CellPadding="4" ForeColor="Black" OnRowCreated="GridSuReport_RowCreated" FooterStyle-HorizontalAlign="Right" OnRowDataBound="GridSuReportSub_RowDataBound" AllowSorting="True" Style="max-width: 100%; min-width: 90%"
                            EnableModelValidation="True" Width="980px">
                            <Columns>
                                <asp:TemplateField HeaderText="Plant" ItemStyle-HorizontalAlign="Center" Visible="false" SortExpression="">
                                    <ItemTemplate>
                                        <asp:Label ID="labPlant" runat="server" Text='<%#Eval("Plant") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Colour" ItemStyle-HorizontalAlign="Center" SortExpression="">
                                    <ItemTemplate>
                                        <asp:Label ID="labColorName" runat="server" Text='<%#Eval("ColorName") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="ExtendedShipDate" ItemStyle-HorizontalAlign="Center" SortExpression="" Visible="false">
                                    <ItemTemplate>
                                        <asp:Label ID="labExtendedShipDate" runat="server" Text='<%#Eval("ExtendedShipDate") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Committed Qty" ItemStyle-HorizontalAlign="Right" SortExpression="">
                                    <ItemTemplate>
                                        <asp:Label ID="labPromisedQty" runat="server" Text='<%#Eval("PromisedQty") %>'></asp:Label>
                                    </ItemTemplate>
                                    <FooterTemplate>
                                        <div>
                                            <asp:Label ID="lblTotPromisedQty" runat="server" />
                                        </div>
                                    </FooterTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="DespatchedQty" ItemStyle-HorizontalAlign="Right" SortExpression="" Visible="">
                                    <ItemTemplate>
                                        <asp:Label ID="labDespatchedQty" runat="server" Text='<%#Eval("DespatchedQty") %>'></asp:Label>
                                    </ItemTemplate>
                                    <FooterTemplate>
                                        <div>
                                            <asp:Label ID="lblTotDespatchedQty" runat="server" />
                                        </div>
                                    </FooterTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Over/Short Qty" ItemStyle-HorizontalAlign="Right" SortExpression="" Visible="true">
                                    <ItemTemplate>
                                        <asp:Label ID="labOSQty" runat="server" Text='<%#Eval("OSQty") %>'></asp:Label>
                                    </ItemTemplate>
                                    <FooterTemplate>
                                        <div>
                                            <asp:Label ID="lblTotOSQty" runat="server" />
                                        </div>
                                    </FooterTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Cancel" Visible="false">
                                    <ItemTemplate>
                                        <asp:Label ID="labCancel" runat="server" Visible="true" Text='<%#Eval("Cancel") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Cancel" Visible="true">
                                    <ItemTemplate>
                                        <asp:Label ID="labCancelRemarks" Width="80px" runat="server" Visible="true" Text='<%#Eval("CancelRe") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                            <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
                        </asp:GridView>
                        <br />
                        <asp:Label ID="Label7" runat="server" Text="Color Summing Up" Style="font-size: small"></asp:Label>
                        <br />
                        <br />
                        <asp:GridView ID="GVColorSummingUp" runat="server" ShowFooter="false" AutoGenerateColumns="False" BackColor="White" BorderColor="#cc3300"
                            BorderWidth="2px" CellPadding="4" ForeColor="Black" FooterStyle-HorizontalAlign="Right" AllowSorting="True" Style="max-width: 100%; min-width: 90%; font-size: small;"
                            EnableModelValidation="True" Width="980px">
                            <Columns>
                                <asp:TemplateField HeaderText="BPO Qty" ItemStyle-HorizontalAlign="Center">
                                    <ItemTemplate>
                                        <asp:Label ID="labBPOQty" runat="server" Text='<%#Eval("BPOQty") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="SPO Qty" ItemStyle-HorizontalAlign="Center" Visible="false">
                                    <ItemTemplate>
                                        <asp:Label ID="labSPOQty" runat="server" Text='<%#Eval("SPOQty") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Committed Qty" ItemStyle-HorizontalAlign="Center">
                                    <ItemTemplate>
                                        <asp:Label ID="labCommittedQty" runat="server" Text='<%#Eval("CommittedQty") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Dispatched Qty" ItemStyle-HorizontalAlign="Center">
                                    <ItemTemplate>
                                        <asp:Label ID="labDespatchedQty" runat="server" Text='<%#Eval("DespatchedQty") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="BPO Vs Dispatched Qty" ItemStyle-HorizontalAlign="Center">
                                    <ItemTemplate>
                                        <asp:Label ID="BPOVsDispatched" runat="server" Text='<%#Eval("BPOVsDispatched") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="SPO Vs Dispatched Qty" ItemStyle-HorizontalAlign="Center" Visible="false">
                                    <ItemTemplate>
                                        <asp:Label ID="SPOVsDispatched" runat="server" Text='<%#Eval("SPOVsDispatched") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Committed Vs Dispatched Qty" ItemStyle-HorizontalAlign="Center">
                                    <ItemTemplate>
                                        <asp:Label ID="CommittedVsDispatched" runat="server" Text='<%#Eval("CommittedVsDispatched") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                        <br />
                        <br />
                        <asp:Label ID="Label5" runat="server" Text="BPO Summery"></asp:Label>
                        <br />
                        <br />
                        <asp:GridView ID="GridBpoSummery" runat="server" ShowFooter="false" AutoGenerateColumns="False" BackColor="White" BorderColor="#cc3300"
                            BorderWidth="2px" CellPadding="4" ForeColor="Black" OnRowDataBound="GridBpoSummery_RowDataBound" FooterStyle-HorizontalAlign="Right" AllowSorting="True" Style="max-width: 100%; min-width: 90%"
                            EnableModelValidation="True" Width="980px">
                           <Columns>
                               <asp:TemplateField HeaderText="BuyerPONo" ItemStyle-HorizontalAlign="Center">
                                    <ItemTemplate>
                                        <asp:Label ID="labBuyerPONo" runat="server" Text='<%#Eval("BuyerPONo") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="ContractNo" ItemStyle-HorizontalAlign="Center">
                                    <ItemTemplate>
                                        <asp:Label ID="labContractNo" runat="server" Text='<%#Eval("ContractNo") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="BPOQty" ItemStyle-HorizontalAlign="Right">
                                    <ItemTemplate>
                                        <asp:Label ID="ReqQty" runat="server" Text='<%#Eval("ReqQty") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="ShippedQty" ItemStyle-HorizontalAlign="Right" SortExpression="">
                                    <ItemTemplate>
                                        <asp:Label ID="ShippedQty" runat="server" Text='<%#Eval("ShippedQty")%>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Short / Over Qty" ItemStyle-HorizontalAlign="Right" SortExpression="">
                                    <ItemTemplate>
                                        <asp:Label ID="labShippedQty" runat="server"></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="ExtendedShipDate" ItemStyle-HorizontalAlign="Right" SortExpression="" Visible="true">
                                    <ItemTemplate>
                                        <asp:Label ID="labExtendedShipDate" runat="server" Text='<%#Eval("ExtendedShipDate", "{0:dd/MM/yyyy}") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="maxShippedDate" ItemStyle-HorizontalAlign="Right">
                                    <ItemTemplate>
                                        <asp:Label ID="labmaxShippedDate" runat="server" Text='<%#Eval("maxShippedDate", "{0:dd/MM/yyyy}") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                            <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
                        </asp:GridView>
                        <br />
                        <br />
                        <asp:Label ID="Label2" runat="server" Text="Pending Deliveries"></asp:Label>
                        <br />
                        <br />
                        <asp:GridView ID="GridViewShiped" runat="server" ShowFooter="true" AutoGenerateColumns="False" BackColor="White" BorderColor="#cc3300"
                            BorderWidth="2px" CellPadding="4" ForeColor="Black" FooterStyle-HorizontalAlign="Right" OnRowDataBound="GridViewShiped_RowDataBound" AllowSorting="True" Style="max-width: 100%; min-width: 90%"
                            EnableModelValidation="True" Width="1036px">
                            <Columns>
                                <asp:TemplateField HeaderText="PlantID" ItemStyle-HorizontalAlign="Center" SortExpression="" Visible="false">
                                    <ItemTemplate>
                                        <asp:Label ID="PlantID" runat="server" Text='<%#Eval("PlantID") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Plant" ItemStyle-Width="20px" ItemStyle-HorizontalAlign="Center" SortExpression="" Visible="true">
                                    <ItemTemplate>
                                        <asp:Label ID="Plant" runat="server" Text='<%#Eval("Plant") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Delivery No" ItemStyle-Width="23px" ItemStyle-HorizontalAlign="Center" SortExpression="" Visible="true">
                                    <ItemTemplate>
                                        <asp:Label ID="labDeliveryNo" runat="server" Text='<%#Eval("DeliveryNo") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Buyer PO No" ItemStyle-Width="180px" ItemStyle-HorizontalAlign="Center" SortExpression="" Visible="true">
                                    <ItemTemplate>
                                        <asp:Label ID="labBuyerPONo" runat="server" Text='<%#Eval("BuyerPONo") %>'></asp:Label>
                                    </ItemTemplate>
                                    <FooterTemplate>
                                        <div>
                                            <asp:Label ID="lblTotColourQty" runat="server" />
                                        </div>
                                    </FooterTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="FOB" ItemStyle-HorizontalAlign="Right" Visible="false" SortExpression="">
                                    <ItemTemplate>
                                        <asp:Label ID="labFOB" runat="server" Text='<%#Eval("FOB") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Extended Ship Date" ItemStyle-Width="55px" ItemStyle-HorizontalAlign="Center" SortExpression="">
                                    <ItemTemplate>
                                        <asp:Label ID="labExtendedShipDate" runat="server" Text='<%#Eval("ExtendedShipDate") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Committed Date" ItemStyle-Width="55px" ItemStyle-HorizontalAlign="Center" SortExpression="">
                                    <ItemTemplate>
                                        <asp:Label ID="labPromisedDate" runat="server" Text='<%#Eval("PromisedDate") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Committed Qty" ItemStyle-Width="40px" ItemStyle-HorizontalAlign="Right" SortExpression="">
                                    <ItemTemplate>
                                        <asp:Label ID="labPromisedQty" runat="server" Text='<%#Eval("PromisedQty") %>'></asp:Label>
                                    </ItemTemplate>
                                    <FooterTemplate>
                                        <div>
                                            <asp:Label ID="lblTotPromisedQty" runat="server" />
                                        </div>
                                    </FooterTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Despatched Qty" ItemStyle-Width="35px" ItemStyle-HorizontalAlign="Right" SortExpression="">
                                    <ItemTemplate>
                                        <asp:Label ID="labDespatchedQty" runat="server"></asp:Label>
                                    </ItemTemplate>
                                    <FooterTemplate>
                                        <div>
                                            <asp:Label ID="lblTotDespatchedQty" runat="server" />
                                        </div>
                                    </FooterTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Committed Vs Des" ItemStyle-HorizontalAlign="Right" Visible="false">
                                    <ItemTemplate>
                                        <asp:Label ID="labPromisedQtyDetail" runat="server"></asp:Label>
                                    </ItemTemplate>
                                    <FooterTemplate>
                                        <div>
                                            <asp:Label ID="lblTotPromisedQtyDetailFOBDetail" runat="server" />
                                        </div>
                                    </FooterTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Committed Vs Des" ItemStyle-HorizontalAlign="Right" Visible="false">
                                    <ItemTemplate>
                                        <asp:Label ID="labPromisedQtyFOB" runat="server"></asp:Label>
                                    </ItemTemplate>
                                    <FooterTemplate>
                                        <div>
                                            <asp:Label ID="lblTotPromisedQtyFOBValue" runat="server" />
                                        </div>
                                    </FooterTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Over/Short Qty" ItemStyle-Width="40px" ItemStyle-HorizontalAlign="Right" SortExpression="">
                                    <ItemTemplate>
                                        <asp:Label ID="labOSQty" runat="server"></asp:Label>
                                    </ItemTemplate>
                                    <FooterTemplate>
                                        <div>
                                            <asp:Label ID="lblTotOSQty" runat="server" />
                                        </div>
                                    </FooterTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Remarks" ItemStyle-Width="72px" Visible="true">
                                    <ItemTemplate>
                                        <asp:Label ID="OverShortReason" runat="server"></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Despatched On" ItemStyle-Width="40px" ItemStyle-HorizontalAlign="Center" Visible="true">
                                    <ItemTemplate>
                                        <asp:Label ID="labDespatchedOn" runat="server"></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Shipped On" ItemStyle-HorizontalAlign="Center">
                                    <ItemTemplate>
                                        <asp:Label ID="labShippedOn" runat="server"></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Pending" Visible="false" ItemStyle-HorizontalAlign="Center">
                                    <ItemTemplate>
                                        <asp:Label ID="labPending" runat="server"></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="ChildCount" Visible="false" ItemStyle-HorizontalAlign="Center">
                                    <ItemTemplate>
                                        <asp:Label ID="labChildCount" runat="server"></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="POID" Visible="false" ItemStyle-HorizontalAlign="Center">
                                    <ItemTemplate>
                                        <asp:Label ID="labPOID" runat="server"></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Cancel" Visible="false">
                                    <ItemTemplate>
                                        <asp:Label ID="labCancel" runat="server" Visible="true"></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Cancel" Visible="true">
                                    <ItemTemplate>
                                        <asp:Label ID="labCancelRemarks" Width="80px" runat="server" Visible="true"></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Short Reason" Visible="true">
                                    <ItemTemplate>
                                        <asp:Label ID="labShortReason" Width="80px" runat="server" Visible="true"></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                            <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
                        </asp:GridView>
                        <br />
                        <br />
                        <asp:Label ID="Label3" runat="server" Text="Shipment History"></asp:Label>
                        <br />
                        <br />
                        <asp:GridView ID="GridViewOtherShipments" runat="server" ShowFooter="true" AutoGenerateColumns="False" BackColor="White" BorderColor="#cc3300"
                            BorderWidth="2px" CellPadding="4" ForeColor="Black" OnRowDataBound="GridSuReport_GridViewOtherShipments" FooterStyle-HorizontalAlign="Right" AllowSorting="True" Style="max-width: 100%; min-width: 90%"
                            EnableModelValidation="True" Width="1039px">
                            <Columns>
                                <asp:TemplateField HeaderText="PlantID" ItemStyle-HorizontalAlign="Center" SortExpression="" Visible="false">
                                    <ItemTemplate>
                                        <asp:Label ID="PlantID" runat="server" Text='<%#Eval("PlantID") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Plant" ItemStyle-HorizontalAlign="Center" SortExpression="" Visible="true">
                                    <ItemTemplate>
                                        <asp:Label ID="Plant" runat="server" Text='<%#Eval("Plant") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Delivery No" ItemStyle-Width="23px" ItemStyle-HorizontalAlign="Center" SortExpression="" Visible="true">
                                    <ItemTemplate>
                                        <asp:Label ID="labDeliveryNo" runat="server" Text='<%#Eval("DeliveryNo") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Buyer PO No" ItemStyle-Width="179px" ItemStyle-HorizontalAlign="Center" SortExpression="" Visible="true">
                                    <ItemTemplate>
                                        <asp:Label ID="labBuyerPONo" runat="server" Text='<%#Eval("BuyerPONo") %>'></asp:Label>
                                    </ItemTemplate>
                                    <FooterTemplate>
                                        <div>
                                            <asp:Label ID="lblTotColourQty" runat="server" />
                                        </div>
                                    </FooterTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="FOB" ItemStyle-HorizontalAlign="Right" Visible="false" SortExpression="">
                                    <ItemTemplate>
                                        <asp:Label ID="labFOB" runat="server" Text='<%#Eval("FOB") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Extended Ship Date" ItemStyle-Width="45px" ItemStyle-HorizontalAlign="Center" SortExpression="">
                                    <ItemTemplate>
                                        <asp:Label ID="labExtendedShipDate" runat="server" Text='<%#Eval("ExtendedShipDate") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Committed Date" ItemStyle-Width="45px" ItemStyle-HorizontalAlign="Center" SortExpression="">
                                    <ItemTemplate>
                                        <asp:Label ID="labPromisedDate" runat="server" Text='<%#Eval("PromisedDate") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Committed Qty" ItemStyle-Width="35px" ItemStyle-HorizontalAlign="Right" SortExpression="">
                                    <ItemTemplate>
                                        <asp:Label ID="labPromisedQty" runat="server" Text='<%#Eval("PromisedQty") %>'></asp:Label>
                                    </ItemTemplate>
                                    <FooterTemplate>
                                        <div>
                                            <asp:Label ID="lblTotPromisedQty" runat="server" />
                                        </div>
                                    </FooterTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Despatched Qty" ItemStyle-Width="35px" ItemStyle-HorizontalAlign="Right" SortExpression="">
                                    <ItemTemplate>
                                        <asp:Label ID="labDespatchedQty" runat="server" Text='<%#Eval("DespatchedQty") %>'></asp:Label>
                                    </ItemTemplate>
                                    <FooterTemplate>
                                        <div>
                                            <asp:Label ID="lblTotDespatchedQty" runat="server" />
                                        </div>
                                    </FooterTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Committed Vs Des" ItemStyle-HorizontalAlign="Right" Visible="false">
                                    <ItemTemplate>
                                        <asp:Label ID="labPromisedQtyDetail" runat="server"></asp:Label>
                                    </ItemTemplate>
                                    <FooterTemplate>
                                        <div>
                                            <asp:Label ID="lblTotPromisedQtyDetailFOBDetail" runat="server" />
                                        </div>
                                    </FooterTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Committed Vs Des" ItemStyle-HorizontalAlign="Right" Visible="false">
                                    <ItemTemplate>
                                        <asp:Label ID="labPromisedQtyFOB" runat="server"></asp:Label>
                                    </ItemTemplate>
                                    <FooterTemplate>
                                        <div>
                                            <asp:Label ID="lblTotPromisedQtyFOBValue" runat="server" />
                                        </div>
                                    </FooterTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Over/Short Qty" ItemStyle-Width="40px" ItemStyle-HorizontalAlign="Right" SortExpression="">
                                    <ItemTemplate>
                                        <asp:Label ID="labOSQty" runat="server" Text='<%#Eval("OSQty") %>'></asp:Label>
                                    </ItemTemplate>
                                    <FooterTemplate>
                                        <div>
                                            <asp:Label ID="lblTotOSQty" runat="server" />
                                        </div>
                                    </FooterTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Remarks" ItemStyle-Width="70px" Visible="true">
                                    <ItemTemplate>
                                        <asp:Label ID="OverShortReason" runat="server" Text='<%#Eval("OverShortReason") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Despatched On" ItemStyle-Width="40px" ItemStyle-HorizontalAlign="Center" Visible="true">
                                    <ItemTemplate>
                                        <asp:Label ID="labDespatchedOn" runat="server" Text='<%#Eval("DespatchedOn") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Shipped On" ItemStyle-HorizontalAlign="Center">
                                    <ItemTemplate>
                                        <asp:Label ID="labShippedOn" runat="server" Text='<%#Eval("ShippedOn") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Cancel" Visible="true">
                                    <ItemTemplate>
                                        <asp:Label ID="labCancel" Width="80px" runat="server" Visible="true"></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Short Reason" ItemStyle-HorizontalAlign="Center">
                                    <ItemTemplate>
                                        <asp:Label ID="ShortReason" runat="server" Text='<%#Eval("ShortReason") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Pending" ItemStyle-HorizontalAlign="Center" Visible="false">
                                    <ItemTemplate>
                                        <asp:Label ID="labsPending" runat="server" Text='<%#Eval("Pending") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="ChildCount" Visible="false" ItemStyle-HorizontalAlign="Center">
                                    <ItemTemplate>
                                        <asp:Label ID="labChildCount" runat="server" Text='<%#Eval("ChildCount") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                            <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
                        </asp:GridView>
                        <br />
                        <br />
                        <br />
                        <asp:Label ID="Label4" runat="server" Text="Debit Notes" Style="font-size: small"></asp:Label>
                        <asp:GridView ID="GridViewDebitNotes" ShowFooter="true" OnRowDataBound="GridViewDebitNotes_RowDataBound" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#cc3300"
                            BorderWidth="2px" CellPadding="4" ForeColor="Black" FooterStyle-HorizontalAlign="Right" AllowSorting="True" Style="max-width: 100%; min-width: 90%; font-size: small;"
                            EnableModelValidation="True" Width="980px">
                            <Columns>
                                <asp:TemplateField HeaderText="DB Note" SortExpression="">
                                    <ItemTemplate>
                                        <asp:Label ID="DEBNumber" runat="server" Text='<%#Eval("DEBNumber") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Style" SortExpression="">
                                    <ItemTemplate>
                                        <asp:Label ID="STYLE" runat="server" Text='<%#Eval("STYLE") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Item Description" SortExpression="">
                                    <ItemTemplate>
                                        <asp:Label ID="ItemDescription" runat="server" Text='<%#Eval("ItemDescription") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="DB Note Date">
                                    <ItemTemplate>
                                        <asp:Label ID="DEBDate" runat="server" Text='<%#Eval("DB_NOTE_DATE","{0:dd/MMM/yyyy}") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="AGAINST" SortExpression="">
                                    <ItemTemplate>
                                        <asp:Label ID="Address" runat="server" Text='<%#Eval("AGAINST") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="DESCRIPTION" Visible="true">
                                    <ItemTemplate>
                                        <asp:Label ID="DESCRIPTION" runat="server" Text='<%#Eval("DESCRIPTION") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Merchandiser" Visible="true">
                                    <ItemTemplate>
                                        <asp:Label ID="OurMerchandiserName" runat="server" Text='<%#Eval("MERCHANDISER") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="DB Note Quantity" ItemStyle-HorizontalAlign="Right" Visible="true">
                                    <ItemTemplate>
                                        <asp:Label ID="QUANTITY" runat="server" Text='<%#Eval("QUANTITY") %>'></asp:Label>
                                    </ItemTemplate>
                                    <FooterTemplate>
                                        <div>
                                            <asp:Label ID="lblTotDebQUANTITY" runat="server" />
                                        </div>
                                    </FooterTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Amount" Visible="true">
                                    <ItemTemplate>
                                        <asp:Label ID="AMOUNT" runat="server" Text='<%#Eval("AMOUNT") %>'></asp:Label>
                                    </ItemTemplate>
                                    <FooterTemplate>
                                        <div>
                                            <asp:Label ID="lblTotDebAMOUNT" runat="server" />
                                        </div>
                                    </FooterTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Acknowledge Quantity" ItemStyle-HorizontalAlign="Right" Visible="true">
                                    <ItemTemplate>
                                        <asp:Label ID="AcknowledgeQty" runat="server" Text='<%#Eval("AcknowledgeQty") %>'></asp:Label>
                                    </ItemTemplate>
                                    <FooterTemplate>
                                        <div>
                                            <asp:Label ID="lblAcknowledgeQty" runat="server" />
                                        </div>
                                    </FooterTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Currrency" Visible="true">
                                    <ItemTemplate>
                                        <asp:Label ID="CURRENCY" runat="server" Text='<%#Eval("CURRENCY") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Approve Comment" Visible="true">
                                    <ItemTemplate>
                                        <asp:Label ID="ShortShipmentApprovalComment" runat="server" Text='<%#Eval("ShortShipmentApprovalComment") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                            <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
                        </asp:GridView>
                        <br />
                        <asp:Label ID="Label6" runat="server" Text="Sample Dispatch Notes" Style="font-size: small"></asp:Label>
                        <asp:GridView ID="GVSampleDespatchNote" ShowFooter="true" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#cc3300"
                            BorderWidth="2px" CellPadding="4" ForeColor="Black" OnRowDataBound="GVSampleDespatchNote_RowDataBound" FooterStyle-HorizontalAlign="Right" AllowSorting="True" Style="max-width: 100%; min-width: 90%; font-size: small;"
                            EnableModelValidation="True" Width="980px">
                            <Columns>
                                <asp:TemplateField HeaderText="Sample Despatch No" SortExpression="">
                                    <ItemTemplate>
                                        <asp:Label ID="SampleDespatchNo" runat="server" Text='<%#Eval("SampleDespatchNo") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Style" SortExpression="">
                                    <ItemTemplate>
                                        <asp:Label ID="STYLE" runat="server" Text='<%#Eval("StyleNo") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Color" SortExpression="">
                                    <ItemTemplate>
                                        <asp:Label ID="ColorName" runat="server" Text='<%#Eval("ColorName") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Sample Type" SortExpression="">
                                    <ItemTemplate>
                                        <asp:Label ID="SampleType" runat="server" Text='<%#Eval("SampleType") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Despatched Qty" ItemStyle-HorizontalAlign="Right" Visible="true">
                                    <ItemTemplate>
                                        <asp:Label ID="DespatchedQty" runat="server" Text='<%#Eval("DespatchedQty") %>'></asp:Label>
                                    </ItemTemplate>
                                    <FooterTemplate>
                                        <div>
                                            <asp:Label ID="lblTotDespatchedQty" runat="server" />
                                        </div>
                                    </FooterTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Received QTy" ItemStyle-HorizontalAlign="Right" Visible="true">
                                    <ItemTemplate>
                                        <asp:Label ID="ReceivedQTy" runat="server" Text='<%#Eval("ReceivedQTy") %>'></asp:Label>
                                    </ItemTemplate>
                                    <FooterTemplate>
                                        <div>
                                            <asp:Label ID="lblTotReceivedQTy" runat="server" />
                                        </div>
                                    </FooterTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Remaining Qty" ItemStyle-HorizontalAlign="Right" Visible="true">
                                    <ItemTemplate>
                                        <asp:Label ID="RemainingQty" runat="server" Text='<%#Eval("RemainingQty") %>'></asp:Label>
                                    </ItemTemplate>
                                    <FooterTemplate>
                                        <div>
                                            <asp:Label ID="lblTotRemainingQty" runat="server" />
                                        </div>
                                    </FooterTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Despatched To" Visible="true">
                                    <ItemTemplate>
                                        <asp:Label ID="DespatchCompany" runat="server" Text='<%#Eval("DespatchCompany") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Despatched Date">
                                    <ItemTemplate>
                                        <asp:Label ID="DespatchedDate" runat="server" Text='<%#Eval("DespatchedDate","{0:dd/MMM/yyyy}") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Despatch Comment" Visible="true">
                                    <ItemTemplate>
                                        <asp:Label ID="DespatchComment" runat="server" Text='<%#Eval("DespatchComment") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Location" Visible="true">
                                    <ItemTemplate>
                                        <asp:Label ID="Send_Plant" runat="server" Text='<%#Eval("Send_Plant") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                            <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
                        </asp:GridView>
                        <br />
                        <br />
                    </label>
                </div>
                <div class="row">
                    <div class="col-md-4">
                    </div>
                    <div class="col-md-7">
                    </div>
                    <div class="col-md-5">
                    </div>
                </div>
                <div class="row">&nbsp;</div>
        </asp:Panel>
    </form>
</body>
</html>
