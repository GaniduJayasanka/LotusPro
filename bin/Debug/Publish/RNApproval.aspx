<%@ page language="C#" autoeventwireup="true" inherits="RNApproval, App_Web_11yxmj2e" %>



<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Shipment Release Note</title>
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

    <script language="Javascript">
       <!--
    function isNumberKey(evt) {
        var charCode = (evt.which) ? evt.which : event.keyCode
        if (charCode != 46 && charCode > 31
            && (charCode < 48 || charCode > 57))
            return false;

        return true;
    }
       //-->
    </script>


       <script src="js/jquery.autocomplete.js" type="text/javascript"></script>
    
     <script type="text/javascript">
         $(document).ready(function () {
             $("#<%=txtShipComments0.ClientID%>").autocomplete('ShortOverFailureReasonReport.ashx');
         });
     </script>

    <style type="text/css">
.blink {
  animation: blink 1s step-start infinite;
}

@keyframes blink {
  50% {
    opacity: 0;
  }
</style>

</head>

<body>
    <form id="form1" runat="server">

        
       
        <div class="col-md-12">
            <div class="row">
                <div class="col-md-1">
                    <br />
                   
                </div>
                <div class="col-md-11">
                    <center><h3>Shipment Release Note Approval</h3></center>
           
                </div>

            </div>
        </div>
    
  <div class="col-md-12">
            <div class="row">
                <div class="col-md-12">
        <asp:Panel ID="pnlsearch" runat="server">
            <div class="col-md-12">
                <div class="row">
                    <div class="col-md-12">
                        <div class="panel panel-default">
                            <div class="panel-body">
                                
                                <div class="row">
                                    <div class="box-body">
                                        <div class="form-group">
                                          
                                            <label class="col-md-1 control-label">Attention</label>
                                             <asp:Label ID="lblAttention" class="col-md-2 control-label" runat="server" Text=""></asp:Label>
                                             
                                          
                                             <label class="col-md-1 control-label">Plant</label>
                                             <div class="col-md-1">
                                            <asp:Label ID="lblPlant" CssClass="blink" Font-Bold="true" Font-Size="Larger" ForeColor="#cc0000" runat="server" Text=""></asp:Label>
                                                 </div>
                           
                                            
                                             <label class="col-md-1 control-label">D. Point</label>
                                             <asp:Label ID="lblDelPoint" class="col-md-1 control-label" runat="server" Text=""></asp:Label>
                           
                                            <label class="col-md-2 control-label">Ship Date</label>
                                                                                     
                                             <asp:Label ID="lblShipdate" class="col-md-2 control-label" runat="server" Text=""></asp:Label>
                           
                                          </div>
                                        </div>
                                    </div>
                                
                                <div class="row">
                                    <div class="box-body">
                                        <div class="form-group">
                                            <label class="col-md-1 control-label" >Dis. By</label>
                                              <asp:Label ID="lblDispatchBy" class="col-md-2 control-label" runat="server" Text=""></asp:Label>
                                            <label class="col-md-1 control-label">Vehicle No</label>
                                           <asp:Label ID="lblvehicleNo" class="col-md-1 control-label" runat="server" Text=""></asp:Label>

                                         <label class="col-md-1 control-label">Type</label>
                                            <asp:Label ID="lblVehicleType" class="col-md-1 control-label" runat="server" Text=""></asp:Label>

                                           <label class="col-md-2 control-label">Transported By</label>
                                          <asp:Label ID="lblTransportBy" class="col-md-1 control-label" runat="server" Text=""></asp:Label>
                                             
                                             
                                        </div>
                                    </div>
                                </div>
                                <br />
                                  <div class="row">
                              
                                        <div class="form-group">
                                            <label class="col-md-1 control-label" style="height: 20px" >Shipment No</label>
                                              <asp:Label ID="lblShipmentNo" class="col-md-2 control-label" runat="server" Text=""></asp:Label>
                                            <label class="col-md-2 control-label" style="height: 20px">Shipment Comment</label>
                                              <asp:Label ID="LblShipComment" class="col-md-3 control-label" runat="server" Text=""></asp:Label>

                                        <div class="col-md-2">
                                          
                                              <asp:Button ID="BtnApprove" runat="server" CssClass="btn btn-success" Text="Approve" Width="115px"  Height="25px"  Font-Size="Smaller"  OnClick="BtnApprove_Click" />
                                               <asp:Button ID="btnDisapprove" runat="server" CssClass="btn btn-danger" OnClientClick="return confirm('Are you sure you want to dissaprove the Release Note ?');"  OnClick="btnDisapprove_Click" Height="25px"  Font-Size="Smaller" Text="Dissapprove"   />
                                                     
                                                                                          
                            &nbsp;</div>
                                             </div>
                                
                                </div>
                                <br />

                                  <asp:Panel ID="PanelEdit" runat="server">
         <div class="col-md-12">
                <div class="row">
                    <div class="col-md-12">
                        <div class="panel panel-default">
                            <div class="panel-body">
                                 <div class="row">
                                    <div class="box-body">
                                        <div class="form-group">
                                         
                                            <div class="col-md-12">                                                 

                                           <label class="col-md-1 control-label" style="font-size:smaller">Style</label>
                                         <div class="col-md-2">
                                          <asp:Label ID="LabStyle"  style="font-size:smaller"  runat="server" Text=""></asp:Label>
                                          </div>
                                          <label class="col-md-1 control-label" style="font-size:smaller">Buyer PO</label>
                                           <div class="col-md-2">
                                              <asp:Label ID="LabBPO" style="font-size:smaller" runat="server" Text=""></asp:Label>
                                           </div>
                                                 <label class="col-md-1 control-label" style="font-size:smaller">Color</label>
                                             <div class="col-md-2">
                                                 <asp:Label ID="Labcolour" style="font-size:smaller" runat="server" Text=""></asp:Label>
                                                 </div>
                                                 <label class="col-md-1 control-label" style="font-size:smaller">Debit Party</label>
                                             <div class="col-md-1">
                                             <asp:CheckBox ID="Checkfactoryerror"  style="font-size:smaller" runat="server" Text="Fac. Errror" AutoPostBack="true" OnCheckedChanged="Checkfactoryerror_CheckedChanged" />
                                             </div>  <div class="col-md-1">
                                                  <asp:TextBox ID="txtFactoryFailPercentage" onkeypress="return isNumberKey(event)"  runat="server" Width="40px" Text="0" style="font-size:smaller" AutoPostBack="true" OnTextChanged="txtFactoryFailPercentage_TextChanged"></asp:TextBox>%
                                                </div>
                                             
                                                </div>
                                             <div class="col-md-12">
                                           <label class="col-md-2 control-label" style="font-size:smaller">Committed Qty</label>

                                         <div class="col-md-1">
                                          <asp:Label ID="Labdelqty" style="font-size:smaller" runat="server" Text=""></asp:Label>
                                          </div>
                                             <label class="col-md-1 control-label" style="font-size:smaller">Ship Qty</label>
                                             <div class="col-md-1">
                                           <asp:Label ID="lblShipQty" style="font-size:smaller" runat="server" Text=""></asp:Label>

                                             </div>
                                                   <div class="col-md-1">
                                              &nbsp;&nbsp;&nbsp;
                                                       </div>
                                                   <label class="col-md-2 control-label" style="font-size:smaller"  >Partial Shipment</label>

                                              <div class="col-md-2">
                                                   <asp:CheckBox ID="ChkPartialShipment"   style="font-size:smaller"   AutoPostBack="true" runat="server" OnCheckedChanged="ChkPartialShipment_CheckedChanged"  /> &nbsp;&nbsp;
                                          
                                                   <asp:TextBox ID="txtPshipmentPercentage" onkeypress="return isNumberKey(event)" runat="server" Width="40px" style="font-size:smaller" Text="0"  AutoPostBack="true" OnTextChanged="txtPshipment_TextChanged"></asp:TextBox>%&nbsp; 
                                                   </div>
                                                 <div class="col-md-1">
                                                  <asp:CheckBox ID="Checkfruntend"  style="font-size:smaller" AutoPostBack="true" runat="server" Text="Front End " OnCheckedChanged="Checkfruntend_CheckedChanged" />
                                                  </div>  <div class="col-md-1">
                                                       &nbsp;  &nbsp; 
                                                        <asp:TextBox ID="txtFrontEndPercentage" AutoPostBack="true" runat="server" onkeypress="return isNumberKey(event)" Text="0" style="font-size:smaller" Width="40px" OnTextChanged="txtFrontEndPercentage_TextChanged"></asp:TextBox>
                                                %  
                                                </div>
                                             
                                                 </div>
                                            <div class="col-md-12">
                                       
                                                 <label class="col-md-2 control-label" style="font-size:smaller"  >Physically Handed Over Date</label>
                                                 <div class="col-md-1">
                                                      <asp:Label ID="lblPhyHandOverdate" style="font-size:smaller" runat="server" Text=""></asp:Label>
                                                   </div>
                                               
                                                      <label class="col-md-3 control-label" style="font-size:smaller"  >Reason For Delayed update</label>
                                               
                                                 
                                                <div class="col-md-4">
                                                    <asp:Label ID="lblDelayedUpdateReason" style="font-size:smaller" runat="server" Text=""></asp:Label>
                                             
                                                    </div>
                                              
                               <div class="col-md-2">
                                                   <asp:CheckBox ID="Checkseviceprovi"  style="font-size:smaller" AutoPostBack="true" runat="server" Text="Service Provider" OnCheckedChanged="Checkseviceprovi_CheckedChanged" />
                                                
                                                     <asp:TextBox ID="txtSPFailPercentage" onkeypress="return isNumberKey(event)" Text="0"   AutoPostBack="true"  Height="25px" Font-Size="Smaller" runat="server"  Width="40px" OnTextChanged="txtSPFailPercentage_TextChanged"></asp:TextBox>
                %
                                      </div>      
</div>

                                            <div class="col-md-12">
                                       
                                                 <label class="col-md-2 control-label" style="font-size:smaller"  >No.Of Cartoons</label>
                                                 <div class="col-md-2">                                                 
                                         
                                          <asp:Label ID="lblNoOfCartoons" style="font-size:smaller" runat="server" Text=""></asp:Label>
                                          
                                               </div>
                                                </div>
                                              <div class="col-md-12">
                                                    <label class="col-md-7 control-label"  style="color:red; font-size:smaller">
               &nbsp;&nbsp;&nbsp;</label>
                                                   <div class="col-md-2">
                                                        <asp:Button ID="BtnUpdate" runat="server" CssClass="btn btn-warning"  OnClick="BtnUpdate_Click" Style="background-position: right; font-size: smaller; font-weight: 700; text-align: left; background-image: url('Images/add.png');  background-repeat: no-repeat; height: 30px;" Text="Update" Width="75px" />
                                                                                                <%--<asp:Button ID="BtnAdd" runat="server" CssClass="btn btn-info" OnClick="BtnAdd_Click" Text="Add" Height="25px" Font-Size="Smaller" />--%>
                                            
                                                    </div>
                                                  <div class="col-md-3">
                                                       
                                           <label  style="font-size:smaller">Reasons For Failure</label>

                                         
                                          <asp:TextBox ID="txtShipComments0" style="font-size:smaller" runat="server" Text=""></asp:TextBox>
                                          </div>
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

                                <br />
                                  <asp:Panel ID="Panel2" runat="server">
            <div class="col-md-12">
                <div class="row">
                    <div class="col-md-12">
                        <div class="panel panel-default">
                            <div class="panel-body">
                                 <div class="row">
                                    <div class="box-body">
                                        <div class="form-group">
                                         
                                            <div class="col-md-6">                                                 
                                                 
                <ul id="assigngw">
                    <asp:GridView ID="gvDeliveryBD"   runat="server" AutoGenerateColumns="False" Font-Size="Smaller" BackColor="White" BorderWidth="1px" EnableModelValidation="True" ForeColor="Black" GridLines="Both" Width="300px"  >
                        <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" Wrap="False" />
                        <Columns>
                              <asp:TemplateField HeaderText="Edit" SortExpression="" >
                                <ItemTemplate>
                                 <asp:Button ID="BtnEdit" runat="server" Text="Edit"  Height="25px" Font-Size="Smaller"   OnClick="BtnEdit_Click" CssClass="btn btn-primary" />                                   
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="DID"  Visible="true">
                                <ItemTemplate>
                                    <%--    <%# Eval("DDID")%>--%>
                                    <asp:Label ID="labDID0" runat="server" Text='<%#Eval("DID") %>' Visible="true"></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                             <asp:TemplateField HeaderText="OrderNo"  Visible="false">
                                <ItemTemplate>
                                 <asp:Label ID="OrderNo" runat="server" Text='<%#Eval("OrderNo") %>' Visible="true"></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                               <asp:TemplateField HeaderText="Buyer Code" Visible="true">
                                <ItemTemplate>
                                    <%--  <%# Eval("Style")%>--%>
                                    <asp:Label ID="BuyerCode" runat="server" Text='<%#Eval("BuyerCode") %>' Visible="true"></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Style" Visible="true">
                                <ItemTemplate>
                                    <%--  <%# Eval("Style")%>--%>
                                    <asp:Label ID="labStyle0" runat="server" Text='<%#Eval("Style") %>' Visible="true"></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="BPO Number">
                                <ItemTemplate>
                                   
                                    <asp:Label ID="labBPO0" runat="server" Text='<%#Eval("BuyerPONo") %>' Visible="true"></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                             <asp:TemplateField HeaderText="Color">
                                <ItemTemplate>                                   
                                    <asp:Label ID="lblColour" runat="server" Text='<%#Eval("Colour") %>' Visible="true"></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                              <asp:TemplateField HeaderText="Committed Qty" ItemStyle-HorizontalAlign="Right">
                                <ItemTemplate>                                 
                                     <asp:Label ID="DeliveryQty" runat="server" Text='<%#Eval("DeliveryQty","{0:n0}") %>' Visible="true"></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                           <asp:TemplateField HeaderText="Shiped QTY" ItemStyle-HorizontalAlign="Right">
                                <ItemTemplate>                                   
                                    <asp:Label ID="labShipedqty" runat="server" Text='<%#Eval("DespatchedQty","{0:n0}") %>' Visible="true"></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                         <asp:TemplateField HeaderText="Comment" Visible="false">
                                <ItemTemplate>
                                    <%-- <%# Eval("Shipedqty")%>--%>
                                    <asp:Label ID="labShipmentComments" runat="server" Text='<%#Eval("Remarks") %>' Visible="true"></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                       
                          <asp:TemplateField HeaderText="Partial Shipment" Visible="true">
                                <ItemTemplate>
                                   <asp:Label ID="lblPartialShipment" runat="server" Text='<%#Eval("PartialShipment")%>' Visible="true"></asp:Label>
                             <asp:Label ID="lblPartialShipmentPercentage"  runat="server" Text='<%#Eval("PartialShipmentPercentage")%>' Visible="false"></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                       <asp:TemplateField HeaderText="Debit Party" Visible="true">
                                <ItemTemplate>
                                    <asp:Label ID="DebitParty" runat="server" Text='<%#Eval("DebitParty") %>' Visible="true"></asp:Label>
                                    <asp:Label ID="lblFactoryFailPercentage" runat="server" Text='<%#Eval("FactoryFailPercentage") %>' Visible="false"></asp:Label>
                                    <asp:Label ID="lblFrontEndPercentage" runat="server" Text='<%#Eval("FrontEndPercentage") %>' Visible="false"></asp:Label>
                                    <asp:Label ID="lblSPFailPercentage" runat="server" Text='<%#Eval("SPFailPercentage") %>' Visible="false"></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                         
                             <asp:TemplateField HeaderText="Physically Handed Over Date" Visible="true">
                                <ItemTemplate>
                                    <asp:Label ID="PhysicallyHandedOverDate" runat="server" Text='<%#Eval("PhysicallyDispatchedDate","{0:dd/MMM/yyyy}") %>' Visible="true"></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Delayed Update Reason" Visible="true">
                                <ItemTemplate>
                                    <asp:Label ID="DelayedUpdateReason" runat="server" Text='<%#Eval("ReasonForDelayedUpdate") %>' Visible="true"></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                         
                             <asp:TemplateField HeaderText="No Of CTN" Visible="true">
                                <ItemTemplate>
                                    <asp:Label ID="NoOfCTN" runat="server" Text='<%#Eval("Cartons") %>' Visible="true"></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                             <asp:TemplateField HeaderText="Over Short Reason" Visible="true">
                                <ItemTemplate>
                                    <asp:Label ID="OverShortReason" runat="server" Text='<%#Eval("OverShortReason") %>' Visible="true"></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <%--     <asp:TemplateField HeaderText="CumShipped" Visible="true">
                                <ItemTemplate>
                                    <asp:Label ID="CumShipped" runat="server" Text='<%#Eval("CumShipped") %>' Visible="true"></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                             <asp:TemplateField HeaderText="" Visible="true">
                                <ItemTemplate>
                            <asp:Button ID="lnkdelete" runat="server" CommandName="Delete" CssClass="btn btn-danger" Font-Size="Smaller" Text="Delete" Width="70px" Height="25px" />
                         
                                    </ItemTemplate>
                                 </asp:TemplateField>--%>
                              
                              <%-- <asp:TemplateField HeaderText="UserID" Visible="false">
                                <ItemTemplate>
                                    <asp:Label ID="lblUserID" runat="server" Text='<%#Eval("UserID") %>' Visible="true"></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>--%>
                           
                      

                        </Columns>
                    </asp:GridView>
                    </ul>
               
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
                                 <br />
                         
                        </div>
                    </div>
                </div>
                </div>
            </div>
        </asp:Panel>
                    </div>
                </div>
      </div>

     <div id="DivFooterRow" style="overflow:hidden">
           <asp:Label ID="lblShipmentRequestID" runat="server" Visible="False"></asp:Label>
         <asp:Label ID="lbluserID" runat="server" Visible="False"></asp:Label>
          <asp:Label ID="ShipmentID" runat="server" Visible="False"></asp:Label> 
           <asp:Label ID="LabShipedqty" Visible="false"   runat="server" Text=""></asp:Label>
         <asp:Label ID="lblStyle" runat="server" Visible="False"></asp:Label>
               <asp:Label ID="lblBuyerPO" runat="server" Visible="False"></asp:Label>
            <asp:Label ID="lblColor" Visible="false"   runat="server" Text=""></asp:Label>
            <asp:Label ID="lblExtRecCount" Visible="false"   runat="server" Text=""></asp:Label>
            <asp:Label ID="lblOrderNo" Visible="false"   runat="server" Text=""></asp:Label>

          <asp:Label ID="lblBPOID" runat="server" Visible="False"></asp:Label>
               <asp:Label ID="lblBPOSEQ" runat="server" Visible="False"></asp:Label>
            <asp:Label ID="lblSDID" Visible="false"   runat="server" Text=""></asp:Label>
            <asp:Label ID="lblSDSEQ" Visible="false"   runat="server" Text=""></asp:Label>
            <asp:Label ID="lblSeniorMerchandiser" Visible="false"   runat="server" Text=""></asp:Label>
             <asp:Label ID="lblSeniorMerchandEmail" Visible="false"   runat="server" Text=""></asp:Label>
            <asp:Label ID="LabelPartiol" runat="server" Visible="False"></asp:Label>
          <asp:Label ID="PlantID" runat="server" Visible="False"></asp:Label>

          <asp:Label ID="LabelPOQTY" Visible="false"   runat="server" Text=""></asp:Label>
            <asp:Label ID="LabColourQty" Visible="false"   runat="server" Text=""></asp:Label>
            <asp:Label ID="LabFc" Visible="false"   runat="server" Text=""></asp:Label>
            <asp:Label ID="LabelSUMIQTY" Visible="false"   runat="server" Text=""></asp:Label>
             <asp:Label ID="LabelPlantName" Visible="false"   runat="server" Text=""></asp:Label>
          <asp:Label ID="delinolab" runat="server" Visible="False"></asp:Label>
                            <asp:Label ID="LabPlantName" runat="server" Visible="False"></asp:Label>
          <asp:Label ID="LabBuyercode" runat="server" Visible="False"></asp:Label>
           <asp:Label ID="labelCumulativShippedQty" Visible="false"   runat="server" Text=""></asp:Label>
          <asp:Label ID="LabFactoryError" runat="server" Visible="False"></asp:Label>
                            <asp:Label ID="LabFruntEnd" runat="server" Visible="False"></asp:Label>
                            <asp:Label ID="LabServisePro" runat="server" Visible="False"></asp:Label>
           <asp:Label ID="LabeMRSCONTACT" runat="server" Visible="False"></asp:Label>
          <asp:Label ID="LabMobNumber" runat="server" Visible="False"></asp:Label>
          <asp:Label ID="lblPhandOverDate" Visible="false"   runat="server" Text=""></asp:Label>  
         <asp:Label ID="lblBuyerCode" Visible="false"   runat="server" Text=""></asp:Label> 
         <asp:Label ID="lblDID" Visible="false"   runat="server" Text=""></asp:Label> 
         <asp:Label ID="lblApprovalSTATUS" Visible="false"   runat="server" Text=""></asp:Label>
           <br />
                      <asp:GridView ID="GVMSizeDetails" Visible="true"   FooterStyle-Font-Bold="true" runat="server" AllowSorting="True" 
                        AutoGenerateColumns="False" BackColor="White" BorderColor="#cccccc" BorderWidth="2px" CellPadding="4"
                         EnableModelValidation="True" Font-Size="Small" ForeColor="Black" Height="96px" ShowFooter="true" Width="866px" > 
                   
                        <Columns>
                             <asp:TemplateField HeaderText="OrderNo"  Visible="true">
                                <ItemTemplate>
                                    <asp:Label ID="OrderNo0" runat="server" Text='<%#Eval("OrderNo") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Size"  Visible="true">
                                <ItemTemplate>
                                    <asp:Label ID="SizeDesc" runat="server" Text='<%#Eval("SizeDesc") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Qty" ItemStyle-HorizontalAlign="Right" Visible="true">
                        <ItemTemplate>
                            <asp:Label ID="Qty" runat="server"  Text='<%#Eval("Qty") %>' ></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                           <asp:TemplateField HeaderText="Average FOB" ItemStyle-HorizontalAlign="Right" Visible="true">
                        <ItemTemplate>
                            <asp:Label ID="FC" runat="server"  Text=' <%#Eval("FC","{0:n}")%>'    ></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>   
                        <asp:TemplateField HeaderText="Average Value" ItemStyle-HorizontalAlign="Right" Visible="true">
                        <ItemTemplate>
                            <asp:Label ID="AverageValue" runat="server"  Text=' <%#Eval("AverageValue","{0:n}")%>'    ></asp:Label>
                        </ItemTemplate>
                             <FooterTemplate >
                              <div>  <asp:Label ID="lblTTLAverageValue"    runat="server" /> </div> 
                                </FooterTemplate>
                    </asp:TemplateField>    
                             <asp:TemplateField HeaderText="Actual FOB" ItemStyle-HorizontalAlign="Right" Visible="true">
                        <ItemTemplate>
                            <asp:Label ID="ActualFOB" AutoPostBack="true"  runat="server"  Text='<%#Eval("FC") %>' ></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>    
                             <asp:TemplateField HeaderText="Actual Value" ItemStyle-HorizontalAlign="Right" Visible="true">
                        <ItemTemplate>
                            <asp:Label ID="ActualValue" runat="server" Text=' <%#Eval("AverageValue","{0:n}")%>'    ></asp:Label>
                        </ItemTemplate>
                                  <FooterTemplate>
                              <div >  <asp:Label ID="lblTTLActualValue"   runat="server" /> </div> 
                                </FooterTemplate>
                    </asp:TemplateField>      
                        </Columns>
                        <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
                        <%-- <HeaderStyle Wrap="true" BackColor="#333333" Font-Bold="True" ForeColor="White" />--%>
                        <FooterStyle HorizontalAlign="Right" BackColor="#333333" Font-Bold="True" ForeColor="White" CssClass="GVFixedFooter" />
                        <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" CssClass="GVFixedHeader" />
                    </asp:GridView>
            <br />
</div>
      
              <asp:Label ID="lblRandom_No" Visible="false"   runat="server" Text=""></asp:Label> 
    </form>
</body>
</html>
