<%@ page language="C#" autoeventwireup="true" inherits="SizeWiseFOBApproval, App_Web_cjp5ygzm" %>

<%@ Register Assembly="BasicFrame.WebControls.BasicDatePicker" Namespace="BasicFrame.WebControls" TagPrefix="BDP" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Size Wise FOB</title>
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
                    <asp:ImageButton ID="btnHome" runat="server" ImageUrl="~/images/Tohome.png" Height="35px"
                        Width="35px" OnClick="btnHome_Click"  />
                </div>


                <div class="col-md-11">
                    <center><h3>Approve Size Wise FOB</h3></center>
                  
                </div>
            </div>
        </div>
       
        <div class="col-md-12">
            <div id="DivRoot" align="left">
                
                <div>
                    <asp:GridView ID="GVMSizeDetails"  FooterStyle-Font-Bold="true" runat="server" AllowSorting="True" 
                         OnRowDataBound="OnRowDataBound" OnSorting="gridviewSorting_Sorting" DataKeyNames="OrderNo, BPOID"
                        AutoGenerateColumns="False" BackColor="White" BorderColor="#cccccc" BorderWidth="2px" CellPadding="4"
                         EnableModelValidation="True" Font-Size="Small" ForeColor="Black" Width="1200px" ShowFooter="false" OnSelectedIndexChanged="GVMSizeDetails_SelectedIndexChanged"  > 
                   
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
                                                  <asp:TemplateField HeaderText="Qty" ItemStyle-HorizontalAlign="Right" Visible="true">
                        <ItemTemplate>
                            <asp:Label ID="Qty" runat="server"  Text='<%#Eval("Qty") %>' ></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                           <asp:TemplateField HeaderText="Average FOB + Upcharge" ItemStyle-HorizontalAlign="Right" Visible="true">
                        <ItemTemplate>
                            <asp:Label ID="FC" runat="server" Text=' <%#Eval("FC","{0:n4}")%>'   ></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>   
                        <asp:TemplateField HeaderText="Average Value" ItemStyle-HorizontalAlign="Right" Visible="true">
                        <ItemTemplate>
                            <asp:Label ID="AverageValue" runat="server" Text=' <%#Eval("AverageValue","{0:n4}")%>'   ></asp:Label>
                        </ItemTemplate>
                           <FooterTemplate>
                              <div>  <asp:Label ID="lblTTLAverageValue"    runat="server" /> </div> 
                                </FooterTemplate>  
                    </asp:TemplateField>    
                                               <%-- <asp:BoundField DataField="ActualFOB" HeaderText="Actual FOB" />--%>
                                                <%-- <asp:BoundField DataField="ActualValue" HeaderText="Actual Value" />--%>

                    <asp:TemplateField HeaderText="Actual FOB" ItemStyle-HorizontalAlign="Right" Visible="true">
                        <ItemTemplate>
                            <asp:Label ID="ActualFOB" runat="server" Text=' <%#Eval("ActualFOB","{0:n4}")%>'  ></asp:Label>
                        </ItemTemplate>
                           
                    </asp:TemplateField>

                          <asp:TemplateField HeaderText="Actual Value" ItemStyle-HorizontalAlign="Right" Visible="true">
                        <ItemTemplate>
                            <asp:Label ID="ActualValue"  runat="server" Text=' <%#Eval("ActualValue","{0:n4}")%>'  ></asp:Label>
                        </ItemTemplate>
                           <FooterTemplate>
                              <div>  <asp:Label ID="lblTTLActualValue"   runat="server" /> </div> 
                                </FooterTemplate>  
                    </asp:TemplateField>
                                              
                                            </Columns>
                                             <FooterStyle HorizontalAlign="Right" BackColor="#333333" Font-Bold="True" ForeColor="White" CssClass="GVFixedFooter" />
                                        </asp:GridView>
                                          </asp:Panel>
                                </ItemTemplate>
                            </asp:TemplateField>
                             <asp:TemplateField HeaderText="OrderNo"  Visible="false">
                                <ItemTemplate>
                                    <asp:Label ID="OrderNo" runat="server" Text='<%#Eval("OrderNo") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                             <asp:TemplateField HeaderText="BPOID"  Visible="false">
                                <ItemTemplate>
                                    <asp:Label ID="BPOID" runat="server" Text='<%#Eval("BPOID") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="SFAID"  Visible="false">
                                <ItemTemplate>
                                    <asp:Label ID="SFAID" runat="server" Text='<%#Eval("SFAID") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                             <asp:TemplateField HeaderText="Buyer" Visible="true">
                        <ItemTemplate>
                            <asp:Label ID="BuyerName" runat="server"  Text='<%#Eval("BuyerName") %>' ></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                            <asp:TemplateField HeaderText="Style No" Visible="true">
                        <ItemTemplate>
                            <asp:Label ID="StyleNo" runat="server"  Text='<%#Eval("StyleNo") %>' ></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                        <asp:TemplateField HeaderText="Buyer PO No" Visible="true">
                        <ItemTemplate>
                            <asp:Label ID="BuyerPONo" runat="server"  Text='<%#Eval("BuyerPONo") %>' ></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                            <asp:TemplateField HeaderText="Average Value" ItemStyle-HorizontalAlign="Right" Visible="true">
                        <ItemTemplate>
                            <asp:Label ID="AverageValue" runat="server" Text=' <%#Eval("AverageValue","{0:n}")%>'   ></asp:Label>
                        </ItemTemplate>                                
                    </asp:TemplateField>   
                              <asp:TemplateField HeaderText="Actual Value" ItemStyle-HorizontalAlign="Right" Visible="true">
                        <ItemTemplate>
                            <asp:Label ID="ActualValue" runat="server" Text=' <%#Eval("ActualValue","{0:n}")%>'    ></asp:Label>
                        </ItemTemplate>                                
                    </asp:TemplateField>   
                            <asp:TemplateField HeaderText="Variance" ItemStyle-HorizontalAlign="Right" Visible="true">
                        <ItemTemplate>
                            <asp:Label ID="Variance" runat="server" Text=' <%#Eval("Variance","{0:n}")%>'    ></asp:Label>
                        </ItemTemplate>                                
                    </asp:TemplateField> 
                            
                             <asp:TemplateField HeaderText="Senior Merchandiser" Visible="true">
                        <ItemTemplate>
                            <asp:Label ID="SeniorMerchandiser" runat="server"  Text='<%#Eval("SeniorMerchandiser") %>' ></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                             <asp:TemplateField HeaderText="UserID" Visible="false">
                        <ItemTemplate>
                            <asp:Label ID="lblmerUserID" runat="server"  Text='<%#Eval("UserID") %>' ></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                              <asp:TemplateField HeaderText="ReportEmail" Visible="false">
                        <ItemTemplate>
                            <asp:Label ID="ReportEmail" runat="server"  Text='<%#Eval("ReportEmail") %>' ></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                             <asp:TemplateField HeaderText="Comment" Visible="true">
                        <ItemTemplate>
                            <asp:TextBox ID="txtComment" CssClass="form-control" runat="server"   ></asp:TextBox>
                        </ItemTemplate>
                    </asp:TemplateField>
                                 <asp:TemplateField HeaderText="          " >
                        <ItemTemplate>
                            <asp:Button ID="btnApprove"  runat="server" Text="Approve"  CssClass="btn btn-success"  OnClick="btnApprove_Click" />
                        </ItemTemplate>
                    </asp:TemplateField>
                        <asp:TemplateField HeaderText="           " >
                        <ItemTemplate>
                            <asp:Button ID="btnDisApprove"  runat="server" Text="Disapprove" OnClientClick="return confirm('Are you sure you want to dissapprove?');"  CssClass="btn btn-danger"  OnClick="btnDisApprove_Click" />
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
                    <asp:Label ID="lblSFAID" Visible="false" runat="server" Text="Label"></asp:Label>
                         <asp:Label ID="lblOrderNo" Visible="false" runat="server" Text="Label"></asp:Label>
                </div>
            </div>
           
        </div>
        
    </form>
</body>
</html>

