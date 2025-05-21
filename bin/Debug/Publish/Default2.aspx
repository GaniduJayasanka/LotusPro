<%@ page language="C#" autoeventwireup="true" inherits="Default2, App_Web_11yxmj2e" %>

<!DOCTYPE html>
<%@ Register Assembly="BasicFrame.WebControls.BasicDatePicker" Namespace="BasicFrame.WebControls" TagPrefix="BDP" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>

     <style type="text/css">
body
{
    margin: 0;
    padding: 0;
    font-family: Arial;
}
.modal
{
    position: fixed;
    z-index: 999;
    height: 100%;
    width: 100%;
    top: 0;
    background-color: Black;
    filter: alpha(opacity=60);
    opacity: 0.6;
    -moz-opacity: 0.8;
}
.center
{
    z-index: 1000;
    margin: 300px auto;
    padding: 10px;
    width: 130px;
    background-color: White;
    border-radius: 10px;
    filter: alpha(opacity=100);
    opacity: 1;
    -moz-opacity: 1;
}
.center img
{
    height: 128px;
    width: 128px;
}
</style>

   

    <style type="text/css">
body
{
    margin: 0;
    padding: 0;
    font-family: Arial;
}
.modal
{
    position: fixed;
    z-index: 999;
    height: 100%;
    width: 100%;
    top: 0;
    background-color: Black;
    filter: alpha(opacity=60);
    opacity: 0.6;
    -moz-opacity: 0.8;
}
.center
{
    z-index: 1000;
    margin: 300px auto;
    padding: 10px;
    width: 250px;
    background-color: White;
    border-radius: 10px;
    filter: alpha(opacity=100);
    opacity: 1;
    -moz-opacity: 1;
}
.center img
{
    height: 28px;
    width: 250px;
}
</style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <asp:ScriptManager ID="ScriptManager1" runat="server">
</asp:ScriptManager>
<%--<asp:UpdateProgress ID="UpdateProgress1" runat="server" AssociatedUpdatePanelID="UpdatePanel1">
<ProgressTemplate>
    <div class="modal">
        <div class="center">
            <img alt="" src="images/wait.gif" />
        </div>
    </div>
</ProgressTemplate>
</asp:UpdateProgress>--%>
<asp:UpdatePanel ID="UpdatePanel1" runat="server">
<ContentTemplate>
    <div >
        <asp:HiddenField ID="hfRemainingValue" runat="server" />
        <div class="col-md-12">
            <div class="row">
                <div class="col-md-1">
                    <br />
                    <asp:ImageButton ID="btnHome" runat="server" ImageUrl="~/images/Tohome.png" Height="35px"
                        Width="35px" OnClick="btnHome_Click" />
                    <asp:Label ID="LabColorCode" runat="server" Visible="False"></asp:Label>
                </div>
                <div class="col-md-11">
                    <center><h3>MSP Dashboard</h3></center>
                    </diMSP Dashboard</h3></center>
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
                                            <label class="col-md-2 control-label">Ship Date   From<span style="color: red">*</span></label>
                                            <div class="col-md-3">
                                                <span class="auto-style1"></span>
                                                <BDP:BasicDatePicker ID="DatePickerFromDate" ToolTip="Dispatched Date (Shipment Released Note Date)" runat="server" CssClass="form-control" />
                                            </div>
                                            <label class="col-md-1 control-label">To <span style="color: red">*</span></label>
                                            <div class="col-md-3">
                                                <span class="auto-style1"></span>
                                                <BDP:BasicDatePicker ID="DatePickerToDate" ToolTip="Dispatched Date (Shipment Released Note Date)" runat="server" CssClass="form-control" />
                                            </div>
                                            <label class="col-md-1 control-label">Plant <span style="color: red">*</span></label>
                                            <div class="col-md-1">
                                                <%--SELECT SEQ AS ID,CASE Seq when 1 then 'SUB' when 2 then 'SP'when 3 then 'SW'when 4 then 'SH'when 5 then 'SN'  "
 + "  END AS Plant FROM Commercial.dbo.Company Where SEQ NOT IN (6,1--%>
                                                <asp:DropDownList ID="DDLPlant" runat="server" CssClass="form-control">
                                                    <asp:ListItem Value="1">All</asp:ListItem>
                                                    <asp:ListItem Value="2">SP</asp:ListItem>
                                                    <asp:ListItem Value="3">SW</asp:ListItem>
                                                    <asp:ListItem Value="4">SH</asp:ListItem>
                                                    <asp:ListItem Value="5">SN</asp:ListItem>
                                                </asp:DropDownList>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="box-body">
                                        <div class="form-group">
                                            <label class="col-md-2 control-label">Type</label>
                                            <div class="col-md-2">
                                                <asp:DropDownList ID="ddlType" runat="server" CssClass="form-control">
                                                    <%-- <asp:ListItem> </asp:ListItem>--%>
                                                    <asp:ListItem Value="1">Cumulative Shipments</asp:ListItem>
                                                    <asp:ListItem Value="2">Over Shipments</asp:ListItem>
                                                    <asp:ListItem Value="3">Short Shipments</asp:ListItem>
                                                </asp:DropDownList>
                                            </div>
                                              <%-- <div class="col-md-4">
                                                   </div>--%>
                                            <div class="col-md-4">
                                                <asp:Button ID="Button1" runat="server" CssClass="btn btn-info" OnClick="btnSearch_Click" Text="Search" Width="100px" />
                                                <asp:Button ID="Button2" runat="server" CssClass="btn btn-warning" Text="Reset" Width="100px" OnClick="Button2_Click" />
                                               
                                            </div>
                                            <label id="lblecpboader" runat="server" class="col-md-3 control-label" style="font-size: larger; border: solid; padding: 5px 5px 5px 5px;">
                                                Total Exp.Inc ($) :
                            <asp:Label ID="lblTotalExpInc" runat="server"></asp:Label></label>
                                        </div>
                                    </div>
                                </div>
                                 <div class="row">
                                    <div class="box-body">
                                        <div class="form-group">
                                            <asp:label id="lblViewType" ForeColor="#800000" Font-Bold="true" runat="server" class="col-md-6 control-label" ></asp:label>
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
                <asp:Panel ID="PanelPlantDetails" runat="server">
                        <div class="col-md-12">
                            <div class="row">
                                <div class="col-md-12">
                                    
                                            
                 <asp:GridView ID="GVPlantDetails"  runat="server"  AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC"
                   OnRowDataBound="GVPlantDetails_RowDataBound"     BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black"
                        AllowSorting="True" Style="max-width: 100%; min-width: 90%" Font-Size="Small"
                        EnableModelValidation="True">
                        <Columns>
                            <asp:TemplateField HeaderText="" SortExpression="">
                                <ItemTemplate>
                                    <asp:ImageButton ID="imgbtnPlantView" OnClick="imgbtnPlantView_Click" runat="server" Height="30px" ImageUrl="~/images/DPlus.png" ToolTip="" Width="30px" />
                                </ItemTemplate>
                            </asp:TemplateField>
                           <asp:TemplateField HeaderText="PlantID" SortExpression="PlantID" Visible="false">
                                <ItemTemplate>
                                    <asp:Label ID="PlantID" runat="server" Text='<%#Eval("PlantID") %>'></asp:Label>
                                </ItemTemplate>                               
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Plant" SortExpression="Plant" Visible="true">
                                <ItemTemplate>
                                    <asp:Label ID="Plant" runat="server" Text='<%#Eval("Plant") %>'></asp:Label>
                                </ItemTemplate>                               
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="BuyerCount" SortExpression="BuyerCount" Visible="false">
                                <ItemTemplate>
                                    <asp:Label ID="BuyerCount" runat="server" Text='<%#Eval("BuyerCount") %>'></asp:Label>
                                </ItemTemplate>                              
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="No. Of Styles" Visible="false" ItemStyle-HorizontalAlign="Right" SortExpression="NoOfStyles">
                                <ItemTemplate>
                                    <asp:Label ID="NoOfStyles" runat="server" Text='<%#Eval("NoOfStyles") %>'></asp:Label>
                                </ItemTemplate>                                
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="SPO Qty" Visible="true" ItemStyle-HorizontalAlign="Right" SortExpression="SPOQty">
                                <ItemTemplate>
                                    <asp:Label ID="SPOQty" runat="server" Text='<%#Eval("SPOQty") %>'></asp:Label>
                                </ItemTemplate>                               
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Commited Qty" Visible="true" ItemStyle-HorizontalAlign="Right" SortExpression="CommitedQty">
                                <ItemTemplate>
                                    <asp:Label ID="CommitedQty" runat="server" Text='<%#Eval("CommitedQty") %>'></asp:Label>
                                </ItemTemplate>                               
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Shipped Qty" Visible="true" ItemStyle-HorizontalAlign="Right" SortExpression="ShippedQty">
                                <ItemTemplate>
                                    <asp:Label ID="ShippedQty" runat="server" Text='<%#Eval("ShippedQty") %>'></asp:Label>
                                </ItemTemplate>                                
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Short/Over Qty" Visible="true" ItemStyle-HorizontalAlign="Right" SortExpression="ShortOver_Qty">
                                <ItemTemplate>
                                    <asp:Label ID="ShortOver_Qty" runat="server" Text='<%#Eval("ShortOver_Qty") %>'></asp:Label>
                                </ItemTemplate>
                                
                            </asp:TemplateField>
                           
                            <asp:TemplateField HeaderText="Short/Over Ship Value ($)" Visible="true" ItemStyle-HorizontalAlign="Right" SortExpression="ShortShipValue">
                                <ItemTemplate>
                                    <asp:Label ID="ShortShipValue" runat="server" Text=' <%#Eval("ShortShipValue","{0:n}")%>'></asp:Label>
                                </ItemTemplate>
                               
                            </asp:TemplateField>
                           
                        </Columns>
                        <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
                        <%-- <HeaderStyle Wrap="true" BackColor="#333333" Font-Bold="True" ForeColor="White" />--%>
                        <FooterStyle HorizontalAlign="Right" BackColor="#333333" Font-Bold="True" ForeColor="White" CssClass="GVFixedFooter" />
                        <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" CssClass="GVFixedHeader" />
                    </asp:GridView>
                                               
                                            
                                      
                                    </div>
                                </div>
                            </div>
                    </asp:Panel>
                                <br />
                  <br />
                  </div>
                <div>
                    <%-- <asp:ListItem> </asp:ListItem>--%>
                         <asp:Panel ID="PanelPlantAganstBuyerDetails" runat="server">
                        <div class="col-md-12">
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="panel panel-default">
                                        <div class="panel-body">
                                            <div class="row">
                                                <div class="box-body">
                                                    <div class="form-group">

                                                        <div class="col-md-1">
                                                            <div class="row">
                                                                <div class="col-md-1">
                                                                <asp:ImageButton ID="ImageButtonBackToPlant" runat="server" Height="50px" ImageUrl="~/images/black.png" OnClick="ImageButtonBackToPlant_Click" Width="50px" />
                                                                </div>
                                                                </div>
                                                         </div>
                                                        <div class="col-md-11">
                                                        <label class="col-md-1 control-label">Plant</label>
                                                        <div class="col-md-4">
                                                            <asp:Label ID="lblPlant_Name" runat="server" Text=""></asp:Label>
                                                        </div>
                                                            </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="box-body">
                                                    <div class="form-group">
                                                        <%-- <div class="col-md-1">
                                                        </div>--%>
                                                        <div class="col-md-11">
                    <asp:GridView ID="GVMSPShedule" ShowFooter="true" OnRowDataBound="GVMSPShedule_RowDataBound" runat="server" OnSorting="GVMSPShedule_Sorting" AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC"
                        BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black"
                        AllowSorting="True" Style="max-width: 100%; min-width: 90%" Font-Size="Small"
                        EnableModelValidation="True">
                        <Columns>
                            <asp:TemplateField HeaderText="" SortExpression="">
                                <ItemTemplate>
                                    <asp:ImageButton ID="imgbtnView" OnClick="imgbtnView_Click" runat="server" Height="30px" ImageUrl="~/images/DPlus.png" ToolTip="" Width="30px" />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField Visible="false" HeaderText="No" ItemStyle-BackColor="DarkGray" HeaderStyle-BackColor="Olive">
                                <ItemTemplate>
                                    <asp:Label ID="No" runat="server" Text='<%# Container.DataItemIndex + 1 %>'></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle BackColor="Olive"></HeaderStyle>
                                <ItemStyle BackColor="DarkGray"></ItemStyle>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="BuyerID" SortExpression="BuyerID" Visible="false">
                                <ItemTemplate>
                                    <asp:Label ID="BuyerID" runat="server" Text='<%#Eval("BuyerID") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Buyer" SortExpression="BuyerName" Visible="true">
                                <ItemTemplate>
                                    <asp:Label ID="BuyerName" runat="server" Text='<%#Eval("BuyerName") %>'></asp:Label>
                                </ItemTemplate>
                                <FooterTemplate>
                                    <asp:Label ID="lable" runat="server" Text="Total"></asp:Label>
                                </FooterTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="BPOQTY" SortExpression="BPOQTY" Visible="true">
                                <ItemTemplate>
                                    <asp:Label ID="BPOQTY" runat="server" Text='<%#Eval("BPOQTY") %>'></asp:Label>
                                </ItemTemplate>
                                <FooterTemplate>
                                    <asp:Label ID="lblTotalBPOQty" runat="server" Visible="true" ></asp:Label>
                                </FooterTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="No. Of Styles" Visible="true" ItemStyle-HorizontalAlign="Right" SortExpression="NoOfStyles">
                                <ItemTemplate>
                                    <asp:Label ID="NoOfStyles" runat="server" Text='<%#Eval("NoOfStyles") %>'></asp:Label>
                                </ItemTemplate>
                                 <FooterTemplate>
                                    <asp:Label ID="lblTotalNoOfStyle" runat="server" Visible="true" ></asp:Label>
                                </FooterTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="SPO Qty" Visible="true" ItemStyle-HorizontalAlign="Right" SortExpression="SPOQty">
                                <ItemTemplate>
                                    <asp:Label ID="SPOQty" runat="server" Text='<%#Eval("SPOQty") %>'></asp:Label>
                                </ItemTemplate>
                                <FooterTemplate>
                                    <asp:Label ID="lblTotalSPOQty" runat="server" Visible="true" ></asp:Label>
                                </FooterTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Commited Qty" Visible="true" ItemStyle-HorizontalAlign="Right" SortExpression="CommitedQty">
                                <ItemTemplate>
                                    <asp:Label ID="CommitedQty" runat="server" Text='<%#Eval("CommitedQty") %>'></asp:Label>
                                </ItemTemplate>
                                <FooterTemplate>
                                    <asp:Label ID="lblTotalCommitedQty" runat="server" Visible="true" ></asp:Label>
                                </FooterTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Shipped Qty" Visible="true" ItemStyle-HorizontalAlign="Right" SortExpression="ShippedQty">
                                <ItemTemplate>
                                    <asp:Label ID="ShippedQty" runat="server" Text='<%#Eval("ShippedQty") %>'></asp:Label>
                                </ItemTemplate>
                                 <FooterTemplate>
                                    <asp:Label ID="lblTotalShippedQty" runat="server" Visible="true" ></asp:Label>
                                </FooterTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Short/Over Qty" Visible="true" ItemStyle-HorizontalAlign="Right" SortExpression="ShortOver_Qty">
                                <ItemTemplate>
                                    <asp:Label ID="ShortOver_Qty" runat="server" Text='<%#Eval("ShortOver_Qty") %>'></asp:Label>
                                </ItemTemplate>
                                <FooterTemplate>
                                    <asp:Label ID="lblTotalShortOver_Qty" runat="server" Visible="true" ></asp:Label>
                                </FooterTemplate>
                            </asp:TemplateField>
                          <%--  <asp:TemplateField HeaderText="%" Visible="false" ItemStyle-HorizontalAlign="Right" SortExpression="Percentage">
                                <ItemTemplate>
                                    <asp:Label ID="Percentage" ToolTip="(Short/Over Qty X 100) / Commited Qty" runat="server" Text='<%#Eval("Percentage","{0:n}")%>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>--%>
                         <asp:TemplateField HeaderText="Short/Over Ship Value ($)" Visible="true" ItemStyle-HorizontalAlign="Right" SortExpression="ShortShipValue">
                                <ItemTemplate>
                                    <asp:Label ID="ShortShipValue" runat="server" Text=' <%#Eval("ShortShipValue","{0:n}")%>'></asp:Label>
                                </ItemTemplate>
                                <FooterTemplate>
                                    <asp:Label ID="lblTotalValue"  runat="server" ></asp:Label>
                                </FooterTemplate>
                            </asp:TemplateField>
                            <%--   <asp:TemplateField HeaderText="Waved OFF Qty" Visible="false" ItemStyle-HorizontalAlign="Right" SortExpression="WavedOFFQty">
                                <ItemTemplate>
                                    <asp:Label ID="WavedOFFQty" runat="server" Text='<%#Eval("WavedOFFQty") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>--%>
                        </Columns>
                        <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
                        <%-- <HeaderStyle Wrap="true" BackColor="#333333" Font-Bold="True" ForeColor="White" />--%>
                        <FooterStyle HorizontalAlign="Right" BackColor="#333333" Font-Bold="True" ForeColor="White" CssClass="GVFixedFooter" />
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
                            </div>
                
                    </asp:Panel>
                    <asp:Panel ID="PanelBuyerDetails" runat="server">
                        <div class="col-md-12">
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="panel panel-default">
                                        <div class="panel-body">
                                            <div class="row">
                                                <div class="box-body">
                                                    <div class="form-group">

                                                        <div class="col-md-1">
                                                            <div class="row">
                                                                <div class="col-md-1">
                                                                <asp:ImageButton ID="ImageBtnBackToMainDashboard" runat="server" Height="50px" ImageUrl="~/images/black.png" OnClick="ImageBtnBackToMainDashboard_Click" Width="50px" />
                                                                </div>
                                                                </div>
                                                         </div>
                                                        <div class="col-md-11">
                                                        <label class="col-md-1 control-label">Buyer</label>
                                                        <div class="col-md-4">
                                                            <asp:Label ID="lblBuyer" runat="server" Text=""></asp:Label>
                                                        </div>
                                                            </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="box-body">
                                                    <div class="form-group">
                                                        <%-- <div class="col-md-1">
                                                        </div>--%>
                                                        <div class="col-md-11">
                                                            <asp:GridView ID="GVBuyerDetails" ShowFooter="true" OnRowDataBound="GVBuyerDetails_RowDataBound" runat="server" AllowSorting="True" AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" EnableModelValidation="True" Font-Size="Small" ForeColor="Black" Style="max-width: 100%; min-width: 90%">
                                                                <Columns>
                                                                    <asp:TemplateField Visible="true">
                                                                        <ItemTemplate>
                                                                            <asp:ImageButton ID="imgbtnBuyerView" runat="server" Height="30px" ImageUrl="~/images/DPlus.png" OnClick="imgbtnBuyerView_Click" ToolTip="" Width="30px" />
                                                                        </ItemTemplate>
                                                                       
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="OrderNo" Visible="false">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="OrderNo" runat="server" Text='<%#Eval("OrderNo") %>'></asp:Label>
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="StyleNo">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="StyleNo" runat="server" Text='<%#Eval("StyleNo") %>'></asp:Label>
                                                                        </ItemTemplate>
                                                                         <FooterTemplate>
                                                                              <asp:Label ID="tot" runat="server" Text="Total"></asp:Label>
                                                                        </FooterTemplate>
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="SSNo" Visible="true">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="SSNo" runat="server" Text='<%#Eval("SSNo") %>'></asp:Label>
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="BPOQTY" Visible="true">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="BPOQTY" runat="server" Text='<%#Eval("BPOQTY") %>'></asp:Label>
                                                                        </ItemTemplate>
                                                                        <FooterTemplate>
                                                                             <asp:Label ID="LBLBuyerBPOQTY" runat="server" ></asp:Label>
                                                                        </FooterTemplate>
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="SPO Qty" ItemStyle-HorizontalAlign="Right" Visible="true">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="SPOQty" runat="server" Text='<%#Eval("SPOQty") %>'></asp:Label>
                                                                        </ItemTemplate>
                                                                        <FooterTemplate>
                                                                       <asp:Label ID="LBLbuyerSPOQty" runat="server" ></asp:Label>
                                                                        </FooterTemplate>
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="Commited Qty" ItemStyle-HorizontalAlign="Right" Visible="true">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="CommitedQty" runat="server" Text='<%#Eval("CommitedQty") %>'></asp:Label>
                                                                        </ItemTemplate>
                                                                        <FooterTemplate>
                                                                       <asp:Label ID="LblBuyerCommitedQty" runat="server" ></asp:Label>                                                                       
                                                                        </FooterTemplate>
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="Shipped Qty" ItemStyle-HorizontalAlign="Right" Visible="true">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="ShippedQty" runat="server" Text='<%#Eval("ShippedQty","{0:n}") %>'></asp:Label>
                                                                        </ItemTemplate>
                                                                        <FooterTemplate>
                                                                       <asp:Label ID="LblBuyerShipQty" runat="server" ></asp:Label>                                                                       
                                                                        </FooterTemplate>
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="Short/Over Qty" ItemStyle-HorizontalAlign="Right" Visible="true">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="ShortOver_Qty" runat="server" Text='<%#Eval("ShortOver_Qty") %>'></asp:Label>
                                                                        </ItemTemplate>
                                                                         <FooterTemplate>
                                                                       <asp:Label ID="LblShortOver_Qty" runat="server" ></asp:Label>                                                                       
                                                                        </FooterTemplate>
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="%" Visible="false" ItemStyle-HorizontalAlign="Right">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="Percentage" ToolTip="(Short/Over Qty X 100) / Commited Qty" runat="server" Text='<%#Eval("Percentage","{0:n}")%>'></asp:Label>
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="Short/Over Ship Value ($)" ItemStyle-HorizontalAlign="Right" Visible="true">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="ShortShipValue" runat="server" Text=' <%#Eval("ShortShipValue","{0:n}")%>'></asp:Label>
                                                                        </ItemTemplate>
                                                                         <FooterTemplate>
                                                                              <asp:Label ID="lblTotalStyleExpen" runat="server" ></asp:Label>
                                                                        </FooterTemplate>
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="FOB ($)" ItemStyle-HorizontalAlign="Right" Visible="false">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="FOB" runat="server" Text='<%#Eval("FC","{0:n}") %>'></asp:Label>
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="Waved OFF Qty" ItemStyle-HorizontalAlign="Right" Visible="false">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="WavedOFFQty" runat="server" Text='<%#Eval("WavedOFFQty") %>'></asp:Label>
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                </Columns>
                                                                <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
                                                                <FooterStyle HorizontalAlign="Right" BackColor="#333333" CssClass="GVFixedFooter" Font-Bold="True" ForeColor="White" />
                                                                <HeaderStyle BackColor="#333333" CssClass="GVFixedHeader" Font-Bold="True" ForeColor="White" />
                                                            </asp:GridView>
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
                </div>
                <div>
                    <asp:Panel ID="PanelStyleDetails" runat="server">
                        <div class="col-md-12">
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="panel panel-default">
                                        <div class="panel-body">
                                            <div class="row">
                                                <div class="box-body">
                                                    <div class="form-group">
                                                         <div class="col-md-1">
                                                            <div class="row">
                                                                <div class="col-md-1">
                                                                <asp:ImageButton ID="ImgBtnBackToStyleDtl" runat="server" Height="50px" ImageUrl="~/images/black.png" OnClick="ImgBtnBackToStyleDtl_Click" Width="50px" />
                                                                </div>
                                                                </div>
                                                         </div>
                                                        <div class="col-md-11">
                                                        <label class="col-md-1 control-label">Style</label>
                                                        <div class="col-md-4">
                                                            <asp:Label ID="lblStyleNo" runat="server" Text=""></asp:Label>
                                                        </div>
                                                            </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="box-body">
                                                    <div class="form-group">
                                                        <%--<div class="col-md-1">
                                                        </div>--%>
                                                        <div class="col-md-11">
                                                            <asp:GridView ID="GVStyleDetails" ShowFooter="true" OnRowDataBound="GVStyleDetails_RowDataBound" runat="server" AllowSorting="True" AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" EnableModelValidation="True" Font-Size="Small" ForeColor="Black" Style="max-width: 100%; min-width: 90%">
                                                                <Columns>
                                                                    <asp:TemplateField Visible="true">
                                                                        <ItemTemplate>
                                                                            <asp:ImageButton ID="imgbtnStyleView" runat="server" Height="30px" ImageUrl="~/images/DPlus.png" OnClick="imgbtnStyleView_Click" ToolTip="" Width="30px" />
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="StyleNo" Visible="false">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="StyleNo" runat="server" Text='<%#Eval("StyleNo") %>'></asp:Label>
                                                                        </ItemTemplate>
                                                                        
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="OrderNo" Visible="false">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="OrderNo" runat="server" Text='<%#Eval("OrderNo") %>'></asp:Label>
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="POID" Visible="false">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="POID" runat="server" Text='<%#Eval("POID") %>'></asp:Label>
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="BuyerPONo" Visible="true">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="BuyerPONo" runat="server" Text='<%#Eval("BuyerPONo") %>'></asp:Label>
                                                                        </ItemTemplate>
                                                                         <FooterTemplate>
                                                                              <asp:Label ID="tot" runat="server" Text="Total"></asp:Label>
                                                                        </FooterTemplate>
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="ContractNo" Visible="true">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="ContractNo" runat="server" Text='<%#Eval("ContractNo") %>'></asp:Label>
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="BPOQTY" Visible="true">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="BPOQTY" Font-Bold="true" Font-Size="Large" runat="server" Text='<%#Eval("BPOQTY") %>'></asp:Label>
                                                                        </ItemTemplate>
                                                                         <FooterTemplate>
                                                                       <asp:Label ID="LblStyleBPOQty" runat="server" ></asp:Label>                                                                       
                                                                        </FooterTemplate>
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="SPO Qty" ItemStyle-HorizontalAlign="Right" Visible="true">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="SPOQty" runat="server" Text='<%#Eval("SPOQty") %>'></asp:Label>
                                                                        </ItemTemplate>
                                                                        <FooterTemplate>
                                                                       <asp:Label ID="LblStyleSumithraPOQty" runat="server" ></asp:Label>                                                                       
                                                                        </FooterTemplate>
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="Commited Qty" ItemStyle-HorizontalAlign="Right" Visible="true">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="CommitedQty" runat="server" Text='<%#Eval("CommitedQty") %>'></asp:Label>
                                                                        </ItemTemplate>
                                                                         <FooterTemplate>
                                                                       <asp:Label ID="LblStyleCommitQty" runat="server" ></asp:Label>                                                                       
                                                                        </FooterTemplate>
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="Shipped Qty" ItemStyle-HorizontalAlign="Right" Visible="true">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="ShippedQty" runat="server" Text='<%#Eval("ShippedQty") %>'></asp:Label>
                                                                        </ItemTemplate>
                                                                        <FooterTemplate>
                                                                       <asp:Label ID="LblStyleShipPOQty" runat="server" ></asp:Label>                                                                       
                                                                        </FooterTemplate>
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="Short/Over Qty" ItemStyle-HorizontalAlign="Right" Visible="true">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="ShortOver_Qty" runat="server" Text='<%#Eval("ShortOver_Qty") %>'></asp:Label>
                                                                        </ItemTemplate>
                                                                         <FooterTemplate>
                                                                       <asp:Label ID="LblStyleShortOver_Qty" runat="server" ></asp:Label>                                                                       
                                                                        </FooterTemplate>
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="%" Visible="false" ItemStyle-HorizontalAlign="Right">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="Percentage" ToolTip="(Short/Over Qty X 100) / Commited Qty" runat="server" Text='<%#Eval("Percentage","{0:n}")%>'></asp:Label>
                                                                        </ItemTemplate>
                                                                         
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="Short/Over Ship Value ($)" ItemStyle-HorizontalAlign="Right" Visible="true">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="ShortShipValue" runat="server" Text=' <%#Eval("ShortShipValue","{0:n}")%>'></asp:Label>
                                                                        </ItemTemplate>
                                                                        <FooterTemplate>
                                                                       <asp:Label ID="LblStyleShortShipValue" runat="server" ></asp:Label>                                                                       
                                                                        </FooterTemplate>
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="FOB ($)" ItemStyle-HorizontalAlign="Right" Visible="false">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="FOB" runat="server" Text='<%#Eval("FC","{0:n}") %>'></asp:Label>
                                                                        </ItemTemplate>
                                                                       
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="Waved OFF Qty" ItemStyle-HorizontalAlign="Right" Visible="false">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="WavedOFFQty" runat="server" Text='<%#Eval("WavedOFFQty") %>'></asp:Label>
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                     <asp:TemplateField HeaderText="Buyer's PO Date"  Visible="true">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="ExtendedShipDate" runat="server" Font-Bold="true" Font-Size="Larger" Text='<%#Eval("ExtendedShipDate", "{0:dd/MM/yyyy}") %>'  ></asp:Label>
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                </Columns>
                                                                <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
                                                                <FooterStyle HorizontalAlign="Right" BackColor="#333333" CssClass="GVFixedFooter" Font-Bold="True" ForeColor="White" />
                                                                <HeaderStyle BackColor="#333333" CssClass="GVFixedHeader" Font-Bold="True" ForeColor="White" />
                                                            </asp:GridView>
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
                </div>
                <div>
                    <asp:Panel ID="PanelColorDetails" runat="server">
                        <div class="col-md-12">
                            <div class="row">
                            
                                <div class="col-md-12">
                                    <div class="panel panel-default">
                                        <div class="panel-body">

                                                <div class="col-md-1">
                                                            <div class="row">
                                                                <div class="col-md-1">
                                                                <asp:ImageButton ID="ImgBtnBackToBPODetails" runat="server" Height="50px" ImageUrl="~/images/black.png" OnClick="ImgBtnBackToBPODetails_Click" Width="50px" />
                                                                </div>
                                                                </div>
                                                         </div>
                                              <div class="col-md-11">

                                            <div class="row">
                                                <div class="box-body">
                                                    <div class="form-group">
                                                        <label class="col-md-1 control-label">Style</label>
                                                        <div class="col-md-4">
                                                            <asp:Label ID="LblStyle" runat="server" Text=""></asp:Label>
                                                        </div>
                                                       <%-- <label class="col-md-1 control-label">BPO No</label>
                                                        <div class="col-md-2">
                                                            <asp:Label ID="LblBuyerPONo" runat="server" Text=""></asp:Label>
                                                        </div>
                                                        <label class="col-md-1 control-label">ContractNo</label>
                                                        <div class="col-md-2">
                                                            <asp:Label ID="LblContractNo" runat="server" Text=""></asp:Label>
                                                        </div>--%>
                                                    </div>
                                                </div>
                                            </div>
                                                  </div>
                                            <div class="row">
                                                <div class="box-body">
                                                    <div class="form-group">
                                                        <%--<div class="col-md-1">
                                                        </div>--%>
                                                        <div class="col-md-11">
                                                            <asp:GridView ID="GVColorDetails" ShowFooter="true" OnRowDataBound="GVColorDetails_RowDataBound" runat="server" AllowSorting="True" AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" EnableModelValidation="True" Font-Size="Small" ForeColor="Black" Style="max-width: 100%; min-width: 90%">
                                                                <Columns>
                                                                    <asp:TemplateField Visible="true">
                                                                        <ItemTemplate>
                                                                            <asp:ImageButton ID="imgbtnColorView" runat="server" Height="30px" ImageUrl="~/images/DPlus.png" OnClick="imgbtnColorView_Click" ToolTip="" Width="30px" />
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                    
                                                                     <asp:TemplateField HeaderText="OrderNo" Visible="false">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="OrderNo" runat="server" Text='<%#Eval("OrderNo") %>'></asp:Label>
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="StyleNo" Visible="false">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="StyleNo" runat="server" Text='<%#Eval("StyleNo") %>'></asp:Label>
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="SSNo" Visible="false">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="SSNo" runat="server" Text='<%#Eval("SSNo") %>'></asp:Label>
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="BuyerName" Visible="false">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="BuyerName" runat="server" Text='<%#Eval("BuyerName") %>'></asp:Label>
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                   
                                                                   
<%--                                                                    <asp:TemplateField HeaderText="ColorCode" Visible="true">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="ColorCode" runat="server" Text='<%#Eval("ColorCode") %>'></asp:Label>
                                                                        </ItemTemplate>
                                                                         
                                                                    </asp:TemplateField>--%>
                                                                    <asp:TemplateField HeaderText="ColorName" Visible="true">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="ColorName" runat="server" Text='<%#Eval("ColorName") %>'></asp:Label>
                                                                        </ItemTemplate>
                                                                        <FooterTemplate>
                                                                              <asp:Label ID="totss" runat="server" Text="Total"></asp:Label>
                                                                        </FooterTemplate>
                                                                    </asp:TemplateField>
                                                                    <%--<asp:TemplateField HeaderText="POID" Visible="false">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="POID" runat="server" Text='<%#Eval("POID") %>'></asp:Label>
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>--%>
                                                                    <asp:TemplateField HeaderText="BuyerID" Visible="false">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="BuyerID" runat="server" Text='<%#Eval("BuyerID") %>'></asp:Label>
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="NoOfStyles" Visible="false">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="NoOfStyles" runat="server" Text='<%#Eval("NoOfStyles") %>'></asp:Label>
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="BPOQTY"  Visible="true">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="BPOQTY" Font-Bold="true" Font-Size="Large" runat="server" Text='<%#Eval("BPOQTY") %>'></asp:Label>
                                                                        </ItemTemplate>
                                                                        <FooterTemplate>
                                                                       <asp:Label ID="LblColorBPOQty" runat="server" ></asp:Label>                                                                       
                                                                        </FooterTemplate>
                                                                    </asp:TemplateField>

                                                                    <asp:TemplateField HeaderText="SPO Qty" ItemStyle-HorizontalAlign="Right" Visible="true">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="SPOQty" runat="server" Text='<%#Eval("SPOQty") %>'></asp:Label>
                                                                        </ItemTemplate>
                                                                         <FooterTemplate>
                                                                       <asp:Label ID="LblColoSPOQty" runat="server" ></asp:Label>                                                                       
                                                                        </FooterTemplate>
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="Commited Qty" ItemStyle-HorizontalAlign="Right" Visible="true">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="CommitedQty" runat="server" Text='<%#Eval("CommitedQty") %>'></asp:Label>
                                                                        </ItemTemplate>
                                                                         <FooterTemplate>
                                                                       <asp:Label ID="LblColorCommitQty" runat="server" ></asp:Label>                                                                       
                                                                        </FooterTemplate>
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="Shipped Qty" ItemStyle-HorizontalAlign="Right" Visible="true">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="ShippedQty" runat="server" Text='<%#Eval("ShippedQty","{0:n}") %>'></asp:Label>
                                                                        </ItemTemplate>
                                                                          <FooterTemplate>
                                                                       <asp:Label ID="LblColorShippedQty" runat="server" ></asp:Label>                                                                       
                                                                        </FooterTemplate>
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="Short/Over Qty" ItemStyle-HorizontalAlign="Right" Visible="true">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="ShortOver_Qty" runat="server" Text='<%#Eval("ShortOver_Qty") %>'></asp:Label>
                                                                        </ItemTemplate>
                                                                         <FooterTemplate>
                                                                       <asp:Label ID="LblColorShortOverQty" runat="server" ></asp:Label>                                                                       
                                                                        </FooterTemplate>
                                                                    </asp:TemplateField>
                                                                    <%--<asp:TemplateField HeaderText="%" Visible="false" ItemStyle-HorizontalAlign="Right">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="Percentage" ToolTip="(Short/Over Qty X 100) / Commited Qty" runat="server" Text='<%#Eval("Percentage","{0:n}")%>'></asp:Label>
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>--%>
                                                                    <asp:TemplateField HeaderText="Short/Over Ship Value ($)" ItemStyle-HorizontalAlign="Right" Visible="true">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="ShortShipValue" runat="server" Text=' <%#Eval("ShortShipValue","{0:n}")%>'></asp:Label>
                                                                        </ItemTemplate>
                                                                         <FooterTemplate>
                                                                       <asp:Label ID="LblColorShortShipValue" runat="server" ></asp:Label>                                                                       
                                                                        </FooterTemplate>
                                                                    </asp:TemplateField>
                                                                   <%-- <asp:TemplateField HeaderText="FOB ($)" ItemStyle-HorizontalAlign="Right" Visible="false">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="FOB" runat="server" Text='<%#Eval("FC","{0:n}") %>'></asp:Label>
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>--%>
                                                                    <asp:TemplateField HeaderText="Waved OFF Qty" ItemStyle-HorizontalAlign="Right" Visible="false">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="WavedOFFQty" runat="server" Text='<%#Eval("WavedOFFQty") %>'></asp:Label>
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="StyleID" Visible="false">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="StyleID" runat="server" Text='<%#Eval("StyleID") %>'></asp:Label>
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                   <%-- <asp:TemplateField HeaderText="SDSEQ" Visible="false">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="SDSEQ" runat="server" Text='<%#Eval("SDSEQ") %>'></asp:Label>
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>--%>
                                                                  
                                                                    <%-- <asp:TemplateField HeaderText="Buyer's PO Date"  Visible="true">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="ExtendedShipDate" Font-Bold="true" Font-Size="Larger" runat="server" Text='<%#Eval("ExtendedShipDate", "{0:dd/MM/yyyy}") %>'  ></asp:Label>
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>--%>
                                                                </Columns>
                                                                <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
                                                                <FooterStyle HorizontalAlign="Right" BackColor="#333333" CssClass="GVFixedFooter" Font-Bold="True" ForeColor="White" />
                                                                <HeaderStyle BackColor="#333333" CssClass="GVFixedHeader" Font-Bold="True" ForeColor="White" />
                                                            </asp:GridView>
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
                </div>
                <div>
                    <asp:Panel ID="PanelDeliveryDetails" runat="server">
                        <div class="col-md-12">
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="panel panel-default">
                                        <div class="panel-body">
                                            <div class="row">
                                                <div class="box-body">
                                                    <div class="form-group">
                                                     <div class="col-md-1">
                                                            <div class="row">
                                                                <div class="col-md-1">
                                                                <asp:ImageButton ID="ImgBtnBackToColor" runat="server" Height="50px" ImageUrl="~/images/black.png" OnClick="ImgBtnBackToColor_Click" Width="50px" />
                                                                </div>
                                                                </div>
                                                         </div>
                                                        <div class="col-md-11">
                                                            <div class="row">
                                                                <label class="col-md-1 control-label">Style</label>
                                                                <div class="auto-style27">
                                                                   
                                                                    
                                                                <asp:LinkButton ID="LbStyle" runat="server" OnClick="LbStyle_Click"    />
                                                                   
                                                                    </div>
                                                            <%--  <%--  <label class="col-md-1 control-label">BPO No</label>
                                                                <div class="col-md-2">
                                                                    <asp:Label ID="LbBPONo" runat="server" Text=""></asp:Label>
                                                                </div>
                                                                <div class="col-md-1">
                                                                    </div>

                                                            </div>
                                                            <div class="row">--%>
                                                                <label class="col-md-1 control-label">Color</label>
                                                                <div class="col-md-4">
                                                                    <asp:Label ID="LblColorName" runat="server" Text=""></asp:Label>
                                                                </div>
                                                               <%-- <label class="col-md-1 control-label">ContractNo</label>
                                                                <div class="col-md-2">
                                                                    <asp:Label ID="LbContractNo" runat="server" Text=""></asp:Label>
                                                                </div>--%>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="box-body">
                                                    <div class="form-group">
                                                        <%-- <div class="col-md-1">
                                                        </div>--%>
                                                        <div class="col-md-11">
                                                            <asp:GridView ID="GVDeliveryDetails" ShowFooter="true" OnRowDataBound="GVDeliveryDetails_RowDataBound" runat="server" AllowSorting="True" AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" EnableModelValidation="True" Font-Size="Small" ForeColor="Black" Style="max-width: 100%; min-width: 90%">
                                                                <Columns>
                                                                    <asp:TemplateField HeaderText="OrderNo" Visible="false">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="OrderNo" runat="server" Text='<%#Eval("OrderNo") %>'></asp:Label>
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="StyleNo" Visible="false">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="StyleNo" runat="server" Text='<%#Eval("StyleNo") %>'></asp:Label>
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="SSNo" Visible="false">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="SSNo" runat="server" Text='<%#Eval("SSNo") %>'></asp:Label>
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="BuyerName" Visible="false">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="BuyerName" runat="server" Text='<%#Eval("BuyerName") %>'></asp:Label>
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="BuyerPONo" Visible="true">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="BuyerPONo" runat="server" Text='<%#Eval("BuyerPONo") %>'></asp:Label>
                                                                        </ItemTemplate>
                                                                         <FooterTemplate>
                                                                      <asp:Label ID="tot" runat="server" Text="Total"></asp:Label>
                                                                      </FooterTemplate>
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="ContractNo" Visible="true">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="ContractNo" runat="server" Text='<%#Eval("ContractNo") %>'></asp:Label>
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="ColorCode" Visible="true">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="ColorCode" runat="server" Text='<%#Eval("ColorCode") %>'></asp:Label>
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="ColorName" Visible="true">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="ColorName" runat="server" Text='<%#Eval("ColorName") %>'></asp:Label>
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="POID" Visible="false">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="POID" runat="server" Text='<%#Eval("POID") %>'></asp:Label>
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="BuyerID" Visible="false">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="BuyerID" runat="server" Text='<%#Eval("BuyerID") %>'></asp:Label>
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="NoOfStyles" Visible="false">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="NoOfStyles" runat="server" Text='<%#Eval("NoOfStyles") %>'></asp:Label>
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="DeliveryNo" Visible="true">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="DeliveryNo" runat="server" Text='<%#Eval("DeliveryNo") %>'></asp:Label>
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="BPOQTY" Visible="true">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="BPOQTY" Font-Bold="true" Font-Size="Large" runat="server" Text='<%#Eval("BPOQTY") %>'></asp:Label>
                                                                        </ItemTemplate>
                                                                        <FooterTemplate>
                                                                       <asp:Label ID="LblDeliveryBPOQty" runat="server" ></asp:Label>                                                                       
                                                                       </FooterTemplate>
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="SPO Qty" ItemStyle-HorizontalAlign="Right" Visible="true">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="SPOQty" runat="server" Text='<%#Eval("SPOQty") %>'></asp:Label>
                                                                        </ItemTemplate>
                                                                        <FooterTemplate>
                                                                       <asp:Label ID="LblDeliverySPOQty" runat="server" ></asp:Label>                                                                       
                                                                       </FooterTemplate>
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="Commited Qty" ItemStyle-HorizontalAlign="Right" Visible="true">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="CommitedQty" runat="server" Text='<%#Eval("CommitedQty") %>'></asp:Label>
                                                                        </ItemTemplate>
                                                                          <FooterTemplate>
                                                                       <asp:Label ID="LblDeliveryCommitedQty" runat="server" ></asp:Label>                                                                       
                                                                       </FooterTemplate>
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="Shipped Qty" ItemStyle-HorizontalAlign="Right" Visible="true">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="ShippedQty" runat="server" Text='<%#Eval("ShippedQty","{0:n}") %>'></asp:Label>
                                                                        </ItemTemplate>
                                                                        <FooterTemplate>
                                                                       <asp:Label ID="LblDeliveryShipedQty" runat="server" ></asp:Label>                                                                       
                                                                       </FooterTemplate>
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="Short/Over Qty" ItemStyle-HorizontalAlign="Right" Visible="true">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="ShortOver_Qty" runat="server" Text='<%#Eval("ShortOver_Qty") %>'></asp:Label>
                                                                        </ItemTemplate>
                                                                         <FooterTemplate>
                                                                       <asp:Label ID="LblDeliveryShortOverQty" runat="server" ></asp:Label>                                                                       
                                                                       </FooterTemplate>
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="%" Visible="false" ItemStyle-HorizontalAlign="Right">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="Percentage" ToolTip="(Short/Over Qty X 100) / Commited Qty" runat="server" Text='<%#Eval("Percentage","{0:n}")%>'></asp:Label>
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="Short/Over Ship Value ($)" ItemStyle-HorizontalAlign="Right" Visible="true">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="ShortShipValue" runat="server" Text=' <%#Eval("ShortShipValue","{0:n}")%>'></asp:Label>
                                                                        </ItemTemplate>
                                                                          <FooterTemplate>
                                                                       <asp:Label ID="LblDeliveryShortShipValue" runat="server" ></asp:Label>                                                                       
                                                                       </FooterTemplate>
                                                                    </asp:TemplateField>
                                                                   <%-- <asp:TemplateField HeaderText="FOB ($)" ItemStyle-HorizontalAlign="Right" Visible="false">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="FC" runat="server" Text='<%#Eval("FC","{0:n}") %>'></asp:Label>
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>--%>
                                                                     <asp:TemplateField HeaderText="FOB ($)" ItemStyle-HorizontalAlign="Right" Visible="false">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="FC" runat="server" Text='<%#Eval("FC") %>'></asp:Label>
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="Waved OFF Qty" ItemStyle-HorizontalAlign="Right" Visible="false">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="WavedOFFQty" runat="server" Text='<%#Eval("WavedOFFQty") %>'></asp:Label>
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="Short Reason" ItemStyle-HorizontalAlign="Right" Visible="true">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="ShortReason" runat="server" Text='<%#Eval("ShortReason") %>'></asp:Label>
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                     <asp:TemplateField HeaderText="Partial Shipment" ItemStyle-HorizontalAlign="Right" Visible="true">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="PartialShipment" runat="server" Text='<%#Eval("PartialShipment") %>'></asp:Label>
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="Buyer's PO Date"  Visible="true">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="ExtendedShipDate" Font-Bold="true" Font-Size="Larger" runat="server" Text='<%#Eval("ExtendedShipDate", "{0:dd/MM/yyyy}") %>'  ></asp:Label>
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                     <asp:TemplateField HeaderText="Pending"  Visible="true">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="Pending" Font-Bold="true" Font-Size="Larger" runat="server" Text='<%#Eval("Pending") %>'  ></asp:Label>
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                </Columns>
                                                                <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
                                                                <FooterStyle HorizontalAlign="Right" BackColor="#333333" CssClass="GVFixedFooter" Font-Bold="True" ForeColor="White" />
                                                                <HeaderStyle BackColor="#333333" CssClass="GVFixedHeader" Font-Bold="True" ForeColor="White" />
                                                            </asp:GridView>
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


                </div>
                <div id="DivFooterRow" style="overflow: hidden">
                </div>
            </div>

        <asp:Button ID="btnShowPopup" runat="server" Style="display: none" />
         <asp:ModalPopupExtender ID="MPESL" runat="server" TargetControlID="btnShowPopup" PopupControlID="pnlpopup"
            CancelControlID="btnMPECancel" BackgroundCssClass="modalBackground">
        </asp:ModalPopupExtender>
         <asp:Panel ID="pnlpopup" runat="server" BackColor="White" Height="500px" Width="1100px"
            Style=" overflow: scroll; border: Solid 3px #0026ff;">
             <div class="container" style="max-width: 1050px">
                <div class="row">
                    <div class="col-md-11">
                        <h4 ></h4>
                        
                    </div>
                   
                    <div class="col-md-1">
                        <br />
                        <asp:ImageButton ID="btnMPECancel" runat="server" ImageUrl="~/images/Cancel.png"
                            Width="20" Height="20" CssClass="pull-right" />
                    </div>
                </div>
                <div class="row">
                    <div class="auto-style26">
                     <table class="auto-style1">
                            <tr>
                                <td class="auto-style17">&nbsp; </td>
                                <td class="auto-style14"><strong>Style&nbsp; :</strong></td>
                                <td class="auto-style7">&nbsp;
                                   <asp:Label ID="LabpopStylepop" runat="server"></asp:Label>
                                </td>
                                <td class="auto-style22">&nbsp;&nbsp;&nbsp; <strong>Colour&nbsp;&nbsp; :</strong>&nbsp; </td>                                
                                <td class="auto-style20">
                                    <asp:Label ID="Labcolour" runat="server"></asp:Label>
                                </td>                                
                                <td class="auto-style25">
                                    <span style="color: rgb(0, 0, 0); font-family: &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; font-size: small; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; letter-spacing: normal; orphans: 2; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;"><strong>Colour Qty </strong></span>
                                    <span style="color: rgb(0, 0, 0); font-family: &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; font-size: small; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 700; letter-spacing: normal; orphans: 2; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;">&nbsp;:</span></td>                                
                                <td class="auto-style24">
                                    <asp:Label ID="LabcolourQty" runat="server"></asp:Label>
                                </td>
                                <td>
                                 <asp:Label ID="LabCCode" runat="server" Visible="false"></asp:Label><asp:Label ID="LabCName" runat="server" Visible="false"></asp:Label>
                                    </td>                                
                                <td>
                                    &nbsp;</td>                                
                                <td>
                                    &nbsp;</td>                                
                                <td>
                                    
                                </td>   
                                 <td>
                                    &nbsp;</td>    
                                 <td>
                                    &nbsp;</td>    
                                 <td>
                                    &nbsp;</td>    
                                 <td>
                                    &nbsp;</td>    
                                 <td>
                                    &nbsp;</td>    
                                 <td>
                                    <asp:ImageButton ID="ImageButton1" runat="server" Height="35px" ToolTip="Print View" ImageUrl="~/images/Printer-icon.png" OnClick="ImageButton1_Click" OnClientClick=""  Width="35px" />
                                    </td>    
                                                             
                            </tr>
                            <tr>
                                <td class="auto-style17">&nbsp;</td>
                                <td class="auto-style14">&nbsp;</td>
                                <td class="auto-style7">&nbsp;</td>
                                <td class="auto-style22">&nbsp;</td>
                                <td class="auto-style20">&nbsp;</td>
                                <td class="auto-style25">&nbsp;</td>
                                <td class="auto-style24">&nbsp;</td>
                                <td class="auto-style5">&nbsp;</td>
                                
                                <td class="auto-style5">&nbsp;</td>
                                
                                <td class="auto-style5">&nbsp;</td>
                                
                                <td class="auto-style5">&nbsp;</td>
                                
                            </tr>
                        </table>
                    </div>
                </div>
            
                <div class="row">
                    <label class="col-md-7">

                        <asp:GridView ID="GridSuReport" runat="server"  ShowFooter="true"   AutoGenerateColumns="False" BackColor="White" BorderColor="#cc3300" 
                BorderWidth="2px" CellPadding="4" ForeColor="Black" OnRowCreated="GridSuReport_RowCreated" FooterStyle-HorizontalAlign="Right" OnRowDataBound="GridSuReport_RowDataBound"  AllowSorting="True" Style="max-width: 100%; min-width: 90%"
                EnableModelValidation="True" Width="980px"  >
               
                <Columns>
                    
                     <asp:TemplateField HeaderText="DID" ItemStyle-HorizontalAlign="Center" SortExpression="" Visible="false">
                        <ItemTemplate>
                            <asp:Label ID="labDID" runat="server" Text='<%#Eval("DID") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                     <asp:TemplateField HeaderText="MDID" ItemStyle-HorizontalAlign="Center" SortExpression="" Visible="false">
                        <ItemTemplate>
                            <asp:Label ID="labMDID" runat="server" Text='<%#Eval("MDID") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                      <asp:TemplateField HeaderText="PendingDID" ItemStyle-HorizontalAlign="Center" SortExpression="" Visible="false">
                        <ItemTemplate>
                            <asp:Label ID="labPendingDID" runat="server" Text='<%#Eval("PendingDID") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                     <asp:TemplateField HeaderText="PlantID" ItemStyle-HorizontalAlign="Center" SortExpression="" Visible="false">
                        <ItemTemplate>
                            <asp:Label ID="PlantID" runat="server" Text='<%#Eval("PlantID") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                              <asp:TemplateField HeaderText="Plant" ItemStyle-HorizontalAlign="Center" SortExpression="" Visible="true">
                        <ItemTemplate>
                            <asp:Label ID="Plant" runat="server" Text='<%#Eval("Plant") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                              <asp:TemplateField HeaderText="Delivery No" ItemStyle-HorizontalAlign="Center" SortExpression="" Visible="true">
                        <ItemTemplate>
                            <asp:Label ID="labDeliveryNo" runat="server" Text='<%#Eval("DeliveryNo") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                              <asp:TemplateField HeaderText="Buyer PO No"  ItemStyle-HorizontalAlign="Center" SortExpression="" Visible="true">
                        <ItemTemplate>
<%--                            <asp:Label ID="labBuyerPONo" runat="server" Text='<%#Eval("BuyerPONo") %>'></asp:Label>--%>
                        <asp:LinkButton ID="labBuyerPONo" runat="server" OnClick="GridSuReport_Click"   Text='<%#Eval("BuyerPONo") %>' Width="180px"></asp:LinkButton>
                        </ItemTemplate>
                        <FooterTemplate>
                     <div >  <asp:Label ID="lblTotColourQty"   runat="server" /> </div> 
                                </FooterTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="FOB" ItemStyle-HorizontalAlign="Right" Visible="false" SortExpression="" >
                        <ItemTemplate>
                            <asp:Label ID="labFOB" runat="server" Text='<%#Eval("FOB") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Extended Ship Date"  ItemStyle-HorizontalAlign="Center" SortExpression="" >
                        <ItemTemplate>
                            <asp:Label ID="labExtendedShipDate" runat="server" Text='<%#Eval("ExtendedShipDate") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Committed Date"  ItemStyle-HorizontalAlign="Center" SortExpression="" >
                        <ItemTemplate>
                            <asp:Label ID="labPromisedDate" runat="server" Text='<%#Eval("PromisedDate") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Committed Qty"  ItemStyle-HorizontalAlign="Right" SortExpression="" >
                        <ItemTemplate>
                            <asp:Label ID="labPromisedQty" runat="server" Text='<%#Eval("PromisedQty") %>'></asp:Label>
                        </ItemTemplate>
                        <FooterTemplate>
                     <div >  <asp:Label ID="lblTotPromisedQty"    runat="server" /> </div> 
                                </FooterTemplate>
                    </asp:TemplateField>
                      <asp:TemplateField HeaderText="Despatched Qty"  ItemStyle-HorizontalAlign="Right" SortExpression="" >
                        <ItemTemplate>
                            <asp:Label ID="labDespatchedQty" runat="server" Text='<%#Eval("DespatchedQty") %>'></asp:Label>
                        </ItemTemplate>
                           <FooterTemplate>
                     <div>  <asp:Label ID="lblTotDespatchedQty"   runat="server" /> </div> 
                                </FooterTemplate>
                    </asp:TemplateField>



                 <asp:TemplateField HeaderText="Committed Vs Des"  ItemStyle-HorizontalAlign="Right" Visible="false">
                        <ItemTemplate>
                            <asp:Label ID="labPromisedQtyDetail" runat="server" ></asp:Label>
                        </ItemTemplate>
                            <FooterTemplate>
                              <div>  <asp:Label ID="lblTotPromisedQtyDetailFOBDetail"   runat="server" /> </div> 
                                </FooterTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Committed Vs Des"  ItemStyle-HorizontalAlign="Right" Visible="false">
                        <ItemTemplate>
                            <asp:Label ID="labPromisedQtyFOB" runat="server" ></asp:Label>
                        </ItemTemplate>
                        <FooterTemplate>
                              <div>  <asp:Label ID="lblTotPromisedQtyFOBValue"   runat="server" /> </div> 
                                </FooterTemplate>
                    </asp:TemplateField>


                     <asp:TemplateField HeaderText="Over/Short Qty"  ItemStyle-HorizontalAlign="Right" SortExpression="" >
                        <ItemTemplate>
                            <asp:Label ID="labOSQty" runat="server" Text='<%#Eval("OSQty") %>'></asp:Label>
                        </ItemTemplate>
                         <FooterTemplate>
                     <div>  
                        <asp:Label ID="lblTotOSQty"   runat="server" />                 
                     </div> 
                       </FooterTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Remarks" Visible="true">
                        <ItemTemplate>
                            <asp:Label ID="OverShortReason" runat="server" Text='<%#Eval("OverShortReason") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Despatched On"  ItemStyle-HorizontalAlign="Center" Visible="true">
                        <ItemTemplate>
                            <asp:Label ID="labDespatchedOn" runat="server" Text='<%#Eval("DespatchedOn") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Shipped On"  ItemStyle-HorizontalAlign="Center">
                        <ItemTemplate>
                            <asp:Label ID="labShippedOn" runat="server" Text='<%#Eval("ShippedOn") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                      <asp:TemplateField HeaderText="Pending"  Visible="false" ItemStyle-HorizontalAlign="Center">
                        <ItemTemplate>
                            <asp:Label ID="labPending" runat="server" Text='<%#Eval("Pending") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                     <asp:TemplateField HeaderText="ChildCount"  Visible="false" ItemStyle-HorizontalAlign="Center">
                        <ItemTemplate>
                            <asp:Label ID="labChildCount" runat="server" Text='<%#Eval("ChildCount") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                       <asp:TemplateField HeaderText="POID"  Visible="false" ItemStyle-HorizontalAlign="Center">
                        <ItemTemplate>
                            <asp:Label ID="labPOID" runat="server" Text='<%#Eval("POID") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Cancel" Visible="false">
                            <ItemTemplate>                           
                                <asp:Label ID="labCancel" runat="server" Visible="true" Text='<%#Eval("Cancel") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                                      <asp:TemplateField HeaderText="Cancel"  Visible="true">
                            <ItemTemplate>                           
                                <asp:Label ID="labCancelRemarks" Width="80px" runat="server" Visible="true" Text='<%#Eval("CancelRe") %>'></asp:Label>
                            </ItemTemplate>
                    </asp:TemplateField>
                     <asp:TemplateField HeaderText="Short Reason"  Visible="true">
                            <ItemTemplate>                           
                                <asp:Label ID="labShortReason" Width="80px" runat="server" Visible="true" Text='<%#Eval("ShortReason") %>'></asp:Label>
                            </ItemTemplate>
                    </asp:TemplateField>
                    
                </Columns>
                <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />

            </asp:GridView>
                        <br />
                        <br />
                        <asp:Label ID="Labebpo" runat="server" Text=""></asp:Label>
                        <br />
                        <br />
                                     <asp:GridView ID="GridSuReportSub" runat="server"  ShowFooter="true"   AutoGenerateColumns="False" BackColor="White" BorderColor="#cc3300" 
                BorderWidth="2px" CellPadding="4" ForeColor="Black" OnRowCreated="GridSuReport_RowCreated" FooterStyle-HorizontalAlign="Right" OnRowDataBound="GridSuReportSub_RowDataBound"  AllowSorting="True" Style="max-width: 100%; min-width: 90%"
                EnableModelValidation="True" Width="980px"  >
               
                <Columns>
                    
                      <asp:TemplateField HeaderText="Plant" ItemStyle-HorizontalAlign="Center" Visible="false" SortExpression="">
                        <ItemTemplate>
                            <asp:Label ID="labPlant" runat="server" Text='<%#Eval("Plant") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                     <asp:TemplateField HeaderText="Colour" ItemStyle-HorizontalAlign="Center" SortExpression="">
                        <ItemTemplate>
                            <asp:Label ID="labColorName" runat="server" Text='<%#Eval("ColorName") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                     <asp:TemplateField HeaderText="ExtendedShipDate" ItemStyle-HorizontalAlign="Center" SortExpression="" Visible="false">
                        <ItemTemplate>
                            <asp:Label ID="labExtendedShipDate" runat="server" Text='<%#Eval("ExtendedShipDate") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                      <asp:TemplateField HeaderText="Committed Qty" ItemStyle-HorizontalAlign="Right" SortExpression="" >
                        <ItemTemplate>
                            <asp:Label ID="labPromisedQty" runat="server" Text='<%#Eval("PromisedQty") %>'></asp:Label>
                        </ItemTemplate>
                          <FooterTemplate>
                              <div>  <asp:Label ID="lblTotPromisedQty"   runat="server" /> </div> 
                                </FooterTemplate>
                    </asp:TemplateField>
                     <asp:TemplateField HeaderText="DespatchedQty" ItemStyle-HorizontalAlign="Right" SortExpression="" Visible="">
                        <ItemTemplate>
                            <asp:Label ID="labDespatchedQty" runat="server" Text='<%#Eval("DespatchedQty") %>'></asp:Label>
                        </ItemTemplate>
                             <FooterTemplate>
                              <div>  <asp:Label ID="lblTotDespatchedQty"   runat="server" /> </div> 
                                </FooterTemplate>
                    </asp:TemplateField>
                              <asp:TemplateField HeaderText="Over/Short Qty" ItemStyle-HorizontalAlign="Right"  SortExpression="" Visible="true">
                        <ItemTemplate>
                            <asp:Label ID="labOSQty" runat="server" Text='<%#Eval("OSQty") %>'></asp:Label>
                        </ItemTemplate>
                                      <FooterTemplate>
                              <div>  <asp:Label ID="lblTotOSQty"   runat="server" /> </div> 
                                </FooterTemplate>
                    </asp:TemplateField>
                     <asp:TemplateField HeaderText="Cancel" Visible="false">
                            <ItemTemplate>                           
                                <asp:Label ID="labCancel" runat="server" Visible="true" Text='<%#Eval("Cancel") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                                      <asp:TemplateField HeaderText="Cancel"  Visible="true">
                            <ItemTemplate>                           
                                <asp:Label ID="labCancelRemarks" Width="80px" runat="server" Visible="true" Text='<%#Eval("CancelRe") %>'></asp:Label>
                            </ItemTemplate>
                    </asp:TemplateField>
                            
              
                    
                </Columns>
                <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />

            </asp:GridView>

                         <br />
                        <br />
                        <asp:Label ID="Label5" runat="server" Text="BPO Summery"></asp:Label>
                        <br />
                        <br />


                          <asp:GridView ID="GridBpoSummery" runat="server"  ShowFooter="false"   AutoGenerateColumns="False" BackColor="White" BorderColor="#cc3300" 
                BorderWidth="2px" CellPadding="4" ForeColor="Black" OnRowDataBound="GridBpoSummery_RowDataBound"  FooterStyle-HorizontalAlign="Right"   AllowSorting="True" Style="max-width: 100%; min-width: 90%"
                EnableModelValidation="True" Width="980px"  >
               
                <Columns>
                    
                    
                     <asp:TemplateField HeaderText="BuyerPONo" ItemStyle-HorizontalAlign="Center" SortExpression="">
                        <ItemTemplate>
                            <asp:Label ID="labBuyerPONo" runat="server" Text='<%#Eval("BuyerPONo") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                     <asp:TemplateField HeaderText="ContractNo" ItemStyle-HorizontalAlign="Center" SortExpression="" Visible="">
                        <ItemTemplate>
                            <asp:Label ID="labContractNo" runat="server" Text='<%#Eval("ContractNo") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                      <asp:TemplateField HeaderText="BPOQty" ItemStyle-HorizontalAlign="Right" SortExpression="" >
                        <ItemTemplate>
                            <asp:Label ID="ReqQty" runat="server" Text='<%#Eval("ReqQty") %>'></asp:Label>
                        </ItemTemplate>
                          
                    </asp:TemplateField>

                     <asp:TemplateField HeaderText="ShippedQty" ItemStyle-HorizontalAlign="Right" SortExpression="" >
                        <ItemTemplate>
                            <asp:Label ID="ShippedQty" runat="server" Text='<%#Eval("ShippedQty")%>'></asp:Label>
                        </ItemTemplate>
                             
                    </asp:TemplateField>

                     <asp:TemplateField HeaderText="Short / Over Qty" ItemStyle-HorizontalAlign="Right" SortExpression="" Visible="">
                        <ItemTemplate>
                            <asp:Label ID="labShippedQty" runat="server"></asp:Label>
                        </ItemTemplate>
                             
                    </asp:TemplateField>

                              <asp:TemplateField HeaderText="ExtendedShipDate" ItemStyle-HorizontalAlign="Right"  SortExpression="" Visible="true">
                        <ItemTemplate>
                            <asp:Label ID="labExtendedShipDate" runat="server" Text='<%#Eval("ExtendedShipDate", "{0:dd/MM/yyyy}") %>'></asp:Label>
                        </ItemTemplate>
                                    
                    </asp:TemplateField>

                     <asp:TemplateField HeaderText="maxShippedDate" ItemStyle-HorizontalAlign="Right" Visible="">
                            <ItemTemplate>                           
                                <asp:Label ID="labmaxShippedDate" runat="server" Text='<%#Eval("maxShippedDate", "{0:dd/MM/yyyy}") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                                 
                </Columns>
                <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />

            </asp:GridView>



                        <br />
                        <br />
                        <asp:Label ID="Label1" runat="server" Text="Pending Deliveries"></asp:Label>
                        <br />
                        <br />

                          <asp:GridView ID="GridViewShiped" runat="server"  ShowFooter="true"   AutoGenerateColumns="False" BackColor="White" BorderColor="#cc3300" 
                BorderWidth="2px" CellPadding="4" ForeColor="Black"  FooterStyle-HorizontalAlign="Right" OnRowDataBound="GridViewShiped_RowDataBound"  AllowSorting="True" Style="max-width: 100%; min-width: 90%"
                EnableModelValidation="True" Width="1036px"  >
               
                <Columns>
                    
                     <asp:TemplateField HeaderText="PlantID" ItemStyle-HorizontalAlign="Center" SortExpression="" Visible="false">
                        <ItemTemplate>
                            <asp:Label ID="PlantID" runat="server" Text='<%#Eval("PlantID") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                              <asp:TemplateField HeaderText="Plant" ItemStyle-Width="20px" ItemStyle-HorizontalAlign="Center" SortExpression="" Visible="true">
                        <ItemTemplate>
                            <asp:Label ID="Plant" runat="server" Text='<%#Eval("Plant") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                              <asp:TemplateField HeaderText="Delivery No" ItemStyle-Width="23px" ItemStyle-HorizontalAlign="Center" SortExpression="" Visible="true">
                        <ItemTemplate>
                            <asp:Label ID="labDeliveryNo" runat="server" Text='<%#Eval("DeliveryNo") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                              <asp:TemplateField HeaderText="Buyer PO No"  ItemStyle-Width="180px" ItemStyle-HorizontalAlign="Center" SortExpression="" Visible="true">
                        <ItemTemplate>
                            <asp:Label ID="labBuyerPONo" runat="server" Text='<%#Eval("BuyerPONo") %>'></asp:Label>
                        </ItemTemplate>
                        <FooterTemplate>
                     <div >  <asp:Label ID="lblTotColourQty"   runat="server" /> </div> 
                                </FooterTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="FOB"  ItemStyle-HorizontalAlign="Right" Visible="false" SortExpression="" >
                        <ItemTemplate>
                            <asp:Label ID="labFOB" runat="server" Text='<%#Eval("FOB") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Extended Ship Date" ItemStyle-Width="55px"  ItemStyle-HorizontalAlign="Center" SortExpression="" >
                        <ItemTemplate>
                            <asp:Label ID="labExtendedShipDate" runat="server" Text='<%#Eval("ExtendedShipDate") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Committed Date"  ItemStyle-Width="55px" ItemStyle-HorizontalAlign="Center" SortExpression="" >
                        <ItemTemplate>
                            <asp:Label ID="labPromisedDate" runat="server" Text='<%#Eval("PromisedDate") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Committed Qty" ItemStyle-Width="40px"  ItemStyle-HorizontalAlign="Right" SortExpression="" >
                        <ItemTemplate>
                            <asp:Label ID="labPromisedQty" runat="server" Text='<%#Eval("PromisedQty") %>'></asp:Label>
                        </ItemTemplate>
                        <FooterTemplate>
                     <div >  <asp:Label ID="lblTotPromisedQty"    runat="server" /> </div> 
                                </FooterTemplate>
                    </asp:TemplateField>
 
                



                       <asp:TemplateField HeaderText="Despatched Qty" ItemStyle-Width="35px"  ItemStyle-HorizontalAlign="Right" SortExpression="" >
                        <ItemTemplate>
                            <asp:Label ID="labDespatchedQty" runat="server" ></asp:Label>
                        </ItemTemplate>
                           <FooterTemplate>
                     <div>  <asp:Label ID="lblTotDespatchedQty"   runat="server" /> </div> 
                                </FooterTemplate>
                    </asp:TemplateField>

                 <asp:TemplateField HeaderText="Committed Vs Des"  ItemStyle-HorizontalAlign="Right" Visible="false">
                        <ItemTemplate>
                            <asp:Label ID="labPromisedQtyDetail" runat="server" ></asp:Label>
                        </ItemTemplate>
                            <FooterTemplate>
                              <div>  <asp:Label ID="lblTotPromisedQtyDetailFOBDetail"   runat="server" /> </div> 
                                </FooterTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Committed Vs Des"  ItemStyle-HorizontalAlign="Right" Visible="false">
                        <ItemTemplate>
                            <asp:Label ID="labPromisedQtyFOB" runat="server" ></asp:Label>
                        </ItemTemplate>
                        <FooterTemplate>
                              <div>  <asp:Label ID="lblTotPromisedQtyFOBValue"   runat="server" /> </div> 
                                </FooterTemplate>
                    </asp:TemplateField>


                     <asp:TemplateField HeaderText="Over/Short Qty"  ItemStyle-Width="40px" ItemStyle-HorizontalAlign="Right" SortExpression="" >
                        <ItemTemplate>
                            <asp:Label ID="labOSQty" runat="server" ></asp:Label>
                        </ItemTemplate>
                         <FooterTemplate>
                     <div>  
                        <asp:Label ID="lblTotOSQty"   runat="server" />                 
                     </div> 
                       </FooterTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Remarks" ItemStyle-Width="72px"  Visible="true">
                        <ItemTemplate>
                            <asp:Label ID="OverShortReason" runat="server" ></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Despatched On" ItemStyle-Width="40px"  ItemStyle-HorizontalAlign="Center" Visible="true">
                        <ItemTemplate>
                            <asp:Label ID="labDespatchedOn" runat="server" ></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Shipped On"  ItemStyle-HorizontalAlign="Center">
                        <ItemTemplate>
                            <asp:Label ID="labShippedOn" runat="server" ></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                      <asp:TemplateField HeaderText="Pending"  Visible="false" ItemStyle-HorizontalAlign="Center">
                        <ItemTemplate>
                            <asp:Label ID="labPending" runat="server" ></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                     <asp:TemplateField HeaderText="ChildCount"  Visible="false" ItemStyle-HorizontalAlign="Center">
                        <ItemTemplate>
                            <asp:Label ID="labChildCount" runat="server" ></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                       <asp:TemplateField HeaderText="POID"  Visible="false" ItemStyle-HorizontalAlign="Center">
                        <ItemTemplate>
                            <asp:Label ID="labPOID" runat="server" ></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Cancel" Visible="false">
                            <ItemTemplate>                           
                                <asp:Label ID="labCancel" runat="server" Visible="true" ></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                                      <asp:TemplateField HeaderText="Cancel"  Visible="true">
                            <ItemTemplate>                           
                                <asp:Label ID="labCancelRemarks" Width="80px" runat="server" Visible="true" ></asp:Label>
                            </ItemTemplate>
                    </asp:TemplateField>
                     <asp:TemplateField HeaderText="Short Reason"  Visible="true">
                            <ItemTemplate>                           
                                <asp:Label ID="labShortReason" Width="80px" runat="server" Visible="true" ></asp:Label>
                            </ItemTemplate>
                    </asp:TemplateField>
                   
                   
                </Columns>
                <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />

            </asp:GridView>


                        <br />
                        <br />
                        <asp:Label ID="Label3" runat="server" Text="Shipment History"></asp:Label>
                        <br />
                        <br />
                        <asp:GridView ID="GridViewOtherShipments" runat="server"  ShowFooter="true"   AutoGenerateColumns="False" BackColor="White" BorderColor="#cc3300" 
                BorderWidth="2px" CellPadding="4" ForeColor="Black" OnRowDataBound="GridSuReport_GridViewOtherShipments"  FooterStyle-HorizontalAlign="Right"   AllowSorting="True" Style="max-width: 100%; min-width: 90%"
                EnableModelValidation="True" Width="1039px"  >
               
                <Columns>
                    
                     <asp:TemplateField HeaderText="PlantID" ItemStyle-HorizontalAlign="Center" SortExpression="" Visible="false">
                        <ItemTemplate>
                            <asp:Label ID="PlantID" runat="server" Text='<%#Eval("PlantID") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                              <asp:TemplateField HeaderText="Plant" ItemStyle-HorizontalAlign="Center" SortExpression="" Visible="true">
                        <ItemTemplate>
                            <asp:Label ID="Plant" runat="server" Text='<%#Eval("Plant") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                              <asp:TemplateField HeaderText="Delivery No"  ItemStyle-Width="23px" ItemStyle-HorizontalAlign="Center" SortExpression="" Visible="true">
                        <ItemTemplate>
                            <asp:Label ID="labDeliveryNo" runat="server" Text='<%#Eval("DeliveryNo") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                              <asp:TemplateField HeaderText="Buyer PO No"   ItemStyle-Width="179px" ItemStyle-HorizontalAlign="Center" SortExpression="" Visible="true">
                        <ItemTemplate>
                            <asp:Label ID="labBuyerPONo" runat="server" Text='<%#Eval("BuyerPONo") %>'></asp:Label>
                        </ItemTemplate>
                        <FooterTemplate>
                     <div >  <asp:Label ID="lblTotColourQty"   runat="server" /> </div> 
                                </FooterTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="FOB" ItemStyle-HorizontalAlign="Right" Visible="false" SortExpression="" >
                        <ItemTemplate>
                            <asp:Label ID="labFOB" runat="server" Text='<%#Eval("FOB") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Extended Ship Date" ItemStyle-Width="45px"   ItemStyle-HorizontalAlign="Center" SortExpression="" >
                        <ItemTemplate>
                            <asp:Label ID="labExtendedShipDate" runat="server" Text='<%#Eval("ExtendedShipDate") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Committed Date" ItemStyle-Width="45px"  ItemStyle-HorizontalAlign="Center" SortExpression="" >
                        <ItemTemplate>
                            <asp:Label ID="labPromisedDate" runat="server" Text='<%#Eval("PromisedDate") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Committed Qty" ItemStyle-Width="35px"   ItemStyle-HorizontalAlign="Right" SortExpression="" >
                        <ItemTemplate>
                            <asp:Label ID="labPromisedQty" runat="server" Text='<%#Eval("PromisedQty") %>'></asp:Label>
                        </ItemTemplate>
                        <FooterTemplate>
                     <div >  <asp:Label ID="lblTotPromisedQty"    runat="server" /> </div> 
                                </FooterTemplate>
                    </asp:TemplateField>
                      <asp:TemplateField HeaderText="Despatched Qty"  ItemStyle-Width="35px"  ItemStyle-HorizontalAlign="Right" SortExpression="" >
                        <ItemTemplate>
                            <asp:Label ID="labDespatchedQty" runat="server" Text='<%#Eval("DespatchedQty") %>'></asp:Label>
                        </ItemTemplate>
                           <FooterTemplate>
                     <div>  <asp:Label ID="lblTotDespatchedQty"   runat="server" /> </div> 
                                </FooterTemplate>
                    </asp:TemplateField>



                 <asp:TemplateField HeaderText="Committed Vs Des"  ItemStyle-HorizontalAlign="Right" Visible="false">
                        <ItemTemplate>
                            <asp:Label ID="labPromisedQtyDetail" runat="server" ></asp:Label>
                        </ItemTemplate>
                            <FooterTemplate>
                              <div>  <asp:Label ID="lblTotPromisedQtyDetailFOBDetail"   runat="server" /> </div> 
                                </FooterTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Committed Vs Des"  ItemStyle-HorizontalAlign="Right" Visible="false">
                        <ItemTemplate>
                            <asp:Label ID="labPromisedQtyFOB" runat="server" ></asp:Label>
                        </ItemTemplate>
                        <FooterTemplate>
                              <div>  <asp:Label ID="lblTotPromisedQtyFOBValue"   runat="server" /> </div> 
                                </FooterTemplate>
                    </asp:TemplateField>


                     <asp:TemplateField HeaderText="Over/Short Qty"  ItemStyle-Width="40px"  ItemStyle-HorizontalAlign="Right" SortExpression="" >
                        <ItemTemplate>
                            <asp:Label ID="labOSQty" runat="server" Text='<%#Eval("OSQty") %>'></asp:Label>
                        </ItemTemplate>
                         <FooterTemplate>
                     <div>  
                        <asp:Label ID="lblTotOSQty"   runat="server" />                 
                     </div> 
                       </FooterTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Remarks"  ItemStyle-Width="70px" Visible="true">
                        <ItemTemplate>
                            <asp:Label ID="OverShortReason" runat="server" Text='<%#Eval("OverShortReason") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Despatched On" ItemStyle-Width="40px"   ItemStyle-HorizontalAlign="Center" Visible="true">
                        <ItemTemplate>
                            <asp:Label ID="labDespatchedOn" runat="server" Text='<%#Eval("DespatchedOn") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Shipped On"  ItemStyle-HorizontalAlign="Center">
                        <ItemTemplate>
                            <asp:Label ID="labShippedOn" runat="server" Text='<%#Eval("ShippedOn") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                       <asp:TemplateField HeaderText="Cancel" Visible="true">
                            <ItemTemplate>                           
                                <asp:Label ID="labCancel" Width="80px" runat="server" Visible="true" ></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                     <asp:TemplateField HeaderText="Short Reason"  ItemStyle-HorizontalAlign="Center">
                        <ItemTemplate>
                            <asp:Label ID="ShortReason" runat="server" Text='<%#Eval("ShortReason") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                      <%-- <asp:TemplateField HeaderText="Pending"  ItemStyle-HorizontalAlign="Center" Visible="false">
                        <ItemTemplate>
                            <asp:Label ID="labsPending" runat="server" Text='<%#Eval("Pending") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>--%>

                    <%--    <asp:TemplateField HeaderText="ChildCount"  Visible="false" ItemStyle-HorizontalAlign="Center">
                        <ItemTemplate>
                            <asp:Label ID="labChildCount" runat="server" Text='<%#Eval("ChildCount") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>--%>
                     <asp:TemplateField HeaderText="ChildCount"  Visible="false" ItemStyle-HorizontalAlign="Center">
                        <ItemTemplate>
                            <asp:Label ID="labChildCount" runat="server" Text='<%#Eval("ChildCount") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                      <asp:TemplateField HeaderText="Pending"  Visible="false" ItemStyle-HorizontalAlign="Center">
                        <ItemTemplate>
                            <asp:Label ID="labPendings" runat="server" Text='<%#Eval("Pending") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                    
                </Columns>
                <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />

            </asp:GridView>


    <br /> <br />
                      <br />
                        <asp:Label ID="Label4" runat="server" Text="Debit Notes" style="font-size: small"></asp:Label>
                          
                        <asp:GridView ID="GridViewDebitNotes" runat="server"  ShowFooter="true"  OnRowDataBound="GridViewDebitNotes_RowDataBound"   AutoGenerateColumns="False" BackColor="White" BorderColor="#cc3300" 
                BorderWidth="2px" CellPadding="4" ForeColor="Black"   FooterStyle-HorizontalAlign="Right"   AllowSorting="True" Style="max-width: 100%; min-width: 90%; font-size: small;"
                EnableModelValidation="True" Width="980px"  >
               
                <Columns>
                    
                    <asp:TemplateField HeaderText="DB Note"  SortExpression="" >
                        <ItemTemplate>
                            <asp:Label ID="DEBNumber" runat="server" Text='<%#Eval("DEBNumber") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                     <asp:TemplateField HeaderText="Style"  SortExpression="" >
                        <ItemTemplate>
                            <asp:Label ID="STYLE" runat="server" Text='<%#Eval("STYLE") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Item Description"  SortExpression="" >
                        <ItemTemplate>
                            <asp:Label ID="ItemDescription" runat="server" Text='<%#Eval("ItemDescription") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="DB Note Date">
                            <ItemTemplate>
                                <asp:Label ID="DEBDate" runat="server" Text='<%#Eval("DB_NOTE_DATE","{0:dd/MMM/yyyy}") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>

                    <asp:TemplateField HeaderText="AGAINST"   SortExpression="" >
                        <ItemTemplate>
                            <asp:Label ID="Address" runat="server" Text='<%#Eval("AGAINST") %>'></asp:Label>
                        </ItemTemplate>                        
                    </asp:TemplateField>
                               
                    <asp:TemplateField HeaderText="DESCRIPTION"   Visible="true">
                        <ItemTemplate>
                            <asp:Label ID="DESCRIPTION" runat="server" Text='<%#Eval("DESCRIPTION") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                  <asp:TemplateField HeaderText="Merchandiser"   Visible="true">
                        <ItemTemplate>
                            <asp:Label ID="OurMerchandiserName" runat="server" Text='<%#Eval("MERCHANDISER") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="DB Note Quantity" ItemStyle-HorizontalAlign="Right"  Visible="true">
                        <ItemTemplate>
                            <asp:Label ID="QUANTITY"  runat="server" Text='<%#Eval("QUANTITY") %>'></asp:Label>
                        </ItemTemplate>
                         <FooterTemplate>
                     <div>  <asp:Label ID="lblTotDebQUANTITY"   runat="server" /> </div> 
                                </FooterTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Amount"   Visible="true">
                        <ItemTemplate>
                            <asp:Label ID="AMOUNT" runat="server" Text='<%#Eval("AMOUNT") %>'></asp:Label>
                        </ItemTemplate>
                         <FooterTemplate>
                     <div>  <asp:Label ID="lblTotDebAMOUNT"   runat="server" /> </div> 
                                </FooterTemplate>
                  
                    </asp:TemplateField>
                      <asp:TemplateField HeaderText="Acknowledge Quantity"  ItemStyle-HorizontalAlign="Right"  Visible="true">
                        <ItemTemplate>
                            <asp:Label ID="AcknowledgeQty" runat="server" Text='<%#Eval("AcknowledgeQty") %>'></asp:Label>
                        </ItemTemplate>
                          <FooterTemplate>
                     <div>  <asp:Label ID="lblAcknowledgeQty"   runat="server" /> </div> 
                                </FooterTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Currrency"   Visible="true">
                        <ItemTemplate>
                            <asp:Label ID="CURRENCY" runat="server" Text='<%#Eval("CURRENCY") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                     <asp:TemplateField HeaderText="Approve Comment"   Visible="true">
                        <ItemTemplate>
                            <asp:Label ID="ShortShipmentApprovalComment" runat="server" Text='<%#Eval("ShortShipmentApprovalComment") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
                <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
            </asp:GridView>
                    <br />
                         <br />
                        <asp:Label ID="Label6" runat="server" Text="Sample Dispatch Notes" style="font-size: small"></asp:Label>
                         <asp:GridView ID="GVSampleDespatchNote" runat="server"  ShowFooter="true"  OnRowDataBound="GVSampleDespatchNote_RowDataBound"    AutoGenerateColumns="False" BackColor="White" BorderColor="#cc3300" 
                BorderWidth="2px" CellPadding="4" ForeColor="Black"   FooterStyle-HorizontalAlign="Right"   AllowSorting="True" Style="max-width: 100%; min-width: 90%; font-size: small;"
                EnableModelValidation="True" Width="980px"  >
               
                <Columns>
                    
                   <asp:TemplateField HeaderText="Sample Despatch No"  SortExpression="" >
                        <ItemTemplate>
                            <asp:Label ID="SampleDespatchNo" runat="server" Text='<%#Eval("SampleDespatchNo") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                     <asp:TemplateField HeaderText="Style"  SortExpression="" >
                        <ItemTemplate>
                            <asp:Label ID="STYLE" runat="server" Text='<%#Eval("StyleNo") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Color"  SortExpression="" >
                        <ItemTemplate>
                            <asp:Label ID="ColorName" runat="server" Text='<%#Eval("ColorName") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                   

                    <asp:TemplateField HeaderText="Sample Type"   SortExpression="" >
                        <ItemTemplate>
                            <asp:Label ID="SampleType" runat="server" Text='<%#Eval("SampleType") %>'></asp:Label>
                        </ItemTemplate>                        
                    </asp:TemplateField>
                       <asp:TemplateField HeaderText="Despatched Qty"  ItemStyle-HorizontalAlign="Right"  Visible="true">
                        <ItemTemplate>
                            <asp:Label ID="DespatchedQty" runat="server" Text='<%#Eval("DespatchedQty") %>'></asp:Label>
                        </ItemTemplate>
                           <FooterTemplate>
                     <div>  <asp:Label ID="lblTotDespatchedQty"   runat="server" /> </div> 
                                </FooterTemplate>
                    </asp:TemplateField> 
                     <asp:TemplateField HeaderText="Received QTy"  ItemStyle-HorizontalAlign="Right"  Visible="true">
                        <ItemTemplate>
                            <asp:Label ID="ReceivedQTy" runat="server" Text='<%#Eval("ReceivedQTy") %>'></asp:Label>
                        </ItemTemplate>
                          <FooterTemplate>
                     <div>  <asp:Label ID="lblTotReceivedQTy"   runat="server" /> </div> 
                                </FooterTemplate>
                    </asp:TemplateField> 
                    <asp:TemplateField HeaderText="Remaining Qty"  ItemStyle-HorizontalAlign="Right"  Visible="true">
                        <ItemTemplate>
                            <asp:Label ID="RemainingQty" runat="server" Text='<%#Eval("RemainingQty") %>'></asp:Label>
                        </ItemTemplate>
                        <FooterTemplate>
                     <div>  <asp:Label ID="lblTotRemainingQty"   runat="server" /> </div> 
                                </FooterTemplate>
                
                    </asp:TemplateField> 
                      <asp:TemplateField HeaderText="Despatched To"   Visible="true">
                        <ItemTemplate>
                            <asp:Label ID="DespatchCompany" runat="server" Text='<%#Eval("DespatchCompany") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField> 
                     <asp:TemplateField HeaderText="Despatched Date">
                            <ItemTemplate>
                                <asp:Label ID="DespatchedDate" runat="server" Text='<%#Eval("DespatchedDate","{0:dd/MMM/yyyy}") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>      
                    <asp:TemplateField HeaderText="Despatch Comment"   Visible="true">
                        <ItemTemplate>
                            <asp:Label ID="DespatchComment" runat="server" Text='<%#Eval("DespatchComment") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                <asp:TemplateField HeaderText="Location"   Visible="true">
                        <ItemTemplate>
                            <asp:Label ID="Send_Plant" runat="server" Text='<%#Eval("Send_Plant") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    
                     
                </Columns>
                <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />

            </asp:GridView>
                          <br />
                            </label>
                </div>
                <div class="row">
                    <div class="col-md-4">
                       
                    </div>
                    <div class="col-md-7">
                      


                    </div>
                    <div class="col-md-5">
                       
                    </div>
                </div>
                <div class="row">&nbsp;</div>
             
             
            </asp:Panel>
            <asp:Label ID="lblBuyerID" runat="server" Text="" Visible="false"></asp:Label>
            <asp:Label ID="lblBPOID" runat="server" Text="" Visible="false"></asp:Label>
            <asp:Label ID="lblBPOSEQ" runat="server" Text="" Visible="false"></asp:Label>
            <asp:Label ID="lblSDID" runat="server" Text="" Visible="false"></asp:Label>
            <asp:Label ID="lblSDSEQ" runat="server" Text="" Visible="false"></asp:Label>
            <asp:Label ID="lblSuPOQty" runat="server" Text="" Visible="false"></asp:Label>
            <asp:Label ID="lblSPlantID" runat="server" Text="" Visible="false"></asp:Label>
            <asp:Label ID="lblOrderNo" runat="server" Text="" Visible="false"></asp:Label>
            <asp:Label ID="lblPOID" runat="server" Text="" Visible="false"></asp:Label>
            <asp:Label ID="LblColorCode" runat="server" Text="" Visible="false"></asp:Label>
            <asp:Label ID="LblSDSEQs" runat="server" Text="" Visible="false"></asp:Label>
            <asp:Label ID="lblTotalBPO" runat="server" Text="" Visible="false"></asp:Label>
            <asp:Label ID="lbltotalNoOfStyle" runat="server" Text="" Visible="false"></asp:Label>
            <asp:Label ID="lbltotalSPOQty" runat="server" Text="" Visible="false"></asp:Label>
            <asp:Label ID="lblTotalCommitedQty" runat="server" Text="" Visible="false"></asp:Label>
            <asp:Label ID="lblTotShipQty" runat="server" Text="" Visible="false"></asp:Label>
            <asp:Label ID="lbltotalSShortOverQty" runat="server" Text="" Visible="false"></asp:Label>
            <asp:Label ID="Label2" runat="server" Text="" Visible="false"></asp:Label>
            <br />
    </div>
</ContentTemplate>
</asp:UpdatePanel>
    </div>
    </form>
</body>
</html>
