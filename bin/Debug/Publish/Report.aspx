<%@ page language="C#" autoeventwireup="true" inherits="Report, App_Web_euilynsb" %>



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
                                    <img src="Images/Tohome.png" width="80%"/>
                                </span>
                                <div class="info-box-content cont_text_pading">
                                    <span class="info-box-text">HOME</span>
                                </div>
                            </div>
                        </a>
                        <a class="col-md-4 col-sm-6 col-xs-12" href="DPlan.aspx">
                            <div class="info-box">
                                <span class="info-box-icon bg-blue">
                                    <img src="Images/Breakdown.png" width="80%"/>
                                </span>
                                <div class="info-box-content cont_text_pading">
                                    <span class="info-box-text">Delivery Plan</span>
                                </div>
                            </div>
                        </a>
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

                           <a class="col-md-4 col-sm-6 col-xs-12" href="Allreports.aspx">
                            <div class="info-box">
                                <span class="info-box-icon bg-yellow">
                                    <img src="Images/DDown.png" width="70%"/>
                                </span>
                                <div class="info-box-content cont_text_pading">
                                    <span class="info-box-text">Other Reports</span>
                                </div>
                            </div>
                        </a>
                         
                          <%--<a class="col-md-4 col-sm-6 col-xs-12" href="PlantWiseDeliveryRep.aspx">
                            <div class="info-box">
                                <span class="info-box-icon bg-maroon">
                                    <img src="Images/DDown.png" width="70%" />
                                </span>
                                <div class="info-box-content cont_text_pading">
                                    <span class="info-box-text"> Style Delivery Drill Down</span>
                                </div>
                            </div>
                        </a>--%>

                          <%-- <a class="col-md-4 col-sm-6 col-xs-12" href="Dashboard.aspx">
                            <div class="info-box">
                                <span class="info-box-icon bg-yellow">
                                    <img src="Images/Dashboard.png" width="70%"/>
                                </span>
                                <div class="info-box-content cont_text_pading">
                                    <span class="info-box-text">Dashboard</span>
                                </div>
                            </div>
                        </a>--%>
                        <%-- <a class="col-md-4 col-sm-6 col-xs-12" href="SerialNoWiseDeliveryRpt.aspx">
                            <div class="info-box">
                                <span class="info-box-icon bg-red">
                                    <img src="Images/Reports.png" width="70%"/>
                                </span>
                                <div class="info-box-content cont_text_pading">
                                    <span class="info-box-text">Serial No. Wise Delivery Plan</span>
                                </div>
                            </div>
                        </a>--%>

                         <%--<a class="col-md-4 col-sm-6 col-xs-12" href="StyleWiseHistory.aspx">
                            <div class="info-box">
                                <span class="info-box-icon bg-lime">
                                    <img src="Images/history.png" width="70%"/>
                                </span>
                                <div class="info-box-content cont_text_pading">
                                    <span class="info-box-text">Log Report</span>
                                </div>
                            </div>
                        </a>--%>
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
