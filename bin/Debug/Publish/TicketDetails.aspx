<%@ page language="C#" autoeventwireup="true" inherits="TicketDetails, App_Web_11yxmj2e" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Ticket Details</title>
    <link href="CSSSTKT/bootstrap.css" rel="stylesheet" />
    <link href="CSSSTKT/SPSStyle.css" rel="stylesheet" />

    <%--    <script type="text/javascript">
        $(function () {
            $("#tabs").tabs({
                collapsible: true
            });
        });
    </script>--%>
</head>
<body>
    <form id="form1" runat="server">
        <asp:Label ID="lblTKTID" runat="server" Text="" Visible="false"></asp:Label>
        <div>
            <div class="col-md-12">
                <div class="col-md-2">
                    <h2>
                      <%--  <asp:ImageButton ID="btnHome" runat="server" ImageUrl="~/images/Tohome.png" Height="35px"
                            Width="35px" PostBackUrl="~/SystemRequirmentsMainPage.aspx" /></h2>--%>
                </div>
                <div class="col-md-8">
                    <h3 style="text-align: center">Ticket No - <asp:Label ID="lblTktNum" runat="server" Text="" ForeColor="#993366" Font-Bold="true"></asp:Label></h3>
                </div>
            </div>
            <div class="col-lg-12">
                <div class="box box-success" style="background-color: #eeeeee">
                    <div class="box-body">
                        <div class="form-group">
                            <div class="row">
                                                                <div class="col-md-12">
                                    <div class="col-md-1">
                                        <asp:Label ID="LblApp" runat="server" Text="Approvals" Font-Bold="true" Font-Italic="true" ForeColor="#009933"></asp:Label>
                                    </div>
                                </div>
                                <div class="col-md-12">
                                    <label class="col-md-1 control-label">GM:</label>
                                    <div class="col-md-2">
                                        <asp:Label ID="LblAppGM" runat="server" Text="" Font-Bold="true" ForeColor="#993366"></asp:Label>
                                    </div>
                                    <label class="col-md-2 control-label">IT Manager:</label>
                                    <div class="col-md-2">
                                        <asp:Label ID="LblAppITMng" runat="server" Text="" Font-Bold="true" ForeColor="#993366"></asp:Label>
                                    </div>
                                    <label class="col-md-2 control-label">Acc. Manager:</label>
                                    <div class="col-md-2">
                                        <asp:Label ID="LblAppAccMng" runat="server" Text="" Font-Bold="true" ForeColor="#993366"></asp:Label>
                                    </div>
                                </div>
                                <div class="col-md-12">
                                    <label class="col-md-1 control-label">Finance:</label>
                                    <div class="col-md-2">
                                        <asp:Label ID="LblAppFinance" runat="server" Text="" Font-Bold="true" ForeColor="#993366"></asp:Label>
                                    </div>
                                    <label class="col-md-2 control-label">Com. Manager:</label>
                                    <div class="col-md-2">
                                        <asp:Label ID="LblAppComMng" runat="server" Text="" Font-Bold="true" ForeColor="#993366"></asp:Label>
                                    </div>
                                    <label class="col-md-2 control-label">CWH Manager:</label>
                                    <div class="col-md-2">
                                        <asp:Label ID="LblAppCWHMng" runat="server" Text="" Font-Bold="true" ForeColor="#993366"></asp:Label>
                                    </div>
                                </div>
                                <div class="col-md-12">
                                    <div class="col-md-3">
                                        <asp:Label ID="LblTopic" runat="server" Text="More Details" Font-Bold="true" Font-Italic="true" ForeColor="#009933"></asp:Label>
                                    </div>
                                </div>
                                <div class="col-md-12">
                                    <%--<label class="col-md-1 control-label">TKT No</label>
                                    <div class="col-md-2">
                                        <asp:Label ID="lblTktNum" runat="server" Text="" ForeColor="#993366"></asp:Label>
                                    </div>--%>
                                    <label class="col-md-2 control-label">Requirment Sub Category</label>
                                    <div class="col-md-2">
                                        <asp:Label ID="lblReqsub" runat="server" Text="" ForeColor="#993366"></asp:Label>
                                    </div>
                                    <label class="col-md-2 control-label">Requirment Main Category</label>
                                    <div class="col-md-2">
                                        <asp:Label ID="lblReqMaine" runat="server" Text="" ForeColor="#993366"></asp:Label>
                                    </div>
                                </div>
                                <div class="col-md-12">
                                    <label class="col-md-1 control-label">Req. Date</label>
                                    <div class="col-md-2">
                                        <asp:Label ID="lblReqDates" runat="server" Text="" ForeColor="#993366"></asp:Label>
                                        <%--663300--%>
                                    </div>
                                    <label class="col-md-2 control-label">Requested User</label>
                                    <div class="col-md-2">
                                        <asp:Label ID="lblREQUser" runat="server" Text="" ForeColor="#993366"></asp:Label>
                                    </div>
                                    <label class="col-md-2 control-label">Doc No.</label>
                                    <div class="col-md-2">
                                        <asp:Label ID="lblDocNos" runat="server" Text="" ForeColor="#993366"></asp:Label>
                                    </div>
                                </div>
                                <div class="col-md-12">
                                    <label class="col-md-1 control-label">Discription</label>
                                    <div class="col-md-10">
                                        <asp:Label ID="LblDiscript" runat="server" Text="" ForeColor="#993366"></asp:Label>
                                    </div>
                                </div>
                                <div class="col-md-12">
                                    <%--<label class="col-md-2 control-label">Request Date</label>
                                    <div class="col-md-2">
                                        <asp:Label ID="LblReqDate" runat="server" Text="" ForeColor="#993366"></asp:Label>
                                    </div>--%>
                                    <label class="col-md-1 control-label">Assign</label>
                                    <div class="col-md-2">
                                        <asp:Label ID="LblAssignDate" runat="server" Text="" ForeColor="#993366"></asp:Label>
                                    </div>
                                    <label class="col-md-1 control-label">Start</label>
                                    <div class="col-md-2">
                                        <asp:Label ID="LblStartDate" runat="server" Text="" ForeColor="#993366"></asp:Label>
                                    </div>
                                    <label class="col-md-2 control-label">Second Start Date</label>
                                    <div class="col-md-2">
                                        <asp:Label ID="LblSecondStart" runat="server" Text="" ForeColor="#993366"></asp:Label>
                                    </div>
                                </div>
                                <div class="col-md-12">
                                    <label class="col-md-1 control-label">Pause</label>
                                    <div class="col-md-2">
                                        <asp:Label ID="LblPauseDate" runat="server" Text="" ForeColor="#993366"></asp:Label>
                                    </div>
                                    <label class="col-md-1 control-label">Finish</label>
                                    <div class="col-md-2">
                                        <asp:Label ID="LblFinishDate" runat="server" Text="" ForeColor="#993366"></asp:Label>
                                    </div>
                                    <label class="col-md-2 control-label">Actual Duration</label>
                                    <div class="col-md-1">
                                        <asp:Label ID="LblActualDur" runat="server" Text="" ForeColor="#993366"></asp:Label>
                                    </div>
                                    <label class="col-md-2 control-label">Assigned Duration</label>
                                    <div class="col-md-1">
                                        <asp:Label ID="LblAssignedDur" runat="server" Text="" ForeColor="#993366"></asp:Label>
                                    </div>
                                </div>
                                <div class="col-md-12">
                                    <label class="col-md-3 control-label">Request To Complete Date Difference</label>
                                    <div class="col-md-1">
                                        <asp:Label ID="LblReqToCom" runat="server" Text="" ForeColor="#993366"></asp:Label>
                                    </div>
                                    <label class="col-md-3 control-label">Start To Complete Date Difference</label>
                                    <div class="col-md-1">
                                        <asp:Label ID="LblStToCom" runat="server" Text="" ForeColor="#993366"></asp:Label>
                                    </div>
                                </div>
                                <div class="col-md-12">
                                    <div class="col-md-1">
                                        <asp:Label ID="LblComnt" runat="server" Text="Comments" Font-Bold="true" Font-Italic="true" ForeColor="#009933"></asp:Label>
                                    </div>
                                </div>
                                <div class="col-md-12">
                                    <label class="col-md-2 control-label">General Manager:</label>
                                    <div class="col-md-4">
                                        <asp:Label ID="lblGMComment" runat="server" Text="" ForeColor="#993366"></asp:Label>
                                    </div>
                                    <label class="col-md-2 control-label">IT Manager:</label>
                                    <div class="col-md-4">
                                        <asp:Label ID="lblComments" runat="server" Text="" ForeColor="#993366"></asp:Label>
                                        <asp:Label ID="lblITMngComment" runat="server" Text="" ForeColor="#993366"></asp:Label>
                                    </div>
                                </div>
                                <div class="col-md-12">
                                    <label class="col-md-2 control-label">Commercial Manager:</label>
                                    <div class="col-md-4">
                                        <asp:Label ID="lblCommercialComment" runat="server" Text="" ForeColor="#993366"></asp:Label>
                                    </div>
                                    <label class="col-md-2 control-label">Account Manager:</label>
                                    <div class="col-md-4">
                                        <asp:Label ID="lblAccountMngComment" runat="server" Text="" ForeColor="#993366"></asp:Label>
                                    </div>
                                </div>
                                <div class="col-md-12">
                                    <label class="col-md-2 control-label">Finance Manager:</label>
                                    <div class="col-md-4">
                                        <asp:Label ID="lblFinComment" runat="server" Text="" ForeColor="#993366"></asp:Label>
                                    </div>
                                    <label class="col-md-2 control-label">CWH Manager:</label>
                                    <div class="col-md-4">
                                        <asp:Label ID="LblCWHMngComment" runat="server" Text="" ForeColor="#993366"></asp:Label>
                                    </div>
                                </div>
                                <div class="col-md-12">
                                    <asp:Image ID="ImgTicket" runat="server" />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>
</body>
</html>


