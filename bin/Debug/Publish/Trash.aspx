<%@ page language="C#" autoeventwireup="true" inherits="Trash, App_Web_b2ychy0x" %>

<%@ Register Assembly="BasicFrame.WebControls.BasicDatePicker" Namespace="BasicFrame.WebControls" TagPrefix="BDP" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Deliveries</title>
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

        .auto-style1 {
            color: #FF0000;
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
                    <center><h3>Trash Deliveries</h3></center>
                </div>
                <div class="col-md-11">
                     <center><h3></h3></center>
                    </div>
            </div>
        </div>
        <asp:Panel ID="pnlsearch" runat="server" Visible="false">
            <div class="col-md-12">
                <div class="row">
                    <div class="col-md-12">
                        <div class="panel panel-default">
                            <div class="panel-body">
                                
                                <div class="row">
                                    <div class="box-body">
                                        <div class="form-group">
                                           
                                            <label class="col-md-1 control-label">Date Set Up </label>
                                            <div class="col-md-2">
                                               <span class="auto-style1"></span> <BDP:BasicDatePicker ID="DatePickerFromDate" runat="server" CssClass="form-control" />
                                            </div>
                                            <label class="col-md-1 control-label">To</label>
                                            <div class="col-md-2">
                                              <span class="auto-style1"></span>  <BDP:BasicDatePicker ID="DatePickerToDate" runat="server" CssClass="form-control" />
                                            </div>
                                             <label class="col-md-1 control-label">Plant</label>
                                            <div class="col-md-1">
                                                <asp:DropDownList ID="DDLPlant" runat="server" CssClass="form-control">
                                                </asp:DropDownList>
                                            </div>
                                            <div class="col-md-4">
                                                <asp:Button ID="BtnSearch" runat="server" CssClass="btn btn-info" OnClick="btnSearch_Click" Text="Search" Width="100px" />
                                                <asp:Button ID="BtnReset" runat="server" CssClass="btn btn-warning" OnClick="BtnReset_Click" Text="Reset" Width="100px" />
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
                <div>
<%--<div style="overflow:auto;" onscroll="OnScrollDiv(this)" id="DivMainContent" >--%>
            <asp:GridView ID="GVMSPShedule" runat="server" ShowFooter="true"   DataKeyNames="OrderNo" AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" 
                BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" OnRowDataBound="GVMSPShedule_RowDataBound"
                AllowSorting="True" Style="max-width: 100%; min-width: 90%" Font-Size="Small"
                EnableModelValidation="True"  >
               
                <Columns>
                    <asp:TemplateField HeaderText="Resend" SortExpression="" >
                        <ItemTemplate>
                    <asp:ImageButton ID="imgbtnAdd" OnClick="imgbtnAdd_Click" runat="server"  Height="30px" ImageUrl="~/images/Resend.png" ToolTip="Add to Schehdule" Width="30px" />
                     </ItemTemplate>
                    </asp:TemplateField>
                              <asp:TemplateField HeaderText="DID" SortExpression="" Visible="false">
                        <ItemTemplate>
                            <asp:Label ID="DID" runat="server" Text='<%#Eval("DID") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="BPOID" SortExpression="" Visible="false">
                        <ItemTemplate>
                            <asp:Label ID="BPOID" runat="server" Text='<%#Eval("BPOID") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="OrderNo" SortExpression="" Visible="false">
                        <ItemTemplate>
                            <asp:Label ID="OrderNo" runat="server" Text='<%#Eval("OrderNo") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="BPOSEQ" SortExpression="" Visible="false">
                        <ItemTemplate>
                            <asp:Label ID="BPOSEQ" runat="server" Text='<%#Eval("BPOSEQ") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="SDID" SortExpression="" Visible="false">
                        <ItemTemplate>
                            <asp:Label ID="SDID" runat="server" Text='<%#Eval("SDID") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="SDSEQ" SortExpression="" Visible="false">
                        <ItemTemplate>
                            <asp:Label ID="SDSEQ" runat="server" Text='<%#Eval("SDSEQ") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    
                    
                   
                    <asp:TemplateField HeaderText="Buyer" Visible="true">
                        <ItemTemplate>
                            <asp:Label ID="BuyerName" ToolTip="Buyer Name" runat="server" Text='<%#Eval("BuyerName") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Style">
                        <ItemTemplate>
                            <asp:Label ID="StyleNo" ToolTip="StyleNo" runat="server" Text='<%#Eval("StyleNo") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                   <asp:TemplateField HeaderText="BPO No" Visible="true">
                        <ItemTemplate>
                            <asp:Label ID="BuyerPONo" ToolTip="Buyer PO No" runat="server" Text='<%#Eval("BuyerPONo") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>                  
                    <asp:TemplateField HeaderText="Color" Visible="true">
                        <ItemTemplate>
                            <asp:Label ID="ColorName" ToolTip="Color Name" runat="server" Text='<%#Eval("ColorName") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                  
                    <asp:TemplateField HeaderText="Contract #" Visible="true">
                        <ItemTemplate>
                            <asp:Label ID="Label1" ToolTip="Contract #" runat="server" Text='<%#Eval("ContractNo") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                     <asp:TemplateField HeaderText="Plant" Visible="true">
                        <ItemTemplate>
                            <asp:Label ID="lblPlant" ToolTip="Plant" runat="server" Text='<%#Eval("Plant") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Ex. Ship Date" Visible="true">
                        <ItemTemplate>
                            <asp:Label ID="ExtendedShipDate" ToolTip="Ex. Ship Date" runat="server"  Text='<%#Eval("ExtendedShipDate","{0:dd/MMM/yyyy}") %>' ></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                       <asp:TemplateField HeaderText="BPO Qty" Visible="true">
                        <ItemTemplate>
                            <asp:Label ID="BPOQty" ToolTip="BPO Qty" runat="server" Text='<%#Eval("BPOQty") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    
                     <asp:TemplateField HeaderText="SPO Qty" Visible="false">
                        <ItemTemplate>
                            <asp:Label ID="SumithraPOQty" ToolTip="Sumithra PO Qty" runat="server" Text='<%#Eval("SumithraPOQty") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Del #" Visible="true">
                        <ItemTemplate>
                            <asp:Label ID="ContractNo" ToolTip="Del #" runat="server" Text='<%#Eval("DeliveryNo") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    
                     <asp:TemplateField HeaderText="Committed Qty" Visible="true">
                        <ItemTemplate>
                            <asp:Label ID="txtPromisedQty" ToolTip="Committed Qty" runat="server" Text='<%#Eval("DeliveryQty") %>'></asp:Label>
                                                   </ItemTemplate>
                    </asp:TemplateField>
                     <asp:TemplateField HeaderText="Committed Date" Visible="true">
                        <ItemTemplate>
                            <asp:Label ID="DeliveryDate" ToolTip="Committed Date" runat="server" Visible="true" Text='<%#Eval("DeliveryDate") %>'></asp:Label>
                          <%--  <BDP:BasicDatePicker  ID="BDPDeliveryDate"  Text='<%# Eval("DeliveryDate", "{0:dd/MM/yyyy}") %>'  runat="server" CssClass="form-control" />--%>
                        </ItemTemplate>
                    </asp:TemplateField>
                     <asp:TemplateField HeaderText="Comment" Visible="true">
                        <ItemTemplate>                           
                            <asp:Label ID="txtgvComment" runat="server" Text='<%#Eval("Comment") %>' Width="300px" />
                        </ItemTemplate>
                    </asp:TemplateField>
                  
                    <asp:TemplateField HeaderText="rowcunts" Visible="false">
                        <ItemTemplate>                           
                            <asp:Label ID="rowcunts" runat="server" Text='<%#Eval("rowcunts") %>'  />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="DNo" Visible="false">
                        <ItemTemplate>                           
                            <asp:Label ID="DNo" runat="server" Text='<%#Eval("DNo") %>'  />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="RevisedDate" Visible="true">
                        <ItemTemplate>
                            <asp:Label ID="RevisedDate" runat="server" Visible="true" Text='<%#Eval("RevisedDate") %>'></asp:Label>
                           
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