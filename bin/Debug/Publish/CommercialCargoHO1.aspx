<%@ page language="C#" enableeventvalidation="false" autoeventwireup="true" inherits="CommercialDeliveries, App_Web_11yxmj2e" %>

<%@ Register Assembly="BasicFrame.WebControls.BasicDatePicker" Namespace="BasicFrame.WebControls" TagPrefix="BDP" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Delivered Delivery Breakdown</title>
    <link href="CSS/bootstrap.css" rel="stylesheet" />
     <link href="css/jquery.autocomplete.css" rel="stylesheet" type="text/css" />
<script src="js/jquery-1.4.1.min.js" type="text/javascript"></script>
<script src="js/jquery.autocomplete.js" type="text/javascript"></script>
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
        $(document).ready(function () {
            $("#<%=TxtSearch.ClientID%>").autocomplete('Autocompletes/AutoComplete.ashx', { extraParams: { "type": "SearchStyle" } });
        });
</script>

     <script type="text/javascript">

         function isNumberKey(evt) {

             var charCode = (evt.which) ? evt.which : event.keyCode
             if (charCode > 31 && (charCode < 48 || charCode > 57))
                 return false;
             return true;
         }

</script>
    <style type="text/css">
       
        .BigCheckBox input {
            width: 20px;
            height: 20px;
        }
        .auto-style2 {
            width: 934px;
        }
        .auto-style4 {
            width: 131px;
        }
        .auto-style5 {
            width: 162px;
        }
        .auto-style10 {
            width: 74px;
        }
        .auto-style11 {
            width: 47px;
        }
        .auto-style12 {
            width: 934px;
            height: 28px;
        }
        .auto-style13 {
            width: 131px;
            height: 28px;
        }
        .auto-style14 {
            width: 162px;
            height: 28px;
        }
        .auto-style15 {
            width: 47px;
            height: 28px;
        }
        .auto-style16 {
            width: 74px;
            height: 28px;
        }
        .auto-style17 {
            height: 28px;
        }
        </style>
</head>
<body>
    <form id="form1" runat="server">
        <asp:Label ID="LabDSID" runat="server" Visible="False"></asp:Label>
        <asp:Label ID="LabPOQty" runat="server" Visible="False"></asp:Label>
        <asp:HiddenField ID="hfRemainingValue" runat="server" />
        <asp:Label ID="LabMobNumber" runat="server" Visible="False"></asp:Label>
        <div class="row">
            <div class="col-md-1">
                <br />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:ImageButton ID="btnHome1" runat="server" ImageUrl="~/images/Tohome.png" Height="35px"
                            Width="35px" PostBackUrl="~/Home.aspx" />
            </div>
            <div class="col-md-10">
                <center><h3>Commercial Deliveries (Cargo @ HO)</h3></center>
            </div>
        </div>
        <%--<asp:Panel ID="pnlsearch" runat="server">
            <div class="col-md-9">
                <div class="panel panel-default">
                    <div class="panel-body">
                        <div class="box-body">
                            <div class="form-group">
                        
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
            </div>--%><%--</asp:Panel>--%>
        <asp:Panel ID="pnlDeliveryGrid" runat="server" Visible="true">
               <div class="col-md-12">
               
                   <table class="nav-justified">
                       <tr>
                           <td class="auto-style12">
                               <asp:Label ID="LblOrderNo" runat="server" Text="Label" Visible="False"></asp:Label>
                           </td>
                           <td class="auto-style13">&nbsp;&nbsp; <strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;</strong></td>
                           <td class="auto-style14">
                               <asp:DropDownList ID="DDLPlant" runat="server" AutoPostBack="True" CssClass="col-xs-offset-0" Height="27px" OnSelectedIndexChanged="DDLPlant_SelectedIndexChanged" Width="95%" Visible="False">
                                    <asp:ListItem Text="All" Value="0"></asp:ListItem>
                                   <asp:ListItem Text="SUB" Value="1"></asp:ListItem>
                                   <asp:ListItem Text="SP" Value="2"></asp:ListItem>
                                   <asp:ListItem Text="SW" Value="3"></asp:ListItem>
                                   <asp:ListItem Text="SH" Value="4"></asp:ListItem>
                                   <asp:ListItem Text="SN" Value="5"></asp:ListItem>
                               </asp:DropDownList>
                           </td>
                           <td class="auto-style15"></td>
                           <td class="auto-style16">&nbsp;&nbsp;<asp:Label ID="Label1" runat="server" Text="Style :" Visible="False"></asp:Label>
                           </td>
                           <td class="auto-style14">
                               <asp:TextBox ID="TxtSearch" runat="server" Width="201px" Visible="False" Wrap="False"></asp:TextBox>
                           </td>
                           <td class="auto-style14">&nbsp;&nbsp;&nbsp; &nbsp;<asp:Button ID="BtnSelect" runat="server" class="btn btn-info" Height="34px" 
                                        OnClick="BtnSelect_Click" style="height: 28px" Text="Select" Width="90px" Visible="False" /></td>
                           <td class="auto-style17"></td>
                       </tr>
                       <tr>
                           <td class="auto-style2">&nbsp;</td>
                           <td class="auto-style4">&nbsp;</td>
                           <td class="auto-style5">&nbsp;</td>
                           <td class="auto-style11">&nbsp;</td>
                           <td class="auto-style10">&nbsp;</td>
                           <td class="auto-style5">&nbsp;</td>
                           <td class="auto-style5">&nbsp;</td>
                           <td>&nbsp;</td>
                       </tr>
                   </table>
               
            </div>
            <div class="col-md-12">
                <asp:GridView ID="gvDeliveryBD" runat="server" AutoGenerateColumns="False" BackColor="White"
                    BorderWidth="1px" CellPadding="4" ForeColor="Black" EnableModelValidation="True" Width="94%" OnSelectedIndexChanged="gvDeliveryBD_SelectedIndexChanged" OnRowDataBound="gvDeliveryBD_RowDataBound" >
                    <HeaderStyle Wrap="False" BackColor="#333333" Font-Bold="True" ForeColor="White" />
                    <Columns>
                        <asp:TemplateField HeaderText="DID" ItemStyle-BackColor="#993333" Visible="true" >
                            <ItemTemplate>
                                <asp:Label ID="labDID" runat="server"  Text='<%# Eval("DID") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Revised Date" Visible="false">
                            <ItemTemplate>
                                <asp:Label ID="RevisedDate" runat="server" Text='<%# Eval("RevisedDate", "{0:dd/MM/yyyy}") %>'></asp:Label>
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
                          <asp:TemplateField HeaderText="MDID" Visible="false">
                            <ItemTemplate>
                                <asp:Label ID="labMDID" runat="server" Text='<%#Eval("MDID") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                          <asp:TemplateField HeaderText="Factory" ItemStyle-Width="20px" Visible="true">
                            <ItemTemplate>
                                <asp:Label ID="labScheduledFactory" runat="server" Text='<%#Eval("ScheduledFactory") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                          <asp:TemplateField HeaderText="Contract No" Visible="true">
                            <ItemTemplate>
                                <asp:Label ID="ContractNo" runat="server" Text='<%#Eval("ContractNo") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Buyer Name" ItemStyle-Width="18px">
                            <ItemTemplate>
                                <asp:Label ID="BuyerName" runat="server" Text='<%#Eval("BuyerName") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Style No" >
                            <ItemTemplate>
                                <asp:Label ID="StyleNo" runat="server" Text='<%#Eval("StyleNo") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Color">
                            <ItemTemplate>
                                <asp:Label ID="ColorName" runat="server" Text='<%#Eval("ColorName") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Buyer PONo" Visible="false">
                            <ItemTemplate>
                                <asp:Label ID="BuyerPONo" runat="server" Text='<%#Eval("BuyerPONo") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                      
                           <asp:TemplateField HeaderText="BPO Qty" Visible="true">
                            <ItemTemplate>
                                <asp:Label ID="POQty" runat="server" Text='<%#Eval("POQty") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <%-- <asp:TemplateField HeaderText="Sumithra PO Qty">
                            <ItemTemplate>
                                <asp:Label ID="SumithraPOQty" runat="server" Text='<%#Eval("SumithraPOQty") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>--%>
                        <asp:TemplateField HeaderText="Delivery Qty" Visible="true">
                            <ItemTemplate>
                                <asp:Label ID="DeliveryQty" runat="server" Text='<%#Eval("DeliveryQty") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Shipped Qty" Visible="false" ItemStyle-Width="20px">
                            <ItemTemplate>
                                <asp:Label ID="ShippedQty" runat="server" Text='<%#Eval("ShippedQty") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                             <asp:TemplateField HeaderText="HO Date" ItemStyle-Width="150px" Visible="true">
                            <ItemTemplate>
                                <BDP:BasicDatePicker  ID="lbAqlDate"  Text='<%#Eval("AQLDate", "{0:dd/MM/yyyy}") %>' runat="server" Visible="false" CssClass="form-control" />
                            
                             <%--    <asp:Button ID="btnAqlDate" runat="server" CssClass="btn btn-info" OnClick="BtnAqlDate_Click" Text=" Set" />--%>
                                 <asp:Label ID="Delivery" runat="server" Text='<%#Eval("AQLDate", "{0:dd/MM/yyyy}") %>'  Visible="true"/> 
                                                                    
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Received Qty"  ItemStyle-Width="200px" Visible="false">
                            <ItemTemplate>
                                   <asp:TextBox ID="txtRecevedQty"   runat="server" Text='<%# Eval("ReceivedQty") %>'    Width="100px" />
                                <asp:Button ID="btnRecevedQty" runat="server" OnClick="BtnRecevedQty_Click" CssClass="btn btn-info"
                                                                     Text="Calculate" />
                            </ItemTemplate>
                        </asp:TemplateField>
                         <asp:TemplateField HeaderText="Variance" ItemStyle-HorizontalAlign="Center" ItemStyle-Font-Bold="true" Visible="false">
                            <ItemTemplate>
                                <asp:Label ID="Variance" Text='<%# Eval("Variance") %>'  runat="server"></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                         <asp:TemplateField HeaderText="Delivery Date" Visible="false">
                            <ItemTemplate>
                                <asp:Label ID="DeliveryDate" runat="server" Text='<%# Eval("DeliveryDate", "{0:dd/MM/yyyy}") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                         


                      
                          <asp:TemplateField HeaderText="" ItemStyle-Width="150px">
                            <ItemTemplate>
                            
                               <asp:DropDownList ID="DDLMarkerGrade" CssClass="form-control"  runat="server"  Width="130px"> 
                                   <asp:ListItem  ></asp:ListItem>
                                   <%--<asp:ListItem Value="1" >Cargo @ HO</asp:ListItem>--%>
                               <asp:ListItem Value="2">Cargo @ Yard</asp:ListItem>
                               </asp:DropDownList>
                             
                              
                            </ItemTemplate>
                        </asp:TemplateField>

                      

                          <asp:TemplateField HeaderText="Shipment"  ItemStyle-Width="110px" Visible="false">
                            <ItemTemplate>
                               <asp:CheckBox id="Checkcompleate" CssClass="BigCheckBox"   GroupName="RadioPlan" runat="server"  /> Complete <br />
                             
                             
                            </ItemTemplate>
                        </asp:TemplateField>
                     

                                <asp:TemplateField HeaderText="Comment" ItemStyle-Width="150px" Visible="true" >
                        <ItemTemplate>                           
                             <asp:TextBox ID="txtComent" Text='<%#Eval("Hocomment") %>'  runat="server"  Width="140px" />
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



                           <asp:TemplateField HeaderText="">
                            <ItemTemplate>
                                  <asp:Button ID="ButRemain" runat="server" Text="OK" OnClick="BtnRemainingDel_Click"  CssClass="btn btn-warning" />
                               
                            </ItemTemplate>
                        </asp:TemplateField>



                     
                          <asp:TemplateField HeaderText="Delivery" Visible="false">
                            <ItemTemplate>
                                <asp:Label ID="lbDeliveryNo" runat="server" Text='<%#Eval("DeliveryNo") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                         <asp:TemplateField HeaderText="BuyerCode" Visible="false">
                            <ItemTemplate>
                                <asp:Label ID="BuyerCode" runat="server" Text='<%#Eval("BuyerCode") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                      
                      <%--  <asp:TemplateField HeaderText="Cargo Status Comment" ItemStyle-Width="170px" Visible="true" >
                        <ItemTemplate>                           
                             <asp:TextBox ID="txtCargoStatusComent" Text='<%#Eval("CargoStatusComment") %>'  runat="server"  Width="110px" />
                        <asp:ImageButton ID="imgbtnDone" OnClick="imgbtnDone_Click" runat="server"  Height="20px" ImageUrl="~/images/Done.png" ToolTip="Add new Item" Width="30px" />
                           </ItemTemplate>
                    </asp:TemplateField>--%>

                    </Columns>
                </asp:GridView>
            </div>
         
        </asp:Panel>
    </form>
</body>
</html>
