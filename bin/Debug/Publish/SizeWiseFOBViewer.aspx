<%@ page language="C#" autoeventwireup="true" inherits="SizeWiseFOBViewer, App_Web_b2ychy0x" %>


<%@ Register Assembly="BasicFrame.WebControls.BasicDatePicker" Namespace="BasicFrame.WebControls" TagPrefix="BDP" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Size Wise FOB Report</title>
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
                    <asp:ImageButton ID="btnHome" OnClick="btnHome_Click" runat="server" ImageUrl="~/images/Tohome.png" Height="35px"
                        Width="35px"  />
                </div>


                <div class="col-md-11">
                    <center><h3>Size Wise FOB Report</h3></center>
                  
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
                                            <label class="col-md-1 control-label">Date Range </label>
                                            <div class="col-md-2">
                                                <span class="auto-style1"></span>
                                              <BDP:BasicDatePicker ID="DatePickerFromDate" ToolTip="Dispatched Date" runat="server" CssClass="form-control" />   
                                            </div>
                                            <label class="col-md-1 control-label">To </label>
                                            <div class="col-md-2">
                                                <span class="auto-style1"></span>
                                              <BDP:BasicDatePicker ID="DatePickerToDate" ToolTip="Dispatched Date" runat="server" CssClass="form-control" />   
                                            </div>
                                             <label class="col-md-1 control-label">Style</label>
                                        <div class="col-md-2">
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
            <div id="DivRoot" align="left">
                
                <div>
                    <asp:GridView ID="GVMSizeDetails" FooterStyle-Font-Bold="true" runat="server" AllowSorting="True" 
                             OnRowDataBound="OnRowDataBound" OnSorting="gridviewSorting_Sorting" DataKeyNames="OrderNo,BPOID"
                        AutoGenerateColumns="False" BackColor="White" BorderColor="#cccccc" BorderWidth="2px" CellPadding="4"
                         EnableModelValidation="True" Font-Size="Small" ForeColor="Black" Height="96px" ShowFooter="false" > 
                   
                        <Columns>
                             <asp:TemplateField>
                                <ItemTemplate>
                                    <img alt="" src="images/plus.png" style="cursor: pointer" />
                                    <asp:Panel ID="pnlOrders" runat="server" Style="display: none">
                                        <asp:GridView ID="gvsizeList" runat="server" AutoGenerateColumns="false" Font-Size="Small"                                         
                                            HeaderStyle-BackColor="#666666" HeaderStyle-ForeColor="White"  ShowFooter="true" OnRowDataBound="gvsizeList_RowDataBound"
                                            RowStyle-Wrap="False">
                                            <Columns>
                                                <asp:TemplateField HeaderStyle-BackColor="#333333" HeaderText="No" ItemStyle-BackColor="DarkGray">
                                                    <ItemTemplate>
                                                        <%# Container.DataItemIndex + 1 %>
                                                    </ItemTemplate>
                                                    <HeaderStyle BackColor="#333333" />
                                                    <ItemStyle BackColor="DarkGray" />
                                                </asp:TemplateField>
                                                <asp:BoundField DataField="DID" HeaderText="DID" Visible="false" />                                                
                                                <asp:BoundField DataField="SizeDesc" HeaderText="SizeDesc" />
                        <asp:TemplateField HeaderText="Qty" Visible="true" ItemStyle-HorizontalAlign="Right">
                        <ItemTemplate>
                            <asp:Label ID="Qty" runat="server"  Text='<%#Eval("Qty") %>' ></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                           <asp:TemplateField HeaderText="Average FOB + Upcharge" ItemStyle-HorizontalAlign="Right" Visible="true">
                        <ItemTemplate>
                            <asp:Label ID="FC" runat="server"  Text=' <%#Eval("FC","{0:n}")%>'   ></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>   
                        <asp:TemplateField HeaderText="Average Value" ItemStyle-HorizontalAlign="Right" Visible="true">
                        <ItemTemplate>
                            <asp:Label ID="AverageValue" runat="server"  Text=' <%#Eval("AverageValue","{0:n}")%>'  ></asp:Label>
                        </ItemTemplate>
                           <FooterTemplate>
                              <div>  <asp:Label ID="lblTTLAverageValue"   runat="server" /> </div> 
                                </FooterTemplate>  
                    </asp:TemplateField>    
                                              <%--  <asp:BoundField DataField="ActualFOB" HeaderText="Actual FOB" />--%>
                                                <%-- <asp:BoundField DataField="ActualValue" HeaderText="Actual Value" />--%>
                                                 <asp:TemplateField HeaderText="Actual FOB" ItemStyle-HorizontalAlign="Right" Visible="true">
                        <ItemTemplate>
                            <asp:Label ID="ActualFOB" runat="server" Text=' <%#Eval("ActualFOB","{0:n}")%>'  ></asp:Label>
                        </ItemTemplate>
                           
                    </asp:TemplateField>

                          <asp:TemplateField HeaderText="Actual Value" ItemStyle-HorizontalAlign="Right" Visible="true">
                        <ItemTemplate>
                            <asp:Label ID="ActualValue"  runat="server"  Text=' <%#Eval("ActualValue","{0:n}")%>' ></asp:Label>
                        </ItemTemplate>
                           <FooterTemplate>
                              <div>  <asp:Label ID="lblTTLActualValue"   runat="server" /> </div> 
                                </FooterTemplate>  
                    </asp:TemplateField>
                                              
                                            </Columns>
                                             <FooterStyle BackColor="#333333" HorizontalAlign="Right" Font-Bold="True" ForeColor="White" CssClass="GVFixedFooter" />
                                        </asp:GridView>
                                    </asp:Panel>
                                </ItemTemplate>
                            </asp:TemplateField>

                             <asp:TemplateField HeaderText="OrderNo"  Visible="true">
                                <ItemTemplate>
                                    <asp:Label ID="OrderNo" runat="server" Text='<%#Eval("OrderNo") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                              <asp:TemplateField HeaderText="BPOID"  Visible="true">
                                <ItemTemplate>
                                    <asp:Label ID="BPOID" runat="server" Text='<%#Eval("BPOID") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                             <asp:TemplateField HeaderText="Plant" SortExpression="Plant">
                                                <ItemTemplate>
                                                    <asp:Label ID="Plant" runat="server" Text='<%# Eval("Plant") %>' />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Buyer Name">
                                                <ItemTemplate>
                                                    <asp:Label ID="LblBuyerName" runat="server" Text='<%# Eval("Buyer") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Style"  Visible="true">
                                <ItemTemplate>
                                    <asp:Label ID="Style" runat="server" Text='<%#Eval("Style") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="BuyerPO" Visible="true">
                        <ItemTemplate>
                            <asp:Label ID="BuyerPO" runat="server"  Text='<%#Eval("BuyerPO") %>' ></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                          <asp:TemplateField HeaderText="Color" Visible="true">
                                                <ItemTemplate>
                                                    <asp:Label ID="Color" runat="server" Text='<%# Eval("Color") %>' />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            
                                            <asp:TemplateField HeaderText="Buyer PO Qty" ItemStyle-HorizontalAlign="Right">
                                                <ItemTemplate>
                                                    <asp:Label ID="BuyerPOQty"  Font-Bold="true" Font-Size="Large"  runat="server" Text='<%# Eval("BuyerPOQty") %>' />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <%--<asp:TemplateField HeaderText="Sumithra PO Qty" ItemStyle-HorizontalAlign="Right">
                                                <ItemTemplate>
                                                    <asp:Label ID="SumithraPOQty" runat="server" Text='<%# Eval("SumithraPOQty") %>' />
                                                </ItemTemplate>
                                            </asp:TemplateField>--%>
                                            <asp:TemplateField HeaderText="Commited Qty" ItemStyle-HorizontalAlign="Right">
                                                <ItemTemplate>
                                                    <asp:Label ID="CommitedQty" runat="server" Text='<%# Eval("CommitedQty") %>' />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Shipped Qty" ItemStyle-HorizontalAlign="Right">
                                                <ItemTemplate>
                                                    <asp:Label ID="ShippedQty" runat="server" Text='<%# Eval("ShippedQty") %>' />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Short/Over Variance" ItemStyle-HorizontalAlign="Right">
                                                <ItemTemplate>
                                                    <asp:Label ID="Variance" runat="server" Text='<%# Eval("Variance") %>' />
                                                </ItemTemplate>
                                            </asp:TemplateField>

                                            <asp:TemplateField HeaderText="Costing FOB + Upcharge ($)   "   ItemStyle-HorizontalAlign="Right" Visible="true" SortExpression="FOB">
                                                <ItemTemplate>
                                                    <asp:Label ID="FOB" runat="server" Text='<%#Eval("FC","{0:n}") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                             <asp:TemplateField HeaderText="RECHavingStatus" Visible="false" ItemStyle-HorizontalAlign="Right">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblRECHavingStatus" runat="server" Text='<%# Eval("RECHavingStatus") %>' />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                             <asp:TemplateField HeaderText="Processed" Visible="false" ItemStyle-HorizontalAlign="Right">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblProcessed" runat="server" Text='<%# Eval("Processed") %>' />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                 <asp:TemplateField HeaderText="Approval Comments" Visible="true" ItemStyle-HorizontalAlign="Right">
                                                <ItemTemplate>
                                                    <asp:Label ID="ApproveComment" runat="server" Text='<%# Eval("ApproveComment") %>' />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="" >
                        <ItemTemplate>
                            <asp:Button ID="btnProceed"   runat="server" Text="Proceed"  CssClass="btn btn-success"  OnClick="btnProceed_Click" />
                        </ItemTemplate>
                    </asp:TemplateField>
                        </Columns>
                        <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
                        <%-- <HeaderStyle Wrap="true" BackColor="#333333" Font-Bold="True" ForeColor="White" />--%>
                        <FooterStyle BackColor="#333333" Font-Bold="True" ForeColor="White" CssClass="GVFixedFooter" />
                        <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" CssClass="GVFixedHeader" />
                    </asp:GridView>
                </div>
                <div>
                   
                </div>
               
                
               
                <div id="DivFooterRow" style="overflow: hidden">
                    <asp:Label ID="lblDID" Visible="false" runat="server" Text="Label"></asp:Label>
                    <asp:Label ID="Label2" Visible="false" runat="server" Text="Label"></asp:Label>
                </div>
            </div>
           
        </div>
        
    </form>
</body>
</html>

