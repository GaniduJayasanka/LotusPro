<%@ page language="C#" autoeventwireup="true" inherits="DataEntry, App_Web_11yxmj2e" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>MSP</title>
     <link rel="shortcut icon" type="image/x-icon" href="images/ship.ico" />
       <link href="CSS/bootstrap.css" rel="stylesheet" />
    <link href="CSS/SPSStyle.css" rel="stylesheet" />
    <style type="text/css">
        .cont_text_pading {
            padding: 30px 10px;
        }
    </style>
</head>
<body>
      <form id="form1" runat="server">
        <h3 style="text-align: center; margin-top: 10px; margin-bottom: 10px; max-width: 90%">MSP MANAGEMENT CONSOLE</h3>
        <div class="col-md-12">
            <div class="col-md-offset-1 col-md-10">
                <div class="box box-success" style="padding: 10px 10px 10px 10px; background-color: #eeeeee">
                    <div class="box-body">
                        <a class="col-md-4 col-sm-6 col-xs-12" href="Home.aspx">
                            <div class="info-box">
                                <span class="info-box-icon bg-green">
                                    <img src="Images/Tohome.png" width="80%"/>
                                </span>
                                <div class="info-box-content cont_text_pading">
                                    <span class="info-box-text">HOME</span>
                                </div>
                            </div>
                        </a>
                        <a class="col-md-4 col-sm-6 col-xs-12" href="UnsetSchedule.aspx">
                            <div class="info-box">
                                <span class="info-box-icon bg-blue">
                                    <img src="Images/SCReport.png" width="80%"/>
                                </span>
                                <div class="info-box-content cont_text_pading">
                                    <span class="info-box-text">MSP SCHEDULER</span>
                                </div>
                            </div>
                        </a>
                        <a class="col-md-4 col-sm-6 col-xs-12" href="SRNHome.aspx">
                            <div class="info-box">
                                <span class="info-box-icon bg-maroon">
                                    <img src="Images/Report.png" width="80%" />
                                </span>
                                <div class="info-box-content cont_text_pading">
                                    <span class="info-box-text"> SHIPMENT RELEASE NOTE</span>
                                </div>
                            </div>
                        </a>
                         <a class="col-md-4 col-sm-6 col-xs-12" href="HONYard.aspx">
                            <div class="info-box">
                                <span class="info-box-icon bg-aqua">
                                    <img src="Images/ITtransfer.png" width="80%"/>
                                </span>
                                <div class="info-box-content cont_text_pading">
                                    <span class="info-box-text">Cargo @ HO & Yard</span>
                                </div>
                            </div>
                        </a>
                        <%-- <a class="col-md-4 col-sm-6 col-xs-12" href="CommercialDeliveries.aspx">
                            <div class="info-box">
                                <span class="info-box-icon bg-teal">
                                    <img src="Images/Del.png" width="60%"/>
                                </span>
                                <div class="info-box-content cont_text_pading">
                                    <span class="info-box-text">Commercial Deliveries</span>
                                </div>
                            </div>
                        </a>--%>

                        
                         <a class="col-md-4 col-sm-6 col-xs-12" href="Trash.aspx">
                            <div class="info-box">
                                <span class="info-box-icon bg-red">
                                    <img src="Images/trash.png" width="80%" />
                                </span>
                                <div class="info-box-content cont_text_pading">
                                    <span class="info-box-text">Trash Deliveries</span>
                                </div>
                            </div>
                        </a>
                      <%--   <a class="col-md-4 col-sm-6 col-xs-12" href="ShortShipments.aspx">
                            <div class="info-box">
                                <span class="info-box-icon bg-orange">
                                    <img src="Images/ShortShip.png" width="80%" />
                                </span>
                                <div class="info-box-content cont_text_pading">
                                    <span class="info-box-text">Pending Deliveries</span>
                                </div>
                            </div>
                        </a>--%>
                         
                         <%--<a class="col-md-4 col-sm-6 col-xs-12" href="WaveOff.aspx">
                            <div class="info-box">
                                <span class="info-box-icon bg-lime">
                                    <img src="Images/WaveOff.png" width="80%" />
                                </span>
                                <div class="info-box-content cont_text_pading">
                                    <span class="info-box-text">Wave OFF</span>
                                </div>
                            </div>
                        </a>--%>

                         <a class="col-md-4 col-sm-6 col-xs-12" href="ProdPlantChange.aspx">
                            <div class="info-box">
                                <span class="info-box-icon bg-purple">
                                    <img src="Images/cancelapproval.png" width="120%" />
                                </span>
                                <div class="info-box-content cont_text_pading">
                                    <span class="info-box-text">Del. Location Change</span>
                                </div>
                            </div>
                        </a>

                       
                       <%--  <a class="col-md-4 col-sm-6 col-xs-12" href="ManualDelivery.aspx">
                            <div class="info-box">
                                <span class="info-box-icon bg-navy">
                                    <img src="Images/Manual.png" width="70%" />
                                </span>
                                <div class="info-box-content cont_text_pading">
                                    <span class="info-box-text">Manual Deliveries</span>
                                </div>
                            </div>
                        </a>--%>

                          <a class="col-md-4 col-sm-6 col-xs-12" href="Approval.aspx">
                            <div class="info-box">
                                <span class="info-box-icon bg-lime">
                                    <img src="Images/app.png" width="70%" />
                                </span>
                                <div class="info-box-content cont_text_pading">
                                    <span class="info-box-text">Approvals</span>
                                </div>
                            </div>
                        </a>

                       <%--  <a class="col-md-4 col-sm-6 col-xs-12" href="ManualDelivery.aspx">--%>
                          <%--   <a class="col-md-4 col-sm-6 col-xs-12" href="DebitNoteReceiving.aspx">
                    <div class="info-box">
                                <span class="info-box-icon bg-green">
                                    <img src="Images/Dispatch.png" width="60%" />
                                </span>
                                <div class="info-box-content cont_text_pading">
                                    <span class="info-box-text">DEB Note Dispatching</span>
                                </div>
                            </div>
                        </a>--%>

                         <%--<a class="col-md-4 col-sm-6 col-xs-12" href="DNAcknowledge.aspx">
                     
                            <div class="info-box">
                                <span class="info-box-icon bg-navy">
                                    <img src="Images/Manual.png" width="70%" />
                                </span>
                                <div class="info-box-content cont_text_pading">
                                    <span class="info-box-text">DEB Note Acknowledge</span>
                                </div>
                            </div>
                        </a>--%>

                        <a class="col-md-4 col-sm-6 col-xs-12" href="InvoiceWiseSummary.aspx">
                     
                            <div class="info-box">
                                <span class="info-box-icon bg-yellow">
                                    <img src="Images/invoice.png" width="60%" />
                                </span>
                                <div class="info-box-content cont_text_pading">
                                    <span class="info-box-text">Invoice Send to Buyer</span>
                                </div>
                            </div>
                        </a>

                         <a class="col-md-4 col-sm-6 col-xs-12" href="SWFHome.aspx">
                     
                            <div class="info-box">
                                <span class="info-box-icon bg-fuchsia">
                                    <img src="Images/sizeFob.png" width="80%" />
                                </span>
                                <div class="info-box-content cont_text_pading">
                                    <span class="info-box-text">FOB Management</span>
                                </div>
                            </div>
                        </a>

                         <a class="col-md-4 col-sm-6 col-xs-12" href="MSP_Dispatched_Rejection_Home.aspx">
                     
                            <div class="info-box">
                                <span class="info-box-icon bg-olive">
                                    <img src="Images/cancelb.png" width="60%" />
                                </span>
                                <div class="info-box-content cont_text_pading">
                                    <span class="info-box-text">Dispatch Rejection</span>
                                </div>
                            </div>
                        </a>

                        <a class="col-md-4 col-sm-6 col-xs-12" href="LaundryWashSheet.aspx">
                     
                            <div class="info-box">
                                <span class="info-box-icon bg-light-blue">
                                    <img src="Images/wash.png" width="60%" />
                                </span>
                                <div class="info-box-content cont_text_pading">
                                    <span class="info-box-text">Document Uploader</span>
                                </div>
                            </div>
                        </a>

                         <a class="col-md-4 col-sm-6 col-xs-12" href="ShipmentCancellationRequest.aspx">
                     
                            <div class="info-box">
                                <span class="info-box-icon bg-yellow-gradient">
                                    <img src="Images/cancelled.png" width="90%" />
                                </span>
                                <div class="info-box-content cont_text_pading">
                                    <span class="info-box-text">Shipment Cancellation</span>
                                </div>
                            </div>
                        </a>

                    </div>
                </div>
            </div>
      
        </div>
    </form>
   <%-- <form id="form1" runat="server">
    <div>
    <asp:ImageButton ID="btnHome" runat="server" ImageUrl="~/images/Tohome.png" Height="35px"
                    Width="35px" OnClick="btnHome_Click"  /></div>
        <div>

            <asp:Panel ID="Panel1" runat="server">
                <table class="auto-style1">
                    <tr>
                        <td class="auto-style2">&nbsp;</td>
                        <td class="auto-style2">&nbsp;</td>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td class="auto-style2">
                            <asp:Label ID="Label2" Width="400px" runat="server" CssClass="auto-style17" Style="font-size: 18pt; font-weight: 700;" Text="MSP Management Console"></asp:Label>
                        </td>
                        <td class="auto-style2">&nbsp;</td>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                    </tr>
                </table>
            </asp:Panel>
        </div>
        <asp:Panel ID="Panel2" runat="server">
            <ul>
                <li>
                     <a href="UnsetSchedule.aspx"> 
                        <img src="images/schedule.png" width="50" height="50" />
                        <h3>MSP Scheduler</h3>
                    </a>
                </li>
                 <li>
                    <a href="ShipmentTD.aspx">
                        <img src="images/Delivered.png" width="50" height="50" />
                        <h3>Delivery Invoice</h3>
                    </a>
                </li>
                <li>
                    <a href="CommercialDeliveries.aspx">
                        <img src="images/RevisedBreakdown.png" width="50" height="50" />
                        <h3>Commercial Deliveries</h3>
                    </a>
                </li>
                 <li>
                    <a href="CommercialCargoHO.aspx">
                        <img src="images/ITtransfer.png" width="50" height="50" />
                        <h3>Commercial Deliveries (Cargo @ HO)</h3>
                    </a>
                </li>
                 <li>
                    <a href="Trash.aspx">
                        <img src="images/trash.png" width="50" height="50" />
                        <h3>Trash Deliveries</h3>
                    </a>
                </li>
              
               

            </ul>
        </asp:Panel>
    </form>--%>
</body>
</html>
