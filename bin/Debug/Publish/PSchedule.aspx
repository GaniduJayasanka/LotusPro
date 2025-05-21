<%@ page language="C#" autoeventwireup="true" inherits="PSchedule, App_Web_34neb3g4" %>

<%@ Register Assembly="BasicFrame.WebControls.BasicDatePicker" Namespace="BasicFrame.WebControls" TagPrefix="BDP" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Style Placement Schedule</title>
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

          .style18 {
            color: #FF3300;
        }


.GVFixedHeader { font-weight:bold; background-color: Green; position:relative; 
                 top:expression(this.parentNode.parentNode.parentNode.scrollTop-1);}

.GVFixedFooter { font-weight:bold; background-color: Green; position:relative;
                 bottom:expression(getScrollBottom(this.parentNode.parentNode.parentNode.parentNode));} 
</style>


<%--     <script src="js/jquery.autocomplete.js" type="text/javascript"></script>

    <script type="text/javascript">
        $(document).ready(function () {
            $("#<%=txtStyle.ClientID%>").autocomplete('SearchStyle.ashx');
        });
    </script>--%>
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
                        Width="35px" />
                </div>
                <div class="col-md-11">
                    <center><h3>Style Placement Schedule</h3></center>
           
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
                                          
                                             <label class="col-md-1 control-label">Buyer <span class="style18">*</span></label>
                                                 <div class="col-md-2">
                                                  <asp:DropDownList ID="DDLBuyer"  CssClass="form-control" runat="server" Height="25px" Font-Size="X-Small" ></asp:DropDownList>
                                         
                           
                                            </div>

                                            </div>
                                        </div>
                                      </div>

                                   <div class="row">
                                    <div class="box-body">
                                        <div class="form-group">
                                          
                                             <label class="col-md-1 control-label">Department</label>
                                                 <div class="col-md-2">
                                                  <asp:DropDownList ID="DDLDepartment"  CssClass="form-control" runat="server" Height="25px" Font-Size="X-Small" ></asp:DropDownList>
                                                                  
                                            </div>


                                             <label class="col-md-1 control-label">Season</label>
                                                 <div class="col-md-1">
                                                  <asp:DropDownList ID="DDLSeason"  CssClass="form-control" runat="server" Height="25px" Font-Size="X-Small" ></asp:DropDownList>
                                                                  
                                            </div>
                                            
                                            </div>

                                            <label class="col-md-1 control-label">Style</label>
                                            <div class="col-md-2">
                                              <asp:TextBox ID="txtStyle" Height="25px" Font-Size="Smaller" CssClass="form-control" runat="server"  ></asp:TextBox>
                                            </div>

                                         <label class="col-md-1 control-label">Buy</label>
                                            <div class="col-md-1">
                                              <asp:TextBox ID="txtBuy" Height="25px" Font-Size="Smaller" CssClass="form-control" runat="server"  ></asp:TextBox>
                                            </div>

                                        </div>
                                      </div>
                                 <br />
                                  
                                  <div class="row">
                                      <div class="box-body">
                                          <div class="form-group">
                                              <label class="col-md-1 control-label"> 
                                              Date Range <span class="style18">*</span></label> 
                                              <div class="col-md-2">
                                                  <BDP:BasicDatePicker ID="BDPFromDate" runat="server" Visible="true" />
                                                  <asp:Label ID="Label1" runat="server"></asp:Label>
                                              </div>
                                              <label class="col-md-1 control-label">To <span class="style18">*</span></label>
                                              <div class="col-md-2">
                                                  <BDP:BasicDatePicker ID="BDPToDate" runat="server" Visible="true" />
                                                  <asp:Label ID="Label2" runat="server"></asp:Label>
                                              </div>
                                                <label class="col-md-1 control-label">Status <span class="style18">*</span></label>
                                               <div class="col-md-2">
                                                   <asp:DropDownList ID="DDLStatus" Height="25px" Font-Size="X-Small" CssClass="form-control" runat="server"></asp:DropDownList>

                                            </div>
                                              <div class="col-md-">
                                                  <asp:Button ID="btnFindDel" runat="server" CssClass="btn btn-info" Height="25px" OnClick="btnFindDel_Click" Style="background-position: right; font-size: smaller; font-weight: 700; text-align: left; background-image: url('Images/find.png'); background-repeat: no-repeat;" Text="Find" Width="100px" />
                                                  &nbsp;<asp:Button ID="BtnReset" runat="server" CssClass="btn btn-warning" Font-Size="Smaller" Height="25px" Text="Reset" OnClick="BtnReset_Click" />
                                               <asp:Button ID="BtnExportExcel" runat="server" CssClass="btn btn-success" Height="25px" OnClick="BtnExportExcel_Click" Style="background-position: right; font-size: smaller; font-weight: 700; text-align: left; background-image: url('Images/exel.png'); background-size:contain; background-repeat: no-repeat;" Text="Export to Excel" Width="130px" />
                                                  
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
             <asp:Label ID="labelCumulativShippedQty" Visible="false"   runat="server" Text=""></asp:Label>
             <asp:Label ID="lblPhandOverDate" Visible="false"   runat="server" Text=""></asp:Label>
            <br />
                      <asp:GridView ID="GVMSizeDetails" Visible="true"   FooterStyle-Font-Bold="true" runat="server" AllowSorting="True" 
                        AutoGenerateColumns="False" BackColor="White" BorderColor="#cccccc" BorderWidth="2px" CellPadding="4"
                         EnableModelValidation="True" Font-Size="Small" ForeColor="Black" Height="96px"  Width="90%" > 
                   
                        <Columns>
                             <asp:TemplateField HeaderText="OrderNo"  Visible="false">
                                <ItemTemplate>
                                    <asp:Label ID="OrderNo0" runat="server" Text='<%#Eval("OrderNo") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Buyer"  Visible="true">
                                <ItemTemplate>
                                    <asp:Label ID="BuyerCode" runat="server" Text='<%#Eval("BuyerCode") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Season"  Visible="true">
                        <ItemTemplate>
                            <asp:Label ID="Season" runat="server"  Text='<%#Eval("Season") %>' ></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                             <asp:TemplateField HeaderText="Department"  Visible="true">
                        <ItemTemplate>
                            <asp:Label ID="Department" runat="server"  Text='<%#Eval("Department") %>' ></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                             <asp:TemplateField HeaderText="Item"  Visible="true">
                        <ItemTemplate>
                            <asp:Label ID="ItemDescription" runat="server"  Text='<%#Eval("ItemDescription") %>' ></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                             <asp:TemplateField HeaderText="StyleNo"   Visible="true">
                        <ItemTemplate>
                            <asp:Label ID="StyleNo" runat="server"  Width="120px" Text='<%#Eval("StyleNo") %>' ></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                           <asp:TemplateField HeaderText="Buyer PO"  Visible="true">
                        <ItemTemplate>
                            <asp:Label ID="BuyerPONo" runat="server"  Text='<%#Eval("BuyerPONo") %>' ></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                              <asp:TemplateField HeaderText="Contract No"  Visible="true">
                        <ItemTemplate>
                            <asp:Label ID="ContractNo" runat="server"  Text='<%#Eval("ContractNo") %>' ></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                             <asp:TemplateField HeaderText="Color Code"  Visible="true">
                        <ItemTemplate>
                            <asp:Label ID="ColorCode" runat="server"  Text='<%#Eval("ColorCode") %>' ></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                            
                              <asp:TemplateField HeaderText="Color"  Visible="true">
                        <ItemTemplate>
                            <asp:Label ID="ColorName" runat="server"  Text='<%#Eval("ColorName") %>' ></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                              <asp:TemplateField HeaderText="BPO Qty"  ItemStyle-HorizontalAlign="Right" Visible="true">
                        <ItemTemplate>
                            <asp:Label ID="Qty" runat="server"  Text='<%#Eval("Qty") %>' ></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                               <asp:TemplateField HeaderText="Shipped Qty"  ItemStyle-HorizontalAlign="Right" Visible="true">
                        <ItemTemplate>
                            <asp:Label ID="CumulativShippedQty" runat="server"  Text='<%#Eval("CumulativShippedQty") %>' ></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                              <asp:TemplateField HeaderText="Country"  Visible="true">
                        <ItemTemplate>
                            <asp:Label ID="Country" runat="server"  Text='<%#Eval("Country") %>' ></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                                 <asp:TemplateField HeaderText="Ship Mode"  Visible="true">
                        <ItemTemplate>
                            <asp:Label ID="ShipMode" runat="server"  Text='<%#Eval("ShipMode") %>' ></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                              <asp:TemplateField HeaderText="Year"  Visible="true">
                        <ItemTemplate>
                            <asp:Label ID="StyleYear" runat="server"  Text='<%#Eval("StyleYear") %>' ></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                                 <asp:TemplateField HeaderText="PO Type"  Visible="true">
                        <ItemTemplate>
                            <asp:Label ID="POType" runat="server"  Text='<%#Eval("POType") %>' ></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                             <asp:TemplateField HeaderText="Extended Ship Date">
                                                <ItemTemplate>
                                                    <asp:Label ID="ExtendedShipDate" runat="server" Text='<%#Eval("ExtendedShipDate","{0:dd/MMM/yyyy}") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                             <asp:TemplateField HeaderText="Order Confirmation Date">
                                                <ItemTemplate>
                                                    <asp:Label ID="OrderConfirmedTime" runat="server" Text='<%#Eval("OrderConfirmedTime","{0:dd/MMM/yyyy}") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                               <asp:TemplateField HeaderText="RTD">
                                                <ItemTemplate>
                                                    <asp:Label ID="RTD" runat="server" Text='<%#Eval("RTD","{0:dd/MMM/yyyy}") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                             <asp:TemplateField HeaderText="PCD">
                                                <ItemTemplate>
                                                    <asp:Label ID="PCD" runat="server" Text='<%#Eval("PCD","{0:dd/MMM/yyyy}") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                 <asp:TemplateField HeaderText="FOB ($)"  ItemStyle-HorizontalAlign="Right" Visible="true">
                        <ItemTemplate>
                            <asp:Label ID="FOB" runat="server"  Text='<%#Eval("FOB","{0:#,##0.00}") %>' ></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                            <asp:TemplateField HeaderText="BPO Value"  ItemStyle-HorizontalAlign="Right" Visible="true">
                        <ItemTemplate>
                            <asp:Label ID="POValue" runat="server"  Text='<%#Eval("POValue","{0:#,##0.00}") %>' ></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                             <asp:TemplateField HeaderText="Total SMV" ItemStyle-HorizontalAlign="Right"  Visible="true">
                        <ItemTemplate>
                            <asp:Label ID="SMVTotal" runat="server"  Text='<%#Eval("SMVTotal") %>' ></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                             <asp:TemplateField HeaderText="Sewing SMV"  ItemStyle-HorizontalAlign="Right" Visible="true">
                        <ItemTemplate>
                            <asp:Label ID="SMVSewing" runat="server"  Text='<%#Eval("SMVSewing") %>' ></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                         
                              <asp:TemplateField HeaderText="Actual EPM" ItemStyle-HorizontalAlign="Right"  Visible="true">
                        <ItemTemplate>
                            <asp:Label ID="ActualEPM" runat="server"  Text='<%#Eval("ActualEPM") %>' ></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                           <%--  <asp:TemplateField HeaderText="Complete Date">
                                                <ItemTemplate>
                                                    <asp:Label ID="CompleteDate" runat="server" Text='<%#Eval("CompleteDate","{0:dd/MMM/yyyy}") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>--%>
                             <asp:TemplateField HeaderText="Plan Delivery Date">
                                                <ItemTemplate>
                                                    <asp:Label ID="DeliveryDate" runat="server" Text='<%#Eval("DeliveryDate","{0:dd/MMM/yyyy}") %>'></asp:Label>
                                                </ItemTemplate>
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

