<%@ page language="C#" autoeventwireup="true" inherits="SRNView, App_Web_11yxmj2e" %>

<%@ Register Assembly="BasicFrame.WebControls.BasicDatePicker" Namespace="BasicFrame.WebControls" TagPrefix="BDP" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Shipment Release Note Report</title>

    
  
    
    

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

    <script type="text/javascript">
        function SetTarget() {
            document.forms[0].target = "_blank";
        }
    </script>
    <link href="CSS/bootstrap.css" rel="stylesheet" />

      <link href="CSS/jquery.autocomplete.css" rel="stylesheet" type="text/css" />
<link href="CSS/jquery.ui.all.css" rel="stylesheet" type="text/css" />
    <script src="js/jquery-1.4.1.min.js" type="text/javascript"></script>

    <script src="js/jquery-1.9.1.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/jquery.min.js"></script>

    <script src="js/jquery-1.4.1.min.js" type="text/javascript"></script>
    <script type="text/javascript" src="js/jQuery-1.8.3.js"></script>
    <script src="js/bootstrap.min.js" type="text/javascript"></script>

   <%-- <script src="js/jquery.autocomplete.js" type="text/javascript"></script>
    
     <script type="text/javascript">
         $(document).ready(function () {
             $("#<%=txtStyle.ClientID%>").autocomplete('SearchStyle.ashx');
         });
    </script>--%>


      <%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
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

    <link href="CSS/bootstrap.css" rel="stylesheet" />

    <script src="js/jquery-1.9.1.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/jquery.min.js"></script>

    <script src="js/jquery-1.4.1.min.js" type="text/javascript"></script>
    <script type="text/javascript" src="js/jQuery-1.8.3.js"></script>
    <script src="js/bootstrap.min.js" type="text/javascript"></script>
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
                    <center><h3>Shipment Release Note View Report</h3></center>
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
                                            <label class="col-md-2 control-label">Dispatch No </label>
                                            <div class="col-md-2">
                                               <asp:DropDownList ID="DropDispatches"   runat="server" CssClass="form-control"  >
                                                </asp:DropDownList>
                                                </div>
                                          <%--   <label class="col-md-1 control-label"> Style </label>
                                            <div class="col-md-2">
                                                 <asp:TextBox ID="txtStyle" CssClass="form-control" Visible="true" runat="server"></asp:TextBox>
                                         

                                            </div>--%>
                                         <%--    <label class="col-md-1 control-label"> Color </label>
                                                   <div class="col-md-2">
                                                <asp:DropDownList ID="DDLColor"   runat="server" CssClass="form-control"   >
                                                </asp:DropDownList>
                                                       </div>--%>
                                            <div class="col-md-3">
                                                <asp:Button ID="BtnSearch" CssClass="btn btn-info" Width="100px" runat="server" Text="Search" OnClick="BtnSearch_Click" />
                                                <asp:Button ID="BtnReSet" runat="server" CssClass="btn btn-warning"  Text="Reset" Width="100px" />
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
<div style="overflow: hidden;" id="DivHeaderRow">
</div>
<div style="overflow:auto;" onscroll="OnScrollDiv(this)" id="DivMainContent" >
         

              <%--  <asp:GridView ID="GVDeapatchReport" runat="server" AutoGenerateColumns="False" BackColor="White" Width="100%"
                        BorderColor="White"  BorderStyle="Ridge" BorderWidth="2px" CellPadding="5" CellSpacing="1"
                       
                        GridLines="Both" Font-Size="Small"  AllowSorting="True" CssClass="auto-style27">
                        <RowStyle BackColor="#DEDFDE" BorderColor="White" BorderWidth="1px" ForeColor="Black" />--%>
               

                           <asp:GridView ID="GVDeapatchReport" Caption="Top 50 records........." runat="server" AutoGenerateColumns="False" BackColor="White" 
                        BorderColor="White"  BorderStyle="Ridge" BorderWidth="2px" CellPadding="3" CellSpacing="1"
                         OnRowDataBound="gvDespatchDetail_RowDataBound" OnSorting="gvDespatchDetail_Sorting"   DataKeyNames="ShipmentID"
                        GridLines="Both" Font-Size="Small"  AllowSorting="True">
                        <RowStyle BackColor="#ffffff" BorderColor="White" BorderWidth="1px" ForeColor="Black" />

                <Columns>
                    
                      <asp:TemplateField>
                                <ItemTemplate>
                                    <img alt="" src="images/plus.png" style="cursor: pointer" />
                                    <asp:Panel ID="pnlOrders" runat="server" Style="display: none">
                                        <asp:GridView ID="gvDespatchDetail" runat="server" AutoGenerateColumns="false" Font-Size="Small"
                                            
                                          AllowSorting="True"  HeaderStyle-BackColor="#000066" HeaderStyle-ForeColor="White"
                                            RowStyle-Wrap="False">
                                            <RowStyle BackColor="#cccccc" BorderColor="White" BorderWidth="1px" ForeColor="Black" />
                                            <Columns>
                                                <asp:TemplateField HeaderStyle-BackColor="Olive" HeaderText="No" ItemStyle-BackColor="DarkGray">
                                                    <ItemTemplate>
                                                        <%# Container.DataItemIndex + 1 %>
                                                    </ItemTemplate>
                                                    <HeaderStyle BackColor="Olive" />
                                                    <ItemStyle BackColor="DarkGray" />
                                                </asp:TemplateField>
                                                <asp:BoundField DataField="ShipmentID" HeaderText="ShipmentID" Visible="false" />
                                                <asp:BoundField DataField="DID" HeaderText="DID" Visible="true" />

                                                <asp:TemplateField HeaderText="Style">
                                                    <ItemTemplate>
                                                        <asp:Label ID="StyleNo" Width="200px" runat="server" Text='<%# Eval("StyleNo") %>' />
                                                    </ItemTemplate>                                                
                                                </asp:TemplateField>
                                                 <asp:TemplateField HeaderText="BuyerPONo">
                                                    <ItemTemplate>
                                                        <asp:Label ID="BuyerPONo" Width="150px" runat="server" Text='<%# Eval("BuyerPONo") %>' />
                                                    </ItemTemplate>                                                    
                                                </asp:TemplateField>

                                                <asp:TemplateField HeaderText="Color">
                                                    <ItemTemplate>
                                                        <asp:Label ID="ColorName" Width="150px" runat="server" Text='<%# Eval("Colour") %>' />
                                                    </ItemTemplate>                                                    
                                                </asp:TemplateField>

                                             <asp:TemplateField HeaderText="Committed Qty">
                                                    <ItemTemplate>
                                                        <asp:Label ID="DeliveryQty" Width="150px" runat="server" Text='<%# Eval("DeliveryQty") %>' />
                                                    </ItemTemplate>                                                    
                                                </asp:TemplateField>
                                                  <asp:TemplateField HeaderText="Despatched Qty">
                                                    <ItemTemplate>
                                                        <asp:Label ID="DespatchedQty" Width="150px" runat="server" Text='<%# Eval("DespatchedQty") %>' />
                                                    </ItemTemplate>                                                    
                                                </asp:TemplateField>
                                            </Columns>
                                        </asp:GridView>
                                    </asp:Panel>
                                </ItemTemplate>
                            </asp:TemplateField>
                  
                   
                  
                           
                    <asp:TemplateField HeaderText="ShipmentID" Visible="false">
                        <ItemTemplate>
                            <asp:Label ID="ShipmentID" runat="server" Text='<%#Eval("ShipmentID") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                     
                        <asp:TemplateField HeaderText="Des. No" Visible="true" ItemStyle-Font-Size="Small" FooterStyle-Font-Bold="true">
                                                        <ItemTemplate>

                                         <asp:LinkButton ID="LinkBtnDES" OnClick="LinkBtnDES_NUMBER_Click"  Font-Bold="true" runat="server" CssClass="paraGraphtext" Text='<%# Eval("ShipmentNo") %>' Font-Size="Small"  ></asp:LinkButton>
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
                <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" CssClass="GVFixedHeader" />

            </asp:GridView>
    </div>

</div>
          
        </div>
        
    </form>
</body>
</html>

