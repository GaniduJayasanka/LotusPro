<%@ page language="C#" autoeventwireup="true" inherits="StyleWiseHistory, App_Web_a2krn21a" %>

<%@ Register Assembly="BasicFrame.WebControls.BasicDatePicker" Namespace="BasicFrame.WebControls" TagPrefix="BDP" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>MSP Schedule</title>
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

        .BigCheckBox input {
            width: 20px;
            height: 20px;
        }

        </style>

        <style type="text/css">

        .Initial
{
  display: block;
  padding: 4px 18px 4px 18px;
  float: left;
  background: url("../Images/InitialImage.png") no-repeat right top;
  color: Black;
  font-weight: bold;
}




.Initial:hover
{
  color: White;
  background: url("../Images/SelectedButton.png") no-repeat right top;
}
.Clicked
{
  float: left;
  display: block;
  background: url("../Images/SelectedButton.png") no-repeat right top;
  padding: 4px 18px 4px 18px;
  color: Black;
  font-weight: bold;
  color: White;
}

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
           
        <asp:HiddenField ID="hfRemainingValue" runat="server" />
        <div class="col-md-12">
            <div class="row">
                <div class="col-md-1">
                 
                    <asp:ImageButton ID="btnHome" runat="server" ImageUrl="~/images/Tohome.png" Height="35px"
                        Width="35px" OnClick="btnHome_Click" />
                    <asp:Label ID="lblOrderNo" runat="server" Text="Label" Visible="False"></asp:Label>
                </div>
                <div class="col-md-10">
                    <center><h3>Style Wise History</h3>
                    </center>
                </div>
                  <div class="col-md-1">                      
                         <a href="InvoiceSearch.aspx"  target="_blank">  <asp:Label ID="Label8" runat="server" ToolTip="Invoice Wise Search" Text="Invoice Wise" type="button"></asp:Label>   </a>
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
                                            <label class="col-md-1 control-label">Style<span style="color: red">*</span> </label>
                                            <div class="col-md-2">

                                                <asp:TextBox ID="txtStyle" runat="server" CssClass="form-control" Width="200px"></asp:TextBox>
                                            </div>
                                            <label class="col-md-1 control-label">DateRange</label>
                                    <div class="col-md-2">
                                        <BDP:BasicDatePicker Width="50px" ID="DatePickerFromDate" runat="server" CssClass="form-control" />
                                       
                                    </div>
                                   <%--  <div class="col-md-3">
                                         &nbsp; &nbsp; &nbsp; &nbsp;
                                         </div>--%>
                                    <label class="col-md-1 control-label">To </label>
                                    <div class="col-md-2">
                                       
                                        <BDP:BasicDatePicker ID="DatePickerToDate" runat="server" CssClass="form-control" />
                                    </div>
                                          
                                            <div class="col-md-3">
                                                <asp:Button ID="BtnSearch" CssClass="btn btn-info" Width="100px" runat="server" Text="Search" OnClick="btnSearch_Click" />
                                                <asp:Button ID="BtnSet" runat="server" CssClass="btn btn-warning" OnClick="BtnSet_Click" Text="Reset" Width="100px" />
                                            </div>
                                            <div class="col-md-1">

                                                </div>
                                        </div>
                                    </div>
                                </div>
                           
                                <div class="row">
                                    <div class="box-body">
                                        <div class="form-group">
                                            <label style="color:DimGray; " class="col-md-2 control-label">Costing Status</label>
                                            <div class="col-md-2">

                                                <asp:Label ID="lblCostingStatus" Font-Bold="true" style="color:DimGray; " runat="server" Text=""></asp:Label>
                                            </div>
                                             <label style="color:DimGray; " class="col-md-2 control-label">Planning Status</label>
                                            
                                         <div class="col-md-2">

                                                <asp:Label ID="lblPlannedStatus" Font-Bold="true" style="color:DimGray; " runat="server" Text=""></asp:Label>
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
          <asp:Button Text="MSP History" BackColor="#a6a6a6"  BorderStyle="Double" ID="Tab1"  
              CssClass="Initial" runat="server" OnClick="Tab1_Click" />
          <asp:Button Text="Ticket History " BackColor="#a6a6a6"  BorderStyle="Double" ID="Tab2" 
              CssClass="Initial" runat="server" OnClick="Tab2_Click" />
          <asp:Button Text="Buyer PO " BackColor="#a6a6a6"  BorderStyle="Double" ID="TabBPO" 
              CssClass="Initial" runat="server" OnClick="btnBPO_Click" />
          <asp:Button Text="MSP Schedule " BackColor="#a6a6a6"  BorderStyle="Double" ID="TabMSPSchedule" 
              CssClass="Initial" runat="server" OnClick="BtnMSPSchedule_Click" />
          <asp:Button Text="Size FOB & Invoice" BackColor="#a6a6a6"  BorderStyle="Double" ID="TabSizeFOB" 
              CssClass="Initial" runat="server" OnClick="TabSizeFOB_Click" />
                <asp:Button Text="Trash" BackColor="#a6a6a6"  BorderStyle="Double" ID="TabTrash" 
              CssClass="Initial" runat="server" OnClick="TabTrash_Click" />

         <asp:MultiView ID="MainView" runat="server">
            <asp:View ID="View1" runat="server">
                  <table style="width: 100%; border-width: 1px; border-color: #e6dede; border-style: solid">
                <tr>
                    <td>&nbsp;</td>
                   </tr>
                      <tr>
                <td>&nbsp;</td> <td>&nbsp;</td> <td>&nbsp;</td>   <td>
            <div style="overflow: hidden;" id="DivHeaderRow">
</div>
<div style="overflow:auto;" onscroll="OnScrollDiv(this)" id="DivMainContent" >
            <asp:GridView ID="GVMSPShedule" runat="server"   DataKeyNames="DID"
                AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" 
                BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black"
               Font-Size="Small"
                EnableModelValidation="True" Width="872px" >
               
                <Columns>
                    <asp:TemplateField HeaderText="No" ItemStyle-BackColor="DarkGray" HeaderStyle-BackColor="Olive">
                        <ItemTemplate><%# Container.DataItemIndex + 1 %></ItemTemplate>
                        <HeaderStyle BackColor="Olive"></HeaderStyle>
                        <ItemStyle BackColor="DarkGray"></ItemStyle>
                    </asp:TemplateField>
               
                   <asp:TemplateField HeaderText="DID" SortExpression="" Visible="false">
                        <ItemTemplate>
                            <asp:Label ID="DID" runat="server" Text='<%#Eval("DID") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                      <asp:TemplateField HeaderText="OrderNo" SortExpression="" Visible="">
                        <ItemTemplate>
                            <asp:Label ID="OrderNo" runat="server" Text='<%#Eval("OrderNo") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="StyleNo" SortExpression="" Visible="">
                        <ItemTemplate>
                            <asp:Label ID="StyleNo" runat="server" Text='<%#Eval("StyleNo") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                       <asp:TemplateField HeaderText="ColorName" SortExpression="" Visible="">
                        <ItemTemplate>
                            <asp:Label ID="ColorName" runat="server" Text='<%#Eval("ColorName") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                   
                     <asp:TemplateField HeaderText="BuyerPONo" SortExpression="" Visible="">
                        <ItemTemplate>
                            <asp:Label ID="BuyerPONo" runat="server" Text='<%#Eval("BuyerPONo") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                
                    <asp:TemplateField HeaderText="UserName" SortExpression="" Visible="">
                        <ItemTemplate>
                            <asp:Label ID="UserName" runat="server" Text='<%#Eval("UserName") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Last Activity On" SortExpression="" Visible="">
                        <ItemTemplate>
                            <asp:Label ID="ActivityDate" runat="server" Text='<%#Eval("ActivityDate") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                        <asp:TemplateField HeaderText="Form Name" SortExpression="" Visible="">
                        <ItemTemplate>
                            <asp:Label ID="FormName" runat="server" Text='<%#Eval("FormName") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                     <asp:TemplateField HeaderText="Scheduled On" SortExpression="" Visible="">
                        <ItemTemplate>
                            <asp:Label ID="ScheduledOn" runat="server" Text='<%#Eval("ScheduledOn") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                   
                </Columns>
                <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
               <%-- <HeaderStyle Wrap="true" BackColor="#333333" Font-Bold="True" ForeColor="White" />--%>
                <FooterStyle BackColor="#333333" Font-Bold="True" ForeColor="White"  CssClass="GVFixedFooter"/>
                <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" CssClass="GVFixedHeader" />

            </asp:GridView>
    </div>
                      </td>
                    </tr>
                      </table>
            </asp:View>
            <asp:View ID="View2" runat="server">
              <table style="width: 100%; border-width: 1px; border-color: #e6dede; border-style: solid">
               <tr>
                    <td>&nbsp;</td>
                   </tr>
                   <tr> <td>&nbsp;</td> <td>&nbsp;</td> <td>&nbsp;</td>
                  <td>
                    <div id="Div1" align="left">
<div style="overflow: hidden;" id="Div2">
</div>
<div style="overflow:auto;" onscroll="OnScrollDiv(this)" id="Div3" >
                <asp:GridView ID="GridTKT" runat="server" DataKeyNames="TAID"
                AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" 
                BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black"
                AllowSorting="True"  Font-Size="Small"
                EnableModelValidation="True" Width="872px" >
               
                <Columns>
                    <asp:TemplateField HeaderText="No" ItemStyle-BackColor="DarkGray" HeaderStyle-BackColor="Olive">
                        <ItemTemplate><%# Container.DataItemIndex + 1 %></ItemTemplate>
                        <HeaderStyle BackColor="Olive"></HeaderStyle>
                        <ItemStyle BackColor="DarkGray"></ItemStyle>
                    </asp:TemplateField>
               
                   <asp:TemplateField HeaderText="TAID" SortExpression="" Visible="false">
                        <ItemTemplate>
                            <asp:Label ID="TAID" runat="server" Text='<%#Eval("TAID") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                      <asp:TemplateField HeaderText="TKTID" SortExpression="" Visible="false">
                        <ItemTemplate>
                            <asp:Label ID="TKTID" runat="server" Text='<%#Eval("TKTID") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="TKTNo" SortExpression="" Visible="">
                        <ItemTemplate>
<%--                            <asp:Label ID="TKTNo" runat="server" Text='<%#Eval("TKTNo") %>'></asp:Label>--%>
                             <asp:LinkButton ID="TKTNo" runat="server" Text='<%#Eval("TKTNo") %>' ></asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Req. Category" SortExpression="" Visible="">
                        <ItemTemplate>
                            <asp:Label ID="ReqSubCat" runat="server" Text='<%#Eval("ReqSubCat") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                     <asp:TemplateField HeaderText="Discription" SortExpression="" Visible="">
                        <ItemTemplate>
                            <asp:Label ID="Discription" runat="server" Text='<%#Eval("Discription") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                       <asp:TemplateField HeaderText="RequestedBy" SortExpression="" Visible="">
                        <ItemTemplate>
                            <asp:Label ID="RequestedBy" runat="server" Text='<%#Eval("RequestedBy") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                   
                    <asp:TemplateField HeaderText="ApprovedBy" SortExpression="" Visible="">
                        <ItemTemplate>
                            <asp:Label ID="ApproveBuy" runat="server" Text='<%#Eval("ApproveBuy") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                
                    <asp:TemplateField HeaderText="ReqDateTime" SortExpression="" Visible="">
                        <ItemTemplate>
                            <asp:Label ID="ReqDate" runat="server" Text='<%#Eval("ReqDate") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                        <asp:TemplateField HeaderText="ApprovedDateTime" SortExpression="" Visible="">
                        <ItemTemplate>
                            <asp:Label ID="AppComMngDateTime" runat="server" Text='<%#Eval("AppComMngDateTime") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                   
                </Columns>
                <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
           
                <FooterStyle BackColor="#333333" Font-Bold="True" ForeColor="White"  CssClass="GVFixedFooter"/>
                <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" CssClass="GVFixedHeader" />

            </asp:GridView>
    </div>
</div>   
                  </td>
                </tr>
              </table>
            </asp:View>
               <asp:View ID="View3" runat="server">
              <table style="width: 100%; border-width: 1px; border-color: #e6dede; border-style: solid">
               <tr>
                    <td>&nbsp;</td>
                   </tr>
                   <tr>
                    <td>&nbsp;&nbsp;&nbsp;</td>
                  <td>
 <asp:GridView ID="GVBPO" runat="server"  OnRowDataBound="OnRowDataBound" 
     OnSorting="gridviewSorting_Sorting" DataKeyNames="POID"
                AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" 
                BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black"
                AllowSorting="True"  Font-Size="Small"
                EnableModelValidation="True" Width="872px" >
               
                <Columns>
                    <asp:TemplateField HeaderText="No" ItemStyle-BackColor="DarkGray" HeaderStyle-BackColor="Olive">
                        <ItemTemplate><%# Container.DataItemIndex + 1 %></ItemTemplate>
                        <HeaderStyle BackColor="Olive"></HeaderStyle>
                        <ItemStyle BackColor="DarkGray"></ItemStyle>
                    </asp:TemplateField>
               
                     <asp:TemplateField>
                                <ItemTemplate>
                                    <img alt="" src="images/plus.png" style="cursor: pointer" />
                                    <asp:Panel ID="pnlOrders" runat="server" Style="display: none">
                                        <asp:GridView ID="gvColorList" runat="server" AutoGenerateColumns="false" Font-Size="Small"                                         
                                            HeaderStyle-BackColor="#666666" HeaderStyle-ForeColor="White"  ShowFooter="false" OnRowDataBound="gvColorList_RowDataBound"
                                            RowStyle-Wrap="False">
                                            <Columns>
                                                <asp:TemplateField HeaderStyle-BackColor="#333333" HeaderText="No" ItemStyle-BackColor="DarkGray">
                                                    <ItemTemplate>
                                                        <%# Container.DataItemIndex + 1 %>
                                                    </ItemTemplate>
                                                    <HeaderStyle BackColor="#333333" />
                                                    <ItemStyle BackColor="DarkGray" />
                                                </asp:TemplateField>
                                              
                                                  <asp:TemplateField HeaderText="Color Name" ItemStyle-HorizontalAlign="Left" Visible="true">
                        <ItemTemplate>
                            <asp:Label ID="ColorName" runat="server"  Text='<%#Eval("ColorName") %>' ></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                                                  <asp:TemplateField HeaderText="Color Code" ItemStyle-HorizontalAlign="Left" Visible="true">
                        <ItemTemplate>
                            <asp:Label ID="ColorCode" runat="server"  Text='<%#Eval("ColorCode") %>' ></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                       <asp:TemplateField HeaderText="Qty" ItemStyle-HorizontalAlign="Right" Visible="true">
                        <ItemTemplate>
                            <asp:Label ID="Qty" runat="server"  Text='<%#Eval("Qty") %>' ></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                                            </Columns>
                                             <FooterStyle HorizontalAlign="Right" BackColor="#333333" Font-Bold="True" ForeColor="White" CssClass="GVFixedFooter" />
                                        </asp:GridView>
                                          </asp:Panel>
                                </ItemTemplate>
                            </asp:TemplateField>
                   <asp:TemplateField HeaderText="POID" SortExpression="" Visible="true">
                        <ItemTemplate>
                            <asp:Label ID="POID" runat="server" Text='<%#Eval("POID") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                      <asp:TemplateField HeaderText="Buyer PO No" SortExpression="" Visible="true">
                        <ItemTemplate>
                            <asp:Label ID="BuyerPONo" runat="server" Text='<%#Eval("BuyerPONo") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                  
                    <asp:TemplateField HeaderText="Contract No" SortExpression="" Visible="">
                        <ItemTemplate>
                            <asp:Label ID="ContractNo" runat="server" Text='<%#Eval("ContractNo") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                     <asp:TemplateField HeaderText="Buyer PO Qty" SortExpression="" Visible="">
                        <ItemTemplate>
                            <asp:Label ID="ReqQty" runat="server" Text='<%#Eval("ReqQty") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                     <asp:TemplateField HeaderText="Extended Ship Date" SortExpression="" Visible="">
                        <ItemTemplate>
                            <asp:Label ID="ExtendedShipDate" runat="server" Text='<%#Eval("ExtendedShipDate","{0:dd/MMM/yyyy}") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                   
                </Columns>
                <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
           
                <FooterStyle BackColor="#333333" Font-Bold="True" ForeColor="White"  CssClass="GVFixedFooter"/>
                <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" CssClass="GVFixedHeader" />

            </asp:GridView>
                      </td>
                    </tr>
                  </table>
                   </asp:View>

              <asp:View ID="View4" runat="server">
              <table style="width: 100%; border-width: 1px; border-color: #e6dede; border-style: solid">
               <tr>
                    <td>&nbsp;</td>
                   </tr>
                   <tr>
                    <td>&nbsp;&nbsp;&nbsp;</td>
                  <td>
 <asp:GridView ID="GVMSPDeliveries" runat="server"  OnRowDataBound="gvDeliveries_RowDataBound" 
                AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" 
                BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black"
                AllowSorting="True"  Font-Size="Small"
                EnableModelValidation="True" Width="1272px" >               
                <Columns>
                 <%--   <asp:TemplateField Visible="true">
                                                                        <ItemTemplate>
                                                                            <asp:ImageButton ID="imgbtnColorView" OnClick="imgbtnColorView_Click"  runat="server" Height="30px" ImageUrl="~/images/DPlus.png"  ToolTip="" Width="30px" />
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>--%>
                                            <asp:BoundField  DataField="DID" HeaderText="DID" Visible="true" />
                                            <asp:BoundField DataField="OrderNo" HeaderText="OrderNo" Visible="false" />
                                            <asp:BoundField DataField="BPOID" HeaderText="BPOID" Visible="false" />
                                            <asp:BoundField DataField="SDID" HeaderText="SDID" Visible="false" />
                                            <asp:BoundField DataField="SDSEQ" HeaderText="SDSEQ" Visible="false" />
                                            <asp:BoundField DataField="Main" HeaderText="Main" Visible="false" />
                                            <asp:BoundField DataField="MDID" HeaderText="MDID" Visible="false" />
                                            <asp:TemplateField HeaderText="POShipDate" Visible="false">
                                                <ItemTemplate>
                                                    <asp:Label ID="POShipDate" runat="server" Text='<%#Eval("POShipDate","{0:dd/MM/yyyy}") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                              <asp:TemplateField HeaderText="Buyer" Visible="false">
                                                <ItemTemplate>
                                                    <asp:Label ID="BuyerName" runat="server" Text='<%#Eval("BuyerName") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Item" Visible="false">
                                                <ItemTemplate>
                                                    <asp:Label ID="ItemDescription" runat="server" Text='<%#Eval("ItemDescription") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Dep" Visible="false">
                                                <ItemTemplate>
                                                    <asp:Label ID="DeptName" runat="server" Text='<%#Eval("DeptName") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="CDID" Visible="false">
                                                <ItemTemplate>
                                                    <asp:Label ID="CDID" runat="server" Text='<%#Eval("CDID") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="AQLDate" Visible="false">
                                                <ItemTemplate>
                                                    <asp:Label ID="AQLDate" runat="server" Text='<%#Eval("AQLDate","{0:dd/MM/yyyy}") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="ShipmentCompleate" Visible="false">
                                                <ItemTemplate>
                                                    <asp:Label ID="ShipmentCompleate" runat="server" Text='<%#Eval("ShipmentCompleate") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Shipped" Visible="false">
                                                <ItemTemplate>
                                                    <asp:Label ID="Shipped" runat="server" Text='<%#Eval("Shipped") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="WRH" Visible="false">
                                                <ItemTemplate>
                                                    <asp:Label ID="WRH" runat="server" Text='<%#Eval("WRH") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Plant" ItemStyle-Width="3%">
                                                <ItemTemplate>
                                                    <asp:Label ID="Scheduled" ToolTip="Plant" runat="server" Text='<%#Eval("ScheduledFactory") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Buyer" ItemStyle-Width="5%">
                                                <ItemTemplate>
                                                    <asp:Label ID="BuyerCode" ToolTip="Buyer"  runat="server" Text='<%#Eval("BuyerCode") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Style" ItemStyle-Width="7%">
                                                <ItemTemplate>
                                                    <asp:Label ID="StyleNo" ToolTip="Style"  Font-Size="Small" runat="server" Text='<%#Eval("StyleNo") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Ship Mode" ItemStyle-Width="5%">
                                                <ItemTemplate>
                                                    <asp:Label ToolTip="Ship Mode" ID="ShipMode" Font-Size="Small" runat="server" Text='<%#Eval("ShipMode") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Color" ItemStyle-Width="7%">
                                                <ItemTemplate>
                                                    <asp:Label ID="ColorName" ToolTip="Color" Font-Size="Small" runat="server" Text='<%#Eval("ColorName") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Buyer PO No" ItemStyle-Width="7%">
                                                <ItemTemplate>
                                                    <asp:Label ID="BuyerPONo" ToolTip="Buyer PO No" Font-Size="Small" runat="server" Text='<%#Eval("BuyerPONo") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Contract No" ItemStyle-Width="7%">
                                                <ItemTemplate>
                                                    <asp:Label ID="ContractNo" ToolTip="ContractNo" Font-Size="Small" runat="server" Text='<%#Eval("ContractNo") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="BPO Qty" ItemStyle-HorizontalAlign="Right"
                                                ItemStyle-Width="6%">
                                                <ItemTemplate>
                                                    <asp:Label ID="BuyerPOQty" ToolTip="BPO Qty" Font-Bold="true"  runat="server" Text='<%#Eval("BuyerPOQty") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="SPO Qty" ItemStyle-HorizontalAlign="Right"
                                                ItemStyle-Width="5%">
                                                <ItemTemplate>
                                                   <asp:Label ID="SumithraPOQty" ToolTip="SPO Qty" runat="server" Text='<%#Eval("SumithraPOQty") %>'></asp:Label>
                                                    <%--<asp:Label ID="SumithraPOQty" ToolTip='<%#Eval("CAStatus")%>' runat="server" Text='<%#Eval("SumithraPOQty") %>'></asp:Label>--%>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="FOB" ItemStyle-HorizontalAlign="Right"
                                                ItemStyle-Width="5%">
                                                <ItemTemplate>
                                                    <asp:Label ID="FOB" ToolTip="FOB" runat="server" Text='<%#Eval("FOB","{0:n}") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Exp.Inc" ItemStyle-HorizontalAlign="Right"
                                                ItemStyle-Width="8%">
                                                <ItemTemplate>
                                                    <asp:Label ID="FOB_SPO" ToolTip="Exp.Inc" runat="server"></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Buyer's PO Date" ItemStyle-HorizontalAlign="Right"
                                                ItemStyle-Width="7%">
                                                <ItemTemplate>
                                                    <asp:Label ID="ShipDate"    runat="server" tooltip='<%# Eval("DespatchedOn","{0:dd/MMM/yyyy}") %>' Text='<%#Eval("ExtendedShipDate","{0:dd/MMM/yyyy}") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                             <asp:TemplateField HeaderText="Delivery Date" ItemStyle-Width="100" Visible="true">
                                                <ItemTemplate>
                                                    <asp:Label ID="DeliveryDate" Font-Bold="true" runat="server" Text='<%#Eval("DeliveryDate","{0:dd/MMM/yyyy}") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Del#" ItemStyle-Width="3%">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblDEL" ToolTip="Del#" runat="server" Text="DEL#"></asp:Label><asp:Label ID="DeliveryNo" runat="server" Text='<%#Eval("DeliveryNo") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>                                            
                                            <asp:TemplateField HeaderText="Meeting Date" ItemStyle-Width="8%">
                                                <ItemTemplate>
                                                    <asp:Label ID="RevisedDate" ToolTip="Meeting Date" runat="server" Text='<%#Eval("RevisedDate","{0:dd/MMM/yyyy}") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                                
                                            <asp:TemplateField HeaderText="Comment" ItemStyle-Width="8%">
                                                <ItemTemplate>
                                                    <asp:Label ID="Comment" ToolTip="Comment" Font-Size="Small" runat="server" Text='<%#Eval("Comment") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Committed Qty" ItemStyle-HorizontalAlign="Right" ItemStyle-Width="3%">
                                                <ItemTemplate>
                                                    <asp:Label ID="DeliveryQty" ToolTip="Committed Qty" runat="server" Text='<%#Eval("DeliveryQty") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Ship Qty" ItemStyle-HorizontalAlign="Right" ItemStyle-Width="3%">
                                                <ItemTemplate>
                                                    <asp:Label ID="ShippedQty" ToolTip="Ship Qty" runat="server" Text='<%#Eval("ShippedQty") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Var" ItemStyle-HorizontalAlign="Right" ItemStyle-Width="3%">
                                                <ItemTemplate>
                                                    <asp:Label ID="DelDesVar" ToolTip="Var" runat="server" Text='<%#Eval("Varience") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Status" ItemStyle-Width="8%">
                                                <ItemTemplate>
                                                    <asp:Label ID="Status" ToolTip="Status" runat="server"></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Date Difference" ItemStyle-Width="">
                                                <ItemTemplate>
                                                    <asp:Label ID="labDifference" ToolTip="Date Difference" Text='<%#Eval("datedif") %>' runat="server"></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Cancel" Visible="false">
                            <ItemTemplate>                           
                                <asp:Label ID="labCancel" runat="server" Visible="true" Text='<%#Eval("Cancel") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                                      <asp:TemplateField HeaderText="Cancel"  Visible="true">
                            <ItemTemplate>                           
                                <asp:Label ID="labCancelRemarks" ToolTip="Cancel" runat="server" Visible="true" Text='<%#Eval("CancelRe") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                                      <asp:TemplateField HeaderText="ColorCode"  Visible="false">
                            <ItemTemplate>                           
                                <asp:Label ID="ColorCode" runat="server" Visible="true" Text='<%#Eval("ColorCode") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
 <asp:TemplateField HeaderText="OrderNo"  Visible="false">
                            <ItemTemplate>                           
                                <asp:Label ID="OrderNo" runat="server" Visible="true" Text='<%#Eval("OrderNo") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
 <asp:TemplateField HeaderText="HandedOver" Visible="false">
                            <ItemTemplate>
                                <asp:Label ID="HandedOver" runat="server" Text='<%#Eval("HandedOver") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                     <asp:TemplateField HeaderText="Dispatched Date" ItemStyle-Width="100" Visible="true">
                                                <ItemTemplate>
                                                    <asp:Label ID="shipDespatchedOn" Font-Bold="true" runat="server" Text='<%#Eval("shipDespatchedOn","{0:dd/MMM/yyyy}") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                </Columns>
                <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
           
                <FooterStyle BackColor="#333333" Font-Bold="True" ForeColor="White"  CssClass="GVFixedFooter"/>
                <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" CssClass="GVFixedHeader" />

            </asp:GridView>
                      </td>
                    </tr>
                  </table>
                   </asp:View>


              <asp:View ID="View5" runat="server">
              <table style="width: 100%; border-width: 1px; border-color: #e6dede; border-style: solid">
               <tr>
                    <td>&nbsp;</td>
                   </tr>
                   <tr>
                    <td>&nbsp;&nbsp;&nbsp;</td>
                  <td>
  <asp:GridView ID="gvsizeList" FooterStyle-Font-Bold="true" runat="server" AllowSorting="True"  Width="70%"
                          
                        AutoGenerateColumns="False" BackColor="White" BorderColor="#cccccc" BorderWidth="2px" CellPadding="4"
                         EnableModelValidation="True" Font-Size="Small" ForeColor="Black" Height="96px" ShowFooter="false" > 
                   
                        <Columns>
                           
                                                <asp:TemplateField HeaderStyle-BackColor="#333333" HeaderText="No" ItemStyle-BackColor="DarkGray">
                                                    <ItemTemplate>
                                                        <%# Container.DataItemIndex + 1 %>
                                                    </ItemTemplate>
                                                    <HeaderStyle BackColor="#333333" />
                                                    <ItemStyle BackColor="DarkGray" />
                                                </asp:TemplateField>
                                               <%-- <asp:BoundField DataField="DID" HeaderText="DID" Visible="false" />                 --%>                               

                        <asp:TemplateField HeaderText="SHIP_NUMBER" Visible="true" >
                        <ItemTemplate>
                            <asp:Label ID="SHIP_NUMBER" runat="server"  Text='<%#Eval("SHIP_NUMBER") %>' ></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                           <asp:BoundField DataField="SizeDesc" HeaderText="SizeDesc" />
                           <asp:TemplateField HeaderText="FOB" ItemStyle-HorizontalAlign="Right" Visible="true">
                        <ItemTemplate>
                            <asp:Label ID="FC" runat="server"  Text=' <%#Eval("FOB","{0:n}")%>'   ></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>   
                        <asp:TemplateField HeaderText="Processed"  Visible="true">
                        <ItemTemplate>
                            <asp:Label ID="Processed" runat="server"  Text=' <%#Eval("Processed")%>'  ></asp:Label>
                        </ItemTemplate>
                           <FooterTemplate>
                              <div>  <asp:Label ID="lblTTLAverageValue"   runat="server" /> </div> 
                                </FooterTemplate>  
                    </asp:TemplateField>    
                                              <%--  <asp:BoundField DataField="ActualFOB" HeaderText="Actual FOB" />--%>
                                                <%-- <asp:BoundField DataField="ActualValue" HeaderText="Actual Value" />--%>
                        <asp:TemplateField HeaderText="Shipped Qty" ItemStyle-HorizontalAlign="Right" Visible="true">
                        <ItemTemplate>
                            <asp:Label ID="ShippedQty" runat="server" Text=' <%#Eval("ShippedQty")%>'  ></asp:Label>
                        </ItemTemplate>
                           
                    </asp:TemplateField>

                          <asp:TemplateField HeaderText="BuyerPONo"  Visible="true">
                        <ItemTemplate>
                            <asp:Label ID="BuyerPONo"  runat="server"  Text=' <%#Eval("BuyerPONo")%>' ></asp:Label>
                        </ItemTemplate>
                           <FooterTemplate>
                              <div>  <asp:Label ID="lblTTLActualValue"   runat="server" /> </div> 
                                </FooterTemplate>  
                    </asp:TemplateField>
                               


                                                 
                                           
                                      
                        </Columns>
                        <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
                        <%-- <HeaderStyle Wrap="true" BackColor="#333333" Font-Bold="True" ForeColor="White" />--%>
                        <FooterStyle BackColor="#333333" Font-Bold="True" ForeColor="White" CssClass="GVFixedFooter" />
                        <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" CssClass="GVFixedHeader" />
                    </asp:GridView>
                      </td>
                    </tr>
                  </table>
                   </asp:View>

               <asp:View ID="View6" runat="server">
              <table style="width: 100%; border-width: 1px; border-color: #e6dede; border-style: solid">
               <tr>
                    <td>&nbsp;</td>
                   </tr>
                   <tr>
                       <td>&nbsp;&nbsp;&nbsp;</td>
                       <td>
                           <asp:GridView ID="GVTrash" runat="server" AllowSorting="True" AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" EnableModelValidation="True" Font-Size="Small" ForeColor="Black" Width="1272px">
                               <Columns>
                                   <%--   <asp:TemplateField Visible="true">
                                                                        <ItemTemplate>
                                                                            <asp:ImageButton ID="imgbtnColorView" OnClick="imgbtnColorView_Click"  runat="server" Height="30px" ImageUrl="~/images/DPlus.png"  ToolTip="" Width="30px" />
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>--%>
                                   <asp:BoundField DataField="DID" HeaderText="DID" Visible="true" />
                                   <asp:BoundField DataField="OrderNo" HeaderText="OrderNo" Visible="false" />
                                   <asp:BoundField DataField="BPOID" HeaderText="BPOID" Visible="false" />
                                   <asp:BoundField DataField="SDID" HeaderText="SDID" Visible="false" />
                                   <asp:BoundField DataField="SDSEQ" HeaderText="SDSEQ" Visible="false" />
                                   <asp:BoundField DataField="Main" HeaderText="Main" Visible="false" />
                                   <asp:BoundField DataField="MDID" HeaderText="MDID" Visible="false" />
                                   <asp:TemplateField HeaderText="POShipDate" Visible="false">
                                       <ItemTemplate>
                                           <asp:Label ID="POShipDate0" runat="server" Text='<%#Eval("POShipDate","{0:dd/MM/yyyy}") %>'></asp:Label>
                                       </ItemTemplate>
                                   </asp:TemplateField>
                                   <asp:TemplateField HeaderText="Buyer" Visible="false">
                                       <ItemTemplate>
                                           <asp:Label ID="BuyerName0" runat="server" Text='<%#Eval("BuyerName") %>'></asp:Label>
                                       </ItemTemplate>
                                   </asp:TemplateField>
                                   <asp:TemplateField HeaderText="Item" Visible="false">
                                       <ItemTemplate>
                                           <asp:Label ID="ItemDescription0" runat="server" Text='<%#Eval("ItemDescription") %>'></asp:Label>
                                       </ItemTemplate>
                                   </asp:TemplateField>
                                   <asp:TemplateField HeaderText="Dep" Visible="false">
                                       <ItemTemplate>
                                           <asp:Label ID="DeptName0" runat="server" Text='<%#Eval("DeptName") %>'></asp:Label>
                                       </ItemTemplate>
                                   </asp:TemplateField>
                                   <asp:TemplateField HeaderText="CDID" Visible="false">
                                       <ItemTemplate>
                                           <asp:Label ID="CDID0" runat="server" Text='<%#Eval("CDID") %>'></asp:Label>
                                       </ItemTemplate>
                                   </asp:TemplateField>
                                   <asp:TemplateField HeaderText="AQLDate" Visible="false">
                                       <ItemTemplate>
                                           <asp:Label ID="AQLDate0" runat="server" Text='<%#Eval("AQLDate","{0:dd/MM/yyyy}") %>'></asp:Label>
                                       </ItemTemplate>
                                   </asp:TemplateField>
                                   <asp:TemplateField HeaderText="ShipmentCompleate" Visible="false">
                                       <ItemTemplate>
                                           <asp:Label ID="ShipmentCompleate0" runat="server" Text='<%#Eval("ShipmentCompleate") %>'></asp:Label>
                                       </ItemTemplate>
                                   </asp:TemplateField>
                                   <asp:TemplateField HeaderText="Shipped" Visible="false">
                                       <ItemTemplate>
                                           <asp:Label ID="Shipped0" runat="server" Text='<%#Eval("Shipped") %>'></asp:Label>
                                       </ItemTemplate>
                                   </asp:TemplateField>
                                   <asp:TemplateField HeaderText="WRH" Visible="false">
                                       <ItemTemplate>
                                           <asp:Label ID="WRH0" runat="server" Text='<%#Eval("WRH") %>'></asp:Label>
                                       </ItemTemplate>
                                   </asp:TemplateField>
                                   <asp:TemplateField HeaderText="Plant" ItemStyle-Width="3%">
                                       <ItemTemplate>
                                           <asp:Label ID="Scheduled0" runat="server" Text='<%#Eval("ScheduledFactory") %>' ToolTip="Plant"></asp:Label>
                                       </ItemTemplate>
                                   </asp:TemplateField>
                                   <asp:TemplateField HeaderText="Buyer" ItemStyle-Width="5%">
                                       <ItemTemplate>
                                           <asp:Label ID="BuyerCode0" runat="server" Text='<%#Eval("BuyerCode") %>' ToolTip="Buyer"></asp:Label>
                                       </ItemTemplate>
                                   </asp:TemplateField>
                                   <asp:TemplateField HeaderText="Style" ItemStyle-Width="7%">
                                       <ItemTemplate>
                                           <asp:Label ID="StyleNo0" runat="server" Font-Size="Small" Text='<%#Eval("StyleNo") %>' ToolTip="Style"></asp:Label>
                                       </ItemTemplate>
                                   </asp:TemplateField>
                                   <asp:TemplateField HeaderText="Ship Mode" ItemStyle-Width="5%">
                                       <ItemTemplate>
                                           <asp:Label ID="ShipMode0" runat="server" Font-Size="Small" Text='<%#Eval("ShipMode") %>' ToolTip="Ship Mode"></asp:Label>
                                       </ItemTemplate>
                                   </asp:TemplateField>
                                   <asp:TemplateField HeaderText="Color" ItemStyle-Width="7%">
                                       <ItemTemplate>
                                           <asp:Label ID="ColorName0" runat="server" Font-Size="Small" Text='<%#Eval("ColorName") %>' ToolTip="Color"></asp:Label>
                                       </ItemTemplate>
                                   </asp:TemplateField>
                                   <asp:TemplateField HeaderText="Buyer PO No" ItemStyle-Width="7%">
                                       <ItemTemplate>
                                           <asp:Label ID="BuyerPONo0" runat="server" Font-Size="Small" Text='<%#Eval("BuyerPONo") %>' ToolTip="Buyer PO No"></asp:Label>
                                       </ItemTemplate>
                                   </asp:TemplateField>
                                   <asp:TemplateField HeaderText="Contract No" ItemStyle-Width="7%">
                                       <ItemTemplate>
                                           <asp:Label ID="ContractNo0" runat="server" Font-Size="Small" Text='<%#Eval("ContractNo") %>' ToolTip="ContractNo"></asp:Label>
                                       </ItemTemplate>
                                   </asp:TemplateField>
                                   <asp:TemplateField HeaderText="BPO Qty" ItemStyle-HorizontalAlign="Right" ItemStyle-Width="6%">
                                       <ItemTemplate>
                                           <asp:Label ID="BuyerPOQty0" runat="server" Font-Bold="true" Text='<%#Eval("BuyerPOQty") %>' ToolTip="BPO Qty"></asp:Label>
                                       </ItemTemplate>
                                   </asp:TemplateField>
                                   <asp:TemplateField HeaderText="SPO Qty" ItemStyle-HorizontalAlign="Right" ItemStyle-Width="5%">
                                       <ItemTemplate>
                                           <asp:Label ID="SumithraPOQty0" runat="server" Text='<%#Eval("SumithraPOQty") %>' ToolTip="SPO Qty"></asp:Label>
                                           <%--<asp:Label ID="SumithraPOQty" ToolTip='<%#Eval("CAStatus")%>' runat="server" Text='<%#Eval("SumithraPOQty") %>'></asp:Label>--%>
                                       </ItemTemplate>
                                   </asp:TemplateField>
                                   <asp:TemplateField HeaderText="FOB" ItemStyle-HorizontalAlign="Right" ItemStyle-Width="5%">
                                       <ItemTemplate>
                                           <asp:Label ID="FOB0" runat="server" Text='<%#Eval("FOB","{0:n}") %>' ToolTip="FOB"></asp:Label>
                                       </ItemTemplate>
                                   </asp:TemplateField>
                                   <asp:TemplateField HeaderText="Exp.Inc" ItemStyle-HorizontalAlign="Right" ItemStyle-Width="8%">
                                       <ItemTemplate>
                                           <asp:Label ID="FOB_SPO0" runat="server" ToolTip="Exp.Inc"></asp:Label>
                                       </ItemTemplate>
                                   </asp:TemplateField>
                                   <asp:TemplateField HeaderText="Buyer's PO Date" ItemStyle-HorizontalAlign="Right" ItemStyle-Width="7%">
                                       <ItemTemplate>
                                           <asp:Label ID="ShipDate0" runat="server" Text='<%#Eval("ExtendedShipDate","{0:dd/MMM/yyyy}") %>' tooltip='<%# Eval("DespatchedOn","{0:dd/MMM/yyyy}") %>'></asp:Label>
                                       </ItemTemplate>
                                   </asp:TemplateField>
                                   <asp:TemplateField HeaderText="Delivery Date" ItemStyle-Width="100" Visible="true">
                                       <ItemTemplate>
                                           <asp:Label ID="DeliveryDate0" runat="server" Font-Bold="true" Text='<%#Eval("DeliveryDate","{0:dd/MMM/yyyy}") %>'></asp:Label>
                                       </ItemTemplate>
                                   </asp:TemplateField>
                                   <asp:TemplateField HeaderText="Del#" ItemStyle-Width="3%">
                                       <ItemTemplate>
                                           <asp:Label ID="lblDEL0" runat="server" Text="DEL#" ToolTip="Del#"></asp:Label>
                                           <asp:Label ID="DeliveryNo0" runat="server" Text='<%#Eval("DeliveryNo") %>'></asp:Label>
                                       </ItemTemplate>
                                   </asp:TemplateField>
                                   <asp:TemplateField HeaderText="Meeting Date" ItemStyle-Width="8%">
                                       <ItemTemplate>
                                           <asp:Label ID="RevisedDate0" runat="server" Text='<%#Eval("RevisedDate","{0:dd/MMM/yyyy}") %>' ToolTip="Meeting Date"></asp:Label>
                                       </ItemTemplate>
                                   </asp:TemplateField>
                                   <asp:TemplateField HeaderText="Comment" ItemStyle-Width="8%">
                                       <ItemTemplate>
                                           <asp:Label ID="Comment0" runat="server" Font-Size="Small" Text='<%#Eval("Comment") %>' ToolTip="Comment"></asp:Label>
                                       </ItemTemplate>
                                   </asp:TemplateField>
                                   <asp:TemplateField HeaderText="Committed Qty" ItemStyle-HorizontalAlign="Right" ItemStyle-Width="3%">
                                       <ItemTemplate>
                                           <asp:Label ID="DeliveryQty0" runat="server" Text='<%#Eval("DeliveryQty") %>' ToolTip="Committed Qty"></asp:Label>
                                       </ItemTemplate>
                                   </asp:TemplateField>
                                   <asp:TemplateField HeaderText="Ship Qty" ItemStyle-HorizontalAlign="Right" ItemStyle-Width="3%">
                                       <ItemTemplate>
                                           <asp:Label ID="ShippedQty0" runat="server" Text='<%#Eval("ShippedQty") %>' ToolTip="Ship Qty"></asp:Label>
                                       </ItemTemplate>
                                   </asp:TemplateField>
                                   <asp:TemplateField HeaderText="Var" ItemStyle-HorizontalAlign="Right" ItemStyle-Width="3%">
                                       <ItemTemplate>
                                           <asp:Label ID="DelDesVar0" runat="server" Text='<%#Eval("Varience") %>' ToolTip="Var"></asp:Label>
                                       </ItemTemplate>
                                   </asp:TemplateField>
                                   <asp:TemplateField HeaderText="Status" ItemStyle-Width="8%">
                                       <ItemTemplate>
                                           <asp:Label ID="Status0" runat="server" ToolTip="Status"></asp:Label>
                                       </ItemTemplate>
                                   </asp:TemplateField>
                                   <asp:TemplateField HeaderText="Date Difference" ItemStyle-Width="">
                                       <ItemTemplate>
                                           <asp:Label ID="labDifference0" runat="server" Text='<%#Eval("datedif") %>' ToolTip="Date Difference"></asp:Label>
                                       </ItemTemplate>
                                   </asp:TemplateField>
                                   <asp:TemplateField HeaderText="Cancel" Visible="false">
                                       <ItemTemplate>
                                           <asp:Label ID="labCancel0" runat="server" Text='<%#Eval("Cancel") %>' Visible="true"></asp:Label>
                                       </ItemTemplate>
                                   </asp:TemplateField>
                                   <asp:TemplateField HeaderText="Cancel" Visible="true">
                                       <ItemTemplate>
                                           <asp:Label ID="labCancelRemarks0" runat="server" Text='<%#Eval("CancelRe") %>' ToolTip="Cancel" Visible="true"></asp:Label>
                                       </ItemTemplate>
                                   </asp:TemplateField>
                                   <asp:TemplateField HeaderText="ColorCode" Visible="false">
                                       <ItemTemplate>
                                           <asp:Label ID="ColorCode0" runat="server" Text='<%#Eval("ColorCode") %>' Visible="true"></asp:Label>
                                       </ItemTemplate>
                                   </asp:TemplateField>
                                   <asp:TemplateField HeaderText="OrderNo" Visible="false">
                                       <ItemTemplate>
                                           <asp:Label ID="OrderNo0" runat="server" Text='<%#Eval("OrderNo") %>' Visible="true"></asp:Label>
                                       </ItemTemplate>
                                   </asp:TemplateField>
                                   <asp:TemplateField HeaderText="HandedOver" Visible="false">
                                       <ItemTemplate>
                                           <asp:Label ID="HandedOver0" runat="server" Text='<%#Eval("HandedOver") %>'></asp:Label>
                                       </ItemTemplate>
                                   </asp:TemplateField>
                                   <asp:TemplateField HeaderText="Dispatched Date" ItemStyle-Width="100" Visible="true">
                                       <ItemTemplate>
                                           <asp:Label ID="shipDespatchedOn0" runat="server" Font-Bold="true" Text='<%#Eval("shipDespatchedOn","{0:dd/MMM/yyyy}") %>'></asp:Label>
                                       </ItemTemplate>
                                   </asp:TemplateField>
                               </Columns>
                               <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
                               <FooterStyle BackColor="#333333" CssClass="GVFixedFooter" Font-Bold="True" ForeColor="White" />
                               <HeaderStyle BackColor="#333333" CssClass="GVFixedHeader" Font-Bold="True" ForeColor="White" />
                           </asp:GridView>
                       </td>
                  </tr>
                   <tr>
                    <td>&nbsp;&nbsp;&nbsp;</td>
                  <td>
                      &nbsp;</td>
                    </tr>
                  </table>
                   </asp:View>
             </asp:MultiView>
     
</div>
            
            <br />
        </div>
        <asp:Button ID="btnShowPopup" runat="server" Style="display: none" />
    
        <asp:Panel ID="pnlpopup" runat="server" BackColor="White" Height="500px" Width="1200px"
            Style="display: none; overflow: scroll; border: Solid 3px #D55500;">
            <div class="container">
                <div class="row">
                    <div class="col-md-11">
                        <h3 style="text-align: center">Delivery Breakdown</h3>
                    </div>
                    <div class="col-md-1">
                        <br />
                        <asp:ImageButton ID="btnCancel" runat="server" ImageUrl="~/images/Cancel.png" Width="20" Height="20" CssClass="pull-right" />
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12">
                        <div class="panel panel-default">
                            <div class="panel-body">
                                <div class="col-md-2">
                                    <strong>
                                        <asp:Label ID="Label1" runat="server" Text="BuyerPONo:"></asp:Label>
                                    </strong>&nbsp;<asp:Label ID="lblBPO" runat="server"></asp:Label>
                                </div>
                                <div class="col-md-2">
                                    <strong>
                                        <asp:Label ID="Label3" runat="server" Text="ContractNo :"></asp:Label>
                                        &nbsp;</strong><asp:Label ID="lblContractNo" runat="server"></asp:Label>
                                </div>
                                <div class="col-md-3">
                                    <strong>
                                        <asp:Label ID="Label5" runat="server" Text="ColorName  :"></asp:Label>
                                        &nbsp; </strong>
                                    <asp:Label ID="lblColorName" runat="server"></asp:Label>
                                </div>
                                <div class="col-md-2">
                                    <strong>
                                        <asp:Label ID="Label7" runat="server" Text="SumithraPOQty :"></asp:Label>
                                        &nbsp;</strong><asp:Label ID="lblSPOQty" runat="server"></asp:Label>
                                </div>
                                 <div class="col-md-2">
                                    <strong>
                                        <asp:Label ID="Label2" runat="server" Text="BuyerPOQty :"></asp:Label>
                                        &nbsp;</strong><asp:Label ID="LabelBuyerPOQty" runat="server"></asp:Label>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12">
                        <div class="card" style="width: 100%; height: 100%">
                            <ul class="nav nav-tabs" role="tablist">
                                <li role="presentation" class="active"><a href="#add" aria-controls="add" role="tab" data-toggle="tab">Add</a></li>
                             <%--   <li role="presentation"><a href="#view" aria-controls="view" role="tab" data-toggle="tab">View</a></li>--%>
                                <%--<li role="presentation"><a href="#summary" aria-controls="summary" role="tab" data-toggle="tab">Delivery History</a></li>--%>
                            </ul>
                            <div class="tab-content">
                                <div role="tabpanel" class="tab-pane active" id="add">

                                      <div class="col-md-12">
                                                <asp:GridView ID="GridViewMultiplePlants" runat="server" AutoGenerateColumns="False"
                                           
                                                    BackColor="White" BorderWidth="1px" CellPadding="4"
                                                    EnableModelValidation="True" ForeColor="Black" Width="90%">
                                                    <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White"
                                                        Wrap="False" />
                                                    <Columns>
                                                                                                     
                                                      
                                                      
                                                        <asp:TemplateField HeaderText="Delivery#">
                                                            <ItemTemplate>
                                                               <asp:Label ID="lblDeliveryNO" runat="server" Text='<%#Eval("DeliveryNo") %>'></asp:Label>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                       
                                                        <asp:TemplateField HeaderText="Promissed Qty">
                                                            <ItemTemplate>
                                                                  <asp:TextBox ID="txtPromissedQty" runat="server" Text="0"  Width="90px" />
                                                               
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Delivery Date">
                                                            <ItemTemplate>
                                                                <BDP:BasicDatePicker  ID="BDPDelivery"    runat="server" CssClass="form-control" />
                                                                <%--<asp:Label ID="DeliveryDate" runat="server" Text='<%#Eval("DeliveryDate") %>' Width="90px" />--%>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Comment">
                                                            <ItemTemplate>
                                                               <asp:TextBox ID="txtComment" runat="server"  Width="300px" />                                                                
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText = "Plant">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblPlant" runat="server" Text='<%# Eval("Plant") %>' Visible = "false" />
                                                                    <asp:DropDownList ID="ddlPlant" runat="server">
                                                                    </asp:DropDownList>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                        
                                                    </Columns>
                                                </asp:GridView>
                                            </div>
                                   
                                   
                                    <div class="col-md-12">
                                        <div class="box-body">
                                            <div class="form-group">
                                               

                                                <div class="col-md-3">
                                                   <%-- <asp:Button ID="btnUpdate" CssClass="btn btn-primary" runat="server" Text="Update" OnClick="btnUpdate_Click" Visible="false" />
                                                    <asp:Button ID="btnupdateCancel" CssClass="btn btn-warning" runat="server" Text="Cancel" OnClick="btncancel_Click" Visible="false" />--%>
                                                  

                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                         <%--       <div role="tabpanel" class="tab-pane" id="view">
                                    <div class="col-md-12">
                                        <div class="box-body">
                                          
                                            <div class="col-md-12">
                                                <asp:GridView ID="gvDeliveryBD" runat="server" AutoGenerateColumns="False" OnRowDataBound="gvDeliveryBD_RowDataBound" DataKeyNames="DID"
                                              OnSorting="gvDeliveryBD_Sorting" 
                                                    BackColor="White" BorderWidth="1px" CellPadding="4"
                                                    EnableModelValidation="True" ForeColor="Black" Width="90%">
                                                    <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White"
                                                        Wrap="False" />
                                                    <Columns>
                                                         <asp:TemplateField>
                        <ItemTemplate>
                            <img alt="" style="cursor: pointer" src="Images/Plus.png" />
                            <asp:Panel ID="Panel1" runat="server" Style="display: none">
                                <asp:GridView ID="gvSubDeliveries" runat="server" AutoGenerateColumns="false" HeaderStyle-BackColor="#c1bcbc" RowStyle-Wrap="False" Width="60%">
                                    <Columns>
                                        <asp:BoundField DataField="DID" HeaderText="DID" Visible="false" />
                                         <asp:TemplateField HeaderText="RevisedDate" ItemStyle-Width="100">
                                            <ItemTemplate>
                                                <asp:Label ID="Label2" runat="server" Text='<%#Eval("RevisedDate","{0:dd/MMM/yyyy}") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="DeliveryNo" ItemStyle-Width="100">
                                            <ItemTemplate>
                                                 
                                                <asp:Label ID="Label4" runat="server" Text='<%#Eval("DeliveryNo") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="DeliveryQty" ItemStyle-Width="100">
                                            <ItemTemplate>
                                             
                                                <asp:Label ID="Label6" runat="server" Text='<%#Eval("DeliveryQty") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                       
                                        <asp:TemplateField HeaderText="DeliveryDate" ItemStyle-Width="100">
                                            <ItemTemplate>
                                              
                                                <asp:Label ID="Label8" runat="server" Text='<%#Eval("DeliveryDate","{0:dd/MMM/yyyy}") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                       
                                        <asp:TemplateField HeaderText="Comment" ItemStyle-Width="100">
                                            <ItemTemplate>
                                                <asp:Label ID="Label9" runat="server" Text='<%#Eval("Comment") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                </asp:GridView>
                            </asp:Panel>
                        </ItemTemplate>
                    </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="DID" Visible="false">
                                                            <ItemTemplate>
                                                                <asp:Label ID="DID" runat="server" Text='<%#Eval("DID") %>'></asp:Label>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                       
                                                      
                                                        <asp:TemplateField HeaderText="Revised Date">
                                                            <ItemTemplate>
                                                                <asp:Label ID="Label10" runat="server"
                                                                    Text='<%# Eval("RevisedDate", "{0:dd/MM/yyyy}") %>'></asp:Label>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Delivery#">
                                                            <ItemTemplate>
                                                               <asp:Label ID="Label11" runat="server" Text='<%#Eval("DeliveryNo") %>'></asp:Label>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                       
                                                        <asp:TemplateField HeaderText="Promissed Qty">
                                                            <ItemTemplate>
                                                                  <asp:TextBox ID="txtPromisedQty" runat="server" Text='<%#Eval("DeliveryQty") %>' Width="90px" />
                                                               
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Delivery Date">
                                                            <ItemTemplate>
                                                                <BDP:BasicDatePicker  ID="BDPDeliveryDate"  Text='<%# Eval("DeliveryDate", "{0:dd/MM/yyyy}") %>'  runat="server" CssClass="form-control" />
                                                                <%--<asp:Label ID="DeliveryDate" runat="server" Text='<%#Eval("DeliveryDate") %>' Width="90px" />
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Comment">
                                                            <ItemTemplate>
                                                               <asp:TextBox ID="txtgvComment" runat="server" Text='<%#Eval("Comment") %>' Width="90px" />
                                                                
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="" ItemStyle-HorizontalAlign="Center">
                                                            <ItemTemplate>
                                                                <asp:Button ID="Button1" runat="server" CssClass="btn btn-info"
                                                                    OnClick="btnUpdate_Click1" Text="Update" />
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        
                                                    </Columns>
                                                </asp:GridView>
                                            </div>
                                        </div>
                                    </div>
                                </div>--%>
                              <%--  <div role="tabpanel" class="tab-pane" id="summary">
                                    <div class="col-md-12">
                                        <div class="box-body">
                                            <br />
                                            <asp:GridView ID="gvSummaryDeliveryBD" runat="server"
                                                AutoGenerateColumns="False" BackColor="White" BorderWidth="1px" CellPadding="4"
                                                EnableModelValidation="True" ForeColor="Black" Width="90%">
                                                <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White"
                                                    Wrap="False" />
                                                <Columns>
                                                    <asp:TemplateField HeaderText="DBID" Visible="false">
                                                        <ItemTemplate>
                                                            <asp:Label ID="DBID" runat="server" Text='<%#Eval("DBID") %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="OrderNo" Visible="false">
                                                        <ItemTemplate>
                                                            <asp:Label ID="OrderNo" runat="server" Text='<%#Eval("OrderNo") %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="BPOID" Visible="false">
                                                        <ItemTemplate>
                                                            <asp:Label ID="BPOID" runat="server" Text='<%#Eval("BPOID") %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="BPOSEQ" Visible="false">
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
                                                    <asp:TemplateField HeaderText="Status" Visible="false">
                                                        <ItemTemplate>
                                                            <asp:Label ID="Status" runat="server" Text='<%#Eval("Status") %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Revised Date">
                                                        <ItemTemplate>
                                                            <asp:Label ID="RevisedDate" runat="server"
                                                                Text='<%# Eval("RevisedDate", "{0:dd/MM/yyyy}") %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Delivery#">
                                                        <ItemTemplate>
                                                            <asp:Label ID="DeliveryNopre" runat="server" Text="Del#"></asp:Label><asp:Label ID="DeliveryNo" runat="server" Text='<%#Eval("DeliveryNo") %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Delivery Qty">
                                                        <ItemTemplate>
                                                              <asp:TextBox ID="txtDeliveryQty" runat="server" Text='<%#Eval("DeliveryQty") %>' Width="90px" />
                                                            <asp:Label ID="DeliveryQty" runat="server" Text='<%#Eval("DeliveryQty") %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Promissed Qty">
                                                        <ItemTemplate>
                                                          <asp:TextBox ID="txtPromisedQty" runat="server" Text='<%#Eval("PromisedQty") %>' Width="90px" />
                                                            <asp:Label ID="PromisedQty" runat="server" Text='<%#Eval("PromisedQty") %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Delivery Date">
                                                        <ItemTemplate>
                                                            <asp:Label ID="DeliveryDate" runat="server"
                                                                Text='<%# Eval("DeliveryDate", "{0:dd/MM/yyyy}") %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Comment">
                                                        <ItemTemplate>
                                                            <asp:Label ID="Comment" runat="server" Text='<%#Eval("Comment") %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                </Columns>
                                            </asp:GridView>
                                        </div>
                                    </div>
                                </div>--%>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </asp:Panel>
    </form>
</body>
</html>

