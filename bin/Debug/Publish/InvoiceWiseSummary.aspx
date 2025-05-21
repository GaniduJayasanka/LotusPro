<%@ page language="C#" autoeventwireup="true" inherits="InvoiceWiseSummary, App_Web_11yxmj2e" %>

<%@ Register Assembly="BasicFrame.WebControls.BasicDatePicker" Namespace="BasicFrame.WebControls" TagPrefix="BDP" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Invoice Summary</title>
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

    <script type="text/javascript">
        var oldgridcolor;
        function SetMouseOver(element) {
            oldgridcolor = element.style.backgroundColor;
            element.style.backgroundColor = '#ADEBFF';
            //element.style.cursor = 'pointer';

        }
        function SetMouseOut(element) {
            element.style.backgroundColor = oldgridcolor;
            element.style.textDecoration = 'none';
        }
    </script> 
    <style type="text/css">
        GridViewStyle
        {
            border-right: 2px solid #A7A6AA;
            border-bottom: 2px solid #A7A6AA;
            border-left: 2px solid white;
            border-top: 2px solid white;
            padding: 4px;
            font-size:x-small;
        }

        .GridViewStyle a
        {
            color: #FFFFFF;
        }

        .GridViewHeaderStyle th
        {
            border-left: 1px solid #EBE9ED;
            border-right: 1px solid #EBE9ED;
        }

        .GridViewHeaderStyle
        {
            background-color: #4d4d4d;
            font-weight: bold;
            color: White;
            font-size:small;
            font-family:Cambria;
        }

        .GridViewFooterStyle
        {
            background-color: #000000;
            font-weight: normal;
            color: White;
            font-size:xx-small;
        }

        .GridViewRowStyle
        {
            background-color: #F7F6F3;
            color: #333333;
            font-size:x-small;
            font-family:Cambria;
            font-weight: bold;
        }

        .GridViewAlternatingRowStyle 
        {
            background-color: #FFFFFF;
            color: #333333;
            font-size:x-small;
            font-family:Cambria;
            font-weight: bold;
        }

        .GridViewRowStyle td, .GridViewAlternatingRowStyle td
        {
            border: 1px solid #EBE9ED;
        }

        .GridViewSelectedRowStyle
        {
            background-color: #E2DED6;
            font-weight: bold;
            color: #333333;
        }

        .GridViewPagerStyle
        {
            background-color: #284775;
            color: #FFFFFF;
        }

        .GridViewPagerStyle table /* to center the paging links*/
        {
            margin: 0 auto 0 auto;
        }

        .BigCheckBox input {
            width: 20px;
            height: 20px;
            font-size:small;
            font-family:Cambria;
            font-weight: bold;
        } 
    </style>

</head>
<body>
    <form id="form1" runat="server">
        <asp:ToolkitScriptManager ID="ScriptManager1" runat="server">
        </asp:ToolkitScriptManager>
        <asp:HiddenField ID="hfRemainingValue" runat="server" />
        <div class="col-md-12">
            <div class="row">
                <div class="col-md-1">
                    <br />
                    <asp:ImageButton ID="btnHome" runat="server" ImageUrl="~/images/Tohome.png" Height="35px"
                        Width="35px" OnClick="btnHome_Click" />
                </div>
                <div class="col-md-9"  style="font-family:Bahnschrift">
                    <center><h3>Invoice Summary List & Send To Buyer</h3></center>                  
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
                                            <label class="col-md-2 control-label">Ship Date From<span style="color: red">*</span></label>
                                            <div class="col-md-2">
                                                <span class="auto-style1"></span>
                                                <BDP:BasicDatePicker ID="DatePickerFromDate" runat="server" CssClass="form-control" Font-Bold="true" Font-Size="Smaller" Font-Names="Cambria" />
                                            </div>
                                            <label class="col-md-1 control-label">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;To <span style="color: red">*</span></label>
                                            <div class="col-md-2">
                                                <span class="auto-style1"></span>
                                                <BDP:BasicDatePicker ID="DatePickerToDate" runat="server" CssClass="form-control" Font-Bold="true" Font-Size="Smaller" Font-Names="Cambria" />
                                            </div>
                                            <label class="col-md-1 control-label">Status <span style="color: red">*</span></label>
                                            <div class="col-md-1">                                            
                                                <asp:DropDownList ID="DDLStatus" runat="server" Font-Bold="true" CssClass="form-control" Width="120px" Height="28px" Font-Names="Cambria" Font-Size="Smaller" >
                                                    <asp:ListItem Value="1">ALL</asp:ListItem>
                                                    <asp:ListItem Value="2">Pending</asp:ListItem>
                                                    <asp:ListItem Value="3">Sent</asp:ListItem>                                                   
                                                </asp:DropDownList>
                                            </div>
                                            <div class="col-md-1">                                            
                                                <asp:Label ID="Label1" Height="30px" Text="" runat="server" />
                                            </div>
                                            <div class="row">&nbsp;</div>

                                            <label class="col-md-2 control-label">Buyer<span style="color: red">*</span></label>
                                            <div class="col-md-3">
                                                <asp:DropDownList Width="300px" ID="DropBuyer" Font-Bold="true" DataTextField="BuyerName" Height="30px" Font-Names="Cambria" Font-Size="Smaller" CssClass="form-control" runat="server" ></asp:DropDownList>
                                            </div>

                                            <div class="col-md-3">
                                                <asp:Button ID="BtnSearch" OnClick="BtnSearch_Click" runat="server" CssClass="btn btn-info"  Text="Search" Width="100px" />
                                                <asp:Button ID="btnReset" OnClick="btnReset_Click" runat="server" CssClass="btn btn-warning" Text="Reset" Width="75px" />
                                            </div>
                                            <div class="col-md-1">
                                                <asp:Button ID="BtnSendSelected" OnClick="BtnSend_Selected_Click" runat="server" Visible="true" CssClass="btn btn-primary"  Text="Send Selected" Width="120px" />                                            
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
            <div id="DivRoot" align="left">
                
                <div>
                    <asp:GridView ID="GVMSPShedule" OnRowDataBound="GVMSPShedule_RowDataBound" HeaderStyle-Height="30px" FooterStyle-Font-Bold="true" runat="server" AllowSorting="True" AutoGenerateColumns="False" BackColor="White" BorderColor="#cccccc" BorderWidth="2px" CellPadding="4" EnableModelValidation="True" Font-Size="Small" ForeColor="Black" Height="96px" ShowFooter="true" Width="900px" > 
                            <FooterStyle CssClass="GridViewFooterStyle" />
                            <RowStyle CssClass="GridViewRowStyle" />    
                            <SelectedRowStyle CssClass="GridViewSelectedRowStyle" />
                            <PagerStyle CssClass="GridViewPagerStyle" />
                            <AlternatingRowStyle CssClass="GridViewAlternatingRowStyle" />
                            <HeaderStyle CssClass="GridViewHeaderStyle" />                    
                        <Columns>
                            <asp:TemplateField HeaderText="Select" ItemStyle-HorizontalAlign="Center">
                                <ItemTemplate>
                                    <asp:CheckBox ID="ChkSelectRow" runat="server" AutoPostBack="false" Checked="false" CssClass="BigCheckBox"  />
                                </ItemTemplate>
                            </asp:TemplateField> 
                            <asp:TemplateField HeaderText="Invoice Dispatch to Buyer" SortExpression="" >
                                <ItemTemplate >
                                   <asp:Button ID="BtnSend" OnClick="BtnSend_Click" runat="server" CssClass="btn btn-primary"  Text="Send" Width="100px" />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="ShipID" SortExpression="ShipID" Visible="false">
                                <ItemTemplate>
                                    <asp:Label ID="ShipID" runat="server" Text='<%#Eval("ShipID") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="INVNumber" Visible="true" ItemStyle-HorizontalAlign="Center">
                                <ItemTemplate>
                                    <asp:Label ID="INVNumber" runat="server" Text='<%#Eval("INVNumber") %>' Width="100px"></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Invoice Date" Visible="true">
                                <ItemTemplate>
                                    <asp:Label ID="InvSubmitDate" runat="server" Width="100px"  Text='<%#Eval("SubmitDate","{0:dd/MMM/yyyy}") %>' ></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Buyer"  Visible="true">
                                <ItemTemplate>
                                    <asp:Label ID="buyer" runat="server" Text='<%#Eval("buyer") %>' Width="250px"></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                             <asp:TemplateField HeaderText="Style"  Visible="true">
                                <ItemTemplate>
                                    <asp:Label ID="STYLE" runat="server" Text='<%#Eval("STYLE") %>' Width="150px"></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                              <asp:TemplateField HeaderText="Total FOB" ItemStyle-HorizontalAlign="Right"  Visible="true">
                                <ItemTemplate>
                                    <asp:Label ID="TTLFOB" runat="server" Text='<%#Eval("TTLFOB") %>' Width="100px"></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                          <%--  <asp:TemplateField HeaderText="Total FOB" ItemStyle-HorizontalAlign="Right"  Visible="true">
                                <ItemTemplate>
                                    <asp:Label ID="TTLFOB" runat="server" Text='<%#Eval("TTLFOB") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Total FOB" ItemStyle-HorizontalAlign="Right"  Visible="true">
                                <ItemTemplate>
                                    <asp:Label ID="TTLFOB" runat="server" Text='<%#Eval("TTLFOB") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>--%>
                             <asp:TemplateField HeaderText="Send User" ItemStyle-HorizontalAlign="Right"  Visible="true">
                                <ItemTemplate>
                                    <asp:Label ID="SendUser" runat="server" Text='<%#Eval("SendUser") %>' Width="75px"></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                             <asp:TemplateField HeaderText="Send Date" ItemStyle-HorizontalAlign="Right"  Visible="true">
                                <ItemTemplate>
                                    <asp:Label ID="SendDate" runat="server" Text='<%#Eval("SendDate","{0:dd/MMM/yyyy}") %>' Width="75px"></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                             <asp:TemplateField HeaderText="Payment Received"   Visible="true">
                                <ItemTemplate>
                                    <asp:Label ID="PaymentReceived" runat="server" Text='<%#Eval("PaymentReceived") %>' Width="75px"></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                        <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
                        <%-- <HeaderStyle Wrap="true" BackColor="#333333" Font-Bold="True" ForeColor="White" />--%>
                        <%--<FooterStyle BackColor="#333333" Font-Bold="True" ForeColor="White" CssClass="GVFixedFooter" />
                        <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" CssClass="GVFixedHeader" />--%>
                    </asp:GridView>
                </div>
                <div>
                   
                </div>
               
                
               
                <div id="DivFooterRow" style="overflow: hidden">
                </div>
            </div>
           
        </div>
        
    </form>
</body>
</html>

