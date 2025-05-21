<%@ page language="C#" autoeventwireup="true" inherits="AllReports, App_Web_b2ychy0x" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>MSP</title>
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
        <h3 style="text-align: center; margin-top: 50px; margin-bottom: 50px; max-width: 90%">MSP REPORTS</h3>
        <div class="col-md-12">
            <div class="col-md-offset-1 col-md-10">
                <div class="box box-success" style="padding: 20px 20px 20px 20px; background-color: #eeeeee">
                    <div class="box-body">
                        <a class="col-md-4 col-sm-6 col-xs-12" href="Home.aspx">
                            <div class="info-box">
                                <span class="info-box-icon bg-green">
                                    <img src="Images/25694.png" width="80%"/>
                                </span>
                                <div class="info-box-content cont_text_pading">
                                    <span class="info-box-text">HOME</span>
                                </div>
                            </div>
                        </a>
                      <%--  <a class="col-md-4 col-sm-6 col-xs-12" href="DeliveryReport.aspx">
                            <div class="info-box">
                                <span class="info-box-icon bg-blue">
                                    <img src="Images/Breakdown.png" width="80%"/>
                                </span>
                                <div class="info-box-content cont_text_pading">
                                    <span class="info-box-text">Delivery Report</span>
                                </div>
                            </div>
                        </a>--%>
                       <%-- <a class="col-md-4 col-sm-6 col-xs-12" href="ScheduleShipment.aspx">
                            <div class="info-box">
                                <span class="info-box-icon bg-orange">
                                    <img src="Images/schedule.png" width="80%" />
                                </span>
                                <div class="info-box-content cont_text_pading">
                                    <span class="info-box-text">Delivery (Monthly)</span>
                                </div>
                            </div>
                        </a>--%>
                        
                        <%-- <a class="col-md-4 col-sm-6 col-xs-12" href="ShipmentScheduleWeek.aspx">
                            <div class="info-box">
                                <span class="info-box-icon bg-aqua">
                                    <img src="Images/Delivery.png" width="80%" />
                                </span>
                                <div class="info-box-content cont_text_pading">
                                    <span class="info-box-text">Delivery (Weekly)</span>
                                </div>
                            </div>
                        </a>--%>

                        <%--   <a class="col-md-4 col-sm-6 col-xs-12" href="PlantWiseDeliveryReport.aspx">
                            <div class="info-box">
                                <span class="info-box-icon bg-purple">
                                    <img src="Images/Plant.png" width="100%"/>
                                </span>
                                <div class="info-box-content cont_text_pading">
                                    <span class="info-box-text">Plant Wise Deliveries</span>
                                </div>
                            </div>
                        </a>--%>
                         
                          <a class="col-md-4 col-sm-6 col-xs-12" href="PlantWiseDeliveryRep.aspx">
                            <div class="info-box">
                                <span class="info-box-icon bg-maroon">
                                    <img src="Images/DDown.png" width="70%" />
                                </span>
                                <div class="info-box-content cont_text_pading">
                                    <span class="info-box-text"> Style Delivery Drill Down</span>
                                </div>
                            </div>
                        </a>

                         <%--  <a class="col-md-4 col-sm-6 col-xs-12" href="DashboardFourLevel.aspx"> --%>
                       <%--           <a class="col-md-4 col-sm-6 col-xs-12" href="DashboardT.aspx">  --%>
                                   <a class="col-md-4 col-sm-6 col-xs-12" href="ShipmentDashboard.aspx">  
                            <div class="info-box">
                                <span class="info-box-icon bg-yellow">
                                    <img src="Images/Dashboard.png" width="70%"/>
                                </span>
                                <div class="info-box-content cont_text_pading">
                                    <span class="info-box-text">Dashboard</span>
                                </div>
                            </div>
                        </a>
                       <%--  <a class="col-md-4 col-sm-6 col-xs-12" href="SerialNoWiseDeliveryRpt.aspx">
                            <div class="info-box">
                                <span class="info-box-icon bg-red">
                                    <img src="Images/Reports.png" width="70%"/>
                                </span>
                                <div class="info-box-content cont_text_pading">
                                    <span class="info-box-text">Serial No. Wise Delivery Plan</span>
                                </div>
                            </div>
                        </a>--%>

                         <a class="col-md-4 col-sm-6 col-xs-12" href="StyleWiseHistory.aspx">
                            <div class="info-box">
                                <span class="info-box-icon bg-orange">
                                    <img src="Images/history.png" width="70%"/>
                                </span>
                                <div class="info-box-content cont_text_pading">
                                    <span class="info-box-text">Style Wise History</span>
                                </div>
                            </div>
                        </a>

                       <%--  <a class="col-md-4 col-sm-6 col-xs-12" href="DBAcknowledgeReport.aspx">
                            <div class="info-box">
                                <span class="info-box-icon bg-teal">
                                    <img src="Images/reports.png" width="70%"/>
                                </span>
                                <div class="info-box-content cont_text_pading">
                                    <span class="info-box-text">Acknowledged Debit Note 
                                        </span>
                                    <span class="info-box-text">Report</span>
                                </div>
                            </div>
                        </a>--%>
                         <a class="col-md-4 col-sm-6 col-xs-12" href="DispatchVsInv.aspx">
                            <div class="info-box">
                                <span class="info-box-icon bg-blue">
                                    <img src="images/MFMDR.png" width="70%"/>
                                </span>
                                <div class="info-box-content cont_text_pading">
                                    <span class="info-box-text">Dispatched Vs Invoiced</span>
                                </div>
                            </div>
                        </a>

                         <a class="col-md-4 col-sm-6 col-xs-12" href="PartialShipments.aspx">
                            <div class="info-box">
                                <span class="info-box-icon bg-olive">
                                    <img src="images/ptl.png" width="70%"/>
                                </span>
                                <div class="info-box-content cont_text_pading">
                                    <span class="info-box-text">Partial Shipments</span>
                                </div>
                            </div>
                        </a>

                             <a class="col-md-4 col-sm-6 col-xs-12" href="CargoAtHOCancellationReport.aspx">
                            <div class="info-box">
                                <span class="info-box-icon bg-purple">
                                    <img src="Images/Plant.png" width="100%"/>
                                </span>
                                <div class="info-box-content cont_text_pading">
                                    <span class="info-box-text">Cancelled - Cargo @ HO</span>
                                </div>
                            </div>
                        </a>

                            <a class="col-md-4 col-sm-6 col-xs-12" href="http://192.168.1.20/MSPReports/ShipmentDashboard.aspx">
                            <div class="info-box">
                                <span class="info-box-icon bg-teal">
                                    <img src="Images/reports.png" width="70%"/>
                                </span>
                                <div class="info-box-content cont_text_pading">
                                    <span class="info-box-text">Shipment Dashboard 
                                        </span>
                                    <span class="info-box-text"></span>
                                </div>
                            </div>
                        </a>

                          <a class="col-md-4 col-sm-6 col-xs-12" href="DebitNoteDetailReport.aspx">
                            <div class="info-box">
                                <span class="info-box-icon bg-lime">
                                    <img src="Images/Debit.png" width="70%"/>
                                </span>
                                <div class="info-box-content cont_text_pading">
                                    <span class="info-box-text">Debit Note Detail Report 
                                        </span>
                                    <span class="info-box-text"></span>
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
                Width="35px" OnClick="btnHome_Click" />
        </div>
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
                            <asp:Label ID="Label2" runat="server" CssClass="auto-style17" Style="font-size: 18pt; font-weight: 700;" Text="Reports"></asp:Label>
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
                    <a href="DeliveryReport.aspx">
                        <img src="images/Breakdown.png" width="50px" height="50px" />
                        <h3>Delivery Report</h3>
                    </a>
                </li>
                <li>
                    <a href="ScheduleShipment.aspx">
                        <img src="images/schedule.png" width="50px" height="50px" />
                        <h3>Delivery Report-Monthly View</h3>
                    </a>
                </li>
                  <li>
                    <a href="ShipmentScheduleWeek.aspx">
                        <img src="images/SCreport.png" width="50px" height="50px" />
                        <h3>Delivery Report-Weekly View</h3>
                    </a>
                </li>

              
            </ul>
        </asp:Panel>
    </form>--%>
</body>
</html>
