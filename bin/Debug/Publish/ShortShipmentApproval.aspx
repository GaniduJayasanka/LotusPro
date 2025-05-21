<%@ page language="C#" autoeventwireup="true" inherits="ShortShipmentApproval, App_Web_cjp5ygzm" %>

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
                    <center><h3>Short Shipment Approval<asp:Label ID="LblDEB_ID" runat="server" Text="" Visible="false"></asp:Label>
                        <asp:Label ID="LblDEB_NUMBER" runat="server" Text="" Visible="false"></asp:Label>
                        <asp:Label ID="lblDID" runat="server" Text="" Visible="false"></asp:Label>
                        </h3></center>
                </div>
            </div>
        </div>
      

               
            <asp:GridView ID="GVMSPShedule" runat="server" OnRowDataBound="GVMSPShedule_RowDataBound"   DataKeyNames="OrderNo" AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" 
                BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" 
                AllowSorting="True"  Font-Size="Small"
                EnableModelValidation="True" Width="1318px">
               
                <Columns>
                     <asp:TemplateField HeaderText="          " >
                        <ItemTemplate>
                            <asp:Button ID="btnApprove"  runat="server" Text="Approve" ToolTip="Raise Liability Notes only for Third Party Failures"  CssClass="btn btn-success"  OnClick="btnApprove_Click" />
                        </ItemTemplate>
                    </asp:TemplateField>
                        <asp:TemplateField HeaderText="           " >
                        <ItemTemplate>
                            <asp:Button ID="btnDisApprove"  runat="server" Text="Disapprove" ToolTip="Send As a Partial Shipment"  CssClass="btn btn-danger"  OnClick="btnDisApprove_Click" />
                        </ItemTemplate>
                    </asp:TemplateField>
                  <%--  <asp:TemplateField HeaderText="" >
                        <ItemTemplate>
                            <asp:Button ID="btnDisapprove"  runat="server" Text="Dissapprove"  CssClass="btn btn-danger"  OnClick="btnDisapprove_Click" />
                        </ItemTemplate>
                    </asp:TemplateField>--%>
                     <asp:TemplateField HeaderText="Approve Comment" SortExpression="" Visible="true">
                        <ItemTemplate>
                            <asp:TextBox ID="txtAppComment" runat="server" ></asp:TextBox>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <%-- <asp:TemplateField HeaderText=" DID" SortExpression="" Visible="true">
                        <ItemTemplate>
                            <asp:Label ID="DID" runat="server" Text='<%#Eval("DID") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>--%>
                              <asp:TemplateField HeaderText=" DID" SortExpression="" Visible="true">
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
   
                    <asp:TemplateField HeaderText="Buyer" SortExpression="BuyerName" Visible="true">
                        <ItemTemplate>
                            <asp:Label ID="BuyerName"  runat="server" Text='<%#Eval("BuyerName") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="OurRefNo" Visible="false" SortExpression="OurRefNo">
                        <ItemTemplate>
                            <asp:Label ID="OurRefNo" runat="server" Text='<%#Eval("OurRefNo") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Style" SortExpression="StyleNo">
                        <ItemTemplate>
                            <asp:LinkButton ID="lblStyleNo" runat="server" OnClick="lblStyleNo_Click" Text='<%#Eval("StyleNo") %>'></asp:LinkButton>
                            <asp:Label ID="StyleNo" Visible="false" runat="server" Text='<%#Eval("StyleNo") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                       <asp:TemplateField HeaderText="Costing" SortExpression="CostingID">
                        <ItemTemplate>
                            <asp:LinkButton ID="lblCostingID" runat="server" OnClick="lblCostingID_Click" Text="View"></asp:LinkButton>
                            <asp:Label ID="labCostingID" Visible="false" runat="server" Text='<%#Eval("CostingID") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                   <asp:TemplateField HeaderText="BPONo" Visible="true" SortExpression="BuyerPONo">
                        <ItemTemplate>
                            <asp:Label ID="BuyerPONo" runat="server" Text='<%#Eval("BuyerPONo") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>                  
                    <asp:TemplateField HeaderText="Color" Visible="true" SortExpression="ColorName">
                        <ItemTemplate>
                            <asp:Label ID="ColorName" runat="server" Text='<%#Eval("ColorName") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                  <asp:TemplateField HeaderText="Color" Visible="true" SortExpression="ColorCode">
                        <ItemTemplate>
                            <asp:Label ID="ColorCode" runat="server" Text='<%#Eval("ColorCode") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Contract #" Visible="false" SortExpression="ContractNo">
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%#Eval("ContractNo") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                     <asp:TemplateField HeaderText="Plant" Visible="true" SortExpression="Plant">
                        <ItemTemplate>
                            <asp:Label ID="lblPlant" runat="server" Text='<%#Eval("Plant") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="merchandiser" Visible="false" SortExpression="Plant">
                        <ItemTemplate>
                            <asp:Label ID="lblmerchandiser" runat="server" Text='<%#Eval("merchandiser") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                     <asp:TemplateField HeaderText="UserID" Visible="false" SortExpression="Plant">
                        <ItemTemplate>
                            <asp:Label ID="UserID" runat="server" Text='<%#Eval("UserID") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Ex. Ship Date" Visible="false" SortExpression="ExtendedShipDate">
                        <ItemTemplate>
                            <asp:Label ID="ExtendedShipDate" runat="server"  Text='<%#Eval("ExtendedShipDate","{0:dd/MMM/yyyy}") %>' ></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                       <asp:TemplateField HeaderText="BPOQty" Visible="true" SortExpression="BPOQty">
                        <ItemTemplate>
                            <asp:Label ID="BPOQty" runat="server" Text='<%#Eval("BPOQty") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    
                     <asp:TemplateField HeaderText="SPOQty" Visible="true" SortExpression="SPOQty">
                        <ItemTemplate>
                            <asp:Label ID="SumithraPOQty" ToolTip='<%#Eval("CAStatus")%>' runat="server" Text='<%#Eval("SumithraPOQty") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Del #" Visible="false" SortExpression="DeliveryNo">
                        <ItemTemplate>
                            <asp:Label ID="ContractNo" runat="server" Text='<%#Eval("DeliveryNo") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>                    
                     <asp:TemplateField HeaderText="Commited Qty" Visible="true" SortExpression="CommitedQty">
                        <ItemTemplate>  
                             <asp:Label ID="CommitedQty" ToolTip="Commited Qty" runat="server" Text='<%#Eval("DeliveryQty") %>'></asp:Label>                         
                            
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Shipped Qty" Visible="true" SortExpression="ShippedQty">
                        <ItemTemplate>  
                             <asp:Label ID="ShippedQty" ToolTip="Shipped Qty" runat="server" Text='<%#Eval("ShippedQty") %>'></asp:Label>                        
                           </ItemTemplate>
                    </asp:TemplateField>
                     <asp:TemplateField HeaderText="Short Ship Qty" Visible="true" SortExpression="ShortQty">
                        <ItemTemplate>  
                             <asp:Label ID="ShortQty" ToolTip="Short Ship Qty" runat="server" Text='<%#Eval("ShortQty") %>'></asp:Label>                        
                           </ItemTemplate>
                    </asp:TemplateField>
                     <asp:TemplateField HeaderText="DeliveryDate" Visible="false" SortExpression="DeliveryDate">
                        <ItemTemplate>
                            <asp:Label ID="DeliveryDate" runat="server" Visible="true" Text='<%#Eval("DeliveryDate") %>'></asp:Label>
                           
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Dispatch Date" Visible="true" SortExpression="DispatchDate">
                        <ItemTemplate> 
                            <asp:Label ID="DispatchDate" ToolTip="Dispatch Date" runat="server" Visible="true" Text='<%#Eval("DispatchDate","{0:dd/MMM/yyyy}") %>'></asp:Label>                         
                        </ItemTemplate>
                    </asp:TemplateField>
                     <asp:TemplateField HeaderText="Comment" Visible="true" SortExpression="Comment">
                        <ItemTemplate> 
                            <asp:Label ID="Comment" runat="server" Visible="true" Text='<%#Eval("Comment") %>'></asp:Label>                         
                    
                        </ItemTemplate>
                    </asp:TemplateField>
                 <asp:TemplateField HeaderText="Short Reason" ItemStyle-Width="300px" Visible="true" SortExpression="ShortReason">
                        <ItemTemplate> 
                            <asp:Label ID="ShortReason" runat="server" Visible="true" Text='<%#Eval("ShortReason") %>'></asp:Label>
                           
                          <br />    <asp:ImageButton ID="imgbtnRevise" OnClick="imgbtnRevise_Click" runat="server"  Height="30px" ImageUrl="~/images/Readd.jpg" ToolTip="Revise" Width="30px" />
                        </ItemTemplate>
                    </asp:TemplateField>
                   <asp:TemplateField HeaderText="Partial Shipment" Visible="false" SortExpression="PartialShipment">
                        <ItemTemplate> 
                            <asp:Label ID="PartialShipment" runat="server" Visible="true" Text='<%#Eval("PartialShipment") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                   <asp:TemplateField HeaderText="FC" Visible="true" SortExpression="FC">
                        <ItemTemplate> 
                            <asp:TextBox ID="FC" Width="50px" ToolTip="FC" runat="server" Visible="true" Text='<%#Eval("FC") %>'></asp:TextBox>
                            <asp:ImageButton ID="btnFCUpdate" Visible="true" runat="server" ImageUrl="~/images/Save.png" Height="30px" 
                        Width="35px" OnClick="btnFCUpdate_Click" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="PendingNCancelled" Visible="true"  SortExpression="PendingNCancelled">
                        <ItemTemplate> 
                            <asp:Label ID="PendingNCancelled" runat="server" Visible="true" Text='<%#Eval("PendingNCancelled") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                     <asp:TemplateField HeaderText="S. Merchandiser " Visible="false" SortExpression="SeniorMerchandiser">
                        <ItemTemplate>  
                             <asp:Label ID="SeniorMerchandiser" runat="server" Text='<%#Eval("SeniorMerchandiser") %>'></asp:Label>                       
                            </ItemTemplate>
                    </asp:TemplateField>
                      <asp:TemplateField HeaderText="SMEREmail" Visible="false" SortExpression="SMEREmail">
                        <ItemTemplate>  
                             <asp:Label ID="SMEREmail" runat="server" Text='<%#Eval("SMEREmail") %>'></asp:Label>                       
                            </ItemTemplate>
                    </asp:TemplateField>


                      <asp:TemplateField HeaderText="CostingID"  SortExpression="CostingID" Visible="false">
                        <ItemTemplate>  
                             <asp:Label ID="lbCostingID" runat="server" Text='<%#Eval("CostingID") %>'></asp:Label>                       
                            </ItemTemplate>
                    </asp:TemplateField>

                    
                </Columns>
                <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
               <%-- <HeaderStyle Wrap="true" BackColor="#333333" Font-Bold="True" ForeColor="White" />--%>
                <FooterStyle BackColor="#333333" Font-Bold="True" ForeColor="White"  CssClass="GVFixedFooter"/>
                <HeaderStyle CssClass="HeaderFreez"  BackColor="#333333" Font-Bold="True" ForeColor="White"  />

            </asp:GridView>
                      
                  
<div id="DivFooterRow" style="overflow:hidden">
    <asp:Label ID="lblOrderNos" runat="server" Text=""></asp:Label>
    <asp:Label ID="lblOurRefNO" runat="server" Text=""></asp:Label>
     <asp:Label ID="lblSmerchandiser" runat="server" Text=""></asp:Label>
    <asp:Label ID="lblDEBUserID" runat="server" Text=""></asp:Label>
     <asp:Label ID="lblShortQty" runat="server" Text=""></asp:Label>
     <asp:Label ID="lblFC" runat="server" Text=""></asp:Label>
     <asp:Label ID="lblShortReasons" runat="server" Text=""></asp:Label>
    <asp:Label ID="lblPlantName" runat="server" Text=""></asp:Label>
     <asp:Label ID="lblSenMEREmail" runat="server" Text=""></asp:Label>
     <asp:Label ID="lblSeniorMerchandiser" runat="server" Text=""></asp:Label>
     <asp:Label ID="lblUser" runat="server" Text=""></asp:Label>
</div>
          

        <asp:Button ID="btnShowPopup" runat="server" Style="display: none" />
      
        <asp:ModalPopupExtender ID="MPEDBdown" runat="server" TargetControlID="btnShowPopup" PopupControlID="pnlpopup"
            CancelControlID="btnCancel" BackgroundCssClass="modalBackground">
        </asp:ModalPopupExtender>
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

                         <div class="col-md-2">
                             <asp:Label ID="lblShipReasonType" runat="server" Text="" Visible="false"> </asp:Label>
                                                <asp:Button ID="BtnUpdate" OnClick="BtnUpdate_Click" runat="server" CssClass="btn btn-success" Visible="true"  Text="Update" Width="100px" />
                                                
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
                              </div>
                                                            <div class="col-md-3">
                                                             <strong>     <asp:Label ID="Label25" runat="server" Text="Failure Percentage"></asp:Label></strong>
                                                                </div>
                        </div>
                                             </div>
                                    <br />
                                    <div class="row">
                    <div class="col-md-12">
                                                            <div class="col-md-3">
                                    <strong>
                                        <asp:Label ID="Label6" runat="server" Text="Factory Failure :"></asp:Label>
                                        &nbsp; </strong>
                                    <asp:CheckBox ID="CheckBoxFactoryFailure" AutoPostBack="true"  OnCheckedChanged="CheckBoxFactoryFailure_CheckedChanged" CssClass="BigCheckBox" runat="server" />
                                                                </div>
                        <div class="col-md-4">
                             <asp:TextBox ID="txtFacFailPercentage" style="text-align: right"  Text="0" runat="server"></asp:TextBox>
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
                                    <asp:CheckBox ID="CheckBoxFrontEndFailure" AutoPostBack="true" OnCheckedChanged="CheckBoxFrontEndFailure_CheckedChanged"  CssClass="BigCheckBox" runat="server" />
                                          </div>
                                    <div class="col-md-4">
                             <asp:TextBox ID="txtFrntEndFaulPercentage" style="text-align: right"  Text="0" runat="server"></asp:TextBox>
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

                                    <asp:CheckBox ID="CheckBoxThirdPartyFailure" AutoPostBack="true" OnCheckedChanged="CheckBoxThirdPartyFailure_CheckedChanged"  CssClass="BigCheckBox" runat="server" />
                                          </div>
                         <div class="col-md-4">
                             <asp:TextBox ID="txtThirdPartyFailPercentage" style="text-align: right"  Text="0" runat="server"></asp:TextBox>
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


         <asp:ModalPopupExtender ID="MPEDBup" runat="server" TargetControlID="btnShowPopup" PopupControlID="pnlServiceProviderpopup"
            CancelControlID="btnCancel" BackgroundCssClass="modalBackground">
        </asp:ModalPopupExtender>
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
                                                                <asp:DropDownList ID="DDLVendor" AutoPostBack="true"  OnSelectedIndexChanged="DDLVendor_SelectedIndexChanged"  CssClass="form-control"  Width="300px" runat="server"></asp:DropDownList>
                                                                </div>
                      
                                 
                                         <div class="col-md-2">
                             <asp:Label ID="Label28" runat="server" Text="" Visible="false"> </asp:Label>
                                                <asp:Button ID="ButtonVendorUpdation" OnClick="ButtonVendorUpdation_Click" runat="server" CssClass="btn btn-success" Visible="true"  Text="Update & Approve" Width="200px" />
                                                
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
        <asp:Label ID="lbllibQty" Visible="false" runat="server" Text="Label"></asp:Label>
                <asp:Label ID="lbltxtAppComment" Visible="false" runat="server" Text="Label"></asp:Label>

         
            
    </form>
</body>
</html>

