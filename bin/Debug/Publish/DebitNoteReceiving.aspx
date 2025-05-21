<%@ page language="C#" autoeventwireup="true" inherits="ShortShipmentApproval, App_Web_11yxmj2e" %>

<%@ Register Assembly="BasicFrame.WebControls.BasicDatePicker" Namespace="BasicFrame.WebControls" TagPrefix="BDP" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Short Shipment Approval</title>
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



/*.GVFixedHeader { font-weight:bold; background-color: Green; position:relative; 
                 top:expression(this.parentNode.parentNode.parentNode.scrollTop-1);}

.GVFixedFooter { font-weight:bold; background-color: Green; position:relative;
                 bottom:expression(getScrollBottom(this.parentNode.parentNode.parentNode.parentNode));}*/ 
</style>

    

    <%--<script language="javascript" >
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
            </script>--%>

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
                    <center><h3>Dispatch - Factory Failure Debit Notes</h3></center>
                </div>
            </div>
        </div>

        <asp:Panel ID="Panel1" runat="server" Visible="">
            <div class="col-md-12" >
                <div class="panel panel-default">
                    <div class="panel-body">
                        <div class="box-body">
                            <div class="form-group">
                             
                                <label class="col-md-2 control-label">DateRange</label>
                                <div class="col-md-2">
                                    <BDP:BasicDatePicker Width="50px" ToolTip="Debit Note Created & Approved Date"  ID="DatePickerFromDate" runat="server" CssClass="form-control" />
                                </div>

                                <div class="col-md-1"></div>
                               
                                <label class="col-md-1 control-label">To</label>
                                <div class="col-md-2">
                                   <BDP:BasicDatePicker ID="DatePickerToDate" ToolTip="Debit Note Created & Approved Date"  runat="server" CssClass="form-control" />
                                </div>
                          <div class="col-md-1"></div>
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

                              <div class="col-md-1">
                                <asp:Button ID="btnsearch" CssClass="btn btn-primary" runat="server" Text="Search" OnClick="btnsearch_Click" />
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
      <div >
                    <div id="GHead"></div> 
                    <div >
            <asp:GridView ID="GVMSPShedule" runat="server"     DataKeyNames="DEBID" AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" 
                BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black"  GridLines="Both"
                AllowSorting="True"  Font-Size="Small"
                EnableModelValidation="True" >
               
                <Columns>
                     <asp:TemplateField HeaderText="" >
                        <ItemTemplate>
                            <asp:Button ID="btnreceived"  runat="server" Text="Dispatch"  CssClass="btn btn-success"  OnClick="btnreceived_Click1" />
                        </ItemTemplate>
                    </asp:TemplateField>

                     <asp:TemplateField HeaderText="DISPATCH QTY" >
                        <ItemTemplate>
                            <asp:TextBox ID="txtReceiveQty" Width="50px"  runat="server" Text=""  />
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="DEBID" SortExpression="" Visible="false">
                        <ItemTemplate>
                            <asp:Label ID="labDEBID" runat="server" Text='<%#Eval("DEBID") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    
                      
                    <asp:TemplateField HeaderText="Company" SortExpression="" Visible="">
                        <ItemTemplate>
                            <asp:Label ID="Company" runat="server" Text='<%#Eval("Company") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                     <asp:TemplateField HeaderText="DB NOTE" SortExpression="" Visible="">
                        <ItemTemplate>
                            <asp:Label ID="DBNOTE" runat="server" Text='<%#Eval("DB NOTE") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                      <asp:TemplateField HeaderText="Buyer" SortExpression="" Visible="">
                        <ItemTemplate>
                            <asp:Label ID="BuyerName" runat="server" Text='<%#Eval("BuyerName") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="STYLE" SortExpression="" Visible="">
                        <ItemTemplate>
                            <asp:Label ID="STYLE" runat="server" Text='<%#Eval("STYLE") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                     <asp:TemplateField HeaderText="BuyerPONo" SortExpression="" Visible="">
                        <ItemTemplate>
                            <asp:Label ID="BuyerPONo" runat="server" Text='<%#Eval("BuyerPONo") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                     <asp:TemplateField HeaderText="Color" SortExpression="" Visible="">
                        <ItemTemplate>
                            <asp:Label ID="ColorName" runat="server" Text='<%#Eval("ColorName") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="ITEM" SortExpression="" Visible="">
                        <ItemTemplate>
                            <asp:Label ID="ITEMDESCRIPTION" runat="server" Text='<%#Eval("ITEM DESCRIPTION") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="COMMENT" SortExpression="" Visible="">
                        <ItemTemplate>
                            <asp:Label ID="DESCRIPTION" runat="server" Text='<%#Eval("DESCRIPTION") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="MERCHANDISER" SortExpression="" Visible="">
                        <ItemTemplate>
                            <asp:Label ID="MERCHANDISER" runat="server" Text='<%#Eval("MERCHANDISER") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    
                    
                   
                    <asp:TemplateField HeaderText="DB_NOTE_DATE"  Visible="true">
                        <ItemTemplate>
                            <asp:Label ID="DB_NOTE_DATE"  runat="server" Text='<%#Eval("DB_NOTE_DATE") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="AGAINST" Visible="true">
                        <ItemTemplate>
                            <asp:Label ID="LIABLE_COMPANY" runat="server" Text='<%#Eval("LIABLE_COMPANY") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                     <asp:TemplateField HeaderText="QUANTITY" ItemStyle-HorizontalAlign="Right" >
                        <ItemTemplate>
                            <asp:Label ID="QUANTITY"   runat="server" Text='<%#Eval("QUANTITY") %>'></asp:Label>
                        </ItemTemplate>

<ItemStyle HorizontalAlign="Right"></ItemStyle>
                    </asp:TemplateField>
                     <asp:TemplateField HeaderText="DISPATCHED QTY" ItemStyle-HorizontalAlign="Right" >
                        <ItemTemplate>
                            <asp:Label ID="TTLDispatchedQty"   runat="server" Text='<%#Eval("TTLDispatchedQty") %>'></asp:Label>
                        </ItemTemplate>
                         <ItemStyle HorizontalAlign="Right" />
                    </asp:TemplateField>  
                     <asp:TemplateField HeaderText="REMAINING QTY" ItemStyle-HorizontalAlign="Right" >
                        <ItemTemplate>
                            <asp:Label ID="remainingQTy"   runat="server" Text='<%#Eval("remainingQTy") %>'></asp:Label>
                        </ItemTemplate>
                         <ItemStyle HorizontalAlign="Right" />
                    </asp:TemplateField>                 
                    <asp:TemplateField HeaderText="AMOUNT" ItemStyle-HorizontalAlign="Right" >
                        <ItemTemplate>
                            <asp:Label ID="AMOUNT"   runat="server" Text='<%#Eval("AMOUNT") %>'></asp:Label>
                        </ItemTemplate>

<ItemStyle HorizontalAlign="Right"></ItemStyle>
                    </asp:TemplateField>
                   <asp:TemplateField HeaderText="CURRENCY" Visible="true" >
                        <ItemTemplate>
                            <asp:Label ID="CURRENCY" runat="server" Text='<%#Eval("CURRENCY") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                   <asp:TemplateField HeaderText="MSP_DID" SortExpression="" Visible="false">
                        <ItemTemplate>
                            <asp:Label ID="labMSP_DID" runat="server" Text='<%#Eval("MSP_DID") %>'></asp:Label>
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
<div id="DivFooterRow" style="overflow:hidden">
    <asp:Label ID="lblOrderNos" runat="server" Text=""></asp:Label>
    <asp:Label ID="lblOurRefNO" runat="server" Text=""></asp:Label>
     <asp:Label ID="lblSmerchandiser" runat="server" Text=""></asp:Label>
    <asp:Label ID="lblDEBUserID" runat="server" Text=""></asp:Label>
     <asp:Label ID="lblShortQty" runat="server" Text=""></asp:Label>
     <asp:Label ID="lblFC" runat="server" Text=""></asp:Label>
     <asp:Label ID="lblShortReasons" runat="server" Text=""></asp:Label>
    <asp:Label ID="lblPlantName" runat="server" Text=""></asp:Label>
</div>
</div>
            
        </div>
        <asp:Button ID="btnShowPopup" runat="server" Style="display: none" />
      
       
         <asp:Panel ID="pnlpopup" runat="server" BackColor="White" Height="500px" Width="1200px"
            Style="display: none; overflow: scroll; border: Solid 3px #D55500;">
            <div class="container">
                <div class="row">
                    <div class="col-md-11">
                        <h3 style="text-align: center">Revise Failure Reason</h3>
                    </div>
                    <div class="col-md-1">
                        <br />
                        <asp:ImageButton ID="btnCancel" runat="server" ImageUrl="~/images/Cancel.png" Width="20" Height="20" CssClass="pull-right" />
                    </div>
                </div>
                 <div class="panel panel-default">
                     <br />
                <div class="row">
                    <div class="col-md-12">
                       
                            <div class="col-md-4">
                                    <strong>
                                        <asp:Label ID="Label16" runat="server" Text="Style:"></asp:Label>
                                    </strong>&nbsp;<asp:Label ID="lblStyle" runat="server"></asp:Label>
                                </div>
                                <div class="col-md-4">
                                    <strong>
                                        <asp:Label ID="Label1" runat="server" Text="Buyer PO No:"></asp:Label>
                                    </strong>&nbsp;<asp:Label ID="lblBPO" runat="server"></asp:Label>
                                </div>
                                <div class="col-md-4">
                                    <strong>
                                        <asp:Label ID="Label3" runat="server" Text="Contract No :"></asp:Label>
                                        &nbsp;</strong><asp:Label ID="lblContractNo" runat="server"></asp:Label>
                                </div>
                               
                           
                      
                </div>
                    </div>
                     <br />
                 <div class="row">
                    <div class="col-md-12">
                        
                                <div class="col-md-4">
                                    <strong>
                                        <asp:Label ID="Label5" runat="server" Text="Color :"></asp:Label>
                                        &nbsp; </strong>
                                    <asp:Label ID="lblColorName" runat="server"></asp:Label>
                                </div>
                                <div class="col-md-4">
                                    <strong>
                                        <asp:Label ID="Label7" runat="server" Text="Sumithra PO Qty :"></asp:Label>
                                        &nbsp;</strong><asp:Label ID="lblSPOQty" runat="server"></asp:Label>
                                </div>
                                 <div class="col-md-3">
                                    <strong>
                                        <asp:Label ID="Label2" runat="server" Text="Buyer PO Qty :"></asp:Label>
                                        &nbsp;</strong><asp:Label ID="LabelBuyerPOQty" runat="server"></asp:Label>
                                </div>
                        
                        <br />
                         <br />
                            </div>
                        </div>
                    </div>
                
                <div class="row">
                    <div class="col-md-12">
                        <div class="col-md-4">
                                    <strong>
                                        <asp:Label ID="Label4" runat="server" Text="Commited Qty :"></asp:Label>
                                        &nbsp; </strong>
                                    <asp:Label ID="lblCommitedQty" runat="server"></asp:Label>
                                </div>
                    
                       
                        <div class="col-md-4">
                                    <strong>
                                        <asp:Label ID="Label8" runat="server" Text="Shipped Qty :"></asp:Label>
                                        &nbsp; </strong>
                                    <asp:Label ID="lblShippedQty" runat="server"></asp:Label>
                                </div>

                         
                        <br />
                        </div>
                    </div>
                        <div class="card" style="width: 100%; height: 100%">
                            <ul class="nav nav-tabs" role="tablist">
                               <%-- <li role="presentation" class="active"><a href="#add" aria-controls="add" role="tab" data-toggle="tab">Add</a></li>--%>
                             <%--   <li role="presentation"><a href="#view" aria-controls="view" role="tab" data-toggle="tab">View</a></li>--%>
                                <%--<li role="presentation"><a href="#summary" aria-controls="summary" role="tab" data-toggle="tab">Delivery History</a></li>--%>
                            </ul>
                            <br />
                            <div class="tab-content">
                                <div role="tabpanel" class="tab-pane active" id="add">
                                    <div class="row">
                    <div class="col-md-12">
                                                            <div class="col-md-3">
                                    <strong>
                                        <asp:Label ID="Label6" runat="server" Text="Factory Failure :"></asp:Label>
                                        &nbsp; </strong>
                                    <asp:CheckBox ID="CheckBoxFactoryFailure" runat="server" />
                                                                </div>
                        <div class="col-md-4">
                             <asp:TextBox ID="txtFacFailPercentage" Text="0" runat="server"></asp:TextBox>
                             </div>
                                 </div>
                                        </div>
                                    <br />
                                        <div class="row">
                                <div class="col-md-12">
                                      <div class="col-md-3">
                                    <strong>
                                        <asp:Label ID="Label9" runat="server" Text="Front End Failure :"></asp:Label>
                                        &nbsp; </strong>
                                    <asp:CheckBox ID="CheckBoxFrontEndFailure" runat="server" />
                                          </div>
                                    <div class="col-md-4">
                             <asp:TextBox ID="txtFrntEndFaulPercentage" Text="0" runat="server"></asp:TextBox>
                             </div>
                                 </div>
                                            </div>
                                     <br />
                                     <div class="row">
                    <div class="col-md-12">
                                      <div class="col-md-3">
                                    <strong>
                                        <asp:Label ID="Label10" runat="server" Text="Third Party Failure :"></asp:Label>
                                        &nbsp; </strong>

                                    <asp:CheckBox ID="CheckBoxThirdPartyFailure" runat="server" />
                                          </div>
                         <div class="col-md-4">
                             <asp:TextBox ID="txtThirdPartyFailPercentage" Text="0" runat="server"></asp:TextBox>
                             </div>
                        </div>
                                         </div>
                                     <br />
                                    
                                   
                                   
                                   
                                </div>
                    
                             
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </asp:Panel>


       
         <asp:Panel ID="pnlServiceProviderpopup" runat="server" BackColor="White" Height="500px" Width="1200px"
            Style="display: none; overflow: scroll; border: Solid 3px #D55500;">
            <div class="container">
                <div class="row">
                    <div class="col-md-11">
                        <h3 style="text-align: center">Third Party Details</h3>
                    </div>
                    <div class="col-md-1">
                        <br />
                        <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/images/Cancel.png" Width="20" Height="20" CssClass="pull-right" />
                    </div>
                </div>
                 <div class="panel panel-default">
                     <br />
                <div class="row">
                    <div class="col-md-12">
                       
                            <div class="col-md-4">
                                    <strong>
                                        <asp:Label ID="Label11" runat="server" Text="Style:"></asp:Label>
                                    </strong>&nbsp;<asp:Label ID="lblTPStyle" runat="server"></asp:Label>
                                </div>
                                <div class="col-md-4">
                                    <strong>
                                        <asp:Label ID="Label13" runat="server" Text="Buyer PO No:"></asp:Label>
                                    </strong>&nbsp;<asp:Label ID="lblTPBuyerPONo" runat="server"></asp:Label>
                                </div>
                                <div class="col-md-4">
                                    <strong>
                                        <asp:Label ID="Label15" runat="server" Text="Contract No :"></asp:Label>
                                        &nbsp;</strong><asp:Label ID="lblTPContractNO" runat="server"></asp:Label>
                                </div>
                               
                           
                      
                </div>
                    </div>
                     <br />
                 <div class="row">
                    <div class="col-md-12">
                        
                                <div class="col-md-4">
                                    <strong>
                                        <asp:Label ID="Label18" runat="server" Text="Color :"></asp:Label>
                                        &nbsp; </strong>
                                    <asp:Label ID="lblTPColor" runat="server"></asp:Label>
                                </div>
                                <div class="col-md-4">
                                    <strong>
                                        <asp:Label ID="Label20" runat="server" Text="Sumithra PO Qty :"></asp:Label>
                                        &nbsp;</strong><asp:Label ID="lblTPSumithraPOQty" runat="server"></asp:Label>
                                </div>
                                 <div class="col-md-3">
                                    <strong>
                                        <asp:Label ID="Label22" runat="server" Text="Buyer PO Qty :"></asp:Label>
                                        &nbsp;</strong><asp:Label ID="lblTPBPOQty" runat="server"></asp:Label>
                                </div>
                        
                        <br />
                         <br />
                            </div>
                        </div>
                    </div>
                
                <div class="row">
                    <div class="col-md-12">
                        <div class="col-md-4">
                                    <strong>
                                        <asp:Label ID="Label24" runat="server" Text="Commited Qty :"></asp:Label>
                                        &nbsp; </strong>
                                    <asp:Label ID="lblTPCommitedQty" runat="server"></asp:Label>
                                </div>
                    
                       
                        <div class="col-md-4">
                                    <strong>
                                        <asp:Label ID="Label26" runat="server" Text="Shipped Qty :"></asp:Label>
                                        &nbsp; </strong>
                                    <asp:Label ID="lblTPShippedQty" runat="server"></asp:Label>
                                </div>

                        
                        <br />
                        </div>
                    </div>
                        <div class="card" style="width: 100%; height: 100%">
                            <ul class="nav nav-tabs" role="tablist">
                               <%-- <li role="presentation" class="active"><a href="#add" aria-controls="add" role="tab" data-toggle="tab">Add</a></li>--%>
                             <%--   <li role="presentation"><a href="#view" aria-controls="view" role="tab" data-toggle="tab">View</a></li>--%>
                                <%--<li role="presentation"><a href="#summary" aria-controls="summary" role="tab" data-toggle="tab">Delivery History</a></li>--%>
                            </ul>
                            <br />
                            <div class="tab-content">
                                <div role="tabpanel" class="tab-pane active" id="Div1">
                                    <div class="row">
                    <div class="col-md-12">
                                                            <div class="col-md-2">                                
                                        <asp:Label ID="Label29" runat="server" Text="Vendor :"></asp:Label>
                                                                </div>
                                                                <div class="col-md-4">                                      
                                                                
                                                                </div>
                      
                                 
                                       
                                        </div>

                                </div>
                                    <br />
                                      <div class="row">
                                        <div class="col-md-12">
                                                            <div class="col-md-2">                                
                                        <asp:Label ID="Label12" runat="server" Text="Address :"></asp:Label>
                                                                </div>
                                                                <div class="col-md-8">                                      
                                                                    <asp:TextBox ID="txtVendorAddress" CssClass="form-control" runat="server"></asp:TextBox>
                                                                </div>
                                </div>
                    
                             
                            </div>
                                   

                                     <div class="row">
                    <div class="col-md-12">
                                                            <div class="col-md-2">                                
                                        <asp:Label ID="Label19" runat="server" Text="Address1 :"></asp:Label>
                                                                </div>
                                                                <div class="col-md-8">                                      
                                                                    <asp:TextBox ID="lblAddress1" CssClass="form-control" runat="server"></asp:TextBox>
                                                                </div>
                                </div>
                    
                             
                            </div>
                                     <div class="row">
                    <div class="col-md-12">
                                                            <div class="col-md-2">                                
                                        <asp:Label ID="Label23" runat="server" Text="Address2 :"></asp:Label>
                                                                </div>
                                                                <div class="col-md-8">                                      
                                                                    <asp:TextBox ID="lblAddress2" CssClass="form-control" runat="server"></asp:TextBox>
                                                                </div>
                                </div>
                                           </div>

                      <div class="row">
                    <div class="col-md-12">
                                                            <div class="col-md-2">                                
                                        <asp:Label ID="Label14" runat="server" Text="Country :"></asp:Label>
                                                                </div>
                                                                <div class="col-md-8">                                      
                                                                    <asp:TextBox ID="lblCountry" CssClass="form-control" runat="server"></asp:TextBox>
                                                                </div>
                                </div>
                    
                             
                            </div>
                             
                          <div class="row">
                    <div class="col-md-12">
                                                            <div class="col-md-2">                                
                                        <asp:Label ID="Label17" runat="server" Text="Contact Person :"></asp:Label>
                                                                </div>
                                                                <div class="col-md-5">                                      
                                                                    <asp:TextBox ID="txtVendorContactPer" CssClass="form-control" runat="server"></asp:TextBox>
                                                                </div>
                          <div class="col-md-2">                                
                                        <asp:Label ID="Label21" runat="server" Text="Company :"></asp:Label>
                                                                </div>
                                                                <div class="col-md-1">                                      
                                                                    <asp:TextBox ID="txtDEBCompany" CssClass="form-control" Text="SHL" runat="server"></asp:TextBox>
                                                                </div>
                                </div>
                    
                             
                            </div> 
                        </div>
                    </div>
               
        </asp:Panel>
        <asp:Label ID="labelMSP_DID" runat="server" Text=""></asp:Label>
        <asp:Label ID="labeltxtReceiveQty" runat="server" Text=""></asp:Label>
        <asp:Label ID="lblRemainingQty" runat="server" Text=""></asp:Label>
    </form>
</body>
</html>

