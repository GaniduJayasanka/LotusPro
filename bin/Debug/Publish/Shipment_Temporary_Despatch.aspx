<%@ page language="C#" autoeventwireup="true" inherits="OutStanding, App_Web_cjp5ygzm" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<link id="Link1" rel="stylesheet" type="text/css" href="~/CSS/Common.css" runat="server" />
    <title>Shipment Temporary Despatch</title>
    <style type="text/css">
        .panel
        {
            background: #499bea; /* Old browsers */
            background: -moz-linear-gradient(top,  #499bea 0%, #255ace 100%); /* FF3.6+ */
            background: -webkit-gradient(linear, left top, left bottom, color-stop(0%,#499bea), color-stop(100%,#255ace)); /* Chrome,Safari4+ */
            background: -webkit-linear-gradient(top,  #499bea 0%,#255ace 100%); /* Chrome10+,Safari5.1+ */
            background: -o-linear-gradient(top,  #499bea 0%,#255ace 100%); /* Opera 11.10+ */
            background: -ms-linear-gradient(top,  #499bea 0%,#255ace 100%); /* IE10+ */
            background: linear-gradient(to bottom,  #499bea 0%,#255ace 100%); /* W3C */
            filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#499bea', endColorstr='#255ace',GradientType=0 ); /* IE6-9 */
            height: 50px;
            width: 97%;
            padding: 0 20px;
            position: relative;
            margin-bottom: 30px;
            border-radius: 10px;
        }
        .style1
        {
            width: 100%;
        }
        .style2
        {
            text-align: left;
        }
        .style3
        {
            height: 37px;
        }
        .style4
        {
            text-align: left;
            width: 31px;
        }
        .style5
        {
            width: 31px;
        }
        .style6
        {
            height: 37px;
            width: 31px;
        }
        .style7
        {
            text-align: left;
            width: 31px;
            height: 36px;
        }
        .style8
        {
            text-align: left;
            height: 36px;
        }
        .style9
        {
            width: 59px;
        }
        .style10
        {
            width: 51px;
        }
        .style11
        {
            width: 56px;
        }
        .style12
        {
            width: 81px;
        }
        .style13
        {
            width: 75px;
        }
        .style14
        {
            text-align: left;
            width: 31px;
            height: 48px;
        }
        .style15
        {
            text-align: left;
            height: 48px;
        }
        ul
        {
            list-style-type: none;
            margin-left: 0;
            margin-top: 0;
            padding-left: 5px;
            padding-right: 40px;
            padding-top: 12px;
        }
        li
        {
            display: inline;
            margin-bottom: 20px;
            margin-left: 0;
            margin-right: 30px;
            margin-top: 0;
            padding-left: 20px;
        }
 

.Hide { display:none; }
        .style16
        {
            text-align: left;
            height: 48px;
            width: 33px;
        }
        .style17
        {
            text-align: left;
            height: 36px;
            width: 33px;
        }
        .style19
        {
            height: 37px;
            width: 33px;
        }
        .style20
        {
            width: 33px;
        }
        .style21
        {
            text-align: left;
            height: 36px;
            width: 94px;
        }
        .style22
        {
            width: 94px;
        }
        .style23
        {
            height: 37px;
            width: 94px;
        }
        .style24
        {
            text-align: left;
            height: 36px;
            width: 163px;
        }
        .style26
        {
            height: 37px;
            width: 163px;
        }
        .style27
        {
            width: 163px;
        }
        .style28
        {
            text-align: left;
            height: 36px;
            width: 230px;
        }
        .style29
        {
        }
        .style30
        {
            height: 37px;
            width: 230px;
        }
        .auto-style4 {
            text-align: left;
            width: 214px;
        }
        .auto-style5 {
            text-align: left;
            height: 36px;
            width: 214px;
        }
        .auto-style7 {
            height: 37px;
            width: 214px;
        }
        .auto-style8 {
            width: 214px;
        }
    </style>
    <script type="text/javascript">
        function SetTarget() {
            document.forms[0].target = "_blank";
        }
    </script>

</head>
<body>
    <form id="form1" runat="server">
    <div>
      <div style="height: 25px">  <li><a href="http://192.168.1.20/ApmasERP/CommercialInformationSystem.aspx">Home</a></li>
          <%--<li><a href="http://192.168.1.20/erps/ApmasReports/CommercialAND Shipping.aspx">Commercial
                        & Shipping</a></li>--%>
                        <li><a href="http://192.168.1.20/erps/ApmasReports/Shipment_ Dispatch_Search.aspx">Shipment Dispatch Search</a><asp:Label ID="LabMobNumber" runat="server" Visible="False"></asp:Label>
          </li>
          <asp:Label ID="LabFactoryError" runat="server" Visible="False"></asp:Label>
          <asp:Label ID="LabFruntEnd" runat="server" Visible="False"></asp:Label>
          <asp:Label ID="LabServisePro" runat="server" Visible="False"></asp:Label>
        </div>
        <%--<asp:Panel ID="Panel1" runat="server">
            <div class="panel">
                <ul>
                    <li><a href="http://192.168.1.14/ApmasNewHome/Home.aspx">Home</a></li><li>
                        <asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButtonlogout_Click"
                            Style="font-weight: 700; color: #FFFFFF; font-size: medium; font-family: 'Times New Roman', Times, serif">Logout</asp:LinkButton></li>
                    <li><a href="http://192.168.1.14/ApmasReports/CommercialAND Shipping.aspx">Commercial
                        & Shipping</a></li>
                        <li><a href="http://192.168.1.14/ApmasReports/Shipment_ Dispatch_Search.aspx">Shipment Dispatch Search</a></li></ul>
            </div>
        </asp:Panel>--%>
        <asp:Panel ID="DetailPanele" runat="server" BorderColor="#FF6600" BorderStyle="Solid">
            <table class="style1">
                <tr>
                    <td class="style14">
                        &nbsp;
                    </td>
                    <td class="style15" colspan="4">
                        &nbsp;
                        <asp:Label ID="Label3" runat="server" Text="Shipment Dispatch" Style="font-weight: 700;
                            font-size: large; font-family: 'Times New Roman', Times, serif; color: #0099CC"></asp:Label>
                        &nbsp; &nbsp; &nbsp;
                    </td>
                    <td class="style16">
                        &nbsp;
                        <asp:Label ID="lbldispatch" runat="server" Style="font-weight: 700; font-size: medium"
                            Text="Despatch No"></asp:Label>
                    </td>
                    <td class="style15">
                        &nbsp;<asp:Label ID="lbldispatchNo" runat="server" Text="Label" Style="font-weight: 700;
                            font-size: medium; font-family: 'Times New Roman', Times, serif; color: #000000;"></asp:Label>
                        &nbsp;
                    </td>
                    <td class="style15">
                        &nbsp;<asp:Label ID="lblshipmentNO" runat="server" Text="Document No" Style="font-weight: 700;
                            font-size: medium; font-family: 'Times New Roman', Times, serif"></asp:Label>
                        &nbsp;
                    </td>
                    <td class="style15">
                        &nbsp;<asp:Label ID="lblshipmentNOdisplay" runat="server" Text="Label" Style="font-size: medium;
                            font-weight: 700; font-family: 'Times New Roman', Times, serif"></asp:Label>
                        &nbsp;
                    </td>
                    <td class="style2">
                        &nbsp;
                    </td>
                    <td class="style2">
                        &nbsp;
                    </td>
                </tr>
                <tr>
                    <td class="style7">
                    </td>
                    <td class="auto-style5">
                        <asp:Label ID="lblAttention" runat="server" Style="font-weight: 700" Text=" Attention"></asp:Label>
                    </td>
                    <td class="style28">
                        <asp:TextBox ID="txtAttention" runat="server" Text="" 
                            Height="23px" Width="154px"></asp:TextBox>
                    </td>
                    <td class="style21">
                        <asp:Label ID="lblDes_Date" runat="server" Style="font-weight: 700" 
                            Text="Des. Date"></asp:Label>
                    </td>
                    <td class="style24">
                        <asp:Label ID="lblDisplayDay" runat="server" 
                            Style="font-weight: 700; color: #FF6600;" Text="Label"></asp:Label>
                    </td>
                    <td class="style17">
                        &nbsp;</td>
                    <td class="style8">
                    </td>
                    <td class="style8">
                    </td>
                    <td class="style8">
                    </td>
                    <td class="style2" colspan="2" rowspan="4">
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    </td>
                </tr>
                <tr>
                    <td class="style5">
                        &nbsp;
                    </td>
                    <td class="auto-style8">
                        <asp:Label ID="lblDeliveryPoint" runat="server" Text="Delivery Point" Style="text-decoration: underline;
                            font-weight: 700;" Visible="False"></asp:Label>
                    </td>
                    <td class="style29">
                        <strong>
                        <asp:Label ID="LabPlant" runat="server" Visible="False"></asp:Label>
                        </strong>
                    </td>
                    <td class="style22">
                        &nbsp;
                    </td>
                    <td class="style27">
                        &nbsp;
                    </td>
                    <td class="style20">
                        &nbsp;
                    </td>
                    <td>
                        &nbsp;
                    </td>
                    <td>
                        &nbsp;
                    </td>
                    <td>
                        &nbsp;
                    </td>
                </tr>
                <tr>
                    <td class="style5">
                        &nbsp;
                    </td>
                    <td class="auto-style8">
                        &nbsp;
                    </td>
                    <td class="style29">
                        &nbsp;
                    </td>
                    <td class="style22">
                        &nbsp;
                    </td>
                    <td class="style27">
                        &nbsp;
                    </td>
                    <td class="style20">
                        &nbsp;
                    </td>
                    <td>
                        &nbsp;
                    </td>
                    <td>
                        &nbsp;
                    </td>
                    <td>
                        &nbsp;
                    </td>
                </tr>
                <tr>
                    <td class="style6">
                    </td>
                    <td class="auto-style7">
                        <asp:Label ID="lblDespatchedBy" runat="server" Text=" Despatched By " Style="font-weight: 700"></asp:Label>
                    </td>
                    <td class="style30">
                        <asp:TextBox ID="txtDespatchedBy" runat="server"></asp:TextBox>
                    </td>
                    <td class="style23">
                        <asp:Label ID="lblVehicleNo" runat="server" Style="font-weight: 700" 
                            Text="Vehicle No"></asp:Label>
                    </td>
                    <td class="style26">
                        <asp:TextBox ID="txtVehicleNo" runat="server" 
                           ></asp:TextBox>
                    </td>
                    <td class="style19">
                        <asp:Label ID="lblType" runat="server" style="font-weight: 700" Text="Type"></asp:Label>
                    </td>
                    <td class="style3">
                        <asp:DropDownList ID="DropDownType" runat="server" AutoPostBack="True">
                         <asp:ListItem Text="Select Type" Value="0"></asp:ListItem>
                            <asp:ListItem Text="Lorry" Value="L"></asp:ListItem>
                            <asp:ListItem Text="Container" Value="C"></asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td class="style3">
                        &nbsp;</td>
                    <td class="style3">
                    </td>
                </tr>
                <tr>
                    <td class="style5">
                        &nbsp;
                    </td>
                    <td class="auto-style8">
                        <asp:Label ID="lblDesComments" runat="server" Text="Des. Comments" Style="font-weight: 700"></asp:Label>
                    </td>
                    <td colspan="4">
                        <asp:TextBox ID="txtDesComments" runat="server" Height="22px" Width="387px"></asp:TextBox>
                    </td>
                    <td>
                        &nbsp;
                    </td>
                    <td>
                        &nbsp;
                    </td>
                    <td>
                        &nbsp;
                    </td>
                    <td colspan="2">
                        &nbsp;
                    </td>
                </tr>
                <tr>
                    <td class="style5">
                        &nbsp;
                    </td>
                    <td class="auto-style8">
                        
                        <asp:Label ID="lblDesComments0" runat="server" Style="font-weight: 700" Text="Comments for Short/Over Shipments"></asp:Label>
                    </td>
                    <td class="style29" colspan="3">
                      
                        <asp:TextBox ID="txtShipComments" runat="server" Height="22px" Width="387px"></asp:TextBox>
                    </td>
                    <td class="style20">
                        &nbsp;
                    </td>
                    <td>
                        &nbsp;
                    </td>
                    <td>
                        &nbsp;
                    </td>
                    <td>
                        &nbsp;
                    </td>
                    <td colspan="2">
                        &nbsp;
                    </td>
                </tr>
                <tr>
                    <td class="style5">&nbsp;</td>
                    <td class="auto-style8">&nbsp;</td>
                    <td class="style29">&nbsp;</td>
                    <td class="style22">&nbsp;</td>
                    <td class="style27">&nbsp;</td>
                    <td class="style20">&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td colspan="2">&nbsp;</td>
                </tr>
                <tr>
                    <td class="style4">
                    </td>
                    <td class="auto-style4">
                        <asp:CheckBox ID="CheckBoxCancelDES" runat="server" />
                        <asp:Label ID="lblCancelDES" runat="server" Text="Cancel DES" Style="font-weight: 700"></asp:Label>
                    </td>
                    <td colspan="4" class="style2">
                        <asp:TextBox ID="txtCancelDES" TextMode="MultiLine" runat="server" Height="22px" Width="386px"></asp:TextBox>
                    </td>
                    <td class="style2">
                    </td>
                    <td class="style2">
                    </td>
                    <td class="style2">
                    </td>
                    <td class="style2" colspan="2">
                    </td>
                </tr>
                <tr>
                    <td class="style5">
                        &nbsp;
                    </td>
                    <td colspan="10">
                        <table class="style1">
                            <tr>
                                <td>
                                    &nbsp;
                                </td>
                                <td class="style10">
                                    &nbsp;
                                </td>
                                <td class="style9">
                                    &nbsp;
                                </td>
                                <td class="style11">
                                    &nbsp;
                                </td>
                                <td class="style12">
                                    &nbsp;
                                </td>
                                <td class="style13">
                                    &nbsp;
                                </td>
                                <td>
                                    &nbsp;
                                </td>
                                <td>
                                    &nbsp;
                                </td>
                                <td>
                                    &nbsp;
                                </td>
                                <td>
                                    &nbsp;
                                </td>
                            </tr>
                            <tr>
                                <td colspan="10">
                                    <%--<asp:GridView ID="GridView2" runat="server" DataKeyNames="StyleNo" AutoGenerateColumns="False"
                                        BackColor="White" BorderColor="#CCCCCC" OnPageIndexChanging="GridView2_PageIndexChanging"
                                        OnRowCommand="GridView2_RowCommand" BorderStyle="None" BorderWidth="1px" CellPadding="4"
                                        OnRowDataBound="Gridview_RowDataBound" GridLines="Horizontal" Style="font-size: small"
                                        Width="989px" ForeColor="Black">
                                        <Columns>
                                            <asp:TemplateField HeaderStyle-BackColor="Olive" HeaderText="No" ItemStyle-BackColor="DarkGray">
                                                <ItemTemplate>
                                                    <%# Container.DataItemIndex + 1 %>
                                                </ItemTemplate>
                                                <HeaderStyle BackColor="Olive" />
                                                <ItemStyle BackColor="DarkGray" />
                                            </asp:TemplateField>
                                               <asp:BoundField DataField="DID" HeaderText="DID" />
                                            <asp:BoundField DataField="StyleNo" HeaderText="StyleNo" />
                                            <asp:BoundField DataField="BuyerPONo" HeaderText="BuyerPONo" />
                                            <asp:BoundField DataField="Colour" HeaderText="Colour" />
                                            <asp:BoundField DataField="qty" HeaderText="Sumithra PO Qty" />
                                            <asp:BoundField DataField="ScheduledFactory" HeaderText="Plant" />
                                            <asp:BoundField DataField="BuyerID" HeaderText="BuyerID"  HeaderStyle-CssClass="Hide" ItemStyle-CssClass="Hide" />
                                            <asp:BoundField DataField="OrderNo" HeaderText="OrderNo"  HeaderStyle-CssClass="Hide" ItemStyle-CssClass="Hide"/>
                                            <asp:BoundField DataField="POID" HeaderText="POID"  HeaderStyle-CssClass="Hide" ItemStyle-CssClass="Hide"/>
                                             <asp:BoundField DataField="DeliveryQty" HeaderText="DeliveryQty"/>
                                            
                                          <%--  <asp:TemplateField HeaderText="CBM" SortExpression="CBM">
                                                <ItemTemplate>
                                                    <asp:TextBox ID="txtCBM" runat="server" />
                                                    <asp:RegularExpressionValidator ID="vldNumber" ControlToValidate="txtCBM" Display="Dynamic"
                                                        ErrorMessage="Place Enter Number" ValidationExpression="(^[0-9.]+$)" runat="server" />
                                                </ItemTemplate>
                                            </asp:TemplateField>--%>
                                    <%--        <asp:TemplateField HeaderText="UMO" SortExpression="UMO">
                                                <ItemTemplate>
                                                    <asp:DropDownList ID="dropdownUMO" runat="server">
                                                        <asp:ListItem Text="PCS" Value="PCS"></asp:ListItem>
                                                        <asp:ListItem Text="CTN" Value="CTN"></asp:ListItem>
                                                    </asp:DropDownList>
                                                </ItemTemplate>
                                            </asp:TemplateField>--%>
                                           <%-- <asp:TemplateField HeaderText="QtyPCS" SortExpression="Qty">
                                                <ItemTemplate>
                                                    <asp:TextBox ID="txtPCSQty" runat="server" />
                                                    <asp:RegularExpressionValidator ID="vldNumber2" ControlToValidate="txtPCSQty"
                                                        Display="Dynamic" ErrorMessage="Place Enter Number" ValidationExpression="(^[0-9.]+$)"
                                                        ValidationGroup="check" runat="server" />
                                                </ItemTemplate>
                                            </asp:TemplateField>--%>
                                               <%-- <asp:TemplateField HeaderText="QtyCTN" SortExpression="Qty">
                                                <ItemTemplate>
                                                    <asp:TextBox ID="txtCTNQty" runat="server" />
                                                    <asp:RegularExpressionValidator ID="vldNumber3" ControlToValidate="txtCTNQty"
                                                        Display="Dynamic" ErrorMessage="Place Enter Number" ValidationExpression="(^[0-9.]+$)"
                                                        ValidationGroup="check" runat="server" />
                                                </ItemTemplate>
                                            </asp:TemplateField>--%>

                    <%--                         <asp:TemplateField HeaderText="Over/Short Reason">
                            <ItemTemplate>
                                <asp:CheckBox id="RaFactory"  GroupName="RadioPlan" runat="server"  />  Factory Error <br />
                                <asp:CheckBox id="Frontend"  GroupName="RadioPlan" runat="server"  />   Front End <br />
                                <asp:CheckBox id="ServPro"  GroupName="RadioPlan" runat="server"  />  Sevice Provider <br />
                                <asp:TextBox ID="txtOvershortReason" MaxLength="10"   runat="server" TextMode="MultiLine" Rows="3"></asp:TextBox>
                          
                            </ItemTemplate>
                        </asp:TemplateField>

                                            <asp:TemplateField HeaderText="Add" SortExpression="Qty">
                                                <ItemTemplate>
                                                    <asp:Button ID="btnGridSave" CommandName="cmdBind2" CommandArgument="<%# ((GridViewRow) Container).RowIndex %>"
                                                        runat="server" CausesValidation="false" Text="Add" />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                          
                                        </Columns>
                                        <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
                                        <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
                                        <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
                                        <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
                                    </asp:GridView>--%>








                                      <div class="style2">
                                          <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" BackColor="White" BorderStyle="None" BorderWidth="1px" CellPadding="4" EnableModelValidation="True" ForeColor="Black" GridLines="Horizontal" OnPageIndexChanging="GridView2_PageIndexChanging" OnRowCommand="GridView2_RowCommand" OnRowDataBound="Gridview_RowDataBound" Style="font-size: small" Width="97%">
                                              <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" Wrap="False" />
                                              <Columns>
                                                  <asp:TemplateField HeaderText="DID" Visible="false">
                                                      <ItemTemplate>
                                                          <asp:Label ID="labDID" runat="server" Text='<%#Eval("DID") %>'></asp:Label>
                                                      </ItemTemplate>
                                                  </asp:TemplateField>
                                                  <asp:TemplateField HeaderText="Style No">
                                                      <ItemTemplate>
                                                          <asp:Label ID="labStyleNo" runat="server" Text='<%#Eval("StyleNo") %>'></asp:Label>
                                                      </ItemTemplate>
                                                  </asp:TemplateField>
                                                  <asp:TemplateField HeaderText="BuyerPONo">
                                                      <ItemTemplate>
                                                          <asp:Label ID="labBuyerPONo" runat="server" Text='<%#Eval("BuyerPONo") %>'></asp:Label>
                                                      </ItemTemplate>
                                                  </asp:TemplateField>
                                                  <asp:TemplateField HeaderText="Colour">
                                                      <ItemTemplate>
                                                          <asp:Label ID="labColour" runat="server" Text='<%#Eval("Colour") %>'></asp:Label>
                                                      </ItemTemplate>
                                                  </asp:TemplateField>
                                                  <asp:TemplateField HeaderText="Sumithra PO Qty">
                                                      <ItemTemplate>
                                                          <asp:Label ID="qty" runat="server" Text='<%#Eval("qty") %>'></asp:Label>
                                                      </ItemTemplate>
                                                  </asp:TemplateField>
                                                  <asp:TemplateField HeaderText="Plant" Visible="false"> <%-- Visible="false"--%>
                                                      <ItemTemplate>
                                                          <asp:Label ID="labScheduledFactory" runat="server" Text='<%#Eval("ScheduledFactory") %>'></asp:Label>
                                                      </ItemTemplate>
                                                  </asp:TemplateField>
                                                  <asp:TemplateField HeaderText="BuyerID" Visible="false">
                                                      <ItemTemplate>
                                                          <asp:Label ID="labBuyerID" runat="server" Text='<%#Eval("BuyerID") %>'></asp:Label>
                                                      </ItemTemplate>
                                                  </asp:TemplateField>
                                              
                                                  <asp:TemplateField HeaderText="OrderNo" Visible="false">  <%-- Visible="false"--%>
                                                      <ItemTemplate>
                                                          <asp:Label ID="labOrderNo" runat="server" Text='<%#Eval("OrderNo") %>'></asp:Label>
                                                      </ItemTemplate>
                                                  </asp:TemplateField>
                                                  <asp:TemplateField HeaderText="POID" Visible="false">  <%-- Visible="false"--%>
                                                      <ItemTemplate>
                                                          <asp:Label ID="labPOID" runat="server" Text='<%#Eval("POID") %>'></asp:Label>
                                                      </ItemTemplate>
                                                  </asp:TemplateField>
                                                  <asp:TemplateField HeaderText="DeliveryQty">
                                                      <ItemTemplate>
                                                          <asp:Label ID="labDeliveryQty" runat="server" Text='<%#Eval("DeliveryQty") %>'></asp:Label>
                                                      </ItemTemplate>
                                                  </asp:TemplateField> 

                                                     <asp:TemplateField HeaderText="QtyPCS">
                                                      <ItemTemplate>
                                                          <asp:TextBox ID="txtCBM" runat="server" />
                                                           <asp:RegularExpressionValidator ID="vldNumber" ControlToValidate="txtCBM" Display="Dynamic"
                                                        ErrorMessage="Place Enter Number" ValidationExpression="(^[0-9.]+$)" runat="server" />
                                                      </ItemTemplate>
                                                  </asp:TemplateField>

                                                    <asp:TemplateField HeaderText="BuyerCode" Visible="false">  <%--Visible="false"--%>
                                                      <ItemTemplate>
                                                          <asp:Label ID="labBuyerCode" runat="server" Text='<%#Eval("BuyerCode") %>'></asp:Label>
                                                      </ItemTemplate>
                                                  </asp:TemplateField> 

                                                          <asp:TemplateField HeaderText="DeliveryDate" Visible="false">   <%-- Visible="false"--%>
                                                      <ItemTemplate>
                                                          <asp:Label ID="labDeliveryDate" runat="server" Text='<%#Eval("DeliveryDate", "{0:dd/MM/yyyy}") %>'></asp:Label>
                                                      </ItemTemplate>
                                                  </asp:TemplateField> 
                                                    <asp:TemplateField HeaderText="DeliveryNo" Visible="false"> <%--Visible="false"--%>
                                                      <ItemTemplate>
                                                          <asp:Label ID="labDeliveryNo" runat="server" Text='<%#Eval("DeliveryNo") %>'></asp:Label>
                                                      </ItemTemplate>
                                                  </asp:TemplateField> 

                                                  
                                                     <asp:TemplateField HeaderText="Over/Short Reason">
                            <ItemTemplate>
                                <asp:CheckBox id="RaFactory"  GroupName="RadioPlan" runat="server"  />  Factory Error <br />
                                <asp:CheckBox id="Frontend"  GroupName="RadioPlan" runat="server"  />   Front End <br />
                                <asp:CheckBox id="ServPro"  GroupName="RadioPlan" runat="server"  />  Sevice Provider <br />
                                <asp:TextBox ID="txtOvershortReason" MaxLength="10"   runat="server" TextMode="MultiLine" Rows="3"></asp:TextBox>
                          
                            </ItemTemplate>
                        </asp:TemplateField>


                                                      <asp:TemplateField HeaderText="">
                                                      <ItemTemplate>
                                                          <asp:Button ID="btnGridSave" CommandName="cmdBind2" CommandArgument="<%# ((GridViewRow) Container).RowIndex %>"
                                                        runat="server" CausesValidation="false" Text="Add" />
                                                      </ItemTemplate>
                                                  </asp:TemplateField>
                                                 

                                              </Columns>
                                          </asp:GridView>
                                    </div>



















                                </td>
                            </tr>
                            <tr>
                                <td>
                                    &nbsp;
                                </td>
                                <td class="style10">
                                    &nbsp;
                                </td>
                                <td class="style9">
                                    &nbsp;
                                </td>
                                <td class="style11">
                                    &nbsp;
                                </td>
                                <td class="style12">
                                    &nbsp;
                                </td>
                                <td class="style13">
                                    &nbsp;
                                </td>
                                <td>
                                    &nbsp;
                                </td>
                                <td>
                                    &nbsp;
                                </td>
                                <td>
                                    &nbsp;
                                </td>
                                <td>
                                    &nbsp;
                                </td>
                            </tr>
                            <tr>
                                <td colspan="10" style="border: medium solid #C0C0C0">
                                    <asp:GridView ID="GridView3" runat="server" DataKeyNames="StyleNo" AutoGenerateColumns="False"
                                        BackColor="White" BorderColor="White" BorderStyle="Ridge" BorderWidth="2px" CellPadding="3"
                                        CellSpacing="1" GridLines="None" Style="font-size: small" Width="989px">
                                        <RowStyle BackColor="#DEDFDE" ForeColor="Black" />
                                        <Columns>
                                            <asp:TemplateField HeaderStyle-BackColor="Olive" HeaderText="No" ItemStyle-BackColor="DarkGray">
                                                <ItemTemplate>
                                                    <%# Container.DataItemIndex + 1 %>
                                                </ItemTemplate>
                                                <HeaderStyle BackColor="Olive" />
                                                <ItemStyle BackColor="DarkGray" />
                                            </asp:TemplateField>
                                            <%-- <asp:BoundField DataField="StyleNo" HeaderText="StyleNo" />--%>
                                            <asp:TemplateField HeaderText="StyleNo" SortExpression="StyleNo">
                                                <ItemTemplate>
                                                    <asp:Label ID="StyleNo" runat="server" Text='<%#Eval("StyleNo") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="BuyerPONo" SortExpression="BuyerPONo">
                                                <ItemTemplate>
                                                    <asp:Label ID="BuyerPONo" runat="server" Text='<%#Eval("BuyerPONo") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Item" SortExpression="Item">
                                                <ItemTemplate>
                                                    <asp:Label ID="Item" runat="server" Text='<%#Eval("Item") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="BuyerID" SortExpression="BuyerID"  HeaderStyle-CssClass="Hide" ItemStyle-CssClass="Hide">
                                                <ItemTemplate>
                                                    <asp:Label ID="BuyerID" runat="server" Text='<%#Eval("BuyerID") %>' ></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="OrderNo" SortExpression="OrderNo"  HeaderStyle-CssClass="Hide" ItemStyle-CssClass="Hide" >
                                                <ItemTemplate>
                                                    <asp:Label ID="OrderNo" runat="server" Text='<%#Eval("OrderNo") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="POID" SortExpression="POID"  HeaderStyle-CssClass="Hide" ItemStyle-CssClass="Hide" >
                                                <ItemTemplate>
                                                    <asp:Label ID="POID" runat="server" Text='<%#Eval("POID") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Sumithra PO Qty" SortExpression="qty">
                                                <ItemTemplate>
                                                    <asp:Label ID="qty" runat="server" Text='<%#Eval("qty") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="CBM" SortExpression="CBM">
                                                <ItemTemplate>
                                                    <asp:Label ID="CBM" runat="server" Text='<%#Eval("CBM") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                          <%--  <asp:TemplateField HeaderText="UMO" SortExpression="UMO">
                                                <ItemTemplate>
                                                    <asp:Label ID="UMO" runat="server" Text='<%#Eval("UMO") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>--%>
                                            <asp:TemplateField HeaderText="QtyPCS" SortExpression="PCSQty">
                                                <ItemTemplate>
                                                    <asp:Label ID="PCSQty" runat="server" Text='<%#Eval("PCSQty") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>

                                             <asp:TemplateField HeaderText="QtyCTN" SortExpression="CTNQty">
                                                <ItemTemplate>
                                                    <asp:Label ID="CTNQty" runat="server" Text='<%#Eval("CTNQty") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>


                                                   <asp:TemplateField HeaderText="CBMRate" SortExpression="CBMRate">
                                                <ItemTemplate>
                                                    <asp:Label ID="CBMRate" runat="server" Text='<%#Eval("CBMRate") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                                <asp:TemplateField HeaderText="CBMPrice" SortExpression="CBMPrice">
                                                <ItemTemplate>
                                                    <asp:Label ID="CBMPrice" runat="server" Text='<%#Eval("CBMPrice") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <%--<asp:BoundField DataField="BuyerPONo" HeaderText="BuyerPONo" />--%>
                                            <%--<asp:BoundField DataField="qty" HeaderText="qty" />--%>
                                            <%--<asp:BoundField DataField="CBM" HeaderText="CBM" />--%>
                                            <%-- <asp:BoundField DataField="UMO" HeaderText="UMO" />--%>
                                            <%--  <asp:BoundField DataField="DispatchQty" HeaderText="DispatchQty" />--%>
                                            <%--  <asp:TemplateField HeaderText="Remove" SortExpression="Remove">
                                                <ItemTemplate>
                                                   <asp:LinkButton ID="linkDeleteItem" runat="server" CommandName="DeleteItem">Delete</asp:LinkButton>
                                                </ItemTemplate>
                                            </asp:TemplateField>--%>
                                        </Columns>
                                        <FooterStyle BackColor="#C6C3C6" ForeColor="Black" />
                                        <PagerStyle BackColor="#C6C3C6" ForeColor="Black" HorizontalAlign="Right" />
                                        <SelectedRowStyle BackColor="#9471DE" Font-Bold="True" ForeColor="White" />
                                        <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#E7E7FF" />
                                    </asp:GridView>
                                    <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Clear Table" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    &nbsp;
                                </td>
                                <td class="style10">
                                    &nbsp;
                                </td>
                                <td class="style9">
                                    &nbsp;
                                </td>
                                <td class="style11">
                                    &nbsp;
                                </td>
                                <td class="style12">
                                    &nbsp;
                                </td>
                                <td class="style13">
                                    &nbsp;
                                </td>
                                <td>
                                    &nbsp;
                                </td>
                                <td>
                                    &nbsp;
                                </td>
                                <td>
                                    &nbsp;
                                </td>
                                <td>
                                    &nbsp;
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    &nbsp;
                                </td>
                                <td class="style10">
                                    <asp:Button ID="BtnNew" runat="server" Height="30px" Text="New" Width="80px" OnClick="BtnNew_Click" />
                                </td>
                                <td class="style9">
                                    <asp:Button ID="BtnSave" runat="server" Text="Save" Width="80px" Height="30px" OnClick="BtnSave_Click1" />
                                </td>
                                <td class="style11">
                                    <asp:Button ID="BtnEdit" runat="server" Text="Edit" Width="80px" Height="30px" />
                                </td>
                                <td class="style12">
                                    <asp:Button ID="BtnConfirm" runat="server" Text="Print & Finish" Width="97px" Height="30px"
                                        OnClick="BtnConfirm_Click" OnClientClick="SetTarget();" />
                                </td>
                                <td class="style13">
                                    <asp:Button ID="BtnPrint" runat="server" Text="Print Preview " Width="92px" Height="30px"
                                        OnClick="BtnPrint_Click" OnClientClick="SetTarget();" />
                                </td>
                                <td>
                                    <asp:Button ID="BtnClear" runat="server" Text="Clear" Width="80px" Height="30px"
                                        OnClick="BtnClear_Click" />
                                </td>
                                <td>
                                    &nbsp;
                                </td>
                                <td>
                                    &nbsp;
                                </td>
                                <td>
                                    &nbsp;
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
        </asp:Panel>
        <asp:Panel ID="GridPanel" runat="server">
        </asp:Panel>
    </div>
    <table class="style1">
        <tr>
            <td colspan="2">
                <asp:Panel ID="Panel2" runat="server" BorderColor="#0066FF" BorderStyle="Solid">
                    <table class="style1">
                        <tr>
                            <td>
                                <asp:Label ID="lblBuyer" runat="server" Text="Buyer" Style="font-weight: 700"></asp:Label>
                            </td>
                            <td>
                                <asp:DropDownList ID="DropDownListBuyer" runat="server" Style="font-size: small;
                                    font-family: 'Times New Roman', Times, serif">
                                </asp:DropDownList>
                            </td>
                            <td>
                                <asp:Label ID="Label1" runat="server" Text="Style" Style="font-weight: 700"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="txtStyle" runat="server"></asp:TextBox>
                            </td>
                            <td>
                                <asp:Label ID="lblPONumber" runat="server" Text="PO Number" Style="font-weight: 700"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="txtPONumber" runat="server"></asp:TextBox>
                            </td>
                            <td>
                                <asp:Button ID="btnSearch" runat="server" Text="Search" Width="80px" Height="30px"
                                    OnClick="btnSearch_Click" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="lblMsg" runat="server" Text="Label" Style="color: #FF0000"></asp:Label>
                            </td>
                            <td>
                                &nbsp;
                            </td>
                            <td>
                                &nbsp;
                            </td>
                            <td>
                                &nbsp;
                            </td>
                            <td>
                                &nbsp;
                            </td>
                            <td>
                                &nbsp;
                            </td>
                            <td>
                                &nbsp;
                            </td>
                        </tr>
                        <tr>
                            <td colspan="7">
                                <asp:GridView ID="GridView1" runat="server" DataKeyNames="StyleNo" AutoGenerateColumns="False"
                                    OnPageIndexChanging="GridView1_PageIndexChanging" OnRowCommand="GridView1_RowCommand"
                                    BackColor="White" BorderColor="Black" BorderStyle="None" BorderWidth="1px" CellPadding="4"
                                    ForeColor="Black" Width="989px" Style="font-family: 'Times New Roman', Times, serif;
                                    font-size: small">
                                    <RowStyle BackColor="#66CCFF" />
                                    <Columns>
                                        <asp:TemplateField HeaderText="No" ItemStyle-BackColor="DarkGray" HeaderStyle-BackColor="Olive">
                                            <ItemTemplate>
                                                <%# Container.DataItemIndex + 1 %>
                                            </ItemTemplate>
                                            <HeaderStyle BackColor="Olive"></HeaderStyle>
                                            <ItemStyle BackColor="DarkGray"></ItemStyle>
                                        </asp:TemplateField>
                                        
                                         <asp:BoundField DataField="DID" HeaderText="DID" />
                                        <asp:BoundField DataField="StyleNo" HeaderText="StyleNo" />
                                        <asp:BoundField DataField="BuyerPONo" HeaderText="BuyerPONo" />
                                         <asp:BoundField DataField="ColorName" HeaderText="ColorName" />
                                        
                                       <%-- <asp:BoundField DataField="Item" HeaderText="Item" />--%>
                                        <asp:BoundField DataField="SumithraPOQty" HeaderText="Sumithra PO Qty" />
                                         <asp:BoundField DataField="ScheduledFactory" HeaderText="Plant" />
                                        

                                        <asp:BoundField DataField="BuyerID" HeaderText="B"  HeaderStyle-CssClass="Hide" ItemStyle-CssClass="Hide"/>
                                        <asp:BoundField DataField="OrderNo" HeaderText="OrderNo"  HeaderStyle-CssClass="Hide" ItemStyle-CssClass="Hide"  />
                                        <asp:BoundField DataField="BPOID" HeaderText="BPOID"  HeaderStyle-CssClass="Hide" ItemStyle-CssClass="Hide" />
                                     
                                         <asp:BoundField DataField="DeliveryQty" HeaderText="DeliveryQty"  />
                                            <asp:BoundField DataField="BuyerCode" HeaderText="BuyerCode"   />
                                         <asp:BoundField DataField="DeliveryDate" HeaderText="DeliveryDate"  HeaderStyle-CssClass="Hide" ItemStyle-CssClass="Hide"  />
                                          <asp:BoundField DataField="DeliveryNo" HeaderText="DeliveryNo"  HeaderStyle-CssClass="Hide" ItemStyle-CssClass="Hide" />
                                        
                                        <asp:TemplateField HeaderText="Details">
                                            <ItemTemplate>
                                                <asp:Button ID="lnkDet" CommandName="cmdBind" CommandArgument="<%# ((GridViewRow) Container).RowIndex %>"
                                                    runat="server" CausesValidation="false" Text="Select" />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                    <FooterStyle BackColor="#CCCC99" />
                                    <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
                                    <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
                                    <HeaderStyle BackColor="Gray" Font-Bold="True" ForeColor="White" />
                                    <AlternatingRowStyle BackColor="White" />
                                </asp:GridView>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                &nbsp;
                            </td>
                            <td>
                                &nbsp;
                            </td>
                            <td>
                                &nbsp;
                            </td>
                            <td>
                                &nbsp;
                            </td>
                            <td>
                                &nbsp;
                            </td>
                            <td>
                                &nbsp;
                            </td>
                            <td>
                                &nbsp;
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;
            </td>
            <td>
                &nbsp;
            </td>
        </tr>
    </table>
    </form>
</body>
</html>
