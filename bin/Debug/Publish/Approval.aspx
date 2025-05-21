<%@ page language="C#" autoeventwireup="true" inherits="Approval, App_Web_b2ychy0x" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>MSP</title>
     <link rel="shortcut icon" type="image/x-icon" href="images/ship.ico" />
       <link href="CSS/bootstrap.css" rel="stylesheet" />
    <link href="CSS/SPSStyle.css" rel="stylesheet" />
    <style type="text/css">
        .cont_text_pading {
            padding: 30px 10px;
        }
        .auto-style1 {
            display: block;
            font-size: x-small;
            white-space: nowrap;
            overflow: hidden;
            text-overflow: ellipsis;
            text-transform: uppercase;
        }
    </style>
</head>
<body>
      <form id="form1" runat="server">
        <h3 style="text-align: center; margin-top: 10px; margin-bottom: 10px; max-width: 90%">APPROVAL CONSOLE</h3>
        <div class="col-md-12">
            <div class="col-md-offset-1 col-md-10">
                <div class="box box-success" style="padding: 10px 10px 10px 10px; background-color: #eeeeee">
                    <div class="box-body">
                        <a class="col-md-4 col-sm-6 col-xs-12" href="DataEntry.aspx">
                            <div class="info-box">
                                <span class="info-box-icon bg-green">
                                    <img src="Images/Tohome.png" width="80%"/>
                                </span>
                                <div class="info-box-content cont_text_pading">
                                    <span class="info-box-text">HOME</span>
                                </div>
                            </div>
                        </a>
                      

                         <a class="col-md-4 col-sm-6 col-xs-12" href="CAlHome.aspx">
                            <div class="info-box">
                                <span class="info-box-icon bg-purple">
                                    <img src="Images/cancelapproval.png" width="120%" />
                                </span>
                                <div class="info-box-content cont_text_pading">
                                    <span class="info-box-text">Cancellation Approval</span>
                                </div>
                            </div>
                        </a>

                      

                          <a class="col-md-4 col-sm-6 col-xs-12" href="ShortShipmentApproval.aspx">
                            <div class="info-box">
                                <span class="info-box-icon bg-lime">
                                    <img src="Images/app.png" width="70%" />
                                </span>
                                <div class="info-box-content cont_text_pading">
                                    <span class="info-box-text">Short Ship. Approval</span>
                                </div>
                            </div>
                        </a>
                       

                         <a class="col-md-4 col-sm-6 col-xs-12" href="RNApprovalPendingList.aspx">
                            <div class="info-box">
                                <span class="info-box-icon bg-orange">
                                    <img src="Images/app.png" width="70%" />
                                </span>
                                <div class="info-box-content cont_text_pading">
                                    <span class="info-box-text">Release Note Approval</span>
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
