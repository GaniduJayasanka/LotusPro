<%@ page language="C#" autoeventwireup="true" inherits="PlantWiseDeliveryReport, App_Web_34neb3g4" %>

<%@ Register Assembly="BasicFrame.WebControls.BasicDatePicker" Namespace="BasicFrame.WebControls" TagPrefix="BDP" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Delivery Breakdown</title>
      <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        .auto-style5 {
            width: 116px;
        }
        .auto-style7 {
            width: 117px;
        }
        .auto-style9 {
            width: 138px;
        }
        .auto-style12 {
            width: 187px;
        }
        .auto-style13 {
            width: 161px;
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
       .ui-tooltip, .arrow:after
        {
            /*background: #FFFF80;*/
            background-color: rgba(53, 255, 42, 0.9);
            background: rgba(53, 255, 42, 0.9);
            color: rgba(53, 255, 42, 0.9);
            border: 1px solid Black;
            text-align:center;
        }
        .ui-tooltip
        {
            padding: 10px 10px;
            color: black;
            border-radius: 10px;
            font: bold 16px "Helvetica Neue" , Sans-Serif;
            text-transform: uppercase;
            box-shadow: 0 0 7px black;
        }
        .arrow
        {
            width: 70px;
            height: 16px;
            overflow: hidden;
            position: absolute;
            left: 50%;
            margin-left: -35px;
            bottom: -16px;
        }
        .arrow.top
        {
            top: -25px;
            bottom: auto;
        }
        .arrow.left
        {
            left: 20%;
        }
        .arrow:after
        {
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
        .arrow.top:after
        {
            bottom: -20px;
            top: auto;
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
        <asp:Label ID="LabelDSID" runat="server" Visible="False"></asp:Label>
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
                        <h3 style="text-align: center">Plant Wise Delivery Report</h3>
                    </div>
                </div>
            </div>
            <div class="col-md-12">
                <div class="panel panel-default">
                    <div class="panel-body">
                        <div class="box-body">
                            <div class="row">
                                <div class="form-group">
                                    <label class="col-md-1 control-label">DateRange<span style="color: red">*</span></label>
                                    <div class="col-md-3">
                                        <BDP:BasicDatePicker ID="DatePickerFromDate" runat="server" CssClass="form-control" />
                                    </div>
                                    <label class="col-md-1 control-label">To <span style="color: red">*</span></label>
                                    <div class="col-md-3">
                                        <BDP:BasicDatePicker ID="DatePickerToDate" runat="server" CssClass="form-control" />
                                    </div>
                                      &nbsp;<div class="col-md-1">
                                        <asp:Button ID="btnsearch" CssClass="btn btn-info" runat="server" Text="Search" OnClick="btnsearch_Click" />
                                                           
                                    </div>
<div class="col-md-1">
                                    </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="box-body">
                                <div class="form-group">
                                    
                                    <label class="col-md-1 control-label">Plant:</label>
                                    <div class="col-md-3">
                                        <asp:DropDownList ID="DDLPlant" runat="server" CssClass="form-control"
                                            AutoPostBack="true" OnSelectedIndexChanged="DDLPlant_SelectedIndexChanged">
                                        </asp:DropDownList>
                                    </div>
                                    <label class="col-md-1 control-label">Buyer:</label>
                                    <div class="col-md-2">
                                        <asp:DropDownList ID="DDLBUYER" CssClass="form-control" runat="server"
                                            AutoPostBack="true" OnSelectedIndexChanged="DDLBUYER_SelectedIndexChanged">
                                        </asp:DropDownList>
                                    </div>
                                   
                                  
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
         </asp:Panel>
        <asp:Panel ID="pnlResults" runat="server">
            <div class="col-md-12">

                <asp:GridView ID="Gridresults" runat="server" ShowFooter="true" Height="264px"  DataKeyNames="OrderNo" AutoGenerateColumns="False" BackColor="White" BorderColor="#cccccc" 
                BorderWidth="2px" CellPadding="4" ForeColor="Black"  AllowSorting="True" Style="max-width: 100%; min-width: 90%" Font-Size="Small"
                EnableModelValidation="True" Width="927px" OnRowDataBound="Gridresults_RowDataBound" OnRowCreated="Gridresults_RowCreated"  >
               
                <Columns>
                    
                              <asp:TemplateField HeaderText="OrderNo" SortExpression=""  Visible="false">
                        <ItemTemplate>
                            <asp:Label ID="OrderNo" runat="server" Text='<%#Eval("OrderNo") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="BPOID" SortExpression="" Visible="false">
                        <ItemTemplate>
                            <asp:Label ID="BPOID" runat="server" Text='<%#Eval("BPOID") %>'></asp:Label>
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
                       <asp:TemplateField HeaderText="Plant" Visible="true">
                        <ItemTemplate>
                            <asp:Label ID="labPlant" runat="server" Text='<%#Eval("Plant") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Buyer" Visible="true">
                        <ItemTemplate>
                            <asp:Label ID="BuyerCode" runat="server" Text='<%#Eval("BuyerCode") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Style">
                        <ItemTemplate>
                            <asp:Label ID="labStyleNo" Width="120px" runat="server" Text='<%#Eval("StyleNo") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                   <asp:TemplateField HeaderText="Buyer PO" Visible="true">
                        <ItemTemplate>                            
                            <asp:LinkButton ID="BuyerPONo" Width="120px" OnClick="lnkbtnBPO_Click"  runat="server" Text='<%#Eval("BuyerPONo") %>'></asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>                  
                    <asp:TemplateField HeaderText="Contract #" Visible="false">
                        <ItemTemplate>
                            <asp:Label ID="LabContractNo" Width="120px" runat="server" Text='<%#Eval("ContractNo") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                      <asp:TemplateField HeaderText="FOB" Visible="false">
                        <ItemTemplate>
                            <asp:Label ID="labFOB" runat="server" Text='<%#Eval("FOB") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                      <asp:TemplateField HeaderText="BuyerPOQty" Visible="false">
                        <ItemTemplate>
                            <asp:Label ID="labBuyerPOQty" runat="server" Text='<%#Eval("BuyerPOQty") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                      <asp:TemplateField HeaderText="Colour" ItemStyle-Width="200px" Visible="true">
                        <ItemTemplate>
                            <asp:Label ID="ColorName" Width="150px" runat="server" Text='<%#Eval("ColorName") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                     <asp:TemplateField HeaderText="Colour Qty" ItemStyle-HorizontalAlign="Right" Visible="true">
                        <ItemTemplate>
                            <asp:Label ID="lblColourQty" runat="server" Text='<%#Eval("ColourQty") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Sumithra PO Qty"  ItemStyle-HorizontalAlign="Right" Visible="true">
                        <ItemTemplate>
                            <asp:Label ID="lblSumithraPOQty" runat="server"  Text='<%#Eval("SumithraPOQty") %>' ></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                       <asp:TemplateField HeaderText="Ext. Ship Date"  ItemStyle-HorizontalAlign="Center" Visible="true">
                        <ItemTemplate>
                            <asp:Label ID="ExtendedShipDate" runat="server" Text='<%#Eval("ExtendedShipDate","{0:dd/MMM/yyyy}") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    
                     <asp:TemplateField HeaderText="Promised Qty"  ItemStyle-HorizontalAlign="Right" Visible="true">
                        <ItemTemplate>
                            <asp:Label ID="PromisedQty" runat="server" Text='<%#Eval("PromisedQty") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Despatched Qty"  ItemStyle-HorizontalAlign="Right"  Visible="true">
                        <ItemTemplate>
                            <asp:Label ID="labDespatchedQty" runat="server" Text='<%#Eval("DespatchedQty") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                     <asp:TemplateField HeaderText="BPO Vs DES"  ItemStyle-HorizontalAlign="Right" Visible="true">
                        <ItemTemplate>
                            <asp:Label ID="labBPOVsDosos" runat="server" ></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                      <asp:TemplateField HeaderText="SPO Vs DES"  ItemStyle-HorizontalAlign="Right" Visible="true">
                        <ItemTemplate>
                            <asp:Label ID="labSPoVsDesos" runat="server" ></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                      <asp:TemplateField HeaderText="BPO Vs DES"  ItemStyle-HorizontalAlign="Right" Visible="true">
                        <ItemTemplate>
                            <asp:Label ID="labBPOOSFOB" runat="server" ></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="SPO Vs DES"  ItemStyle-HorizontalAlign="Right" Visible="true">
                        <ItemTemplate>
                            <asp:Label ID="labSPOOSFOB" runat="server" ></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                     
                      <asp:TemplateField HeaderText="Cancel" Visible="false">
                            <ItemTemplate>                           
                                <asp:Label ID="labCancel" runat="server" Visible="true" Text='<%#Eval("Cancel") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                                      <asp:TemplateField HeaderText="Cancel"  Visible="true">
                            <ItemTemplate>                           
                                <asp:Label ID="labCancelRemarks" Width="80px" runat="server" Visible="true" Text='<%#Eval("CancelRe") %>'></asp:Label>
                            </ItemTemplate>
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
            Style="display: none; overflow: scroll; border: Solid 3px #0026ff;">
             <div class="container" style="max-width: 1050px">
                <div class="row">
                    <div class="col-md-11">
                        <h4 ></h4>
                        
                    </div>
                   
                    <div class="col-md-1">
                        <br />
                        <asp:ImageButton ID="btnMPECancel" runat="server" ImageUrl="~/images/Cancel.png"
                            Width="20" Height="20" CssClass="pull-right" />
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-11">
                        <table class="auto-style1">
                            <tr>
                                <td class="auto-style9">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Style :</td>
                                <td class="auto-style12"><strong>
                                    <asp:Label ID="LabStyle" runat="server"></asp:Label>
                                    </strong></td>
                                <td class="auto-style7">BPO No&nbsp; :&nbsp;&nbsp;</td>
                                <td class="auto-style13"><strong>
                                    <asp:Label ID="LabBpoNum" runat="server"></asp:Label>
                                    </strong></td>                                
                            </tr>
                            <tr>
                                <td class="auto-style9">&nbsp;</td>
                                <td class="auto-style12">&nbsp;</td>
                                <td class="auto-style7">&nbsp;</td>
                                <td class="auto-style13">&nbsp;</td>
                                <td class="auto-style5">&nbsp;</td>
                                <td>&nbsp;</td>
                            </tr>
                        </table>
                    </div>
                </div>
            
                <div class="row">
                    <label class="col-md-7">

                        <asp:GridView ID="GridSuReport" runat="server"  ShowFooter="true"   AutoGenerateColumns="False" BackColor="White" BorderColor="#cc3300" 
                BorderWidth="2px" CellPadding="4" ForeColor="Black" FooterStyle-HorizontalAlign="Right" OnRowDataBound="GridSuReport_RowDataBound"  AllowSorting="True" Style="max-width: 100%; min-width: 90%"
                EnableModelValidation="True" Width="980px"  >
               
                <Columns>
                    
                              <asp:TemplateField HeaderText="Plant" SortExpression="" Visible="true">
                        <ItemTemplate>
                            <asp:Label ID="Plant" runat="server" Text='<%#Eval("Plant") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                              <asp:TemplateField HeaderText="Color" SortExpression="" Visible="true">
                        <ItemTemplate>
                            <asp:Label ID="ColorName" runat="server" Text='<%#Eval("ColorName") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                              <asp:TemplateField HeaderText="Colour Qty"  ItemStyle-HorizontalAlign="Right" SortExpression="" Visible="true">
                        <ItemTemplate>
                            <asp:Label ID="ColourQty" runat="server" Text='<%#Eval("ColourQty") %>'></asp:Label>
                        </ItemTemplate>
                        <FooterTemplate>
                     <div >  <asp:Label ID="lblTotColourQty"   runat="server" /> </div> 
                                </FooterTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Delivery" SortExpression="" >
                        <ItemTemplate>
                            <asp:Label ID="DeliveryNo" runat="server" Text='<%#Eval("DeliveryNo") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Promised Date"  ItemStyle-HorizontalAlign="Center" SortExpression="" >
                        <ItemTemplate>
                            <asp:Label ID="PromisedDate" runat="server" Text='<%#Eval("PromisedDate") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Promised Qty"  ItemStyle-HorizontalAlign="Right" SortExpression="" >
                        <ItemTemplate>
                            <asp:Label ID="labPromisedQty" runat="server" Text='<%#Eval("PromisedQty") %>'></asp:Label>
                        </ItemTemplate>
                        <FooterTemplate>
                     <div >  <asp:Label ID="lblTotPromisedQty"    runat="server" /> </div> 
                                </FooterTemplate>
                    </asp:TemplateField>
                      <asp:TemplateField HeaderText="Shipped Qty"  ItemStyle-HorizontalAlign="Right" SortExpression="" >
                        <ItemTemplate>
                            <asp:Label ID="labShippedQty" runat="server" Text='<%#Eval("ShippedQty") %>'></asp:Label>
                        </ItemTemplate>
                           <FooterTemplate>
                     <div>  <asp:Label ID="lblTotShippedQty"   runat="server" /> </div> 
                                </FooterTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Over/Short Qty"  ItemStyle-HorizontalAlign="Right" SortExpression="" >
                        <ItemTemplate>
                            <asp:Label ID="labOSQty" runat="server" Text='<%#Eval("OSQty") %>'></asp:Label>
                        </ItemTemplate>
                         <FooterTemplate>
                     <div>  
                         <asp:Label ID="lblTotOSQty"   runat="server" />                 
                     </div> 
                                </FooterTemplate>
                    </asp:TemplateField>
                       <asp:TemplateField HeaderText="Over/Short Reason" Visible="true">
                        <ItemTemplate>
                            <asp:Label ID="OverShortReason" runat="server" Text='<%#Eval("OverShortReason") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Despatched On"  ItemStyle-HorizontalAlign="Center" Visible="true">
                        <ItemTemplate>
                            <asp:Label ID="labDespatchedOn" runat="server" Text='<%#Eval("DespatchedOn") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Shipped On"  ItemStyle-HorizontalAlign="Center">
                        <ItemTemplate>
                            <asp:Label ID="labShippedOn" runat="server" Text='<%#Eval("ShippedOn") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                      <asp:TemplateField HeaderText="Cancel" Visible="false">
                            <ItemTemplate>                           
                                <asp:Label ID="labCancel" runat="server" Visible="true" Text='<%#Eval("Cancel") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                                      <asp:TemplateField HeaderText="Cancel"  Visible="true">
                            <ItemTemplate>                           
                                <asp:Label ID="labCancelRemarks" Width="80px" runat="server" Visible="true" Text='<%#Eval("CancelRe") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                 
                </Columns>
                <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />

            </asp:GridView>



                    </label>
                   
                </div>
                <div class="row">
                    <div class="col-md-4">
                       
                    </div>
                    <div class="col-md-3">
                        


                    </div>
                    <div class="col-md-5">
                       
                    </div>
                </div>
                <div class="row">&nbsp;</div>
             
             
         </asp:Panel>
    </form>
</body>
</html>
