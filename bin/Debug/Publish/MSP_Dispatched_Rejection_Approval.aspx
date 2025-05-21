<%@ page language="C#" autoeventwireup="true" inherits="MSP_Dispatched_Rejection_Approval, App_Web_11yxmj2e" %>
<%@ Register Assembly="BasicFrame.WebControls.BasicDatePicker" Namespace="BasicFrame.WebControls" TagPrefix="BDP" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <link href="CSS/bootstrap.css" rel="stylesheet" />
    <link href="CSS/jquery.autocomplete.css" rel="stylesheet" type="text/css" />
    <script src="js/jquery-1.4.1.min.js" type="text/javascript"></script>
    <script src="js/jquery.autocomplete.js" type="text/javascript"></script>

<%--    <script type="text/javascript">
        $(document).ready(function () {
            $("#<%=txtStyle.ClientID%>").autocomplete('SearchStyle.ashx');
    });
    </script>--%>

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
    <script language="javascript" type ="text/javascript" >

        function CloseBrowser() {
            window.close();

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
                        <center><h2>Dispatch Rejection - Approval</h2></center>
                    </div>
                </div>
            </div>

            <div>
            <asp:GridView ID="GV_Dispatches" Caption="Dispatched Shipments" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" 
                BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black"  GridLines="Both" AllowSorting="True"  Font-Size="Small"
                EnableModelValidation="True" >
                <FooterStyle CssClass="GridViewFooterStyle" />
                <RowStyle CssClass="GridViewRowStyle" />    
                <SelectedRowStyle CssClass="GridViewSelectedRowStyle" />
                <PagerStyle CssClass="GridViewPagerStyle" />
                <AlternatingRowStyle CssClass="GridViewAlternatingRowStyle" />
                <HeaderStyle CssClass="GridViewHeaderStyle" />                
                <Columns>
                     <asp:TemplateField HeaderText="DID NO." >
                        <ItemTemplate>                            
                            <asp:Label ID="DID" runat="server" Text='<%#Eval("DID") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                     <asp:TemplateField HeaderText=" Buyer" >
                        <ItemTemplate>                            
                            <asp:Label ID="BuyerName" runat="server" Text='<%#Eval("BuyerName") %>' Width="100px"></asp:Label>
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

                     <asp:TemplateField HeaderText=" STYLE" >
                        <ItemTemplate>                            
                            <asp:Label ID="Style" runat="server" Text='<%#Eval("Style") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="DATE DISPATCHED">
                        <ItemTemplate>
                            <asp:Label ID="DisDate" runat="server" Text='<%# Eval("DispatchedDate", "{0:dd/MMM/yyyy}") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                                          
                    <asp:TemplateField HeaderText="DISPATCHED USER">
                        <ItemTemplate>
                            <asp:Label ID="UserName" runat="server" Text='<%#Eval("DispatchedUser") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="COLOR">
                        <ItemTemplate>
                            <asp:Label ID="ColorName" runat="server" Text='<%#Eval("Color") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="SPO QTY." Visible="false"  ItemStyle-HorizontalAlign="Right">
                        <ItemTemplate>
                            <asp:Label ID="SPO_QTY" runat="server" Text='<%#Eval("SPOQty") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="COMMITTED QTY."  ItemStyle-HorizontalAlign="Right">
                        <ItemTemplate>
                            <asp:Label ID="COM_QTY" runat="server" Text='<%#Eval("ComQty") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="DISPATCHED QTY"  ItemStyle-HorizontalAlign="Right">
                        <ItemTemplate>
                            <asp:Label ID="DIS_QTY" runat="server" Text='<%#Eval("DisQty") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                              
                    <asp:TemplateField HeaderText="REMOVAL REASON" >
                        <ItemTemplate>
                            <asp:Label ID="RemovalReason" runat="server" Text='<%#Eval("RemovalReason") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                   <asp:TemplateField HeaderText="REMOVAL COMMENT">
                        <ItemTemplate>
                            <asp:Label ID="RemovalComment" runat="server" Text='<%#Eval("RemovalComment") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                   <asp:TemplateField HeaderText="REMOVAL REQUEST BY">
                        <ItemTemplate>
                            <asp:Label ID="RejectUser" runat="server" Text='<%#Eval("RejectUser") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>                                                                        
                    
                   <asp:TemplateField HeaderText=" PLANT">
                        <ItemTemplate>
                            <asp:Label ID="Plant" runat="server" Text='<%#Eval("Plant") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField> 
                
                     <asp:TemplateField HeaderText="APPROVE" >
                        <ItemTemplate>
                            <asp:Button ID="btnApprove"  runat="server" Text="APPROVE"  CssClass="btn btn-success" Height="30px" Style="font-family: Cambria" Font-Size="X-Small" Font-Bold="true" OnClick="BtnApprove_Click"   />
                        </ItemTemplate>
                    </asp:TemplateField>
                                     
                </Columns>
                <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
<%--                <FooterStyle BackColor="#333333" Font-Bold="True" ForeColor="White"  CssClass="GVFixedFooter"/>
                <HeaderStyle CssClass="HeaderFreez"  BackColor="#333333" Font-Bold="True" ForeColor="White"  />--%>

            </asp:GridView>

                <br />
                 
                 <asp:GridView ID="GV_DeliveryRejection" Caption="Deliveries (Not Shipped)"  runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" 
                BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black"  GridLines="Both" AllowSorting="True"  Font-Size="Small"
                EnableModelValidation="True" >
                <FooterStyle CssClass="GridViewFooterStyle" />
                <RowStyle CssClass="GridViewRowStyle" />    
                <SelectedRowStyle CssClass="GridViewSelectedRowStyle" />
                <PagerStyle CssClass="GridViewPagerStyle" />
                <AlternatingRowStyle CssClass="GridViewAlternatingRowStyle" />
                <HeaderStyle CssClass="GridViewHeaderStyle" />                
                <Columns>
                     <asp:TemplateField HeaderText="DID NO." >
                        <ItemTemplate>                            
                            <asp:Label ID="DID" runat="server" Text='<%#Eval("DID") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                     <asp:TemplateField HeaderText=" Buyer" >
                        <ItemTemplate>                            
                            <asp:Label ID="BuyerName" runat="server" Text='<%#Eval("BuyerName") %>' ></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText=" STYLE" >
                        <ItemTemplate>                            
                            <asp:Label ID="Style" runat="server" Text='<%#Eval("StyleNo") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                     <asp:TemplateField HeaderText=" Buyer PO No." >
                        <ItemTemplate>                            
                            <asp:Label ID="BuyerPONo" runat="server" Text='<%#Eval("BuyerPONo") %>' ></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                     <asp:TemplateField HeaderText=" ContractNo" >
                        <ItemTemplate>                            
                            <asp:Label ID="ContractNo" runat="server" Text='<%#Eval("ContractNo") %>' ></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>


                    <asp:TemplateField HeaderText="COLOR">
                        <ItemTemplate>
                            <asp:Label ID="ColorName" runat="server" Text='<%#Eval("ColorName") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Delivery No">
                        <ItemTemplate>
                            <asp:Label ID="DeliveryNo" runat="server" Text='<%#Eval("DeliveryNo") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="SPO QTY." Visible="false"  ItemStyle-HorizontalAlign="Right">
                        <ItemTemplate>
                            <asp:Label ID="SPO_QTY" runat="server" Text='<%#Eval("SumithraPOQty") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="COMMITTED QTY."  ItemStyle-HorizontalAlign="Right">
                        <ItemTemplate>
                            <asp:Label ID="DeliveryQty" runat="server" Text='<%#Eval("DeliveryQty") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                  
                              
                    <asp:TemplateField HeaderText="REMOVAL REASON" >
                        <ItemTemplate>
                            <asp:Label ID="RemovalReason" runat="server" Text='<%#Eval("DeliveryCancelReason") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                   <asp:TemplateField HeaderText="REMOVAL COMMENT">
                        <ItemTemplate>
                            <asp:Label ID="RemovalComment" runat="server" Text='<%#Eval("DeliveryCancelComment") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                   <asp:TemplateField HeaderText="REQUEST BY">
                        <ItemTemplate>
                            <asp:Label ID="RejectUser" runat="server" Text='<%#Eval("DeliveryCancelRequestedUser") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>                                                                        
                    
                   <asp:TemplateField HeaderText=" PLANT">
                        <ItemTemplate>
                            <asp:Label ID="Plant" runat="server" Text='<%#Eval("ScheduledFactory") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField> 
                
                     <asp:TemplateField HeaderText="APPROVE" >
                        <ItemTemplate>
                            <asp:Button ID="btnApprove_NotShippedDeliveries"  runat="server" Text="APPROVE"  CssClass="btn btn-success" Height="30px" Style="font-family: Cambria" Font-Size="X-Small" Font-Bold="true" OnClick="btnApprove_NotShippedDeliveries_Click"   />
                        </ItemTemplate>
                    </asp:TemplateField>
                     <asp:TemplateField HeaderText="DISAPPROVE" >
                        <ItemTemplate>
                            <asp:Button ID="btnDisapprove_NotShippedDeliveries"  runat="server" Text="DISAPPROVE"  CssClass="btn btn-danger" Height="30px" Style="font-family: Cambria" Font-Size="X-Small" Font-Bold="true" OnClick="btnDisapprove_NotShippedDeliveries_Click"   />
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
                     <asp:TemplateField HeaderText="DID NO." >
                        <ItemTemplate>                            
                            <asp:Label ID="DID" runat="server" Text='<%#Eval("DID") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                      <asp:TemplateField HeaderText=" Buyer" >
                        <ItemTemplate>                            
                            <asp:Label ID="Buyer" runat="server" Text='<%#Eval("BuyerName") %>' Width="100px"></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                     <asp:TemplateField HeaderText=" STYLE" >
                        <ItemTemplate>                            
                            <asp:Label ID="Style" runat="server" Text='<%#Eval("Style") %>'></asp:Label>
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

                    

                    <asp:TemplateField HeaderText="DATE DISPATCHED">
                        <ItemTemplate>
                            <asp:Label ID="DisDate" runat="server" Text='<%# Eval("DispatchedDate", "{0:dd/MMM/yyyy}") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                                          
                    <asp:TemplateField HeaderText="DISPATCHED USER">
                        <ItemTemplate>
                            <asp:Label ID="UserName" runat="server" Text='<%#Eval("DispatchedUser") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="COLOR">
                        <ItemTemplate>
                            <asp:Label ID="ColorName" runat="server" Text='<%#Eval("Color") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="SPO QTY." Visible="false"  ItemStyle-HorizontalAlign="Right">
                        <ItemTemplate>
                            <asp:Label ID="SPO_QTY" runat="server" Text='<%#Eval("SPOQty") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="COMMITTED QTY."  ItemStyle-HorizontalAlign="Right">
                        <ItemTemplate>
                            <asp:Label ID="COM_QTY" runat="server" Text='<%#Eval("ComQty") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="DISPATCHED QTY"  ItemStyle-HorizontalAlign="Right">
                        <ItemTemplate>
                            <asp:Label ID="DIS_QTY" runat="server" Text='<%#Eval("DisQty") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                              
                    <asp:TemplateField HeaderText="REMOVAL REASON" >
                        <ItemTemplate>
                            <asp:Label ID="RemovalReason" runat="server" Text='<%#Eval("RemovalReason") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                   <asp:TemplateField HeaderText="REMOVAL COMMENT">
                        <ItemTemplate>
                            <asp:Label ID="RemovalComment" runat="server" Text='<%#Eval("RemovalComment") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>      

                   <asp:TemplateField HeaderText="REMOVAL REQUEST BY">
                        <ItemTemplate>
                            <asp:Label ID="RejectUser" runat="server" Text='<%#Eval("RejectUser") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>                        
                                                 
                   <asp:TemplateField HeaderText="REMOVAL APPROVED BY">
                        <ItemTemplate>
                            <asp:Label ID="ApprovedUser" runat="server" Text='<%#Eval("ApprovedUser") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>  
                    
                   <asp:TemplateField HeaderText="PLANT">
                        <ItemTemplate>
                            <asp:Label ID="Plant" runat="server" Text='<%#Eval("Plant") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField> 
                                                                                
                </Columns>
                <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
            </asp:GridView>     
                

                  <asp:GridView ID="GV_2"  runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" 
                BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black"  GridLines="Both" AllowSorting="True"  Font-Size="Small"
                EnableModelValidation="True" >
                <FooterStyle CssClass="GridViewFooterStyle" />
                <RowStyle CssClass="GridViewRowStyle" />    
                <SelectedRowStyle CssClass="GridViewSelectedRowStyle" />
                <PagerStyle CssClass="GridViewPagerStyle" />
                <AlternatingRowStyle CssClass="GridViewAlternatingRowStyle" />
                <HeaderStyle CssClass="GridViewHeaderStyle" />                
                <Columns>
                     <asp:TemplateField HeaderText="DID NO." >
                        <ItemTemplate>                            
                            <asp:Label ID="DID" runat="server" Text='<%#Eval("DID") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                     <asp:TemplateField HeaderText=" Buyer" >
                        <ItemTemplate>                            
                            <asp:Label ID="BuyerName" runat="server" Text='<%#Eval("BuyerName") %>' ></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText=" STYLE" >
                        <ItemTemplate>                            
                            <asp:Label ID="Style" runat="server" Text='<%#Eval("StyleNo") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                     <asp:TemplateField HeaderText=" Buyer PO No." >
                        <ItemTemplate>                            
                            <asp:Label ID="BuyerPONo" runat="server" Text='<%#Eval("BuyerPONo") %>' ></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                     <asp:TemplateField HeaderText=" ContractNo" >
                        <ItemTemplate>                            
                            <asp:Label ID="ContractNo" runat="server" Text='<%#Eval("ContractNo") %>' ></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>


                    <asp:TemplateField HeaderText="COLOR">
                        <ItemTemplate>
                            <asp:Label ID="ColorName" runat="server" Text='<%#Eval("ColorName") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Delivery No">
                        <ItemTemplate>
                            <asp:Label ID="DeliveryNo" runat="server" Text='<%#Eval("DeliveryNo") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="SPO QTY." Visible="false"  ItemStyle-HorizontalAlign="Right">
                        <ItemTemplate>
                            <asp:Label ID="SPO_QTY" runat="server" Text='<%#Eval("SumithraPOQty") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="COMMITTED QTY."  ItemStyle-HorizontalAlign="Right">
                        <ItemTemplate>
                            <asp:Label ID="DeliveryQty" runat="server" Text='<%#Eval("DeliveryQty") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                  
                              
                    <asp:TemplateField HeaderText="REMOVAL REASON" >
                        <ItemTemplate>
                            <asp:Label ID="RemovalReason" runat="server" Text='<%#Eval("DeliveryCancelReason") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                   <asp:TemplateField HeaderText="REMOVAL COMMENT">
                        <ItemTemplate>
                            <asp:Label ID="RemovalComment" runat="server" Text='<%#Eval("DeliveryCancelComment") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                   <asp:TemplateField HeaderText="REQUEST BY">
                        <ItemTemplate>
                            <asp:Label ID="RejectUser" runat="server" Text='<%#Eval("DeliveryCancelRequestedUser") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>                                                                        
                    
                   <asp:TemplateField HeaderText=" PLANT">
                        <ItemTemplate>
                            <asp:Label ID="Plant" runat="server" Text='<%#Eval("ScheduledFactory") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField> 
                
                     
                                        
                </Columns>
                <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
<%--                <FooterStyle BackColor="#333333" Font-Bold="True" ForeColor="White"  CssClass="GVFixedFooter"/>
                <HeaderStyle CssClass="HeaderFreez"  BackColor="#333333" Font-Bold="True" ForeColor="White"  />--%>

            </asp:GridView>
            </div>
        </div>

        <asp:Label ID="lblUserId" runat="server" Visible="false" Text="Label"></asp:Label>
    </form>
</body>
</html>
