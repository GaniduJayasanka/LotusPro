<%@ page language="C#" autoeventwireup="true" inherits="SWFHome, App_Web_10bhy3il" %>

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
    </style>
</head>
<body>
      <form id="form1" runat="server">
        <h3 style="text-align: center; margin-top: 50px; margin-bottom: 50px; max-width: 90%">FOB MANAGEMENT CONSOLE</h3>
        <div class="col-md-12">
            <div class="col-md-offset-1 col-md-10">
                <div class="box box-success" style="padding: 20px 20px 20px 20px; background-color: #eeeeee">
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
                        <a class="col-md-4 col-sm-6 col-xs-12" href="DailyShipments.aspx">
                            <div class="info-box">
                                <span class="info-box-icon bg-blue">
                                    <img src="Images/sizeFob.png" width="80%"/>
                                </span>
                                <div class="info-box-content cont_text_pading">
                                    <span class="info-box-text">Size Wise FOB</span>
                                </div>
                            </div>
                        </a>
                        <a class="col-md-4 col-sm-6 col-xs-12" href="SizeWiseFOBApproval.aspx">
                            <div class="info-box">
                                <span class="info-box-icon bg-maroon">
                                    <img src="Images/Approval.png" width="80%" />
                                </span>
                                <div class="info-box-content cont_text_pading">
                                    <span class="info-box-text"> Size Wise FOB Approval</span>
                                </div>
                            </div>
                        </a>
                         <a class="col-md-4 col-sm-6 col-xs-12" href="SizeWiseFOBViewer.aspx">
                            <div class="info-box">
                                <span class="info-box-icon bg-yellow">
                                    <img src="Images/activitylog.png" width="80%"/>
                                </span>
                                <div class="info-box-content cont_text_pading">
                                    <span class="info-box-text">Report View</span>
                                </div>
                            </div>
                        </a>
                        
                    </div>
                </div>
            </div>
      
        </div>
    </form>

</body>
</html>
