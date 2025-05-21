<%@ page language="C#" autoeventwireup="true" inherits="PlaningSchedule, App_Web_b2ychy0x" %>

<%@ Register Assembly="BasicFrame.WebControls.BasicDatePicker" Namespace="BasicFrame.WebControls" TagPrefix="BDP" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Shipment Schedule Report</title>
    <link href='fullcalendar.min.css' rel='stylesheet' />
    <link href='fullcalendar.print.min.css' rel='stylesheet' media='print' />
    <link href="CSS/bootstrap.css" rel="stylesheet" />

    <script src='lib/moment.min.js'></script>
    <script src='lib/jquery.min.js'></script>
    <script src='fullcalendar.min.js'></script>
    <script>
        $(document).ready(function () {
            $('#calendar').fullCalendar({
                header: {
                    left: 'prev,next today',
                    center: 'title',
                    right: false
                },
                defaultView: 'basicWeek',
                defaultDate: $('#hfdate').val(),
                weekNumberCalculation: 'ISO',
                editable: true,
                events: {
                    url: 'Event.ashx',
                    data: function () {
                        return {
                            Buyer: $("#DDLBUYER").val(),
                            StyleID: $("#DDLStyle").val(),
                            PlantID: $("#DDLPlant").val()
                        };
                    }
                },
                eventRender: function (event, element) {
                    element.find('.fc-title').append("<br/>" + event.description);
                }
            });
            $('#btnSearch').click(function () {
                $('#calendar').fullCalendar('refetchEvents');
            });
        });
    </script>
    <style>
        #calendar {
            max-width: 100%;
            min-width: 90%;
            margin: 0 auto;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <asp:HiddenField ID="hfdate" runat="server" />
        <div class="col-md-12">
            <div class="col-md-12">
                <div class="col-md-2">
                    <br />
                    <asp:ImageButton ID="btnHome" runat="server" ImageUrl="~/images/Tohome.png" Height="35px"
                        Width="35px" PostBackUrl="~/home.aspx" />
                    <asp:ImageButton ID="btnback" runat="server" ImageUrl="~/images/Back.png" Height="35px"
                        Width="35px" PostBackUrl="~/report.aspx" />
                </div>
                <div class="col-md-9">
                    <h3 style="text-align: center">Delivery Plan</h3>
                </div>
            </div>
            <div class="col-md-12">
                <div class="panel panel-default">
                    <div class="panel-body">
                        <div class="box-body">
                            <div class="form-group">
                                <label class="col-md-1 control-label">Date:</label>
                                <div class="col-md-4">
                                    <BDP:BasicDatePicker ID="BDPselected" runat="server" CssClass="form-control" />
                                </div>
                                <div class="col-md-1">
                                    <asp:Button ID="btnDatesearch" CssClass="btn btn-info pull-right" runat="server" Text="Date Search" OnClick="btnsearch_Click" />
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="panel-body">
                        <div class="box-body">
                            <div class="form-group">
                                <label class="col-md-1 control-label">Plant:</label>
                                <div class="col-md-1">
                                    <asp:DropDownList ID="DDLPlant" runat="server" CssClass="form-control">
                                    </asp:DropDownList>
                                </div>
                                <label class="col-md-1 control-label">Buyer:</label>
                                <div class="col-md-2">
                                    <asp:DropDownList ID="DDLBUYER" CssClass="form-control" runat="server">
                                    </asp:DropDownList>
                                </div>
                                <label class="col-md-1 control-label">Style:</label>
                                <div class="col-md-2">
                                    <asp:DropDownList ID="DDLStyle" runat="server" CssClass="form-control">
                                    </asp:DropDownList>
                                </div>
                                <div class="col-md-1">
                                    <asp:Button ID="btnSearch" CssClass="btn btn-info pull-right" runat="server" Text="Search" />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-md-12">
            <div id='calendar'></div>
            <br />
        </div>
    </form>
</body>
</html>
