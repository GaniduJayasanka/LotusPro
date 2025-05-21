<%@ page language="C#" autoeventwireup="true" inherits="YardToHO, App_Web_10bhy3il" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Daily Shipments List</title>
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

    <script type="text/javascript" src="js/jQuery-1.8.3.js"></script>

    <script type="text/javascript">
        $("[src*=plus]").live("click", function () {
            $(this).closest("tr").after("<tr><td></td><td colspan = '999'>" + $(this).next().html() + "</td></tr>")
            $(this).attr("src", "images/minus (3).png");
        });
        $("[src*=minus]").live("click", function () {
            $(this).attr("src", "images/plus.png");
            $(this).closest("tr").next().remove();
        });
    </script>

    <script src="js/jquery.autocomplete.js" type="text/javascript"></script>

    <script type="text/javascript">
        $(document).ready(function () {
            $("#<%=txtStyle.ClientID%>").autocomplete('SearchStyle.ashx');
        });
    </script>

           
</head>
<body>
    <form id="form1" runat="server">
      
        <div class="col-md-12">
            <div class="row">
                <div class="col-md-1">
                    <br />
                    <asp:ImageButton ID="btnHome" OnClick="btnHome_Click" runat="server" ImageUrl="~/images/Tohome.png" Height="35px"
                        Width="35px"  />
                    <%--  <asp:ImageButton ID="btnHelp" runat="server" ImageUrl="~/images/help.png" Height="35px"
                        Width="35px" OnClick="btnHelp_Click" />--%>
                </div>


                <div class="col-md-11">
                    <center><h3>Yard to HO Conversion</h3></center>
                  
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
                                          
                                            <label class="col-md-1 control-label">Style</label>
                                            <div class="col-md-3">
                                            <span class="auto-style1"></span>
                                            <asp:TextBox ID="txtStyle" CssClass="form-control" runat="server"></asp:TextBox>
                                            </div>                                            
                                       
                                            <div class="col-md-3">
                                                <asp:Button ID="BtnSearch" runat="server" CssClass="btn btn-primary"  Text="Find" Width="100px" OnClick="BtnSearch_Click" />
                                                <asp:Button ID="btnReset"  runat="server" CssClass="btn btn-warning" Text="Reset" Width="100px" OnClick="btnReset_Click" />
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
                <div class="row">
                    <div class="col-md-12">
                       
                            <div class="panel-body">
                                <div class="row">
                                    <div class="box-body">
                                        <div class="form-group">
                    <div class="col-md-11">
                       
                                        <asp:GridView ID="GVShipmentsInYard" runat="server" DataKeyNames="DID"
                                            AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC"
                                            BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black"
                                            Font-Size="Small"
                                            EnableModelValidation="True">
                                            <Columns>
                                                <asp:TemplateField HeaderText="No" ItemStyle-BackColor="DarkGray" HeaderStyle-BackColor="Olive">
                                                    <ItemTemplate><%# Container.DataItemIndex + 1 %></ItemTemplate>
                                                    <HeaderStyle BackColor="Olive"></HeaderStyle>
                                                    <ItemStyle BackColor="DarkGray"></ItemStyle>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="DID" SortExpression="" Visible="true">
                                                    <ItemTemplate>
                                                        <asp:Label ID="DID" runat="server" Text='<%#Eval("DID") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                  <asp:TemplateField HeaderText="Plant" SortExpression="" Visible="">
                                                    <ItemTemplate>
                                                        <asp:Label ID="ScheduledFactory" runat="server" Text='<%#Eval("ScheduledFactory") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                  <asp:TemplateField HeaderText="Buyer" SortExpression="" Visible="">
                                                    <ItemTemplate>
                                                        <asp:Label ID="BuyerName" runat="server" Text='<%#Eval("BuyerName") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="OrderNo" SortExpression="" Visible="false">
                                                    <ItemTemplate>
                                                        <asp:Label ID="OrderNo" runat="server" Text='<%#Eval("OrderNo") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Style" SortExpression="" Visible="">
                                                    <ItemTemplate>
                                                        <asp:Label ID="StyleNo" runat="server" Text='<%#Eval("StyleNo") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Color" SortExpression="" Visible="">
                                                    <ItemTemplate>
                                                        <asp:Label ID="ColorName" runat="server" Text='<%#Eval("ColorName") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Buyer PO" SortExpression="" Visible="">
                                                    <ItemTemplate>
                                                        <asp:Label ID="BuyerPONo" runat="server" Text='<%#Eval("BuyerPONo") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                              <asp:TemplateField HeaderText="Committed Qty" SortExpression="" Visible="">
                                                    <ItemTemplate>
                                                        <asp:Label ID="DeliveryQty" runat="server" Text='<%#Eval("DeliveryQty") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                 <asp:TemplateField HeaderText="Dispatched Qty" SortExpression="" Visible="">
                                                    <ItemTemplate>
                                                        <asp:Label ID="ShippedQty" runat="server" Text='<%#Eval("ShippedQty") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                 <asp:TemplateField HeaderText="Variance" SortExpression="" Visible="">
                                                    <ItemTemplate>
                                                        <asp:Label ID="Variance" runat="server" Text='<%#Eval("Variance") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                             
                                                 <asp:TemplateField HeaderText="Committed Date" SortExpression="" Visible="">
                                                <ItemTemplate>
                                                    <asp:Label ID="DeliveryDate" runat="server" Text='<%#Eval("DeliveryDate","{0:dd/MMM/yyyy}") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                                 <asp:TemplateField HeaderText="Comment" SortExpression="" Visible="">
                                                    <ItemTemplate>
                                                        <asp:Label ID="Comment" runat="server" Text='<%#Eval("Comment") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                 <asp:TemplateField HeaderText="AQL Date" SortExpression="" Visible="">
                                                <ItemTemplate>
                                                    <asp:Label ID="AQLDate" runat="server" Text='<%#Eval("AQLDate","{0:dd/MMM/yyyy}") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Revise to HO" SortExpression="" >
                                                <ItemTemplate>
                                            <asp:ImageButton ID="imgbtnReviseToHO" OnClick="imgbtnReviseToHO_Click" runat="server"  Height="30px" ImageUrl="~/images/Resend.png" ToolTip="Revise to HO" Width="30px" />
                                             </ItemTemplate>
                                            </asp:TemplateField>
                                            </Columns>
                                            <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
                                            <%-- <HeaderStyle Wrap="true" BackColor="#333333" Font-Bold="True" ForeColor="White" />--%>
                                            <FooterStyle BackColor="#333333" Font-Bold="True" ForeColor="White" CssClass="GVFixedFooter" />
                                            <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" CssClass="GVFixedHeader" />
                                        </asp:GridView>
                        </div>
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


