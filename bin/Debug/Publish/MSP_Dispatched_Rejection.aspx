<%@ page language="C#" autoeventwireup="true" inherits="MSP_Dispatched_Rejection, App_Web_11yxmj2e" %>
<%@ Register Assembly="BasicFrame.WebControls.BasicDatePicker" Namespace="BasicFrame.WebControls" TagPrefix="BDP" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="CSS/bootstrap.css" rel="stylesheet" />
    <link href="CSS/jquery.autocomplete.css" rel="stylesheet" type="text/css" />
    <script src="js/jquery-1.4.1.min.js" type="text/javascript"></script>
    <script src="js/jquery.autocomplete.js" type="text/javascript"></script>

    <script type="text/javascript">
    $(document).ready(function () {
    $("#<%=txtStyle.ClientID%>").autocomplete('SearchStyle.ashx');
    });
    </script>

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
<script type="text/javascript">

    function changeLabel(text, id) {
        $("#" + id).val(text);
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
            font-size:smaller;
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
            font-size:smaller;
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
            font-size:smaller;
            font-family:Cambria;
            font-weight: bold;
        }

        .GridViewAlternatingRowStyle 
        {
            background-color: #FFFFFF;
            color: #333333;
            font-size:smaller;
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

.button {
      border-radius: 15px;
      background-color: Gray;
      border: none;
      color: #FFFFFF;
      text-align: center;
      font-size: 14px;     
      padding: 10px;
      width: 200px;
      transition: all 0.5s;
      cursor: pointer;
      margin: 5px;
    }

    .button span {
      cursor: pointer;
      display: inline-block;
      position: relative;
      transition: 0.5s;
    }

    .button span:after {
      content: '\00bb';
      position: absolute;
      opacity: 0;
      top: 0;
      right: -20px;
      transition: 0.5s;
    }

    .button:hover span {
      padding-right: 40px;
    }

    .button:hover span:after {
      opacity: 1;
      right: 0;
    }
    </style>
    <style type="text/css">
        .Gridtxt {
            width: 100px;
        }

        .gridHeader {
            text-align: right;
            font-weight: bold;
        }

        .panel {
            margin-bottom: 5px !important;
        }

        .form-group {
            margin-bottom: 5px !important;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>

        <div class="col-md-12">
            <div class="col-md-10">
                <div class="row">
                    <div class="col-md-1">
                        <br />
                        <asp:ImageButton ID="btnHome" runat="server" ImageUrl="~/images/Tohome.png" Height="25px" Width="25px" PostBackUrl="MSP_Dispatched_Rejection_Home.aspx" />
                    </div>
                    <div class="col-md-11" style="font-family:Bahnschrift">
                        <center><h2>DISPATCH   REJECTION</h2></center>
                    </div>
                </div>
            </div>

            <div class="col-md-12">
                <div class="panel panel-default">
                    <div class="panel-body">
                        <div class="box-body">
                            <div class="row">
                                <div class="form-group">
                                        <label class="col-md-1 control-label">PLANT</label>
                                        <div class="col-md-3">
                                            <asp:DropDownList Width="200px" ID="DropPlants" DataTextField="ActionName" CssClass="form-control" runat="server" Height="25px" Font-Size="Smaller" ></asp:DropDownList>
                                        </div>  

                                        <label class="col-md-1 control-label">STYLE</label>
                                        <div class="col-md-3 control-label">
                                            <asp:TextBox  ID="txtStyle" CssClass="form-control" runat="server" Width="300px" Font-Size="Smaller" Height="25px" ></asp:TextBox>
                                        </div> 

                                        <div class="col-md-3 control-label">
                                            <asp:Button ID="btnGo" CssClass="btn btn-Gray" runat="server" Text="GO" Width="100px" Height="25px" Font-Names="cambria" Font-Size="X-Small" Font-Bold="true" OnClick="btnGo_Click"  />
                                       <asp:Button ID="btnReset" CssClass="btn btn-warning" runat="server" Text="Reset" Width="100px" Height="25px" Font-Names="cambria" Font-Size="X-Small" Font-Bold="true" OnClick="btnReset_Click"  />
                                            </div>

                               </div>
                            </div>
                        </div>
                    </div>
                </div>
             </div>

<div>

    <asp:Panel ID="PanelColorDescription" runat="server"  >
      <div class="col-md-11">
            <div class="form-group">
                
               
                <label class="col-md-2 control-label">
                    <img src="images/lightBrown.PNG" width="35" height="20" />
                    : Invoiced</label>

                 <label class="col-md-3 control-label">
                    <img src="images/blue2.PNG" width="35" height="20" />
                    : Multiple Deliveries</label>
               

            </div>
        </div>
        </asp:Panel>

    <asp:Panel ID="PanelMultipleDeliveries" runat="server">
          <div class="col-md-12">
                <div class="panel panel-default">
                    <div class="panel-body">
                        <div class="box-body">

                             <div class="row">
                                <div class="form-group">
                                       

                                        <label class="col-md-1 control-label">Buyer</label>
                                        <div class="col-md-3 control-label">
                                            <asp:Label ID="lblBuyer" runat="server" Text="Label"></asp:Label>
                                        </div> 

                                   

                               </div>
                            </div>

                            <div class="row">
                                <div class="form-group">
                                       

                                        <label class="col-md-1 control-label">Buyer PO</label>
                                        <div class="col-md-3 control-label">
                                            <asp:Label ID="lblBuyerPO" runat="server" Text="Label"></asp:Label>
                                        </div> 

                                     <label class="col-md-1 control-label">Contract</label>
                                        <div class="col-md-3 control-label">
                                            <asp:Label ID="lblContractNo" runat="server" Text="Label"></asp:Label>
                                        </div> 

                                        <label class="col-md-1 control-label">Color</label>
                                        <div class="col-md-3 control-label">
                                            <asp:Label ID="lblColor" runat="server" Text="Label"></asp:Label>
                                        </div> 

                               </div>
                            </div>

                            <hr />
                            <br />
                             <asp:GridView ID="GVDeliveryBreakdown" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" 
                BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black"  GridLines="Both" AllowSorting="True"  Font-Size="Small"
                EnableModelValidation="True" OnRowDataBound="GVDeliveryBreakdown_RowDataBound" >
                <FooterStyle CssClass="GridViewFooterStyle" />
                <RowStyle CssClass="GridViewRowStyle" />    
                <SelectedRowStyle CssClass="GridViewSelectedRowStyle" />
                <PagerStyle CssClass="GridViewPagerStyle" />
                <AlternatingRowStyle CssClass="GridViewAlternatingRowStyle" />
                <HeaderStyle CssClass="GridViewHeaderStyle" />                
                <Columns>
                    <asp:TemplateField HeaderText=" DID NO."  >
                        <ItemTemplate>                            
                            <asp:Label ID="DID" runat="server" Text='<%#Eval("DID") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="OrderNo" Visible="false" >
                        <ItemTemplate>                            
                            <asp:Label ID="OrderNo" runat="server" Text='<%#Eval("OrderNo") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="BPOID" Visible="false" >
                        <ItemTemplate>                            
                            <asp:Label ID="BPOID" runat="server" Text='<%#Eval("BPOID") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="BPOSEQ" Visible="false" >
                        <ItemTemplate>                            
                            <asp:Label ID="BPOSEQ" runat="server" Text='<%#Eval("BPOSEQ") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="SDID" Visible="false">
                        <ItemTemplate>                            
                            <asp:Label ID="SDID" runat="server" Text='<%#Eval("SDID") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                     <asp:TemplateField HeaderText="SDSEQ" Visible="false">
                        <ItemTemplate>                            
                            <asp:Label ID="SDSEQ" runat="server" Text='<%#Eval("SDSEQ") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>                    
                     <asp:TemplateField HeaderText=" Buyer PO No." >
                        <ItemTemplate>                            
                            <asp:Label ID="BuyerPONo" runat="server" Text='<%#Eval("BuyerPONo") %>' Width="100px"></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                     <asp:TemplateField HeaderText=" ContractNo" >
                        <ItemTemplate>                            
                            <asp:Label ID="ContractNo" runat="server" Text='<%#Eval("ContractNo") %>' Width="130px"></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                     <asp:TemplateField HeaderText=" COLOR">
                        <ItemTemplate>
                            <asp:Label ID="ColorName" runat="server" Text='<%#Eval("ColorName") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                     <asp:TemplateField HeaderText="DeliveryNo">
                        <ItemTemplate>
                            <asp:Label ID="DeliveryNo" runat="server" Text='<%#Eval("DeliveryNo") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText=" DATE DISPATCHED">
                        <ItemTemplate>
                            <asp:Label ID="DisDate" runat="server" Text='<%#Eval("DeliveryDate") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                                          
                    <asp:TemplateField HeaderText=" DISPATCHED USER">
                        <ItemTemplate>
                            <asp:Label ID="UserName" runat="server" Text='<%#Eval("DespatchedBy") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                   

                    <asp:TemplateField HeaderText=" SPO QTY." Visible="false"  ItemStyle-HorizontalAlign="Right">
                        <ItemTemplate>
                            <asp:Label ID="SPO_QTY" runat="server" Text='<%#Eval("SumithraPOQty") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText=" COMMITTED QTY."  ItemStyle-HorizontalAlign="Right">
                        <ItemTemplate>
                            <asp:Label ID="COM_QTY" runat="server" Text='<%#Eval("DeliveryQty") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText=" DISPATCHED QTY"  ItemStyle-HorizontalAlign="Right">
                        <ItemTemplate>
                            <asp:Label ID="DIS_QTY" runat="server" Text='<%#Eval("ShippedQty") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                              
                    <asp:TemplateField HeaderText=" REMOVAL REASON" >
                        <ItemTemplate>
                            <%--<asp:DropDownList ID="DropDisRemReason" runat="server" Style="font-family: Cambria" Font-Size="Small" Font-Bold="true" Width="200px"></asp:DropDownList>--%>
                              <asp:DropDownList ID="DropDisRemReason" runat="server" CssClass="form-control" Style="font-family: Cambria" Font-Size="Small" Font-Bold="true" Width="200px" Height="30px">
                                                    <asp:ListItem  ></asp:ListItem> 
                                                    <asp:ListItem Value="1" >Shipment Rejection</asp:ListItem>
                                                    <%--<asp:ListItem Value="2">Shipment Rejection</asp:ListItem>--%>
                              </asp:DropDownList>
                        </ItemTemplate>
                    </asp:TemplateField>

                   <asp:TemplateField HeaderText=" REMOVAL COMMENT">
                        <ItemTemplate>
                            <asp:TextBox ID="DisRemCom" runat="server" Text="" Style="font-family: Cambria" Font-Size="Small" Font-Bold="true" Width="200px" Height="30px" />
                        </ItemTemplate>
                    </asp:TemplateField>
                
                     <asp:TemplateField HeaderText=" REQUEST" >
                        <ItemTemplate>
                             <asp:Button ID="BtnDeliveryCancellation"  runat="server" Text="Delivery Cancellation"  CssClass="btn btn-success" Height="30px" Style="font-family: Cambria" Font-Size="X-Small" Font-Bold="true" OnClick="BtnDeliveryCancellation_Click"  />
                            <asp:Button ID="btnDispatchCancellation"  runat="server" Text="Dispatch Cancellation"  CssClass="btn btn-danger" Height="30px" Style="font-family: Cambria" Font-Size="X-Small" Font-Bold="true" OnClick="btnDispatchCancellation_Click"  />
                        </ItemTemplate>
                    </asp:TemplateField>

                                         
                     <asp:TemplateField HeaderText="Invoiced Status">
                        <ItemTemplate>
                             <asp:Label ID="InvoicedStatus" runat="server" Text='<%#Eval("InvoicedStatus") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField> 
                     <asp:TemplateField HeaderText="Invoiced" Visible="false">
                        <ItemTemplate>
                             <asp:Label ID="Invoiced" runat="server" Text='<%#Eval("Invoiced") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                     <asp:TemplateField HeaderText="Shipped" Visible="true">
                        <ItemTemplate>
                            <asp:Label ID="Shipped" runat="server" Text='<%#Eval("Shipped") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                      <asp:TemplateField HeaderText="Delivery Cancel Request" Visible="true">
                        <ItemTemplate>
                            <asp:Label ID="DeliveryCancelRequest" runat="server" Text='<%#Eval("DeliveryCancelRequest") %>' Visible="false"></asp:Label>
                             <asp:Label ID="DeliveryCancelRequestStatus" runat="server" Text='<%#Eval("DeliveryCancelRequestStatus") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                       <asp:TemplateField HeaderText="Dispatch Cancel Request" Visible="true">
                        <ItemTemplate>
                            <asp:Label ID="DispatchCancelRequest" runat="server" Text='<%#Eval("DispatchCancelRequest") %>' Visible="false"></asp:Label>
                             <asp:Label ID="DispatchCancelRequestStatus" runat="server" Text='<%#Eval("DispatchCancelRequestStatus") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
                <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
<%--                <FooterStyle BackColor="#333333" Font-Bold="True" ForeColor="White"  CssClass="GVFixedFooter"/>
                <HeaderStyle CssClass="HeaderFreez"  BackColor="#333333" Font-Bold="True" ForeColor="White"  />--%>

            </asp:GridView>
                        </div>
                    </div>
                </div>
             </div>
    </asp:Panel>

            <asp:GridView ID="GV_Dispatches" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" OnRowDataBound="GV_Dispatches_RowDataBound"
                BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black"  GridLines="Both" AllowSorting="True"  Font-Size="Small"
                EnableModelValidation="True" >
                <FooterStyle CssClass="GridViewFooterStyle" />
                <RowStyle CssClass="GridViewRowStyle" />    
                <SelectedRowStyle CssClass="GridViewSelectedRowStyle" />
                <PagerStyle CssClass="GridViewPagerStyle" />
                <AlternatingRowStyle CssClass="GridViewAlternatingRowStyle" />
                <HeaderStyle CssClass="GridViewHeaderStyle" />                
                <Columns>
                    <asp:TemplateField HeaderText=" DID NO."  >
                        <ItemTemplate>                            
                            <asp:Label ID="DID" runat="server" Text='<%#Eval("DID") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="OrderNo" Visible="false" >
                        <ItemTemplate>                            
                            <asp:Label ID="OrderNo" runat="server" Text='<%#Eval("OrderNo") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="BPOID" Visible="false" >
                        <ItemTemplate>                            
                            <asp:Label ID="BPOID" runat="server" Text='<%#Eval("BPOID") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="BPOSEQ" Visible="false" >
                        <ItemTemplate>                            
                            <asp:Label ID="BPOSEQ" runat="server" Text='<%#Eval("BPOSEQ") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="SDID" Visible="false">
                        <ItemTemplate>                            
                            <asp:Label ID="SDID" runat="server" Text='<%#Eval("SDID") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                     <asp:TemplateField HeaderText="SDSEQ" Visible="false">
                        <ItemTemplate>                            
                            <asp:Label ID="SDSEQ" runat="server" Text='<%#Eval("SDSEQ") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                      <asp:TemplateField HeaderText=" Buyer" >
                        <ItemTemplate>    
                            
                            <asp:Label ID="Buyer" runat="server" Text='<%#Eval("BuyerName") %>' Width="100px"></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                     <asp:TemplateField HeaderText=" Buyer PO No." >
                        <ItemTemplate>                            
                            <asp:Label ID="BuyerPONo" runat="server" Text='<%#Eval("BuyerPONo") %>' Width="100px"></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                     <asp:TemplateField HeaderText=" ContractNo" >
                        <ItemTemplate>                            
                            <asp:Label ID="ContractNo" runat="server" Text='<%#Eval("ContractNo") %>' Width="130px"></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText=" DATE DISPATCHED">
                        <ItemTemplate>
                            <asp:Label ID="DisDate" runat="server" Text='<%#Eval("DeliveryDate") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                                          
                    <asp:TemplateField HeaderText=" DISPATCHED USER">
                        <ItemTemplate>
                            <asp:Label ID="UserName" runat="server" Text='<%#Eval("UserName") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText=" COLOR">
                        <ItemTemplate>
                            <asp:Label ID="ColorName" runat="server" Text='<%#Eval("ColorName") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText=" SPO QTY." Visible="false"  ItemStyle-HorizontalAlign="Right">
                        <ItemTemplate>
                            <asp:Label ID="SPO_QTY" runat="server" Text='<%#Eval("SumithraPOQty") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText=" COMMITTED QTY."  ItemStyle-HorizontalAlign="Right">
                        <ItemTemplate>
                            <asp:Label ID="COM_QTY" runat="server" Text='<%#Eval("DeliveryQty") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText=" DISPATCHED QTY"  ItemStyle-HorizontalAlign="Right">
                        <ItemTemplate>
                            <asp:Label ID="DIS_QTY" runat="server" Text='<%#Eval("ShippedQty") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                              
                    <asp:TemplateField HeaderText=" DISPATCHED REMOVAL REASON" >
                        <ItemTemplate>
                            <%--<asp:DropDownList ID="DropDisRemReason" runat="server" Style="font-family: Cambria" Font-Size="Small" Font-Bold="true" Width="200px"></asp:DropDownList>--%>
                              <asp:DropDownList ID="DropDisRemReason" runat="server" CssClass="form-control" Style="font-family: Cambria" Font-Size="Small" Font-Bold="true" Width="200px" Height="30px">
                                                    <asp:ListItem  ></asp:ListItem> 
                                                    <asp:ListItem Value="1" >Shipment Rejection</asp:ListItem>
                                                    <%--<asp:ListItem Value="2">Shipment Rejection</asp:ListItem>--%>
                              </asp:DropDownList>
                        </ItemTemplate>
                    </asp:TemplateField>

                   <asp:TemplateField HeaderText=" DISPATCHED REMOVAL COMMENT">
                        <ItemTemplate>
                            <asp:TextBox ID="DisRemCom" runat="server" Text="" Style="font-family: Cambria" Font-Size="Small" Font-Bold="true" Width="200px" Height="30px" />
                        </ItemTemplate>
                    </asp:TemplateField>
                
                     <asp:TemplateField HeaderText=" REQUEST" >
                        <ItemTemplate>
                            <asp:Button ID="btnRequest"  runat="server" Text="REQUEST"  CssClass="btn btn-success" Height="30px" Style="font-family: Cambria" Font-Size="X-Small" Font-Bold="true" OnClick="BtnSend_Click"  />
                        </ItemTemplate>
                    </asp:TemplateField>

                     <asp:TemplateField HeaderText=" REQUEST for MULTIPLE DELIVERIES" >
                        <ItemTemplate>
                            <asp:Button ID="btnMultipleDel"  runat="server" Text="VIEW"  CssClass="btn btn-primary" Height="30px" Style="font-family: Cambria" Font-Size="X-Small" Font-Bold="true" OnClick="btnMultipleDel_Click"  />
                        </ItemTemplate>
                    </asp:TemplateField>

                        <asp:TemplateField HeaderText="Multiple Deleveries">
                        <ItemTemplate>
                             <asp:Label ID="lblMultipleDeleveries" runat="server" Text='<%#Eval("MultipleDeleveries") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>  
                     <asp:TemplateField HeaderText="Invoiced Status">
                        <ItemTemplate>
                             <asp:Label ID="InvoicedStatus" runat="server" Text='<%#Eval("InvoicedStatus") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField> 
                     <asp:TemplateField HeaderText="Invoiced" Visible="false">
                        <ItemTemplate>
                             <asp:Label ID="Invoiced" runat="server" Text='<%#Eval("Invoiced") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
                <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
<%--                <FooterStyle BackColor="#333333" Font-Bold="True" ForeColor="White"  CssClass="GVFixedFooter"/>
                <HeaderStyle CssClass="HeaderFreez"  BackColor="#333333" Font-Bold="True" ForeColor="White"  />--%>

            </asp:GridView>

            <asp:GridView ID="GV_1" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" 
                BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black"  GridLines="Both" AllowSorting="True"  Font-Size="Small" Visible="true"
                EnableModelValidation="True" >
                <FooterStyle CssClass="GridViewFooterStyle" />
                <RowStyle CssClass="GridViewRowStyle" />    
                <SelectedRowStyle CssClass="GridViewSelectedRowStyle" />
                <PagerStyle CssClass="GridViewPagerStyle" />
                <AlternatingRowStyle CssClass="GridViewAlternatingRowStyle" />
                <HeaderStyle CssClass="GridViewHeaderStyle" />                
                <Columns>
                     <asp:TemplateField HeaderText=" DID NO." >
                        <ItemTemplate>                            
                            <asp:Label ID="DID" runat="server" Text='<%#Eval("DID") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                      <asp:TemplateField HeaderText=" Buyer" >
                        <ItemTemplate>                            
                            <asp:Label ID="BuyerName" runat="server" Text='<%#Eval("BuyerName") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                     <asp:TemplateField HeaderText=" Buyer PO No." >
                        <ItemTemplate>                            
                            <asp:Label ID="BuyerPONo" runat="server" Text='<%#Eval("BuyerPONo") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                     <asp:TemplateField HeaderText=" ContractNo" >
                        <ItemTemplate>                            
                            <asp:Label ID="ContractNo" runat="server" Text='<%#Eval("ContractNo") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                     <asp:TemplateField HeaderText=" STYLE" >
                        <ItemTemplate>                            
                            <asp:Label ID="Style" runat="server" Text='<%#Eval("Style") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText=" DATE DISPATCHED">
                        <ItemTemplate>
                            <asp:Label ID="DisDate" runat="server" Text='<%# Eval("DispatchedDate", "{0:dd/MMM/yyyy}") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                                          
                    <asp:TemplateField HeaderText=" DISPATCHED USER">
                        <ItemTemplate>
                            <asp:Label ID="UserName" runat="server" Text='<%#Eval("DispatchedUser") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText=" COLOR">
                        <ItemTemplate>
                            <asp:Label ID="ColorName" runat="server" Text='<%#Eval("Color") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText=" SPO QTY."  ItemStyle-HorizontalAlign="Right">
                        <ItemTemplate>
                            <asp:Label ID="SPO_QTY" runat="server" Text='<%#Eval("SPOQty") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText=" COMMITTED QTY."  ItemStyle-HorizontalAlign="Right">
                        <ItemTemplate>
                            <asp:Label ID="COM_QTY" runat="server" Text='<%#Eval("ComQty") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText=" DISPATCHED QTY"  ItemStyle-HorizontalAlign="Right">
                        <ItemTemplate>
                            <asp:Label ID="DIS_QTY" runat="server" Text='<%#Eval("DisQty") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                              
                    <asp:TemplateField HeaderText=" DISPATCHED REMOVAL REASON" >
                        <ItemTemplate>
                            <asp:Label ID="RemovalReason" runat="server" Text='<%#Eval("RemovalReason") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                   <asp:TemplateField HeaderText=" DISPATCHED REMOVAL COMMENT">
                        <ItemTemplate>
                            <asp:Label ID="RemovalComment" runat="server" Text='<%#Eval("RemovalComment") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>     
                    
                   <asp:TemplateField HeaderText=" DISPATCHED REMOVAL REQUEST BY">
                        <ItemTemplate>
                            <asp:Label ID="RejectUser" runat="server" Text='<%#Eval("RejectUser") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>    
                    
                   <asp:TemplateField HeaderText=" PLANT">
                        <ItemTemplate>
                            <asp:Label ID="Plant" runat="server" Text='<%#Eval("Plant") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>                                                 
                                        
                </Columns>
                <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
            </asp:GridView>

      <asp:GridView ID="GV_2" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" 
                BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black"  GridLines="Both" AllowSorting="True"  Font-Size="Small"
                EnableModelValidation="True"  >
                <FooterStyle CssClass="GridViewFooterStyle" />
                <RowStyle CssClass="GridViewRowStyle" />    
                <SelectedRowStyle CssClass="GridViewSelectedRowStyle" />
                <PagerStyle CssClass="GridViewPagerStyle" />
                <AlternatingRowStyle CssClass="GridViewAlternatingRowStyle" />
                <HeaderStyle CssClass="GridViewHeaderStyle" />                
                <Columns>
                    <asp:TemplateField HeaderText=" DID NO."  >
                        <ItemTemplate>                            
                            <asp:Label ID="DID" runat="server" Text='<%#Eval("DID") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="OrderNo" Visible="false" >
                        <ItemTemplate>                            
                            <asp:Label ID="OrderNo" runat="server" Text='<%#Eval("OrderNo") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="BPOID" Visible="false" >
                        <ItemTemplate>                            
                            <asp:Label ID="BPOID" runat="server" Text='<%#Eval("BPOID") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="BPOSEQ" Visible="false" >
                        <ItemTemplate>                            
                            <asp:Label ID="BPOSEQ" runat="server" Text='<%#Eval("BPOSEQ") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="SDID" Visible="false">
                        <ItemTemplate>                            
                            <asp:Label ID="SDID" runat="server" Text='<%#Eval("SDID") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                     <asp:TemplateField HeaderText="SDSEQ" Visible="false">
                        <ItemTemplate>                            
                            <asp:Label ID="SDSEQ" runat="server" Text='<%#Eval("SDSEQ") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField> 
                      <asp:TemplateField HeaderText=" Buyer">
                        <ItemTemplate>
                            <asp:Label ID="BuyerName" runat="server" Text='<%#Eval("BuyerName") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                      <asp:TemplateField HeaderText=" Style">
                        <ItemTemplate>
                            <asp:Label ID="StyleNo" runat="server" Text='<%#Eval("StyleNo") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                     <asp:TemplateField HeaderText=" Buyer PO No." >
                        <ItemTemplate>                            
                            <asp:Label ID="BuyerPONo" runat="server" Text='<%#Eval("BuyerPONo") %>' Width="100px"></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                     <asp:TemplateField HeaderText=" ContractNo" >
                        <ItemTemplate>                            
                            <asp:Label ID="ContractNo" runat="server" Text='<%#Eval("ContractNo") %>' Width="130px"></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                     <asp:TemplateField HeaderText=" COLOR">
                        <ItemTemplate>
                            <asp:Label ID="ColorName" runat="server" Text='<%#Eval("ColorName") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                     <asp:TemplateField HeaderText="DeliveryNo">
                        <ItemTemplate>
                            <asp:Label ID="DeliveryNo" runat="server" Text='<%#Eval("DeliveryNo") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="COMMITTED DATE">
                        <ItemTemplate>
                            <asp:Label ID="DisDate" runat="server" Text='<%#Eval("DeliveryDate") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                      
                    <asp:TemplateField HeaderText=" SPO QTY." Visible="false"  ItemStyle-HorizontalAlign="Right">
                        <ItemTemplate>
                            <asp:Label ID="SPO_QTY" runat="server" Text='<%#Eval("SumithraPOQty") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText=" COMMITTED QTY."  ItemStyle-HorizontalAlign="Right">
                        <ItemTemplate>
                            <asp:Label ID="COM_QTY" runat="server" Text='<%#Eval("DeliveryQty") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText=" DISPATCHED QTY"  ItemStyle-HorizontalAlign="Right">
                        <ItemTemplate>
                            <asp:Label ID="DIS_QTY" runat="server" Text='<%#Eval("ShippedQty") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                              
                  <asp:TemplateField HeaderText=" REMOVAL REASON">
                        <ItemTemplate>
                           <asp:Label ID="DeliveryCancelReason" runat="server" Text='<%#Eval("DeliveryCancelReason") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                   <asp:TemplateField HeaderText=" REMOVAL COMMENT">
                        <ItemTemplate>
                           <asp:Label ID="DeliveryCancelComment" runat="server" Text='<%#Eval("DeliveryCancelComment") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                  <asp:TemplateField HeaderText="REQUESTED USER">
                        <ItemTemplate>
                            <asp:Label ID="UserName" runat="server" Text='<%#Eval("DeliveryCancelRequestedUser") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                     
                </Columns>
                <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
<%--                <FooterStyle BackColor="#333333" Font-Bold="True" ForeColor="White"  CssClass="GVFixedFooter"/>
                <HeaderStyle CssClass="HeaderFreez"  BackColor="#333333" Font-Bold="True" ForeColor="White"  />--%>

            </asp:GridView>
            </div>
        </div>

        <asp:Label ID="lblDID" runat="server" Text="Label" Visible="false"></asp:Label>
         <asp:Label ID="lblUserId" runat="server" Text="Label" Visible="false"></asp:Label>
    </form>
</body>
</html>
