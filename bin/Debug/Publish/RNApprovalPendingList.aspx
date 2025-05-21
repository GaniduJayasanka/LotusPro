<%@ page language="C#" autoeventwireup="true" inherits="RNApprovalPendingList, App_Web_b2ychy0x" %>

<%@ Register Assembly="BasicFrame.WebControls.BasicDatePicker" Namespace="BasicFrame.WebControls" TagPrefix="BDP" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Shipment Release Note Approval</title>
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


 
    <style type="text/css">



.GVFixedHeader { font-weight:bold; background-color: Green; position:relative; 
                 top:expression(this.parentNode.parentNode.parentNode.scrollTop-1);}

.GVFixedFooter { font-weight:bold; background-color: Green; position:relative;
                 bottom:expression(getScrollBottom(this.parentNode.parentNode.parentNode.parentNode));} 
</style>

    

    <script language="javascript" >
        $(document).ready(function () {
            var gridHeader = $('#<%=GVMSPShedule.ClientID%>').clone(true); // Here Clone Copy of Gridview with style
            $(gridHeader).find("tr:gt(0)").remove(); // Here remove all rows except first row (header row)
            $('#<%=GVMSPShedule.ClientID%> tr th').each(function (i) {
                 // Here Set Width of each th from gridview to new table(clone table) th 
                 $("th:nth-child(" + (i + 1) + ")", gridHeader).css('width', ($(this).width()).toString() + "px");
             });
             $("#GHead").append(gridHeader);
             $('#GHead').css('position', 'absolute');
            //  $('#GHead').css('top', $('#<%=GVMSPShedule.ClientID%>').offset().top);

        });
    </script>

    <style type="text/css">
        .modalBackground {
            background-color: Gray;
            filter: alpha(opacity=80);
            opacity: 0.8;
            z-index: 10000;
        }

        .BigCheckBox input {
            width: 20px;
            height: 20px;
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
                <div class="col-md-11">
                    <center><h3>Shipment Release Note Approval
                        </h3></center>
                </div>
            </div>
        </div>
      
          <div class="row">
                              
                                        <div class="form-group">
                                             <div class="col-md-12">
                                         
                                            <div class="col-md-11">
               
            <asp:GridView ID="GVMSPShedule" runat="server"    AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" 
                BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" 
                AllowSorting="True"  Font-Size="Small"
                EnableModelValidation="True" Width="1318px">
               
                <Columns>
                               <asp:TemplateField HeaderText="View" SortExpression="" >
                                <ItemTemplate>
                                 <asp:Button ID="BtnView" runat="server" Text="View" class="btn btn-success"   OnClick="BtnView_Click" CssClass="btn btn-success" />                                   
                                </ItemTemplate>
                            </asp:TemplateField>
                     <asp:TemplateField HeaderText="ShipmentRequestID" Visible="false">
                        <ItemTemplate>
                            <asp:Label ID="ShipmentRequestID" runat="server" Text='<%#Eval("ShipmentRequestID") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                     
                        <asp:TemplateField HeaderText="Shipment Req. No" Visible="true" ItemStyle-Font-Size="Small" FooterStyle-Font-Bold="true">
                                                        <ItemTemplate>

                                         <asp:LinkButton ID="LinkBtnDES" OnClick="LinkBtnDES_Click"  Font-Bold="true" runat="server" CssClass="paraGraphtext" Text='<%# Eval("ShipmentReqNo") %>' Font-Size="Small"  ></asp:LinkButton>
                                                           <%-- <asp:Label ID="TKTNo" runat="server" Text='<%# Bind("TKTNo") %>' Visible="true"></asp:Label>--%>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Plant">
                        <ItemTemplate>
                            <asp:Label ID="Origin" runat="server" Text='<%#Eval("Origin") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                       <asp:TemplateField HeaderText="Attention">
                        <ItemTemplate>
                            <asp:Label ID="Attention" runat="server" Text='<%#Eval("Attention") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                     <asp:TemplateField HeaderText="Delivery Point">
                        <ItemTemplate>
                            <asp:Label ID="DeliveryPoint" runat="server" Text='<%#Eval("DeliveryPoint") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                     <asp:TemplateField HeaderText="Despatched By">
                        <ItemTemplate>
                            <asp:Label ID="DespatchedBy" runat="server" Text='<%#Eval("DespatchedBy") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Vehicle No">
                        <ItemTemplate>
                            <asp:Label ID="VehicleNo" runat="server" Text='<%#Eval("VehicleNo") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                     <asp:TemplateField HeaderText="Vehicle Type">
                        <ItemTemplate>
                            <asp:Label ID="VehicleType" runat="server" Text='<%#Eval("VehicleType") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                     <asp:TemplateField HeaderText="Transported By">
                        <ItemTemplate>
                            <asp:Label ID="Transportedby" runat="server" Text='<%#Eval("Transportedby") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                     <asp:TemplateField HeaderText="Comments">
                        <ItemTemplate>
                            <asp:Label ID="ShipmentComments" runat="server" Text='<%#Eval("ShipmentComments") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                   
                    <asp:TemplateField HeaderText="Despatched Date" Visible="true">
                        <ItemTemplate>
                            <asp:Label ID="ShipDate" runat="server" Text='<%#Eval("ShipDate","{0:dd/MMM/yyyy}") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    

                    
                </Columns>
                <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
               <%-- <HeaderStyle Wrap="true" BackColor="#333333" Font-Bold="True" ForeColor="White" />--%>
                <FooterStyle BackColor="#333333" Font-Bold="True" ForeColor="White"  CssClass="GVFixedFooter"/>
                <HeaderStyle CssClass="HeaderFreez"  BackColor="#333333" Font-Bold="True" ForeColor="White"  />

            </asp:GridView>
                      
            </div>
                                                 </div>
                                            </div>
              </div>
<div id="DivFooterRow" style="overflow:hidden">
    <asp:Label ID="lblShipmentRequestID" runat="server" Text="" Visible="false"></asp:Label>
    <asp:Label ID="lblOurRefNO" runat="server" Text="" Visible="false"></asp:Label>
  
</div>
 
            
    </form>
</body>
</html>

