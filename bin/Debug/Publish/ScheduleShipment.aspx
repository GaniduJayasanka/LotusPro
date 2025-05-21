<%@ page language="C#" autoeventwireup="true" inherits="ScheduleShipment, App_Web_11yxmj2e" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Shipment Schedule Report</title>
    <link href="CSS/bootstrap.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
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
                                <label class="col-md-1 control-label">Year <span style="color: red">*</span> :</label>
                                <div class="col-md-1">
                                    <asp:DropDownList ID="ddlYear" runat="server" CssClass="form-control">
                                        <asp:ListItem Value=""></asp:ListItem>
                                        <asp:ListItem Value="1">2016</asp:ListItem>
                                        <asp:ListItem Value="2">2017</asp:ListItem>
                                        <asp:ListItem Value="3">2018</asp:ListItem>
                                        <asp:ListItem Value="4">2019</asp:ListItem>
                                        <asp:ListItem Value="5">2020</asp:ListItem>
                                        <asp:ListItem Value="6">2021</asp:ListItem>
                                        <asp:ListItem Value="7">2022</asp:ListItem>
                                        <asp:ListItem Value="8">2023</asp:ListItem>
                                        <asp:ListItem Value="9">2024</asp:ListItem>
                                        <asp:ListItem Value="10">2025</asp:ListItem>
                                        <asp:ListItem Value="11">2026</asp:ListItem>
                                        <asp:ListItem Value="12">2027</asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                                <label class="col-md-1 control-label">Month <span style="color: red">*</span> :</label>
                                <div class="col-md-1">
                                    <asp:DropDownList ID="ddlMonth" runat="server" CssClass="form-control">
                                        <asp:ListItem Value=""></asp:ListItem>
                                        <asp:ListItem Value="1">January</asp:ListItem>
                                        <asp:ListItem Value="2">February</asp:ListItem>
                                        <asp:ListItem Value="3">March</asp:ListItem>
                                        <asp:ListItem Value="4">April</asp:ListItem>
                                        <asp:ListItem Value="5">May</asp:ListItem>
                                        <asp:ListItem Value="6">June</asp:ListItem>
                                        <asp:ListItem Value="7">July</asp:ListItem>
                                        <asp:ListItem Value="8">August</asp:ListItem>
                                        <asp:ListItem Value="9">September</asp:ListItem>
                                        <asp:ListItem Value="10">October</asp:ListItem>
                                        <asp:ListItem Value="11">November</asp:ListItem>
                                        <asp:ListItem Value="12">December</asp:ListItem>
                                    </asp:DropDownList>
                                </div>
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
                            </div>
                        </div>
                        <br />
                        <br />
                        <div class="box-body">
                            <div class="form-group">
                                <div class="col-md-12">
                                    <asp:Button ID="btnsearch" CssClass="btn btn-info pull-right" runat="server" Text="Search" OnClick="btnsearch_Click" />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-md-12">
            <asp:GridView ID="gvSelectedDateEvents" runat="server" Width="100%"></asp:GridView>
            <asp:Calendar ID="CalendarShipment" runat="server" BackColor="White" BorderColor="Silver"
                BorderWidth="1px" Font-Names="Verdana" Font-Size="9pt" ForeColor="Black" Width="100%"
                FirstDayOfWeek="Monday" ShowGridLines="True" BorderStyle="Solid" OnDayRender="CalendarShipment_DayRender">
                <TodayDayStyle BackColor="#CCCCCC" />
                <DayStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True" />
                <OtherMonthDayStyle ForeColor="White" />
                <NextPrevStyle Font-Size="12pt" ForeColor="White" Font-Bold="True" VerticalAlign="Bottom" />
                <DayHeaderStyle BorderWidth="1px" Font-Bold="True" Font-Size="12pt" BackColor="#FFCC66" />
                <TitleStyle BackColor="Brown" Font-Bold="True" Font-Size="12pt" ForeColor="White"
                    HorizontalAlign="Center" VerticalAlign="Middle" />
            </asp:Calendar>
            <br />
        </div>
    </form>
</body>
</html>
