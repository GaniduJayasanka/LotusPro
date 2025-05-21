<%@ page language="C#" autoeventwireup="true" inherits="Home, App_Web_10bhy3il" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">

    <link rel="shortcut icon" type="image/x-icon" href="images/ship.ico" />

        <link rel="shortcut icon" type="image/ico" href="images/ship.ico" />
    <link rel="icon" type="image/ico" href="images/ship.ico" />
    <link rel="apple-touch-icon" type="image/ico" href="images/ship.ico" />

     <link href="CSS/bootstrap.css" rel="stylesheet" />
    <link href="CSS/SPSStyle.css" rel="stylesheet" />
    <style type="text/css">
        .cont_text_pading {
            padding: 30px 10px;
        }
    </style>
</head>
<body>
   <%-- <form id="form1" runat="server">
    <div>
    
        <asp:Panel ID="Panel1" runat="server">
            <table class="auto-style1">
                <tr>
                    <td>&nbsp;</td>
                    <td class="auto-style4">&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td class="auto-style3" colspan="6">
                        &nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td colspan="6" style="text-align: center">
                        <blockquote>
                            <asp:Label ID="Label1" runat="server" style="font-size: xx-large; font-weight: 700;" Text="Monthly Shipping Plan"></asp:Label>
                        </blockquote>
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                   <td></td> <td colspan="7">	<div id="content">
			


                       <table style="width: 1117px">
                           <tr>
                               <td></td>
                               <td class="auto-style3">
                                   <asp:ImageButton ID="ImgBtnDataEntry" runat="server" Height="103px" ImageUrl="~/images/DataEntry.png" OnClick="ImgBtnDataEntry_Click" PostBackUrl="~/DataEntry.aspx" Width="103px" />
                               </td>
                               <td class="auto-style3">
                                   &nbsp;</td>
                               <td class="auto-style3">
                                   &nbsp;</td>
                               <td class="auto-style3">
                                   <asp:ImageButton ID="ImgBtnReport" runat="server" Height="103px" ImageUrl="~/images/ReportView.png" OnClick="ImgBtnReport_Click" PostBackUrl="~/report.aspx" Width="103px" />
                               </td>
                               <td class="auto-style5">&nbsp;</td>
                           </tr>
                           <tr><td></td><td style="text-align: center">
                               <asp:Label ID="Label2" runat="server" style="text-align: center" 
                                   Text="MSP Management Console"></asp:Label>
                               </td> <td class="auto-style3">
                                   &nbsp;</td><td class="auto-style3">
                                   &nbsp;</td><td class="auto-style3">
                                   <asp:Label ID="Label3" runat="server" Text="Report View"></asp:Label>
                               </td>
                               <td class="auto-style5">&nbsp;</td>
                           </tr>
                       </table>
		</div></td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td class="auto-style4">&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
            </table>
        </asp:Panel>
    
    </div>
    </form>--%>

      <form id="form1" runat="server">
        <h1 style="text-align: center; margin-top: 30px; margin-bottom: 30px;"><b>MONTHLY SHIPPING PLAN</b></h1>
        <div class="col-md-offset-1 col-md-10">
            <div class="box box-success" style="padding: 20px 20px 20px 20px; background-color: #eeeeee">
                <div class="box-body">
                    <a class="col-md-4 col-sm-6 col-xs-12" href="DataEntry.aspx">
                        <div class="info-box">
                            <span class="info-box-icon bg-green">
                                <img src="Images/ComponentIsssue.png" width="80%" /></span>
                            <div class="info-box-content cont_text_pading">
                                <span class="info-box-text">MSP Management Console</span>
                            </div>
                        </div>
                    </a>
                    
                    <a class="col-md-4 col-sm-6 col-xs-12" href="report.aspx">
                        <div class="info-box">
                            <span class="info-box-icon bg-yellow">
                                <img src="Images/MFMDR.png"  width="80%"/></span>

                            <div class="info-box-content cont_text_pading">
                                <span class="info-box-text">Report View</span>
                            </div>
                        </div>
                    </a>
                   <%-- <a class="col-md-4 col-sm-6 col-xs-12" href="Line/Line.aspx">
                        <div class="info-box">
                            <span class="info-box-icon bg-aqua">
                                <img src="Images/Line.png" /></span>

                            <div class="info-box-content cont_text_pading">
                                <span class="info-box-text">Others</span>
                            </div>
                        </div>
                    </a>--%>
                    
                   
                   
                </div>
            </div>
        </div>
    </form>
</body>
</html>
