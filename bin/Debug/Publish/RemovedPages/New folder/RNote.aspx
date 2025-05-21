<%@ page language="C#" autoeventwireup="true" inherits="RNote, App_Web_c55p33ak" %>

<%@ Register Assembly="BasicFrame.WebControls.BasicDatePicker" Namespace="BasicFrame.WebControls" TagPrefix="BDP" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
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

    

    <style type="text/css">
.GVFixedHeader { font-weight:bold; background-color: Green; position:relative; 
                 top:expression(this.parentNode.parentNode.parentNode.scrollTop-1);}

.GVFixedFooter { font-weight:bold; background-color: Green; position:relative;
                 bottom:expression(getScrollBottom(this.parentNode.parentNode.parentNode.parentNode));} 
</style>

   <%-- <script language="javascript" type="text/javascript">
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

--%>


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

        </style>

        <script src="js/jquery.autocomplete.js" type="text/javascript"></script>
    
     <script type="text/javascript">
         $(document).ready(function () {
             $("#<%=txtShipComments0.ClientID%>").autocomplete('ShortOverFailureReasonReport.ashx');
         });
    </script>

</head>

<body>
    <form id="form1" runat="server">
    <asp:ToolkitScriptManager ID="ScriptManager1" runat="server">
        </asp:ToolkitScriptManager>
        
       
        <div class="col-md-12">
            <div class="row">
                <div class="col-md-1">
                    <br />
                    <asp:ImageButton ID="btnHome" runat="server" ImageUrl="~/images/Tohome.png" Height="35px"
                        Width="35px" OnClick="btnHome_Click" />
                </div>
                <div class="col-md-11">
                    <center><h3>Shipment Release Note</h3></center>
           
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
                                          
                                            <label class="col-md-1 control-label">Attention</label>
                                            <div class="col-md-2">
                                              <asp:TextBox ID="txtAttention" Height="25px" Font-Size="Smaller" CssClass="form-control" runat="server"  ></asp:TextBox>
                                            </div>
                                             <label class="col-md-1 control-label">Plant</label>
                                            <div class="col-md-2">
                                                  <asp:DropDownList ID="DropPlantheader" DataTextField="ActionName" CssClass="form-control" runat="server" Height="25px" Font-Size="X-Small" ></asp:DropDownList>
                                         
                           
                                            </div>
                                             <label class="col-md-1 control-label">D. Point</label>
                                            
                                              <div class="col-md-2">
                                               <asp:TextBox ID="txtDelipoint" Height="25px" Font-Size="Smaller" CssClass="form-control" runat="server" ></asp:TextBox>   
                                                </div>
                                            <label class="col-md-1 control-label">Ship Date</label>
                                          
                                             <div class="col-md-1">
                                               <BDP:BasicDatePicker ID="DatePickerPO" runat="server" Visible="true" />
                            <asp:Label ID="LabelShipdate" runat="server"></asp:Label>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="box-body">
                                        <div class="form-group">
                                            <label class="col-md-1 control-label" >Dis. By</label>
                                            <div class="col-md-2">
                                                <asp:TextBox ID="TextDespachby" Height="25px" Font-Size="Smaller" runat="server" CssClass="form-control" ></asp:TextBox>
                                            </div>
                                            <label class="col-md-1 control-label">Vehicle No</label>
                                            <div class="col-md-2">
                                                <asp:TextBox ID="txtVehicleNo" Height="25px" Font-Size="Smaller" CssClass="form-control" ToolTip="This filed is required" runat="server" ></asp:TextBox>
                                            </div>
                                         <label class="col-md-1 control-label">Type</label>
                                            <div class="col-md-1">
                                                 <asp:DropDownList ID="DropDownType" Height="25px" Font-Size="X-Small"  CssClass="form-control" runat="server" >
                                <asp:ListItem Text="Select Type" Value="0"></asp:ListItem>
                                <asp:ListItem Text="Lorry" Value="L"></asp:ListItem>
                                <asp:ListItem Text="Container" Value="C"></asp:ListItem>
                            </asp:DropDownList>
                                            </div>
                                           <label class="col-md-2 control-label">Transported By</label>
                                            <div class="col-md-2">
                                                  <asp:TextBox ID="TextDTranseported"  Height="25px" Font-Size="Smaller" runat="server" CssClass="form-control" ></asp:TextBox>
                                                
                                            </div>
                                             
                                             
                                        </div>
                                    </div>
                                </div>
                                <br />
                                  <div class="row">
                              
                                        <div class="form-group">
                                           
                                            <label class="col-md-2 control-label">Shipment Comment</label>
                                            <div class="col-md-4">
                                                <asp:TextBox ID="txtShipComments"  Height="25px" Font-Size="Smaller" runat="server" CssClass="form-control" MaxLength="32"></asp:TextBox>
                                            </div>
                                        <div class="col-md-5">
                                              <asp:Button ID="BunCreate" runat="server" CssClass="btn btn-primary" Text="Create" OnClick="BunCreate_Click" Height="25px"  Font-Size="Smaller" />
                                            <asp:Button ID="BtnReset" runat="server" CssClass="btn btn-warning" Text="Reset" OnClick="BtnReset_Click" Height="25px"  Font-Size="Smaller" />
                                              <asp:Button ID="BtnConfirm" runat="server" CssClass="btn btn-success" Text="Confirm & Print" Width="115px"  Height="25px"  Font-Size="Smaller"  OnClick="BtnFandprint_Click" />
                                               <asp:Button ID="btnFindDel" runat="server" CssClass="btn btn-info"  OnClick="btnFindDel_Click" Style="background-position: right; font-size: smaller; font-weight: 700; text-align: left; background-image: url('http://localhost:49396/MSP/Images/find.png');  background-repeat: no-repeat;" Text="Find Deliveries" Width="130px" Height="25px" />
                                                                                                
                            &nbsp;</div>
                                             </div>
                                
                                </div>
                                 <br />
                               <asp:Panel ID="Panel1" runat="server">
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
                                                 <label class="col-md-1 control-label" style="font-size:smaller">Reason</label>
                                             <div class="col-md-1">
                                             <asp:CheckBox ID="Checkfactoryerror"  style="font-size:smaller" runat="server" Text="Fac. Errror" AutoPostBack="true" OnCheckedChanged="Checkfactoryerror_CheckedChanged" />
                                             </div>  <div class="col-md-1">
                                                  <asp:TextBox ID="txtFactoryFailPercentage" runat="server" Width="40px" style="font-size:smaller" AutoPostBack="true" OnTextChanged="txtFactoryFailPercentage_TextChanged"></asp:TextBox>%
                                                </div>
                                             
                                                </div>
                                             <div class="col-md-12">
                                           <label class="col-md-2 control-label" style="font-size:smaller">Committed Qty</label>

                                         <div class="col-md-1">
                                          <asp:Label ID="Labdelqty" style="font-size:smaller" runat="server" Text=""></asp:Label>
                                          </div>
                                             <label class="col-md-1 control-label" style="font-size:smaller">Ship Qty</label>
                                             <div class="col-md-1">
                                           <asp:TextBox ID="TextShipedQty" style="font-size:smaller" Width="60px" AutoPostBack="true" runat="server"  OnTextChanged="TextShipedQty_TextChanged"></asp:TextBox>
                                             </div>
                                                   <div class="col-md-1">
                                               <b>(</b> <asp:Label ID="LabelVari"  style="font-size:smaller"  runat="server"></asp:Label> <b>)</b>
                                                       </div>
                                                   <label class="col-md-2 control-label" style="font-size:smaller"  >Partial Shipment</label>

                                              <div class="col-md-2">
                                                   <asp:CheckBox ID="ChkPartialShipment"   style="font-size:smaller"   AutoPostBack="true" runat="server" OnCheckedChanged="ChkPartialShipment_CheckedChanged"  /> &nbsp;&nbsp;
                                          
                                                   <asp:TextBox ID="txtPshipmentPercentage" runat="server" Width="40px" style="font-size:smaller"  AutoPostBack="true" OnTextChanged="txtPshipment_TextChanged"></asp:TextBox>%&nbsp; 
                                                   </div>
                                                 <div class="col-md-1">
                                                  <asp:CheckBox ID="Checkfruntend"  style="font-size:smaller" AutoPostBack="true" runat="server" Text="Front End " OnCheckedChanged="Checkfruntend_CheckedChanged" />
                                                  </div>  <div class="col-md-1">
                                                       &nbsp;  &nbsp; 
                                                        <asp:TextBox ID="txtFrontEndPercentage" AutoPostBack="true" runat="server" style="font-size:smaller" Width="40px" OnTextChanged="txtFrontEndPercentage_TextChanged"></asp:TextBox>
                                                %  
                                                </div>
                                             
                                                 </div>
                                            <div class="col-md-12">
                                       
                                                 <label class="col-md-2 control-label" style="font-size:smaller"  >Physically Handed Over Date</label>
                                                 <div class="col-md-2">
                                                  <BDP:BasicDatePicker ID="BBPHandedOverOn"   runat="server" Style="font-family: 'Times New Roman', Times, serif; font-size:smaller" AutoPostBack="true" OnSelectionChanged="BBPHandedOverOn_SelectionChanged" />
                                               </div>
                                                <div class="col-md-2">
                                                 <asp:Label ID="Label27"  style="font-size:smaller;" runat="server" >Reason For Delayed update</asp:Label>
                                                    </div>
                                                <div class="col-md-4">
                                              <asp:TextBox ID="txtDelayedUpdateReason" runat="server" Width="198px"></asp:TextBox>
                                                    </div>
                                              
                               <div class="col-md-2">
                                                   <asp:CheckBox ID="Checkseviceprovi"  style="font-size:smaller" AutoPostBack="true" runat="server" Text="Service Provider" OnCheckedChanged="Checkseviceprovi_CheckedChanged" />
                                                
                                                     <asp:TextBox ID="txtSPFailPercentage" AutoPostBack="true"  Height="25px" Font-Size="Smaller" runat="server"  Width="40px" OnTextChanged="txtSPFailPercentage_TextChanged"></asp:TextBox>
                %
                                      </div>      
</div>

                                            <div class="col-md-12">
                                       
                                                 <label class="col-md-2 control-label" style="font-size:smaller"  >No.Of Cartoons</label>
                                                 <div class="col-md-2">                                                 
                                         
                                          <asp:TextBox ID="txtCartoon" style="font-size:smaller" runat="server" Text=""></asp:TextBox>
                                          
                                               </div>
                                                </div>
                                              <div class="col-md-12">
                                                    <label class="col-md-7 control-label"  style="color:red; font-size:smaller">
                **Able to dispatch zero comitted quantities & this is only for M & S Buyer PO (Short Shipped)</label>
                                                   <div class="col-md-2">
                                                        <asp:Button ID="BtnAdd" runat="server" CssClass="btn btn-warning"  OnClick="BtnAdd_Click" Style="background-position: right; font-size: smaller; font-weight: 700; text-align: left; background-image: url('Images/add.png');  background-repeat: no-repeat;" Text="Add" Width="75px" />
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
                        </div>
                    </div>
                </div>
                </div>
            </div>
        </asp:Panel>

        <div class="row">
                              
                                        <div class="form-group">
                                             <div class="col-md-12">
                                         
                                            <div class="col-md-11">
              
                    <asp:GridView ID="gvDeliveryBD" OnRowDeleting="gvDeliveryBD_RowDeleting"  runat="server" AutoGenerateColumns="False" Font-Size="Smaller" BackColor="White" BorderWidth="1px" CellPadding="4" EnableModelValidation="True" ForeColor="Black" GridLines="Both"  Width="96%">
                        <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" Wrap="False" />
                        <Columns>
                            <asp:TemplateField HeaderText="DID"  Visible="true">
                                <ItemTemplate>
                                    <%--    <%# Eval("DDID")%>--%>
                                    <asp:Label ID="labDID0" runat="server" Text='<%#Eval("DID") %>' Visible="true"></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                             <asp:TemplateField HeaderText="OrderNo"  Visible="true">
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
                                    <asp:Label ID="labStyle0" runat="server" Text='<%#Eval("StyleNo") %>' Visible="true"></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="BPO Number">
                                <ItemTemplate>
                                   
                                    <asp:Label ID="labBPO0" runat="server" Text='<%#Eval("BuyerPONo") %>' Visible="true"></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                             <asp:TemplateField HeaderText="Color">
                                <ItemTemplate>                                   
                                    <asp:Label ID="Color" runat="server" Text='<%#Eval("Color") %>' Visible="true"></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                              <asp:TemplateField HeaderText="Committed Qty">
                                <ItemTemplate>                                 
                                     <asp:Label ID="DeliveryQty" runat="server" Text='<%#Eval("DeliveryQty") %>' Visible="true"></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                           <asp:TemplateField HeaderText="Shiped QTY">
                                <ItemTemplate>
                                   
                                    <asp:Label ID="labShipedqty" runat="server" Text='<%#Eval("ShipedQty") %>' Visible="true"></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                         <asp:TemplateField HeaderText="Comment">
                                <ItemTemplate>
                                    <%-- <%# Eval("Shipedqty")%>--%>
                                    <asp:Label ID="labShipmentComments" runat="server" Text='<%#Eval("ShipmentComments") %>' Visible="true"></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                          <%--  <asp:CommandField ItemStyle-ForeColor="Red" ShowDeleteButton="true" />--%>
                            <asp:TemplateField HeaderText="PartialShipment" Visible="true">
                                <ItemTemplate>
                                    <%--  <%# Eval("ColorName")%>--%>
                                    <asp:Label ID="lblPartialShipment" runat="server" Text='<%#Eval("PartialShipment")%>' Visible="true"></asp:Label>
                                <asp:Label ID="PartialPshipmentPercentage" runat="server" Text='<%#Eval("PartialPshipmentPercentage") %>' Visible="true"></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Senior Merchant" Visible="true">
                                <ItemTemplate>
                                    <asp:Label ID="lblSeniorMerchant" runat="server" Text='<%#Eval("SeniorMerchant") %>' Visible="true"></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                             <asp:TemplateField HeaderText="Factory Error" Visible="true">
                                <ItemTemplate>
                                   <%-- <asp:CheckBox ID="CheckBoxFactoryError" Checked="" runat="server" />--%>
                                    <asp:Label ID="FactoryError" runat="server" Text='<%#Eval("FactoryError") %>' Visible="true"></asp:Label>
                                    <asp:Label ID="FactoryFailPercentage" runat="server" Text='<%#Eval("FactoryFailPercentage") %>' Visible="true"></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                             <asp:TemplateField HeaderText="FEndError" Visible="true">
                                <ItemTemplate>
                                    <asp:Label ID="FEndError" runat="server" Text='<%#Eval("FEndError") %>' Visible="true"></asp:Label>
                                    <asp:Label ID="FrontEndPercentage" runat="server" Text='<%#Eval("FrontEndPercentage") %>' Visible="true"></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                             <asp:TemplateField HeaderText="SPError" Visible="true">
                                <ItemTemplate>
                                    <asp:Label ID="SPError" runat="server" Text='<%#Eval("SPError") %>' Visible="true"></asp:Label>
                                    <asp:Label ID="SPFailPercentage" runat="server" Text='<%#Eval("SPFailPercentage") %>' Visible="true"></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                             <asp:TemplateField HeaderText="Physically Handed Over Date" Visible="true">
                                <ItemTemplate>
                                    <asp:Label ID="PhysicallyHandedOverDate" runat="server" Text='<%#Eval("PhysicallyHandedOverDate") %>' Visible="true"></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Delayed Update Reason" Visible="true">
                                <ItemTemplate>
                                    <asp:Label ID="DelayedUpdateReason" runat="server" Text='<%#Eval("DelayedUpdateReason") %>' Visible="true"></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Email" Visible="false">
                                <ItemTemplate>
                                    <asp:Label ID="lblMerReportEmail" runat="server" Text='<%#Eval("SMEmail") %>' Visible="true"></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                             <asp:TemplateField HeaderText="No Of CTN" Visible="true">
                                <ItemTemplate>
                                    <asp:Label ID="NoOfCTN" runat="server" Text='<%#Eval("NoOfCTN") %>' Visible="true"></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                             <asp:TemplateField HeaderText="" Visible="true">
                                <ItemTemplate>
                            <asp:Button ID="lnkdelete" runat="server" CommandName="Delete" CssClass="btn btn-danger" Font-Size="Smaller" Text="Delete" Width="70px" Height="25px" />
                         
                                    </ItemTemplate>
                                 </asp:TemplateField>
                              
                              <%-- <asp:TemplateField HeaderText="UserID" Visible="false">
                                <ItemTemplate>
                                    <asp:Label ID="lblUserID" runat="server" Text='<%#Eval("UserID") %>' Visible="true"></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>--%>
                           
                      

                        </Columns>
                    </asp:GridView>
</div>
                                            </div>
                                            </div>
            </div>
           

        <asp:Panel ID="DetailPanele2" runat="server">
            <div class="col-md-12">
                <div class="row">
                    <div class="col-md-12">
                        <div class="panel panel-default">
                            <div class="panel-body">
                                
                                <div class="row">
                                    <div class="box-body">
                                        <div class="form-group">

                                           <label class="col-md-1 control-label">Buyer</label>
 <div class="col-md-2">
    
        <asp:DropDownList ID="DropBuyer" CssClass="form-control" runat="server" Height="25px" Font-Size="X-Small" ></asp:DropDownList>

     </div>
                                            <label class="col-md-1 control-label">Style</label>
                                             <div class="col-md-2">
                                                 <asp:TextBox ID="TextStyle" CssClass="form-control" runat="server"  Height="25px" Font-Size="Smaller"></asp:TextBox>
                                                 </div>
                                             <div class="col-md-4">
                                            <asp:Button ID="BunFind" runat="server" CssClass="btn btn-info" OnClick="BunFind_Click" Text="Search" Height="25px" Font-Size="Smaller" />
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

      
            <div class="col-md-9">
         <asp:GridView ID="GridDeliverydetails" runat="server" AutoGenerateColumns="False" BackColor="White"
              BorderWidth="1px" CellPadding="4" EnableModelValidation="True" ForeColor="Black" Width="95%"  
             OnRowDataBound="GridDeliverydetails_RowDataBound"  Font-Size="Small">
                                <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" Wrap="False" />
                                <Columns>
                                  <%--  <asp:TemplateField HeaderStyle-BackColor="Olive" HeaderText="No" ItemStyle-BackColor="DarkGray">
                                        <ItemTemplate>
                                            <%# Container.DataItemIndex + 1 %>
                                        </ItemTemplate>
                                        <HeaderStyle BackColor="Olive" />
                                        <ItemStyle BackColor="DarkGray" />
                                    </asp:TemplateField>--%>
                                 
                                        <asp:TemplateField HeaderText="DID" Visible="true">
                            <ItemTemplate>                           
                                <asp:Label ID="labDID" runat="server" Visible="true" Text='<%#Eval("DID") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                                      <asp:TemplateField HeaderText="Buyer Code" Visible="true">
                            <ItemTemplate>                           
                                <asp:Label ID="BuyerCode" runat="server" Visible="true" Text='<%#Eval("BuyerCode") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                                      <asp:TemplateField HeaderText="Style" Visible="true">
                            <ItemTemplate>                           
                                <asp:Label ID="labStyleNo" runat="server" Visible="true" Text='<%#Eval("StyleNo") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                                       <asp:TemplateField HeaderText="Buyer PO" Visible="true">
                            <ItemTemplate>                           
                                <asp:Label ID="labBuyerPONo" runat="server" Visible="true" Text='<%#Eval("BuyerPONo") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                                      <asp:TemplateField HeaderText="Color" Visible="true">
                            <ItemTemplate>                           
                                <asp:Label ID="labColorName" runat="server" Visible="true" Text='<%#Eval("ColorName") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>

                                
                                      <asp:TemplateField HeaderText="Contract No" Visible="true">
                            <ItemTemplate>                           
                                <asp:Label ID="labContractNo" runat="server" Visible="true" Text='<%#Eval("ContractNo") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                                 
                               

                                               <asp:TemplateField HeaderText="OrderNo" Visible="false">
                            <ItemTemplate>                           
                                <asp:Label ID="labOrderNo" runat="server" Visible="true" Text='<%#Eval("OrderNo") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                              
                                               <asp:TemplateField HeaderText="BPOID" Visible="false">
                            <ItemTemplate>                           
                                <asp:Label ID="labBPOID" runat="server" Visible="true" Text='<%#Eval("BPOID") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>


                                        <asp:TemplateField HeaderText="ColorQty" Visible="true">
                            <ItemTemplate>                           
                                <asp:Label ID="labColorQty" runat="server" Visible="true" Text='<%#Eval("ColorQty") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>

                                    
                                               <asp:TemplateField HeaderText="Committed Qty" Visible="true">
                            <ItemTemplate>                           
                                <asp:Label ID="labDeliveryQty" runat="server" Visible="true" Text='<%#Eval("DeliveryQty") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                                  
                                 
                                    <asp:TemplateField HeaderText="Committed Date" Visible="false">
                            <ItemTemplate>                           
                                <asp:Label ID="labDeliveryDate" runat="server" Visible="true" Text='<%#Eval("DeliveryDate") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                                   

                                        <asp:TemplateField HeaderText="DEL NO" Visible="false">
                            <ItemTemplate>                           
                                <asp:Label ID="labDELINO" runat="server" Visible="true" Text='<%#Eval("DELINO") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>

                                    <%-- <asp:BoundField DataField="PlantID" HeaderStyle-CssClass="Hide" HeaderText="PlantID"  ItemStyle-CssClass="Hide" />--%>


                                       <asp:TemplateField HeaderText="PlantID" Visible="false">
                            <ItemTemplate>                           
                                <asp:Label ID="labPlantID" runat="server" Visible="true" Text='<%#Eval("PlantID") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                                    <%-- <asp:BoundField DataField="PlantName" HeaderStyle-CssClass="Hide" HeaderText="PlantName" ItemStyle-CssClass="Hide" />--%>

                                    <asp:TemplateField HeaderText="Plant" Visible="true">
                            <ItemTemplate>                           
                                <asp:Label ID="labPlantName" runat="server" Visible="true" Text='<%#Eval("PlantName") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                                  
                                     <asp:TemplateField HeaderText="Buyer Code" Visible="true">
                            <ItemTemplate>                           
                                <asp:Label ID="labBuyerCode" runat="server" Visible="true" Text='<%#Eval("BuyerCode") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                                  

                                           
                                     <asp:TemplateField HeaderText="PO Qty" Visible="false">
                            <ItemTemplate>                           
                                <asp:Label ID="labPOQty" runat="server" Visible="true" Text='<%#Eval("POQty") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>


                                     <asp:TemplateField HeaderText="Sumithra PO Qty" Visible="true">
                            <ItemTemplate>                           
                                <asp:Label ID="labSumithraPOQty" runat="server" Visible="true" Text='<%#Eval("SumithraPOQty") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>

                                        <asp:TemplateField HeaderText="FC" Visible="false">
                            <ItemTemplate>                           
                                <asp:Label ID="labFC" runat="server" Visible="true" Text='<%#Eval("FC") %>'></asp:Label>
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
                 <asp:TemplateField HeaderText="Laundry Wash Report"  Visible="true">
                            <ItemTemplate>                           
                                <asp:Label ID="LaundryWashReport" runat="server" Visible="true" Text='<%#Eval("LaundryWashReport") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                                       <asp:TemplateField HeaderText="Senior Merchant"  Visible="true">
                            <ItemTemplate>                           
                                <asp:Label ID="SeniorMerchant" runat="server" Visible="true" Text='<%#Eval("SeniorMerchant") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                                       <asp:TemplateField HeaderText="Senior Merchant Email"  Visible="false">
                            <ItemTemplate>                           
                                <asp:Label ID="SMEmail" runat="server" Visible="true" Text='<%#Eval("SMEmail") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                                     <asp:TemplateField HeaderText="SSBPO"  Visible="true">
                            <ItemTemplate>                           
                                <asp:Label ID="labSSBPO" runat="server" Visible="true" Text='<%#Eval("SSBPO") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                                     <asp:TemplateField HeaderText="Select" SortExpression="" >
                                <ItemTemplate>
                                   <%-- <asp:Button ID="Btnselect" runat="server" Text="Select" class="btn btn-success"  CommandArgument="select" OnClick="BtnSelect_Click" CssClass="btn btn-success" />--%>
                                     <asp:ImageButton ID="btnAddtoList" runat="server" ImageUrl="~/images/done.png" Height="20px"                      Width="20px" OnClick="BtnSelect_Click" />
                                </ItemTemplate>
                            </asp:TemplateField>


                                                     
                                 

                                </Columns>
                            </asp:GridView>
</div>



        <div class="col-md-12">
            <div id="DivRoot" align="left">
<div style="overflow: hidden;" id="DivHeaderRow">
</div>
                <div>
<%--<div style="overflow:auto;" onscroll="OnScrollDiv(this)" id="DivMainContent" >--%>
                    <div class="col-md-1">
                        &nbsp;&nbsp;
                        </div>
            <div class="col-md-8">
                      <asp:GridView ID="GVMSPShedule" runat="server" ShowFooter="true"   DataKeyNames="OrderNo" AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" 
                BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black"               
                AllowSorting="True"  Style="max-width: 100%; min-width: 90%" Font-Size="Small"
                EnableModelValidation="True"  >
               
                <Columns>
                   
                    <asp:TemplateField HeaderText="" SortExpression="" Visible="false" >
                        <ItemTemplate>
                    <asp:ImageButton ID="imgbtnAdd0" Visible="false"  runat="server"  Height="30px" ImageUrl="~/images/remove3.png" ToolTip="Add new Item" Width="30px" />
                     </ItemTemplate>
                    </asp:TemplateField>
                     <asp:TemplateField HeaderText="" SortExpression="" Visible="false">
                        <ItemTemplate>
                    <asp:ImageButton ID="imgbtnRevise"   runat="server"  Height="30px" ImageUrl="~/images/Revise.png" ToolTip="Revise" Width="30px" />
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
                    
                     <asp:TemplateField HeaderText="Commited Qty" Visible="true" SortExpression="DeliveryQty">
                        <ItemTemplate>                           
                             <asp:TextBox ID="txtPromisedQty" Enabled="false" runat="server" Text='<%#Eval("DeliveryQty") %>' Width="90px" />
                        </ItemTemplate>
                    </asp:TemplateField>
                     <asp:TemplateField HeaderText="Commited Date" Visible="true" SortExpression="DeliveryDate">
                        <ItemTemplate>
                            <asp:Label ID="DeliveryDate" runat="server" Visible="false" Text='<%#Eval("DeliveryDate") %>'></asp:Label>
                            <BDP:BasicDatePicker  ID="BDPDeliveryDate"  Text='<%# Eval("DeliveryDate", "{0:dd/MM/yyyy}") %>'  runat="server" CssClass="form-control" />
                        </ItemTemplate>
                    </asp:TemplateField>
                     <asp:TemplateField HeaderText="Comment" Visible="true" SortExpression="Comment">
                        <ItemTemplate>                           
                            <asp:TextBox ID="txtgvComment"  runat="server" Text='<%#Eval("Comment") %>' Width="300px" />
                        </ItemTemplate>
                    </asp:TemplateField>
                  <asp:TemplateField HeaderText="" >
                        <ItemTemplate>
                            <asp:Button ID="btnUpdate"  runat="server" Text="Update"  CssClass="btn btn-success"  />
                        </ItemTemplate>
                    </asp:TemplateField>

                  
                       <asp:TemplateField HeaderText="" >
                        <ItemTemplate>
                            <asp:Button ID="btnRemove" Enabled="false"  runat="server" Text="Trash"  CssClass="btn btn-danger"   />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="rowcunts" Visible="false">
                        <ItemTemplate>                           
                            <asp:Label ID="rowcunts" runat="server" Text='<%#Eval("rowcunts") %>'  />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="DNo" Visible="false">
                        <ItemTemplate>                           
                            <asp:Label ID="DNo" runat="server" Text='<%#Eval("DNo") %>'  />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="RevisedDate" Visible="true" SortExpression="RevisedDate">
                        <ItemTemplate>
                            <asp:Label ID="RevisedDate" runat="server" Visible="true" Text='<%#Eval("RevisedDate") %>'></asp:Label>                           
                        </ItemTemplate>
                    </asp:TemplateField>
                     <asp:TemplateField HeaderText="Cancel Remarks" Visible="true" SortExpression="Comment">
                        <ItemTemplate>                           
                            <asp:TextBox ID="txtcancelRemarks" runat="server"  Text='<%#Eval("CancelRemarks") %>'  Width="200px" />
                        </ItemTemplate>
                    </asp:TemplateField>
                     <asp:TemplateField HeaderText="Shipment Cancellation" SortExpression="" >
                        <ItemTemplate>
                    <asp:ImageButton ID="imgbtnSHipmentCancel"  runat="server"  Height="40px" ImageUrl="~/images/CancelShip.png"  ToolTip="Shipment Cancellation" Width="55px" />
                     </ItemTemplate>
                    </asp:TemplateField>
                      <asp:TemplateField HeaderText="Cancel" Visible="false" SortExpression="Cancel">
                        <ItemTemplate>
                            <asp:Label ID="Cancel" runat="server" Visible="true" Text='<%#Eval("Cancel") %>'></asp:Label>                           
                        </ItemTemplate>
                    </asp:TemplateField>
                       <asp:TemplateField HeaderText="CancelRequest" Visible="true" SortExpression="Cancel">
                        <ItemTemplate>
                            <asp:Label ID="CancelRequest" runat="server" Visible="true" Text='<%#Eval("CancelRequest") %>'></asp:Label>                           
                        </ItemTemplate>
                    </asp:TemplateField>
                     <asp:TemplateField HeaderText="PartialShipmentStatus" Visible="true" SortExpression="PartialShipmentStatus">
                        <ItemTemplate>
                            <asp:Label ID="PartialShipmentStatus" runat="server" Visible="true" Text='<%#Eval("PartialShipmentStatus") %>'></asp:Label>                           
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
                <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
               <%-- <HeaderStyle Wrap="true" BackColor="#333333" Font-Bold="True" ForeColor="White" />--%>
                <FooterStyle BackColor="#333333" Font-Bold="True" ForeColor="White"  CssClass="GVFixedFooter"/>
                <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" CssClass="GVFixedHeader" />

            </asp:GridView>
                </div>
    </div>
<div id="DivFooterRow" style="overflow:hidden">
</div>
</div>
            
            <asp:Label ID="lblDeliveryCount" runat="server" Text="" Visible="false"></asp:Label>
             <asp:Label ID="ShipmentID" runat="server" Visible="False"></asp:Label> 
             <asp:Label ID="LabMobNumber" runat="server" Visible="False"></asp:Label>
                            <asp:Label ID="LabFactoryError" runat="server" Visible="False"></asp:Label>
                            <asp:Label ID="LabFruntEnd" runat="server" Visible="False"></asp:Label>
                            <asp:Label ID="LabServisePro" runat="server" Visible="False"></asp:Label>
                            <asp:Label ID="delinolab" runat="server" Visible="False"></asp:Label>
                            <asp:Label ID="LabPlantName" runat="server" Visible="False"></asp:Label>
                            
                            <asp:Label ID="LabBuyercode" runat="server" Visible="False"></asp:Label>
                            <asp:Label ID="LabeCommit" runat="server" Visible="False"></asp:Label>
                            <asp:Label ID="LabPlantID" runat="server" Visible="False"></asp:Label>
                            <asp:Label ID="SHID" runat="server" Visible="False"></asp:Label>
                            <asp:Label ID="LabeMRSCONTACT" runat="server" Visible="False"></asp:Label>
                            <asp:Label ID="Labeshdate" runat="server" Visible="False"></asp:Label>
                            <asp:Label ID="LabelPartiol" runat="server" Visible="False"></asp:Label>
              <asp:Label ID="PlantID" runat="server" Visible="False"></asp:Label>
               <asp:Label ID="LabeDid" runat="server" Visible="False"></asp:Label>
            <asp:Label ID="LabShortShipBPO" Visible="false"   runat="server" Text=""></asp:Label>
            <asp:Label ID="LabdelSeniorMerchant" Visible="false"   runat="server" Text=""></asp:Label>
            <asp:Label ID="LabSMEmail" Visible="false"   runat="server" Text=""></asp:Label>

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

            <asp:Label ID="LabelPOQTY" Visible="false"   runat="server" Text=""></asp:Label>
            <asp:Label ID="LabColourQty" Visible="false"   runat="server" Text=""></asp:Label>
            <asp:Label ID="LabFc" Visible="false"   runat="server" Text=""></asp:Label>
            <asp:Label ID="LabelSUMIQTY" Visible="false"   runat="server" Text=""></asp:Label>
              <asp:Label ID="LabShipedqty" Visible="false"   runat="server" Text=""></asp:Label>

                <asp:Label ID="TextShipno" Visible="false"   runat="server" Text=""></asp:Label>
              <asp:Label ID="LabelPlantName" Visible="false"   runat="server" Text=""></asp:Label>
             <asp:Label ID="lblNoOfCTNcount" Visible="false"   runat="server" Text=""></asp:Label>
            <asp:Label ID="lblBuyerCode" Visible="false"   runat="server" Text=""></asp:Label> 
            <asp:Label ID="lblOrderNoPrevious" Visible="false"   runat="server" Text=""></asp:Label>
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
       
    
   
    </form>
</body>
</html>

