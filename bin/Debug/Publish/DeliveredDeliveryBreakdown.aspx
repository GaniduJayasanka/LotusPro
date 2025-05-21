<%@ page language="C#" autoeventwireup="true" inherits="DeliveredDeliveryBreakdown, App_Web_b2ychy0x" %>

<%@ Register Assembly="BasicFrame.WebControls.BasicDatePicker" Namespace="BasicFrame.WebControls" TagPrefix="BDP" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Delivered Delivery Breakdown</title>
    <link href="CSS/bootstrap.css" rel="stylesheet" />
    <script language="Javascript">
        function isNumberKey(evt) {
            var charCode = (evt.which) ? evt.which : evt.keyCode;
            if (charCode != 46 && charCode > 31
              && (charCode < 48 || charCode > 57))
                return false;

            return true;
        }
    </script>


     <script type="text/javascript">

         function isNumberKey(evt) {

             var charCode = (evt.which) ? evt.which : event.keyCode
             if (charCode > 31 && (charCode < 48 || charCode > 57))
                 return false;
             return true;
         }

</script>
</head>
<body>
    <form id="form1" runat="server">
        <asp:Label ID="LabDSID" runat="server" Visible="False"></asp:Label>
        <asp:Label ID="LabPOQty" runat="server" Visible="False"></asp:Label>
        <asp:HiddenField ID="hfRemainingValue" runat="server" />
        <asp:Label ID="LabMobNumber" runat="server" Visible="False"></asp:Label>
        <asp:Label ID="LabFactoryError" runat="server" Visible="False"></asp:Label>
        <asp:Label ID="LabFruntEnd" runat="server" Visible="False"></asp:Label>
        <asp:Label ID="LabServisePro" runat="server" Visible="False"></asp:Label>
        <div class="row">
            <div class="col-md-1">
                <br />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:ImageButton ID="btnHome1" runat="server" ImageUrl="~/images/Tohome.png" Height="35px"
                            Width="35px" PostBackUrl="~/Home.aspx" />
            </div>
            <div class="col-md-10">
                <center><h3>Shipment confirmation</h3></center>
            </div>
        </div>
        <asp:Panel ID="pnlsearch" runat="server">
            <div class="col-md-9">
                <div class="panel panel-default">
                    <div class="panel-body">
                        <div class="box-body">
                            <div class="form-group">
                                <%-- <label class="col-md-1 control-label">Plant</label>
                                <div class="col-md-2">
                                    <asp:DropDownList ID="ddlPlant" runat="server" CssClass="form-control">
                                    </asp:DropDownList>
                                </div>--%>
                                <label class="col-md-2 control-label">Date Range</label>
                                <div class="col-md-3">
                                    <BDP:BasicDatePicker ID="DatePickerFromDate" runat="server" CssClass="form-control" />
                                </div>
                                <label class="col-md-1 control-label">To</label>
                                <div class="col-md-3">
                                    <BDP:BasicDatePicker ID="DatePickerToDate" runat="server" CssClass="form-control" />
                                    </div>
                               <%-- <label class="col-md-1 control-label">Plant</label>
                                <div class="col-md-1">
                                    <asp:DropDownList ID="DDLPlant" runat="server"  CssClass="form-control" >
                                    </asp:DropDownList>
                                </div>--%>
                            </div>
                            <div class="col-md-1">
                                <asp:Button ID="btnsearch" CssClass="btn btn-info" runat="server" Text="Search" OnClick="btnsearch_Click" />
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <%-- <div class="col-md-3">
                <div class="panel panel-default">
                    <div class="panel-body">
                        <div class="box-body">
                            <div class="form-group">
                                <label class="col-md-3 control-label">Style</label>
                                <div class="col-md-9">
                                    <asp:DropDownList ID="ddlStyle" runat="server" CssClass="form-control" AutoPostBack="True" OnSelectedIndexChanged="ddlStyle_SelectedIndexChanged">
                                    </asp:DropDownList>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>--%>
        </asp:Panel>
        <asp:Panel ID="pnlDeliveryGrid" runat="server" Visible="false">
               <div class="col-md-12">
                <br />
                <asp:Button ID="btnSave" CssClass="btn btn-success" runat="server" Text="Save" OnClick="btnSave_Click" Visible="False" />
                <br />
                <br />
            </div>
            <div class="col-md-12">
                <asp:GridView ID="gvDeliveryBD" runat="server" AutoGenerateColumns="False" BackColor="White"
                    BorderWidth="1px" CellPadding="4" ForeColor="Black" EnableModelValidation="True" Width="97%" OnRowDataBound="gvDeliveryBD_RowDataBound">
                    <HeaderStyle Wrap="False" BackColor="#333333" Font-Bold="True" ForeColor="White" />
                    <Columns>
                        <asp:TemplateField HeaderText="DID" Visible="false">
                            <ItemTemplate>
                                <asp:Label ID="DID" runat="server" Text='<%# Eval("DID") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Revised Date" Visible="false">
                            <ItemTemplate>
                                <asp:Label ID="RevisedDate" runat="server" Text='<%# Eval("RevisedDate", "{0:dd/MM/yyyy}") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Delivery#" Visible="false">
                            <ItemTemplate>
                                <asp:Label ID="DeliveryNopre" runat="server" Text='Del#'></asp:Label><asp:Label ID="DeliveryNo" runat="server" Text='<%#Eval("DeliveryNo") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Delivery Date" Visible="false">
                            <ItemTemplate>
                                <asp:Label ID="DeliveryDate" runat="server" Text='<%# Eval("DeliveryDate", "{0:dd/MM/yyyy}") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Comment" Visible="false">
                            <ItemTemplate>
                                <asp:Label ID="Comment" runat="server" Text='<%#Eval("Comment") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="OrderNo" Visible="false">
                            <ItemTemplate>
                                <asp:Label ID="OrderNo" runat="server" Text='<%# Eval("OrderNo") %>'></asp:Label>
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
                        <asp:TemplateField HeaderText="Buyer Name">
                            <ItemTemplate>
                                <asp:Label ID="BuyerName" runat="server" Text='<%#Eval("BuyerName") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Style No">
                            <ItemTemplate>
                                <asp:Label ID="StyleNo" runat="server" Text='<%#Eval("StyleNo") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Color">
                            <ItemTemplate>
                                <asp:Label ID="ColorName" runat="server" Text='<%#Eval("ColorName") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Buyer PONo">
                            <ItemTemplate>
                                <asp:Label ID="BuyerPONo" runat="server" Text='<%#Eval("BuyerPONo") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Contract No">
                            <ItemTemplate>
                                <asp:Label ID="ContractNo" runat="server" Text='<%#Eval("ContractNo") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                           <asp:TemplateField HeaderText="BPO Qty">
                            <ItemTemplate>
                                <asp:Label ID="POQty" runat="server" Text='<%#Eval("POQty") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                         <asp:TemplateField HeaderText="Sumithra PO Qty">
                            <ItemTemplate>
                                <asp:Label ID="SumithraPOQty" runat="server" Text='<%#Eval("SumithraPOQty") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Delivery Qty">
                            <ItemTemplate>
                                <asp:Label ID="DeliveryQty" runat="server" Text='<%#Eval("DeliveryQty") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                       <%-- <asp:TemplateField HeaderText="Promised Qty">
                            <ItemTemplate>
                                <asp:Label ID="PromisedQty" runat="server" Text='<%#Eval("PromisedQty") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>--%>
                        <asp:TemplateField HeaderText="Factory">
                            <ItemTemplate>
                                <asp:Label ID="ScheduledFactory" runat="server" Text='<%#Eval("ScheduledFactory") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Shipped Qty">
                            <ItemTemplate>
                                <asp:TextBox ID="txtDeliveredQty" runat="server" onkeypress="return isNumberKey(event)"></asp:TextBox>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Over/Short Reason">
                            <ItemTemplate>
                                <asp:CheckBox id="RaFactory"  GroupName="RadioPlan" runat="server"  />  Factory Error <br />
                                <asp:CheckBox id="Frontend"  GroupName="RadioPlan" runat="server"  />   Front End <br />
                                <asp:CheckBox id="ServPro"  GroupName="RadioPlan" runat="server"  />  Sevice Provider
                                <asp:TextBox ID="txtOvershortReason" MaxLength="10"   runat="server" TextMode="MultiLine" Rows="3"></asp:TextBox>
                          
                            </ItemTemplate>
                        </asp:TemplateField>
                         <asp:TemplateField HeaderText="BuyerCode" Visible="false">
                            <ItemTemplate>
                                <asp:Label ID="BuyerCode" runat="server" Text='<%#Eval("BuyerCode") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                       
                         <asp:TemplateField HeaderText="OverShortReason" Visible="false">
                            <ItemTemplate>
                                <asp:Label ID="OverShortReason" runat="server" Text='<%#Eval("OverShortReason") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                          <asp:TemplateField HeaderText="">
                        <ItemTemplate>
                            <asp:Button ID="BtnBreakDown" runat="server" Text="Save" OnClick="BtnBreakDown_Click"  CssClass="btn btn-warning" />
                        </ItemTemplate>
                    </asp:TemplateField>

                    </Columns>
                </asp:GridView>
            </div>
         
        </asp:Panel>
    </form>
</body>
</html>
