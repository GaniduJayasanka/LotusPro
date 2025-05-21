<%@ page language="C#" autoeventwireup="true" inherits="EMBInNOut, App_Web_10bhy3il" enableeventvalidation="false" %>


<%@ Register Assembly="BasicFrame.WebControls.BasicDatePicker" Namespace="BasicFrame.WebControls" TagPrefix="BDP" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Embroidery System</title>
    <link href="CSS/bootstrap.css" rel="stylesheet" />

        <link rel="shortcut icon" type="image/x-icon" href="images/Emb.ico" />

        <link rel="shortcut icon" type="image/ico" href="images/Emb.ico" />
    <link rel="icon" type="image/ico" href="images/Emb.ico" />
    <link rel="apple-touch-icon" type="image/ico" href="images/Emb.ico" />



    <script src="js/jquery-1.9.1.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/jquery.min.js"></script>

    <script src="js/jquery-1.4.1.min.js" type="text/javascript"></script>
    <script type="text/javascript" src="js/jQuery-1.8.3.js"></script>
    <script src="js/bootstrap.min.js" type="text/javascript"></script>
    <script src="js/jquery.autocomplete.js" type="text/javascript"></script>
    <link href="CSS/jquery.autocomplete.css" rel="stylesheet" type="text/css" />
    <link href="CSS/jquery.ui.all.css" rel="stylesheet" type="text/css" />

      <link href="CSS/jquery.autocomplete.css" rel="stylesheet" type="text/css" />
    <script src="js/jquery-1.4.1.min.js" type="text/javascript"></script>
    <script src="js/jquery.autocomplete.js" type="text/javascript"></script>

    <script type="text/javascript">
        $(document).ready(function () {
            $("#<%=txtStyleSearch.ClientID%>").autocomplete('AutoCompletes/SearchEMBStyle.ashx', {
                extraParams: { "type": "Style" }
            });

        });
    </script>

     
     <script type="text/javascript">
         $(document).ready(function () {
             $("#<%=txtEmbStyle.ClientID%>").autocomplete('AutoCompletes/SearchEMBStyle.ashx', {
                extraParams: { "type": "Style" }
            });

        });
    </script>

    <script type="text/javascript">
        $(document).ready(function () {
            $("#<%=txtStyleRpt.ClientID%>").autocomplete('AutoCompletes/SearchEMBStyle.ashx', {
                 extraParams: { "type": "Style" }
             });

         });
    </script>



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

        .auto-style1 {
            color: #FF0000;
        }
    </style>


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
   
</head>
<body>
     <form id="form1" runat="server">
    <table width="96%" align="center">
      <tr>
        <td>
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
                    <center><h3>Embroidery System</h3></center>
                </div>
            </div>
        </div>
          <asp:Button Text="In & Out" BackColor="#a6a6a6"  BorderStyle="Double" ID="Tab1"  CssClass="Initial" runat="server"

              OnClick="Tab1_Click" />
          <asp:Button Text="Add Dispatch" BackColor="#a6a6a6"  BorderStyle="Double" ID="Tab2" CssClass="Initial" runat="server" OnClick ="Tab2_Click" />
         <asp:Button Text="View Dispatch" BackColor="#a6a6a6"  BorderStyle="Double" ID="ViewDispatchNotes" CssClass="Initial" runat="server" OnClick ="ViewDispatchNotes_Click" />
         
             <asp:Button Text="Invoicing" BackColor="#a6a6a6" Visible="true" BorderStyle="Double" ID="Tab3" CssClass="Initial" runat="server"

              OnClick="Tab3_Click" />
            <asp:Button Text="Invoice Summary" BackColor="#a6a6a6"  Visible="true" BorderStyle="Double" ID="Tab4" CssClass="Initial" runat="server"
         OnClick="Tab4_Click" />
              <asp:Button Text="Report" BackColor="#a6a6a6"  Visible="true" BorderStyle="Double" ID="Tab5" CssClass="Initial" runat="server"
         OnClick="Tab5_Click" />
             <asp:Button Text="Dispatch VS Invoice" BackColor="#a6a6a6"  Visible="true" BorderStyle="Double" ID="Tab6" CssClass="Initial" runat="server"
         OnClick="Tab6_Click" />
          <asp:MultiView ID="MainView" runat="server">
            <asp:View ID="View1" runat="server">
              <table style="width: 100%; border-width: 1px; border-color: #e6dede; border-style: solid">
                <tr>
                  <td>
                      <div class="col-md-12">
                       
                            <div class="panel-body">
                                
                                <div class="row">
                                    <div class="box-body">
                                        <div class="form-group">
                                           
                                            <label class="col-md-1 control-label">Style </label>
                                            <div class="col-md-3">
                                                <asp:TextBox ID="txtStyle"  CssClass="form-control" runat="server"></asp:TextBox>
                                            </div>
                                           
                                            <div class="col-md-5">
                                                <asp:Button ID="btnFind" runat="server" CssClass="btn btn-info"  Text="Find" Width="60px" OnClick="btnFind_Click" />
                                                <asp:Button ID="Button2" runat="server" CssClass="btn btn-warning"  Text="Reset" Width="70px" OnClick="Button2_Click" />
                                                <asp:Button ID="btnSave" runat="server" CssClass="btn btn-success"  Text="Save" Width="80px" OnClick="btnSave_Click"  />
                                                 <asp:Label ID="lblOrderNo" runat="server" Text="" Visible="false"></asp:Label>
                                                <asp:Label ID="lblEDHOD" runat="server" Text="" Visible="false"></asp:Label>
                                                <asp:Label ID="lblMinimumINDate" runat="server" Text="" Visible="false"></asp:Label>
                                                  <asp:Label ID="lblStylePartInCount" runat="server" Text="" Visible="false"></asp:Label>
                                                <asp:Label ID="lblStylePartOutCount" runat="server" Text="" Visible="false"></asp:Label>
                                      <asp:Label ID="lblDateDiffer" runat="server" Text="" Visible="false"></asp:Label>
                                                <asp:Label ID="lblTTLdueAmount" runat="server" Text="" Visible="false"></asp:Label>
                                                 <asp:Label ID="lblBuyerName" runat="server" Text="" Visible="false"></asp:Label>
                                                 <asp:Label ID="lblRandom_No" Visible="false" runat="server" Text=""></asp:Label>        
                                                  </div> 
                                             

                                               
                                        </div>
                                    </div>
                                </div>
                                <br />
                                 <div class="row">
                                    <div class="box-body">
                                        <div class="form-group">
<asp:GridView ID="GVEmbStyle"  runat="server" ShowFooter="false"    AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" 
                BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" 
               
                AllowSorting="True"  Style="max-width: 100%; min-width: 90%" Font-Size="Small"
                EnableModelValidation="True"  >
               
                <Columns>
                   
                     <asp:TemplateField HeaderText="" ><ItemTemplate><asp:Button ID="btnSelect"   runat="server" Text="Select"  CssClass="btn btn-success"  OnClick="btnSelect_Click" /></ItemTemplate></asp:TemplateField>
                              <asp:TemplateField HeaderText="OrderNo" SortExpression="" Visible="true"><ItemTemplate><asp:Label ID="OrderNo" runat="server" Text='<%#Eval("OrderNo") %>'></asp:Label></ItemTemplate></asp:TemplateField>
                    <asp:TemplateField HeaderText="OurRefNo" SortExpression="" Visible="true"><ItemTemplate><asp:Label ID="OurRefNo" runat="server" Text='<%#Eval("OurRefNo") %>'></asp:Label></ItemTemplate></asp:TemplateField>
                    <asp:TemplateField HeaderText="StyleNo" SortExpression="" Visible="true"><ItemTemplate><asp:Label ID="StyleNo" runat="server" Text='<%#Eval("StyleNo") %>'></asp:Label></ItemTemplate></asp:TemplateField>
                    <asp:TemplateField HeaderText="Buyer" ControlStyle-Width="150px"><ItemTemplate><asp:Label ID="BuyerName" runat="server" Text='<%#Eval("BuyerName") %>'></asp:Label></ItemTemplate></asp:TemplateField>  
            
                    <asp:TemplateField HeaderText="BPO Qty" SortExpression="" Visible="true"><ItemTemplate><asp:Label ID="qtyConfirm" runat="server" Text='<%#Eval("qtyConfirm") %>'></asp:Label></ItemTemplate></asp:TemplateField>
                    <asp:TemplateField HeaderText="BPO Qty With 10%" SortExpression="" Visible="true"><ItemTemplate><asp:Label ID="BPOQTYWith5percent" runat="server" Text='<%#Eval("BPOQTYWith5percent") %>'></asp:Label></ItemTemplate></asp:TemplateField>
                     <asp:TemplateField HeaderText="RTD" Visible="true" SortExpression="RTD"><ItemTemplate><asp:Label ID="RTD" runat="server"  Text='<%#Eval("RTD","{0:dd/MMM/yyyy}") %>' ></asp:Label></ItemTemplate></asp:TemplateField>
                     <asp:TemplateField HeaderText="PCD" Visible="true" SortExpression="PCD"><ItemTemplate><asp:Label ID="PCD" runat="server"  Text='<%#Eval("PCD","{0:dd/MMM/yyyy}") %>' ></asp:Label></ItemTemplate></asp:TemplateField>

                         </Columns>
       <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
               <%-- <HeaderStyle Wrap="true" BackColor="#333333" Font-Bold="True" ForeColor="White" />--%>
                <FooterStyle BackColor="#333333" Font-Bold="True" ForeColor="White"  CssClass="GVFixedFooter"/>
                <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" CssClass="GVFixedHeader" />
    </asp:GridView>
                                            </div>
                                        </div>
                                     </div>
                                <asp:Panel ID="PanelInNOut"  runat="server">
                                       <div class="row">
                                    <div class="box-body">
                                        <div class="form-group">
                                            <label class="col-md-1 control-label">Buyer</label>
                                             <div class="col-md-2">
                                                 <asp:Label ID="lblBuyer" runat="server" Text=""></asp:Label>
                                                 </div>
                                             <label class="col-md-1 control-label">BPO Qty</label>
                                            <div class="col-md-1">
                                                 <asp:Label ID="lblBPOQty" runat="server" Text=""></asp:Label>
                                               &nbsp; &nbsp;   (<asp:Label ID="lblBPOWith5Percent" ToolTip="BPO Qty with 10%" runat="server" Text=""></asp:Label>)
                                                 </div>
                                             <label class="col-md-1 control-label">RTD</label>
                                            <div class="col-md-1">
                                                 <asp:Label ID="lblRTD" runat="server" Text=""></asp:Label>
                                                 </div>
                                             <label class="col-md-1 control-label">PCD</label>
                                            <div class="col-md-1">
                                                 <asp:Label ID="lblPCD" runat="server" Text=""></asp:Label>
                                                 </div>
                                            </div>
                                        <label class="col-md-2 control-label">In & Out Diff.</label>
                                            <div class="col-md-1">
                                                 <asp:Label ID="lblInNOutVariance" runat="server" Text=""></asp:Label>
                                                 </div>
                                            </div>
                                        </div>
                                           </div>
                           <div class="row">
                                    <div class="box-body">
                                        <div class="form-group">
                                            <label class="col-md-1 control-label">Submission</label>
                                             <div class="col-md-2">
                                             <asp:DropDownList ID="DDLSubmission" runat="server" AutoPostBack="true" OnSelectedIndexChanged="DDLSubmission_SelectedIndexChanged"/>
                                               </div> 
                                            <label class="col-md-1 control-label">Part</label>   
                                               <div class="col-md-2">
                                             <asp:DropDownList ID="DDLPart" runat="server"/>
                                               </div>      
                                            </div>
                                        </div>
                             </div>
                                <div class="row">
                                    <div class="box-body">
                                        <div class="form-group">
                                            <label class="col-md-1 control-label">Date</label>
                                            <div class="col-md-2">
                                               <span class="auto-style1"></span> <BDP:BasicDatePicker ID="BasicDatePickerDate" ToolTip="Date" runat="server" CssClass="form-control" />
                                            </div>
                                            <label class="col-md-1 control-label">In Qty</label>
                                            <div class="col-md-1">
                                                <asp:TextBox ID="txtINQty"  CssClass="form-control" runat="server"></asp:TextBox>
                                            
                                            </div>
                                         <label class="col-md-1 control-label">Out Qty</label>
                                            <div class="col-md-1">
                                            <asp:TextBox ID="txtOutQty"  CssClass="form-control" runat="server"></asp:TextBox>
                                            
                                            </div>
                                           
                                        </div>
                                    </div>
                                </div>

                                     <div class="row">
                                    <div class="box-body">
                                        <div class="form-group">
                                           
                                            <div class="col-md-6">
                                                <asp:GridView ID="GVEmbInQty"  OnRowDataBound="GVEmbInQty_RowDataBound" Caption="Garment In" runat="server" AllowSorting="True" AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" EnableModelValidation="True" Font-Size="Small" ForeColor="Black" ShowFooter="true" Style="max-width: 100%; min-width: 90%">
                                                    <Columns>
                                                        
                                                        <asp:TemplateField HeaderText="OrderNo" SortExpression="" Visible="true"><ItemTemplate><asp:Label ID="OrderNo0" runat="server" Text='<%#Eval("OrderNo") %>'></asp:Label></ItemTemplate></asp:TemplateField>
                                                       <asp:TemplateField HeaderText="StyleNo" SortExpression="" Visible="true"><ItemTemplate><asp:Label ID="StyleNo0" runat="server" Text='<%#Eval("StyleNo") %>'></asp:Label></ItemTemplate></asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Submissions" SortExpression="" Visible="true"><ItemTemplate><asp:Label ID="Submissions" runat="server" Text='<%#Eval("Submissions") %>'></asp:Label></ItemTemplate></asp:TemplateField>
                                                         <asp:TemplateField HeaderText="Part" SortExpression="" Visible="true"><ItemTemplate><asp:Label ID="Part" runat="server" Text='<%#Eval("Part") %>'></asp:Label></ItemTemplate></asp:TemplateField>
                                                        <asp:TemplateField ControlStyle-Width="150px" HeaderText="Date"><ItemTemplate><asp:Label ID="Date" runat="server"  Text='<%#Eval("Date","{0:dd/MMM/yyyy}") %>'></asp:Label></ItemTemplate></asp:TemplateField>
                                                        <asp:TemplateField HeaderText="In Qty" SortExpression="" Visible="true"><ItemTemplate><asp:Label ID="INQty" runat="server" Text='<%#Eval("InQty") %>'></asp:Label></ItemTemplate><FooterTemplate><asp:Label ID="lblTotalINQty" runat="server" Visible="true" ></asp:Label></FooterTemplate></asp:TemplateField>
                                                      
                                                    </Columns>
                                                    <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
                                                    <%-- <HeaderStyle Wrap="true" BackColor="#333333" Font-Bold="True" ForeColor="White" />--%>
                                                    <FooterStyle BackColor="#333333" CssClass="GVFixedFooter" Font-Bold="True" ForeColor="White" />
                                                    <HeaderStyle BackColor="#333333" CssClass="GVFixedHeader" Font-Bold="True" ForeColor="White" />
                                                </asp:GridView>
                                                </div>
                                            <div class="col-md-6">
                                                  <asp:GridView ID="GVEmbOutQty" OnRowDataBound="GVEmbOutQty_RowDataBound" Caption="Garment Out" runat="server" AllowSorting="True" AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" EnableModelValidation="True" Font-Size="Small" ForeColor="Black" ShowFooter="true" Style="max-width: 100%; min-width: 90%">
                                                    <Columns>
                                                        
                                                        <asp:TemplateField HeaderText="OrderNo" SortExpression="" Visible="true"><ItemTemplate><asp:Label ID="OrderNo0" runat="server" Text='<%#Eval("OrderNo") %>'></asp:Label></ItemTemplate></asp:TemplateField>
                                                       
                                                        <asp:TemplateField HeaderText="StyleNo" SortExpression="" Visible="true"><ItemTemplate><asp:Label ID="StyleNo0" runat="server" Text='<%#Eval("StyleNo") %>'></asp:Label></ItemTemplate></asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Submissions" SortExpression="" Visible="true"><ItemTemplate><asp:Label ID="Submissions" runat="server" Text='<%#Eval("Submissions") %>'></asp:Label></ItemTemplate></asp:TemplateField>
                                                         <asp:TemplateField HeaderText="Part" SortExpression="" Visible="true"><ItemTemplate><asp:Label ID="Part" runat="server" Text='<%#Eval("Part") %>'></asp:Label></ItemTemplate></asp:TemplateField>
                                                        <asp:TemplateField ControlStyle-Width="150px" HeaderText="Date"><ItemTemplate><asp:Label ID="Date" runat="server"  Text='<%#Eval("Date","{0:dd/MMM/yyyy}") %>'></asp:Label></ItemTemplate></asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Out Qty" SortExpression="" Visible="true"><ItemTemplate><asp:Label ID="OutQty" runat="server" Text='<%#Eval("OutQTy") %>'></asp:Label></ItemTemplate><FooterTemplate><asp:Label ID="lblTotalOutQty" runat="server" Visible="true" ></asp:Label></FooterTemplate></asp:TemplateField>
                                                      
                                                    </Columns>
                                                    <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
                                                    <%-- <HeaderStyle Wrap="true" BackColor="#333333" Font-Bold="True" ForeColor="White" />--%>
                                                    <FooterStyle BackColor="#333333" CssClass="GVFixedFooter" Font-Bold="True" ForeColor="White" />
                                                    <HeaderStyle BackColor="#333333" CssClass="GVFixedHeader" Font-Bold="True" ForeColor="White" />
                                                </asp:GridView>
                                                </div>
                                            </div>
                                        </div>
                                         </div>

                           <div class="row">
                                    <div class="box-body">
                                        <div class="form-group">
                                           
                                            <div class="col-md-6">
                                                <asp:GridView ID="GVInSummary"   Caption="Garment In - Summary" runat="server" AllowSorting="True" AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" EnableModelValidation="True" Font-Size="Small" ForeColor="Black" ShowFooter="false" Style="max-width: 100%; min-width: 90%">
                                                    <Columns>
                                                        
                                                        <asp:TemplateField HeaderText="OrderNo" SortExpression="" Visible="true"><ItemTemplate><asp:Label ID="OrderNo0" runat="server" Text='<%#Eval("OrderNo") %>'></asp:Label></ItemTemplate></asp:TemplateField>
                                                       <asp:TemplateField HeaderText="StyleNo" SortExpression="" Visible="true"><ItemTemplate><asp:Label ID="StyleNo0" runat="server" Text='<%#Eval("StyleNo") %>'></asp:Label></ItemTemplate></asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Submissions" SortExpression="" Visible="true"><ItemTemplate><asp:Label ID="Submissions" runat="server" Text='<%#Eval("Submissions") %>'></asp:Label></ItemTemplate></asp:TemplateField>
                                                         <asp:TemplateField HeaderText="Part" SortExpression="" Visible="true"><ItemTemplate><asp:Label ID="Part" runat="server" Text='<%#Eval("Part") %>'></asp:Label></ItemTemplate></asp:TemplateField>
                                                        
                                                   <asp:TemplateField HeaderText="In Qty" SortExpression="" Visible="true"><ItemTemplate><asp:Label ID="TotalInQty" runat="server" Text='<%#Eval("TotalINQty") %>'></asp:Label></ItemTemplate><FooterTemplate><asp:Label ID="lblTotalINQty" runat="server" Visible="true" ></asp:Label></FooterTemplate></asp:TemplateField>
                                                      
                                                    </Columns>
                                                    <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
                                                    <%-- <HeaderStyle Wrap="true" BackColor="#333333" Font-Bold="True" ForeColor="White" />--%>
                                                    <FooterStyle BackColor="#333333" CssClass="GVFixedFooter" Font-Bold="True" ForeColor="White" />
                                                    <HeaderStyle BackColor="#333333" CssClass="GVFixedHeader" Font-Bold="True" ForeColor="White" />
                                                </asp:GridView>
                                                </div>
                                            <div class="col-md-6">
                                                  <asp:GridView ID="GVEmbOutSummary" Caption="Garment Out - Summary" runat="server" AllowSorting="True" AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" EnableModelValidation="True" Font-Size="Small" ForeColor="Black" ShowFooter="false" Style="max-width: 100%; min-width: 90%">
                                                    <Columns>
                                                        
                                                        <asp:TemplateField HeaderText="OrderNo" SortExpression="" Visible="true"><ItemTemplate><asp:Label ID="OrderNo0" runat="server" Text='<%#Eval("OrderNo") %>'></asp:Label></ItemTemplate></asp:TemplateField>
                                                       
                                                        <asp:TemplateField HeaderText="StyleNo" SortExpression="" Visible="true"><ItemTemplate><asp:Label ID="StyleNo0" runat="server" Text='<%#Eval("StyleNo") %>'></asp:Label></ItemTemplate></asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Submissions" SortExpression="" Visible="true"><ItemTemplate><asp:Label ID="Submissions" runat="server" Text='<%#Eval("Submissions") %>'></asp:Label></ItemTemplate></asp:TemplateField>
                                                         <asp:TemplateField HeaderText="Part" SortExpression="" Visible="true"><ItemTemplate><asp:Label ID="Part" runat="server" Text='<%#Eval("Part") %>'></asp:Label></ItemTemplate></asp:TemplateField>
                                                       
                                                        <asp:TemplateField HeaderText="Out Qty" SortExpression="" Visible="true"><ItemTemplate><asp:Label ID="TotalOutQty" runat="server" Text='<%#Eval("TotalOutQty") %>'></asp:Label></ItemTemplate><FooterTemplate><asp:Label ID="lblTotalOutQty" runat="server" Visible="true" ></asp:Label></FooterTemplate></asp:TemplateField>
                                                      
                                                    </Columns>
                                                    <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
                                                    <%-- <HeaderStyle Wrap="true" BackColor="#333333" Font-Bold="True" ForeColor="White" />--%>
                                                    <FooterStyle BackColor="#333333" CssClass="GVFixedFooter" Font-Bold="True" ForeColor="White" />
                                                    <HeaderStyle BackColor="#333333" CssClass="GVFixedHeader" Font-Bold="True" ForeColor="White" />
                                                </asp:GridView>
                                                </div>
                                            </div>
                                        </div>
                                         </div>

                                    </asp:Panel>
                            </div>
                       
                    </div>
                  </td>
                </tr>
              </table>
            </asp:View>
            <asp:View ID="View2" runat="server">
              <table style="width: 100%; border-width: 1px; border-color: #e6dede; border-style: solid">
                <tr>
                  <td>
                       <div class="col-md-12">
                       
                            <div class="panel-body">
                                <div class="row">
                                    <div class="box-body">
                                        <div class="form-group">
                                            <label class="col-md-2 control-label">Despatch Date </label>
                                            <div class="col-md-2">
                                                <BDP:BasicDatePicker ID="DatePickerDespatchDate" runat="server" CssClass="form-control" />
                                            </div>
                                            <label class="col-md-1 control-label">Attention</label>
                                            <div class="col-md-2">
                                              
                                                <asp:TextBox ID="txtAttention" CssClass="form-control" runat="server"></asp:TextBox>
                                            </div>
                                            <div class="col-md-2">
                                                <asp:Button ID="btnDispatchSave" OnClientClick="return TestCheckBox(dgTry,'chkSelect');" runat="server" CssClass="btn btn-success" Text="Save" Width="80px" OnClick="btnDispatchSave_Click" />
                                               
                                                <asp:Button ID="BtnDispatchReswt" runat="server" CssClass="btn btn-warning"  Text="Reset" Width="80px" OnClick="BtnDispatchReswt_Click" />
                                          </div>
                                            <div class="col-md-1">
                                                 <asp:ImageButton ID="ImageButtonPrint" runat="server" ImageUrl="~/images/Print.png" Height="35px"
                        Width="35px" OnClick="ImageButtonPrint_Click" />
                                                 </div>
                                                
                                                 <div class="col-md-2">
                                                         <asp:Label ID="lblDES_NUMBER" runat="server" Text="" style="font-size: large; font-weight: 700; color: #800000"></asp:Label>
                                            
                                            </div>
                                            
                                        </div>
                                    </div>
                                </div>
                                 <div class="row">
                                    <div class="box-body">
                                        <div class="form-group">
                                             <label class="col-md-2 control-label">Despatch By </label>
                                            <div class="col-md-2">
                                                <asp:TextBox ID="txtDespatchedBy" CssClass="form-control"  runat="server"></asp:TextBox>
                                            </div>
                                            <label class="col-md-1 control-label">Despatch To </label>
                                            <div class="col-md-2">
                                              
                                                <asp:RadioButtonList ID="RadioBtnDespatchTo" RepeatDirection="Horizontal" AutoPostBack = "true" runat="server" OnSelectedIndexChanged="RadioBtnDespatchTo_SelectedIndexChanged" >
                                                        <asp:ListItem Text ="Group Company&nbsp;&nbsp;&nbsp;&nbsp;" Value="1" />
                                                      <asp:ListItem Text ="Customer" Value="2" />
 
                                                </asp:RadioButtonList>
                                            </div>
                                             <div class="col-md-3">
                                               <asp:DropDownList ID="DDLCustomer" AutoPostBack="true" OnSelectedIndexChanged="DDLCustomer_SelectedIndexChanged"   runat="server" CssClass="form-control"  >
                                                      </asp:DropDownList>
                                               <asp:DropDownList ID="DDLCompany"   runat="server" CssClass="form-control" OnSelectedIndexChanged="DDLCompany_SelectedIndexChanged"  >
                                                </asp:DropDownList>
                                                 </div>
                                            
                                         
                                        </div>
                                    </div>
                                </div>
                            <div class="row">
                                    <div class="box-body">
                                        <div class="form-group">
                                            
                                            <label class="col-md-2 control-label">Vehicle No</label>
                                            <div class="col-md-2">                                            
                                                <asp:TextBox ID="txtVecleNo" CssClass="form-control" runat="server"></asp:TextBox>
                                            </div>
                                             <label class="col-md-2 control-label">Des. Comment</label>
                                            <div class="col-md-6">                                            
                                                <asp:TextBox ID="txtComment"  CssClass="form-control" runat="server"></asp:TextBox>
                                            </div>
                                            
                                            
                                        </div>
                                    </div>
                                </div>

                                  <div class="row">
                                    <div class="box-body">
                                        <div class="form-group">
                                            
                                            <label class="col-md-2 control-label">Style</label>
                                            <div class="col-md-3">                                            
                                                <asp:TextBox ID="txtStyleSearch"  CssClass="form-control" runat="server"></asp:TextBox>
                                            </div> 
                                                <div class="col-md-1">   
                                                   <asp:Button ID="btnGO" runat="server" CssClass="btn btn-primary" Text="GO" Width="80px" OnClick="btnGO_Click" />
                                                 
                                                    <br />
                                                    <br />
                                                    </div>
                                            </div>
                                        </div>
                                      
                                                     <div class="row">
                                    <div class="box-body">
                                        <div class="form-group">
                                             <div class="col-md-1">   
                                                 </div>
                                             <div class="col-md-10">   
                                                    <asp:GridView ID="GVEmbOutQtySelection" runat="server" AllowSorting="True" AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" Caption="Garment Out" CellPadding="4" EnableModelValidation="True" Font-Size="Small" ForeColor="Black" ShowFooter="false" Style="max-width: 100%; min-width: 90%">
                                                        <Columns>
                                                             <asp:TemplateField HeaderText="ESID" SortExpression="" Visible="true"><ItemTemplate><asp:Label ID="ESID" runat="server" Text='<%#Eval("ESID") %>'></asp:Label></ItemTemplate></asp:TemplateField>
                                                            <asp:TemplateField HeaderText="Submissions" SortExpression="" Visible="true"><ItemTemplate><asp:Label ID="Submissions" runat="server" Text='<%#Eval("Submissions") %>'></asp:Label></ItemTemplate></asp:TemplateField>
                                                            <asp:TemplateField HeaderText="Out Qty" ItemStyle-HorizontalAlign="Right" SortExpression="" Visible="true"><ItemTemplate><asp:Label ID="OutQty" runat="server" Text='<%#Eval("OutQty") %>'></asp:Label></ItemTemplate></asp:TemplateField>
   
                                                            
                                                             <asp:TemplateField HeaderText="Already Dispatched Qty" ItemStyle-HorizontalAlign="Right" SortExpression="" Visible="true"><ItemTemplate><asp:Label ID="DespatchQty" Text='<%#Eval("DespatchQty") %>' runat="server" ></asp:Label></ItemTemplate></asp:TemplateField>
                                                            
                                                              <asp:TemplateField HeaderText="Remaining Qty" ItemStyle-HorizontalAlign="Right" SortExpression="" Visible="true"><ItemTemplate><asp:Label ID="RemainingQty" Text='<%#Eval("RemainingQty") %>' runat="server" ></asp:Label></ItemTemplate></asp:TemplateField>
                                                            <asp:TemplateField HeaderText="Dispatch Qty" SortExpression="" Visible="true"><ItemTemplate><asp:TextBox ID="txtDispatchQty" AutoPostBack="true" OnTextChanged="txtDispatchQty_TextChanged" runat="server" ></asp:TextBox></ItemTemplate></asp:TemplateField>
                                                            <asp:TemplateField HeaderText="Reason" SortExpression="" Visible="true"><ItemTemplate><asp:DropDownList ID="DDLReason" runat="server"><asp:ListItem Enabled="true" Text="Select Reason" Value="-1"></asp:ListItem><asp:ListItem Text=" " Value="4"></asp:ListItem><asp:ListItem Text="Factory Failure" Value="1"></asp:ListItem><asp:ListItem Text="Front End Failure" Value="2"></asp:ListItem><asp:ListItem Text="Third Party Failure" Value="3"></asp:ListItem></asp:DropDownList></ItemTemplate></asp:TemplateField>
                                                            <asp:TemplateField HeaderText="Remarks" SortExpression="" Visible="true"><ItemTemplate><asp:TextBox ID="txtRemarks"  runat="server" ></asp:TextBox></ItemTemplate></asp:TemplateField>
                                                             <asp:TemplateField HeaderText="" SortExpression="" Visible="true"><ItemTemplate><asp:CheckBox ID="ChkInQty" class="BigCheckBox" runat="server" /></ItemTemplate></asp:TemplateField>
                                                        </Columns>
                                                        <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
                                                        <%-- <HeaderStyle Wrap="true" BackColor="#333333" Font-Bold="True" ForeColor="White" />--%>
                                                        <FooterStyle BackColor="#333333" CssClass="GVFixedFooter" Font-Bold="True" ForeColor="White" />
                                                        <HeaderStyle BackColor="#333333" CssClass="GVFixedHeader" Font-Bold="True" ForeColor="White" />
                                                    </asp:GridView>
                                                 </div>
                                                    </div>
                                            
                                            
                                        </div>
                                    </div>
                                </div>
                                </div>
                           </div>
                  </td>
                </tr>
              </table>
            </asp:View>
            <asp:View ID="View3" runat="server">
              <table style="width: 100%; border-width: 1px; border-color: #e6dede; border-style: solid">
                <tr>
                  <td>
                  
                    <div class="col-md-12">
                       
                            <div class="panel-body">
                                
                                <div class="row">
                                    <div class="box-body">
                                        <div class="form-group">
                                           
                                            <label class="col-md-1 control-label">Style </label>
                                           <div class="col-md-3">                                            
                                                <asp:TextBox ID="txtEmbStyle"  CssClass="form-control" runat="server"></asp:TextBox>
                                            </div> 
                                                <div class="col-md-1">   
                                                   <asp:Button ID="btnInGo" runat="server" CssClass="btn btn-primary" Text="GO" Width="80px" OnClick="btnInGo_Click" />
                                                 </div>
                                             <div class="col-md-1">   
                                                   <asp:Button ID="btnInvoicing"  runat="server" CssClass="btn btn-success" Text="Invoicing"  OnClick="btnInvoicing_Click1" />
                                                 </div>
                                           
                                               <label class="col-md-2 control-label" runat="server" id="txtTIQ">To Be Invoice Qty</label>  
                                             <div class="col-md-1">
                                                 <asp:TextBox ID="lblInvoiceQty" CssClass="form-control" Enabled="false" runat="server" Text=""></asp:TextBox>
                                                 </div>
                                              <label class="col-md-2 control-label" runat="server" id="lblTIQ1">Total Invoiced Qty</label>  
                                             <div class="col-md-1">
                                                 <asp:Label ID="lblTTLInvoicedQty"  runat="server" Text="0"></asp:Label>
                                                 </div>
                                        </div>
                                    </div>
                                </div>
                                
                         
                
                   <div class="row">
                                    <div class="box-body">
                                        <div class="form-group">

                       <div class="col-md-12">
                                                  <asp:GridView ID="GVAllDispatch"   runat="server" AllowSorting="True" AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" EnableModelValidation="True" Font-Size="Small" ForeColor="Black" ShowFooter="false" Style="max-width: 100%; min-width: 90%">
                                                    <Columns>
                                                         <asp:TemplateField HeaderText="Select" SortExpression="" Visible="true"><ItemTemplate>&nbsp;&nbsp; <asp:CheckBox ID="chkSelect" class="BigCheckBox" AutoPostBack="true" OnCheckedChanged="chkSelect_CheckedChanged" runat="server" /></ItemTemplate></asp:TemplateField>
                                                          <asp:TemplateField HeaderText="EDDOD" SortExpression="" Visible="false"><ItemTemplate><asp:Label ID="EDDOD" runat="server" Text='<%#Eval("EDDOD") %>'></asp:Label></ItemTemplate></asp:TemplateField>
                                                        <asp:TemplateField HeaderText="OrderNo" SortExpression="" Visible="true"><ItemTemplate><asp:Label ID="OrderNo0" runat="server" Text='<%#Eval("OrderNo") %>'></asp:Label></ItemTemplate></asp:TemplateField>
                                                       <asp:TemplateField HeaderText="DES_NUMBER" SortExpression="" Visible="true"><ItemTemplate><asp:LinkButton ID="LinkBtnDES_NUMBER" Font-Bold="true" runat="server" CssClass="paraGraphtext" Text='<%# Eval("DES_NUMBER") %>' Font-Size="Small" OnClick="LinkBtnDES_NUMBER_Click" OnClientClick="SetTarget();"></asp:LinkButton><asp:Label ID="EDHOD" runat="server" Visible="false" Text='<%#Eval("EDHOD") %>'></asp:Label></ItemTemplate></asp:TemplateField>
                                                        <asp:TemplateField HeaderText="StyleNo" SortExpression="" Visible="true"><ItemTemplate><asp:Label ID="StyleNo0" runat="server" Text='<%#Eval("StyleNo") %>'></asp:Label></ItemTemplate></asp:TemplateField>
                                                         <asp:TemplateField HeaderText="Submission No" SortExpression="" Visible="true"><ItemTemplate><asp:Label ID="Submissions" runat="server" Text='<%#Eval("Submissions") %>'></asp:Label></ItemTemplate></asp:TemplateField>
                                                        <asp:TemplateField ControlStyle-Width="150px" HeaderText="Date"><ItemTemplate><asp:Label ID="Date" runat="server"  Text='<%#Eval("DES_DATE","{0:dd/MMM/yyyy}") %>'></asp:Label></ItemTemplate></asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Dispatched Qty" SortExpression="" Visible="true"><ItemTemplate><asp:Label ID="DispatchedQty" runat="server" Text='<%#Eval("DespatchQty") %>'></asp:Label></ItemTemplate><FooterTemplate><asp:Label ID="lblTotalOutQty" runat="server" Visible="true" ></asp:Label></FooterTemplate></asp:TemplateField>
                                                     <asp:TemplateField HeaderText="Reason" SortExpression="" Visible="true"><ItemTemplate><asp:Label ID="Reason" runat="server" Text='<%#Eval("Reason") %>'></asp:Label></ItemTemplate></asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Remarks" SortExpression="" Visible="true"><ItemTemplate><asp:Label ID="Remarks" runat="server" Text='<%#Eval("Remarks") %>'></asp:Label></ItemTemplate></asp:TemplateField> 
                                                        
                                                        <asp:TemplateField HeaderText="Comments" SortExpression="" Visible="true"><ItemTemplate><asp:Label ID="Comments" runat="server" Text='<%#Eval("Comments") %>'></asp:Label></ItemTemplate></asp:TemplateField> 
                                                         <asp:TemplateField HeaderText="Dispatched By" SortExpression="" Visible="true"><ItemTemplate><asp:Label ID="DESPATCHED_BY" runat="server" Text='<%#Eval("DESPATCHED_BY") %>'></asp:Label></ItemTemplate></asp:TemplateField> 
                                                         <asp:TemplateField HeaderText="Attention" SortExpression="" Visible="true"><ItemTemplate><asp:Label ID="ATTENTION" runat="server" Text='<%#Eval("ATTENTION") %>'></asp:Label></ItemTemplate></asp:TemplateField> 
                                                         <asp:TemplateField HeaderText="Location" SortExpression="" Visible="true"><ItemTemplate><asp:Label ID="Location" runat="server" Text='<%#Eval("Location") %>'></asp:Label></ItemTemplate></asp:TemplateField> 
                                                    </Columns>
                                                    <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
                                                    <%-- <HeaderStyle Wrap="true" BackColor="#333333" Font-Bold="True" ForeColor="White" />--%>
                                                    <FooterStyle BackColor="#333333" CssClass="GVFixedFooter" Font-Bold="True" ForeColor="White" />
                                                    <HeaderStyle BackColor="#333333" CssClass="GVFixedHeader" Font-Bold="True" ForeColor="White" />
                                                </asp:GridView>
                                                </div>
                                            </div>
                                        </div>
                       </div>
                         </div>
                       
                    </div>
                  </td>
                </tr>

                  <div>
                        <asp:GridView ID="GrVHidden" Caption="Summary View"  runat="server" AllowSorting="True" AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" EnableModelValidation="True" Font-Size="Small" ForeColor="Black" ShowFooter="false" Style="max-width: 100%; min-width: 40%">
                                                    <Columns>
                                                         
                                                        <asp:TemplateField HeaderText="rn"  SortExpression="" Visible="false"><ItemTemplate><asp:Label ID="rn" runat="server" Text='<%#Eval("rn") %>'></asp:Label></ItemTemplate></asp:TemplateField>
                                                         <asp:TemplateField HeaderText="ESID" SortExpression="" Visible="false"><ItemTemplate><asp:Label ID="ESID" runat="server" Text='<%#Eval("ESID") %>'></asp:Label></ItemTemplate></asp:TemplateField>
                                                         <asp:TemplateField HeaderText="Submissions" SortExpression="" Visible="true"><ItemTemplate><asp:Label ID="Submissions" runat="server" Text='<%#Eval("Submissions") %>'></asp:Label></ItemTemplate></asp:TemplateField>
                                                         <asp:TemplateField HeaderText="Dispatch Qty" SortExpression="" Visible="true"><ItemTemplate><asp:Label ID="DispatchCount" runat="server" Text='<%#Eval("DispatchCount") %>'></asp:Label></ItemTemplate></asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Selected Qty for Invoicing" SortExpression="" Visible="true"><ItemTemplate><asp:Label ID="InvoicedQty" runat="server" Text='<%#Eval("InvoicedQty") %>'></asp:Label></ItemTemplate></asp:TemplateField>
                                                        </Columns>
                            <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
                                                    <%-- <HeaderStyle Wrap="true" BackColor="#333333" Font-Bold="True" ForeColor="White" />--%>
                                                    <FooterStyle BackColor="#333333" CssClass="GVFixedFooter" Font-Bold="True" ForeColor="White" />
                                                    <HeaderStyle BackColor="#333333" CssClass="GVFixedHeader" Font-Bold="True" ForeColor="White" />
                                                
                            </asp:GridView>
                  </div>
              </table>
            </asp:View>

               <asp:View ID="View4" runat="server">
              <table style="width: 100%; border-width: 1px; border-color: #e6dede; border-style: solid">
                <tr>
                  <td>
                      <div class="col-md-12">
                       
                            <div class="panel-body">
 
                                <div class="row">
                                    <div class="box-body">
                                        <div class="form-group">
                                           
                                            <label class="col-md-1 control-label">From </label>
                                            <div class="col-md-3">
                                                 
                                                <BDP:BasicDatePicker ID="BasicDatePickerfromdate" runat="server" CssClass="form-control" />
                                            </div>
                                             <label class="col-md-1 control-label">To </label>
                                            <div class="col-md-3">
                                            <BDP:BasicDatePicker ID="BasicDatePickeriToDate" runat="server" CssClass="form-control" />
                                         </div>
                                            <label class="col-md-1 control-label">Company </label>
                                             <div class="col-md-1">
                                               <asp:DropDownList ID="DropDownCompany"   runat="server" CssClass="form-control"  >
                                                      </asp:DropDownList>
                                                 </div>
                                            <div class="col-md-2">
                                               <asp:Button ID="BtnFindInv" runat="server" CssClass="btn btn-success" Text="Find"  OnClick="BtnFindInv_Click" />
                                                 
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                </div>
                          </div>
                      </td>
                    </tr>
                  </table>
                                  <table style="width: 100%; border-width: 0px; border-color: #e6dede; border-style: solid">
                <tr>
                  <td>
                      <div class="col-md-12">
                       
                            <div class="panel-body">

                                  <div class="row">
                                    <div class="box-body">
                                        <div class="form-group">
                                  <asp:GridView ID="GridGrnSum" runat="server" AllowSorting="True" 
                  CellPadding="3"  AutoGenerateColumns="False" 
                style="font-size: 10pt; font-family: 'Calibri','Times New Roman', Times, serif" 
                Width="989px" OnSorting="gridviewSorting_Sorting" 
                    RowStyle-VerticalAlign="Bottom" BackColor="White" BorderColor="#999999" 
                    BorderStyle="Solid" BorderWidth="1px" HorizontalAlign="Left" 
                    UseAccessibleHeader="False"
                    ShowFooter="false" onrowcommand="GridViewOrderList_RowCommand" EnableModelValidation="True" ForeColor="Black" GridLines="Vertical" >
                      
                <RowStyle />
                  <AlternatingRowStyle BackColor="#CCCCCC" />
                <Columns>
              
                    <asp:TemplateField HeaderText="No" ItemStyle-BackColor="DarkGray" HeaderStyle-BackColor="Olive"><ItemTemplate></ItemTemplate><HeaderStyle BackColor="Olive"></HeaderStyle><ItemStyle BackColor="DarkGray"></ItemStyle></asp:TemplateField>
                    <asp:TemplateField HeaderText="InvID" SortExpression="InvID" Visible="false"><ItemTemplate><asp:Label ID="InvID" runat="server" Text='<%#Eval("InvID") %>'></asp:Label></ItemTemplate></asp:TemplateField>
                      <asp:TemplateField HeaderText="Company" SortExpression="Company" Visible="true"><ItemTemplate><asp:Label ID="Company" runat="server" Text='<%#Eval("Company") %>'></asp:Label></ItemTemplate></asp:TemplateField>
                     <asp:TemplateField HeaderText="InvDate" SortExpression="InvDate"><ItemTemplate><asp:Label ID="InvDate" runat="server" Text='<%#Eval("InvDate","{0:dd-MMM-yyyy}")as string %>'></asp:Label></ItemTemplate></asp:TemplateField>  
                    <asp:TemplateField HeaderText="InvNumber" SortExpression="InvNumber" ><ItemTemplate><asp:Label ID="InvNumber" runat="server" Text='<%#Eval("InvNumber") %>' ></asp:Label></ItemTemplate></asp:TemplateField>                           
                         
                          <asp:TemplateField HeaderText="Location" SortExpression="Company"><ItemTemplate><asp:Label ID="Location" runat="server" Text='<%#Eval("Location") %>'></asp:Label></ItemTemplate></asp:TemplateField>

                      <asp:TemplateField HeaderText=" Confirm" Visible="false" SortExpression="ConfirmDEB"><ItemTemplate><asp:Label ID="Confirm" runat="server" Text='<%#Eval("ConfirmDEB") %>'></asp:Label></ItemTemplate></asp:TemplateField>

                   <asp:TemplateField HeaderText="Print Preview"><ItemTemplate><asp:Button ID="BtnOrderViewOld" runat="server" 
                                    CommandArgument="<%# ((GridViewRow) Container).RowIndex %>" 
                                    CommandName="Preview" CssClass="btn btn-info" Text="Preview" 
                                    Width="150px" /></ItemTemplate></asp:TemplateField>     
                    
                    
                              
                    
                </Columns>
                
                 
                <FooterStyle BackColor="#CCCCCC" HorizontalAlign="Left" />
                <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
                <HeaderStyle  BackColor="Black" Font-Bold="True" ForeColor="White" />
            </asp:GridView>
                                            </div>
                                         </div>
                                       </div>
                                </div>
                          </div>
                      </td>
                    </tr>
                  </table>
                   </asp:View>
               <asp:View ID="View5" runat="server">
                <table style="width: 100%; border-width: 1px; border-color: #e6dede; border-style: solid">
                <tr>
                  <td>
                      <div class="col-md-12">
                       
                            <div class="panel-body">
 
                                <div class="row">
                                    <div class="box-body">
                                        <div class="form-group">
                                
                                <div class="row">
                                    <div class="box-body">
                                        <div class="form-group">
                                           
                                            <label class="col-md-1 control-label">Style </label>
                                            <div class="col-md-3">
                                                <asp:TextBox ID="txtStyleRpt"  CssClass="form-control" runat="server" ></asp:TextBox>
                                            </div>
                                           
                                            <div class="col-md-5">
                                                <asp:Button ID="btnRptFind" runat="server" CssClass="btn btn-info"  Text="Find" Width="60px" OnClick="btnRptFind_Click" />
                                                <asp:Button ID="Button3" runat="server" CssClass="btn btn-warning"  Text="Reset" Width="70px" OnClick="Button2_Click" />
                                               
                                               </div> 
                                             

                                               
                                        </div>
                                    </div>
                                </div>
                                            </div>
                                        </div>
                                    </div>
                                
                                
                                
                                <asp:Panel ID="Panel1"  runat="server">
                                     
                        
                                <div class="row">
                                    <div class="box-body">
                                        <div class="form-group">
                                            <label class="col-md-1 control-label">From Date</label>
                                            <div class="col-md-2">
                                               <span class="auto-style1"></span> <BDP:BasicDatePicker  ID="BasicDatePickerFrom" ToolTip="Dispatch Date"  runat="server" CssClass="form-control" />
                                            </div>
                                            <label class="col-md-1 control-label">To Date</label>
                                            <div class="col-md-1">
                                                   <span class="auto-style1"></span> <BDP:BasicDatePicker ID="BasicDatePickerTo" ToolTip="Dispatch Date" runat="server" CssClass="form-control" />
                                        
                                            
                                            </div>
                                        
                                        </div>
                                    </div>
                                </div>

                                     </asp:Panel>
                                </div>
                          </div>

                             
                       
                   
                  </td>
                </tr>
              </table>
                   <br />
                    <div class="col-md-12">

                                     <div class="row">
                                  
                                           
                                            <div class="col-md-10">
                                                <asp:GridView ID="GVStyleWiseReport"  OnRowDataBound="GVStyleWiseReport_RowDataBound"  runat="server" AllowSorting="True" AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" EnableModelValidation="True" Font-Size="Small" ForeColor="Black" ShowFooter="false" Style="max-width: 100%; min-width: 90%">
                                                    <Columns>
                                                        
                                                        <asp:TemplateField HeaderText="OrderNo" SortExpression="" Visible="true"><ItemTemplate><asp:Label ID="OrderNo0" runat="server" Text='<%#Eval("OrderNo") %>'></asp:Label></ItemTemplate></asp:TemplateField>
                                                       <asp:TemplateField HeaderText="StyleNo" SortExpression="" Visible="true"><ItemTemplate><asp:Label ID="StyleNo0" runat="server" Text='<%#Eval("StyleNo") %>'></asp:Label></ItemTemplate></asp:TemplateField>
                                                       <asp:TemplateField HeaderText="BPO Qty" SortExpression="" Visible="true"><ItemTemplate><asp:Label ID="qtyConfirm" runat="server" Text='<%#Eval("qtyConfirm") %>'></asp:Label></ItemTemplate></asp:TemplateField>
                                                        <asp:TemplateField HeaderText="In Qty" SortExpression="" Visible="true"><ItemTemplate><asp:Label ID="InQty" Text='<%#Eval("InQty") %>' runat="server" ></asp:Label></ItemTemplate></asp:TemplateField>
                                                          <asp:TemplateField HeaderText="Out Qty" SortExpression="" Visible="true"><ItemTemplate><asp:Label ID="OutQty" Text='<%#Eval("OutQty") %>' runat="server" ></asp:Label></ItemTemplate></asp:TemplateField>
                                                         <asp:TemplateField HeaderText="Dispatch Qty" SortExpression="" Visible="true"><ItemTemplate><asp:Label ID="DispatchQty" Text='<%#Eval("DespatchedQty") %>'  runat="server" ></asp:Label></ItemTemplate></asp:TemplateField>
                                                         <asp:TemplateField HeaderText="Invoiced Qty" SortExpression="" Visible="true"><ItemTemplate><asp:Label ID="InvoicedQty" Text='<%#Eval("INvQty") %>' runat="server" ></asp:Label></ItemTemplate></asp:TemplateField>
                                                    </Columns>
                                                    <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
                                                    <%-- <HeaderStyle Wrap="true" BackColor="#333333" Font-Bold="True" ForeColor="White" />--%>
                                                    <FooterStyle BackColor="#333333" CssClass="GVFixedFooter" Font-Bold="True" ForeColor="White" />
                                                    <HeaderStyle BackColor="#333333" CssClass="GVFixedHeader" Font-Bold="True" ForeColor="White" />
                                                </asp:GridView>
                                                </div>

                                           
                                         </div>
                                   
                            </div>
                   </asp:View>

                <asp:View ID="View6" runat="server">
                <table style="width: 100%; border-width: 1px; border-color: #e6dede; border-style: solid">
                <tr>
                  <td>
                      <div class="col-md-12">
                       
                            <div class="panel-body">
 
                                <div class="row">
                                    <div class="box-body">
                                        <div class="form-group">
                                
                                <div class="row">
                                    <div class="box-body">
                                        <div class="form-group">
                                           
                                            <label class="col-md-1 control-label">From Date</label>
                                            <div class="col-md-2">
                                               <span class="auto-style1"></span> <BDP:BasicDatePicker  ID="DatePickerFromDate" ToolTip="Dispatch Date"  runat="server" CssClass="form-control" />
                                            </div>
                                            <label class="col-md-1 control-label">To Date</label>
                                            <div class="col-md-2">
                                                   <span class="auto-style1"></span> <BDP:BasicDatePicker ID="DatePickerToDate" ToolTip="Dispatch Date" runat="server" CssClass="form-control" />
                                                                                    
                                            </div>
                                           
                                            <div class="col-md-5">
                                                <asp:Button ID="btnDispatchvsInvrptSearch" runat="server" CssClass="btn btn-info"  Text="Find" Width="60px" OnClick="btnDispatchvsInvrptSearch_Click" />
                                       
                                               
                                               </div> 
                                             

                                               
                                        </div>
                                    </div>
                                </div>
                                            </div>
                                        </div>
                                    </div>
                                
                                
                                
                           
                                </div>
                          </div>

                             
                       
                   
                  </td>
                </tr>
              </table>
                   <br />
                               <asp:Panel ID="Panel2" runat="server">
                                   <table><tr><td>&nbsp;&nbsp;&nbsp;</td> <td>
  <asp:GridView ID="GVBuyerSummary" runat="server" FooterStyle-HorizontalAlign="Right" ShowFooter="true" Height="25px" 
      AutoGenerateColumns="False" BackColor="White" BorderColor="#cccccc" OnRowDataBound="GVBuyerSummary_RowDataBound"
                                BorderWidth="1px" CellPadding="4" ForeColor="Black" AllowSorting="True" Font-Size="Smaller"
                                EnableModelValidation="True"  Width="95%" >
                <FooterStyle CssClass="GridViewFooterStyle" />
                <RowStyle CssClass="GridViewRowStyle" />    
                <SelectedRowStyle CssClass="GridViewSelectedRowStyle" />
                <PagerStyle CssClass="GridViewPagerStyle" />
                <AlternatingRowStyle CssClass="GridViewAlternatingRowStyle" />
                <HeaderStyle CssClass="GridViewHeaderStyle" /> 
      
                             <Columns>
                                     
                                <asp:TemplateField HeaderText="Buyer"><ItemTemplate><asp:Label ID="BuyerName"  Width="230px" runat="server" Text='<%#Eval("BuyerName") %>'></asp:Label></ItemTemplate></asp:TemplateField>                                

                                <asp:TemplateField HeaderText="Dispatched Qty"  HeaderStyle-CssClass="text-right"  ItemStyle-HorizontalAlign="Right"    SortExpression="" Visible="true"><ItemTemplate><asp:Label ID="TShippedQty" runat="server"  Width="100px" Text=' <%#Eval("DispatchedQty","{0:#,##0}")%>'     ></asp:Label></ItemTemplate><FooterTemplate><div><asp:Label ID="lblTTShippedQty"   runat="server" /></div></FooterTemplate></asp:TemplateField>                                  
                                 
                                <asp:TemplateField HeaderText="Invoiced Qty" HeaderStyle-CssClass="text-right"  ItemStyle-HorizontalAlign="Right"    SortExpression="" Visible="true"><ItemTemplate><asp:Label ID="lblInvoicedQty" runat="server"  Width="100px" Text=' <%#Eval("InvoiceQty","{0:#,##0}")%>'   ></asp:Label></ItemTemplate><FooterTemplate><div><asp:Label ID="lblTTInvoicedQty"   runat="server" /></div></FooterTemplate></asp:TemplateField>

                                <asp:TemplateField HeaderText="Invoiced Vs Dispatched" HeaderStyle-CssClass="text-right"  ItemStyle-HorizontalAlign="Right"    SortExpression="" Visible="true"><ItemTemplate><asp:Label ID="InvoicedVsDispatched" runat="server" Visible="true"  Width="100px" Text=' <%#Eval("InvoicedVsDispatched","{0:#,##0}")%>'   ></asp:Label></ItemTemplate><FooterTemplate><div><asp:Label ID="lblTTInvoicedVsDispatched"   runat="server" /></div></FooterTemplate></asp:TemplateField> 

                                <asp:TemplateField HeaderText="Avg Planned Inv Value" HeaderStyle-CssClass="text-right" ItemStyle-HorizontalAlign="Right"    SortExpression="" Visible="true"><ItemTemplate><asp:Label ID="AvgPlannedInvValue" runat="server"  Width="100px" Text=' <%#Eval("PlannedInvoiceValue","{0:#,##0.00}")%>'     ></asp:Label></ItemTemplate><FooterTemplate><div><asp:Label ID="lblAvgPlannedInvValue"   runat="server" /></div></FooterTemplate></asp:TemplateField>

                                <asp:TemplateField HeaderText="Actual Inv Value" HeaderStyle-CssClass="text-right" ItemStyle-HorizontalAlign="Right"    SortExpression="" Visible="true"><ItemTemplate><asp:Label ID="ActualInvValue" runat="server"  Width="100px" Text=' <%#Eval("ActualInvoiceValue","{0:#,##0.00}")%>'     ></asp:Label></ItemTemplate><FooterTemplate><div><asp:Label ID="lblActualInvValue"   runat="server" /></div></FooterTemplate></asp:TemplateField>

                                <asp:TemplateField HeaderText="Variance" HeaderStyle-CssClass="text-right" ItemStyle-HorizontalAlign="Right"    SortExpression="" Visible="true"><ItemTemplate><asp:Label ID="PlanVsActualVariance" runat="server"  Width="100px" Text=' <%#Eval("Variance","{0:#,##0.00}")%>'     ></asp:Label></ItemTemplate><FooterTemplate><div><asp:Label ID="lblPlanVsActualVariance"   runat="server" /></div></FooterTemplate></asp:TemplateField>

                                <asp:TemplateField HeaderText="Received Amount" HeaderStyle-CssClass="text-right" ItemStyle-HorizontalAlign="Right"    SortExpression="" Visible="true"><ItemTemplate><asp:Label ID="ReceivedAmount" runat="server"  Width="100px" Text=' <%#Eval("ReceivedAmount","{0:#,##0.00}")%>'     ></asp:Label></ItemTemplate><FooterTemplate><div><asp:Label ID="lblTotReceivedAmount"   runat="server" /></div></FooterTemplate></asp:TemplateField>


                                <asp:TemplateField HeaderText="Pending Receivable" HeaderStyle-CssClass="text-right" ItemStyle-HorizontalAlign="Right"    SortExpression="" Visible="true"><ItemTemplate><asp:Label ID="PendingReceivble" runat="server"  Width="100px" Text=' <%#Eval("PendingReceivble","{0:#,##0.00}")%>'     ></asp:Label></ItemTemplate><FooterTemplate><div><asp:LinkButton ID="linkBtnTotPendingReceivblee" ForeColor="#ffffff" Font-Bold="true"  OnClick="LinkPendingReceivble_Click" runat="server" ></asp:LinkButton><asp:Label ID="lblTotPendingReceivble"   runat="server" Visible="false" /></div></FooterTemplate></asp:TemplateField>

                               <%-- <asp:TemplateField HeaderText="Doc. Sent Qty" ItemStyle-HorizontalAlign="Right" HeaderStyle-CssClass="gridHeader" Visible="true">
                                <ItemTemplate>
                                    <asp:Label ID="TotFOB" runat="server" Text=' <%#Eval("TotFOB","{0:#,##0}")%>' Width="100px" ></asp:Label>
                                </ItemTemplate>
                                <FooterTemplate>
                                    <div>
                                        <asp:Label Font-Bold="true" ID="lblTotFOB" runat="server" />
                                    </div>
                                </FooterTemplate>
                                </asp:TemplateField>   --%>
                                 <%-- <asp:TemplateField HeaderText="BuyerID" Visible="false" ControlStyle-Width="150px">
                                    <ItemTemplate>                                          
                                        <asp:Label ID="BuyerID" runat="server" Text='<%#Eval("BuyerID") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField> --%>
                                </Columns>
                                <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
                               <FooterStyle BackColor="#666666" Font-Bold="True" ForeColor="White" CssClass="GVFixedFooter" />
                                <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />                           
                            </asp:GridView>
                                       </td></tr></table>
                 <br />
                            </asp:Panel>
        <div class="col-md-12">
            <div id="DivRoot" align="left">
                <div style="overflow: hidden;" id="DivHeaderRow">
                </div>
                <div>
                    <div style="width: 1300px;">
                       
                        <div id="GHead"></div>
                        <div style="height: 1800px; overflow: auto">
                <asp:GridView ID="GVResults" runat="server" FooterStyle-HorizontalAlign="Right" 
                  ShowFooter="true" Height="25px" AutoGenerateColumns="False" BackColor="White"
                BorderColor="#cccccc" BorderWidth="1px" CellPadding="4" ForeColor="Black" AllowSorting="True"
                  EnableModelValidation="True" Width="1200px" Font-Size="Small"  OnRowDataBound="GVResults_RowDataBound" >
                <FooterStyle CssClass="GridViewFooterStyle" />
                <RowStyle CssClass="GridViewRowStyle" />    
                <SelectedRowStyle CssClass="GridViewSelectedRowStyle" />
                <PagerStyle CssClass="GridViewPagerStyle" />
                <AlternatingRowStyle CssClass="GridViewAlternatingRowStyle" />
                <HeaderStyle CssClass="GridViewHeaderStyle" />

                             <Columns>
                                       <asp:TemplateField HeaderText="OrderNo" SortExpression="" Visible="false"><ItemTemplate><asp:Label ID="OrderNo" runat="server" Text='<%#Eval("OrderNo") %>'></asp:Label></ItemTemplate></asp:TemplateField>
                                     <asp:TemplateField HeaderText="Buyer" ItemStyle-HorizontalAlign="Left" HeaderStyle-HorizontalAlign="Left"><ItemTemplate><asp:Label ID="BuyerCode"  Width="200px" runat="server" Text='<%#Eval("BuyerName") %>'></asp:Label></ItemTemplate></asp:TemplateField>

                                    <asp:TemplateField HeaderText="Style No"><ItemTemplate><asp:Label ID="StyleNo" runat="server" Text='<%#Eval("StyleNo") %>'></asp:Label></ItemTemplate></asp:TemplateField>
                                                                     
                                    <asp:TemplateField HeaderText="Dispatched Qty" ItemStyle-HorizontalAlign="Right" HeaderStyle-CssClass="gridHeader"><ItemTemplate><asp:Label ID="DispatchedQty"  Width="70px" runat="server" Text='<%#Eval("DispatchedQty") %>'></asp:Label></ItemTemplate><FooterTemplate><div><asp:Label Font-Bold="true" ID="LblDispatchedQty" runat="server" /></div></FooterTemplate></asp:TemplateField>
                                    <asp:TemplateField HeaderText="Invoiced QTY" ItemStyle-HorizontalAlign="Right" HeaderStyle-CssClass="gridHeader"><ItemTemplate><asp:Label ID="InvoiceQTY"  Width="70px" runat="server" Text='<%#Eval("InvoiceQTY") %>'></asp:Label></ItemTemplate><FooterTemplate><div><asp:Label Font-Bold="true" ID="LblInvoiceQTY" runat="server" /></div></FooterTemplate></asp:TemplateField>
                                   
                                   
                                    <asp:TemplateField HeaderText="Invoiced Vs Dispatched" ItemStyle-HorizontalAlign="Right" HeaderStyle-CssClass="gridHeader" Visible="true"><ItemTemplate><asp:Label ID="InvoicedVsDispatched"  Width="70px" runat="server" Text='<%#Eval("InvoicedVsDispatched") %>'></asp:Label></ItemTemplate><FooterTemplate><div><asp:Label Font-Bold="true" ID="LblInvoicedVsDispatched" runat="server" /></div></FooterTemplate></asp:TemplateField>
                                    

                                     <asp:TemplateField HeaderText="Planned Invoice Value" ItemStyle-HorizontalAlign="Right" HeaderStyle-CssClass="gridHeader" Visible="true"><ItemTemplate><asp:Label ID="AvgPlannedInvValue"  Width="100px" runat="server" Text=' <%#Eval("PlannedInvoiceValue","{0:n}")%>' ></asp:Label></ItemTemplate><FooterTemplate><div><asp:Label Font-Bold="true" ID="LblTotAvgPlannedInvValue" runat="server" /></div></FooterTemplate></asp:TemplateField>
                                   <asp:TemplateField HeaderText="Actual Invoice Value" ItemStyle-HorizontalAlign="Right" HeaderStyle-CssClass="gridHeader" Visible="true"><ItemTemplate><asp:Label ID="ActualInvValue"  Width="100px" runat="server" Text=' <%#Eval("ActualInvoiceValue","{0:n}")%>' ></asp:Label></ItemTemplate><FooterTemplate><div><asp:Label Font-Bold="true" ID="LblTotActualInvValue" runat="server" /></div></FooterTemplate></asp:TemplateField>

                                    <asp:TemplateField HeaderText="Variance" ItemStyle-HorizontalAlign="Right" HeaderStyle-CssClass="gridHeader" Visible="true"><ItemTemplate><asp:Label ID="PlanVsActualVariance"  Width="100px" runat="server" Text=' <%#Eval("Variance","{0:n}")%>' ></asp:Label></ItemTemplate><FooterTemplate><div><asp:Label Font-Bold="true" ID="LblTotPlanVsActualVariancee" runat="server" /></div></FooterTemplate></asp:TemplateField>

                                       <asp:TemplateField HeaderText="Received Amount" ItemStyle-HorizontalAlign="Right" HeaderStyle-CssClass="gridHeader" Visible="true"><ItemTemplate><asp:Label ID="ReceivedAmount"  Width="100px" runat="server" Text=' <%#Eval("ReceivedAmount","{0:n}")%>' ></asp:Label></ItemTemplate><FooterTemplate><div><asp:Label Font-Bold="true" ID="LblTotReceivedAmount" runat="server" /></div></FooterTemplate></asp:TemplateField>
                                  <asp:TemplateField HeaderText="Pending Receivable" ItemStyle-HorizontalAlign="Right" HeaderStyle-CssClass="gridHeader" Visible="true"><ItemTemplate><asp:Label ID="PendingReceivble"  Width="100px" runat="server" Text=' <%#Eval("PendingReceivble","{0:n}")%>' ></asp:Label></ItemTemplate><FooterTemplate><div><asp:Label Font-Bold="true" ID="LblTotPendingReceivblee" runat="server" /></div></FooterTemplate></asp:TemplateField>
                                     
                                  <asp:TemplateField HeaderText="AVG FOB" ItemStyle-HorizontalAlign="Right" HeaderStyle-CssClass="gridHeader" Visible="true"><ItemTemplate><asp:Label ID="AVGFOB" runat="server"  Width="70px" Text=' <%#Eval("FC","{0:n}")%>' ></asp:Label></ItemTemplate></asp:TemplateField> 

                                    <asp:TemplateField HeaderText="INV. Unit Price" ItemStyle-HorizontalAlign="Right" HeaderStyle-CssClass="gridHeader" Visible="true"><ItemTemplate><asp:Label ID="INVUnitPrice" runat="server"  Width="70px" Text=' <%#Eval("INVUnitPrice","{0:n}")%>' ></asp:Label></ItemTemplate></asp:TemplateField> 

                                </Columns>
                              <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
                                <FooterStyle BackColor="#666666" Font-Bold="True" ForeColor="White" CssClass="GVFixedFooter" />
                                <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
                                <HeaderStyle CssClass="HeaderFreez"  BackColor="#333333" Font-Bold="True" ForeColor="White"  />
                            </asp:GridView>
                          </div>
                        </div>
                    </div>
                           

                        
        </div></div>
                   </asp:View>

               <asp:View ID="View7" runat="server">
                <table style="width: 100%; border-width: 1px; border-color: #e6dede; border-style: solid">
                <tr>
                  <td>
                      <div class="col-md-12">
                       
                            <div class="panel-body">
 
                                <div class="row">
                                    <div class="box-body">
                                        <div class="form-group">
                                
                                <div class="row">
                                    <div class="box-body">
                                        <div class="form-group">
                                           
                                            <label class="col-md-2 control-label">Dispatch No</label>
                                            <div class="col-md-2">
                                               <span class="auto-style1"></span> 
                                                <asp:TextBox ID="txtDisNo" runat="server" CssClass="form-control"></asp:TextBox>

                                            </div>
                                           
                                           
                                            <div class="col-md-5">
                                                <asp:Button ID="btnEmbDispatchFind" runat="server" CssClass="btn btn-info"  Text="Find" Width="60px" OnClick="btnEmbDispatchFind_Click" />
                                       
                                               
                                               </div> 
                                             

                                               
                                        </div>
                                    </div>
                                </div>
                                            </div>
                                        </div>
                                    </div>
                                
                                
                                
                           
                                </div>
                          </div>

                             
                       
                   
                  </td>
                </tr>
              </table>
                   <br />
                               <asp:Panel ID="Panel3" runat="server">
                                   <table><tr><td>&nbsp;&nbsp;&nbsp;</td> <td>
    <asp:GridView ID="GVDeapatchReport" runat="server" AutoGenerateColumns="False" BackColor="White" 
                        BorderColor="White"  BorderStyle="Ridge" BorderWidth="2px" CellPadding="3" CellSpacing="1"
                         OnRowDataBound="gvDespatchDetail_RowDataBound" OnSorting="gvDespatchDetail_Sorting"   DataKeyNames="EDHOD"
                        GridLines="Both" Font-Size="Small"  AllowSorting="True">
                        <RowStyle BackColor="#ffffff" BorderColor="White" BorderWidth="1px" ForeColor="Black" />

                <Columns>
                    
                      <asp:TemplateField><ItemTemplate><img alt="" src="images/plus.png" style="cursor: pointer" /><asp:Panel ID="pnlOrders" runat="server" Style="display: none"><asp:GridView ID="gvDespatchDetail" runat="server" AutoGenerateColumns="false" Font-Size="Small"
                                            
                                          AllowSorting="True"  HeaderStyle-BackColor="#000066" HeaderStyle-ForeColor="White"
                                            RowStyle-Wrap="False"><RowStyle BackColor="#cccccc" BorderColor="White" BorderWidth="1px" ForeColor="Black" /><Columns><asp:TemplateField HeaderStyle-BackColor="Olive" HeaderText="No" ItemStyle-BackColor="DarkGray"><ItemTemplate></ItemTemplate><HeaderStyle BackColor="Olive" /><ItemStyle BackColor="DarkGray" /></asp:TemplateField><asp:TemplateField HeaderText="No" ItemStyle-Width="25px"><ItemTemplate></ItemTemplate></asp:TemplateField><asp:TemplateField HeaderText="Style No" ItemStyle-Height="30px" Visible="true"><ItemTemplate><asp:Label ID="StyleNo" runat="server" Text='<%#Eval("StyleNo") %>'></asp:Label></ItemTemplate></asp:TemplateField><asp:TemplateField HeaderText="Submission No" ItemStyle-Height="30px" Visible="true"><ItemTemplate><asp:Label ID="Submissions" runat="server" Text='<%#Eval("Submissions") %>'></asp:Label></ItemTemplate></asp:TemplateField><asp:TemplateField HeaderText="Qty"><ItemTemplate><asp:Label ID="DespatchedQty" runat="server" style="text-align:right" Text='<%# Eval("DespatchQty") %>' Width="150px" /></ItemTemplate></asp:TemplateField><asp:TemplateField HeaderText="Reason" Visible="true"><ItemTemplate><asp:Label ID="Reason" runat="server" Text='<%# Eval("Reason") %>' /></ItemTemplate></asp:TemplateField><asp:TemplateField HeaderText="Remarks" Visible="true"><ItemTemplate><asp:Label ID="Remarks" runat="server" Text='<%# Eval("Remarks") %>' /></ItemTemplate></asp:TemplateField></Columns></asp:GridView></asp:Panel></ItemTemplate></asp:TemplateField>
                  
                   
                  
                           
                    <asp:TemplateField HeaderText="EDHOD" Visible="false"><ItemTemplate><asp:Label ID="EDHOD" runat="server" Text='<%#Eval("EDHOD") %>'></asp:Label></ItemTemplate></asp:TemplateField>
                     
                        <asp:TemplateField HeaderText="Des. No" Visible="true" ItemStyle-Font-Size="Small" FooterStyle-Font-Bold="true"><ItemTemplate><asp:LinkButton ID="LinkBtnEmbDES" OnClick="LinkBtnDES_NUMBER_Click"  Font-Bold="true" runat="server" CssClass="paraGraphtext" Text='<%# Eval("DES_NUMBER") %>' Font-Size="Small"  ></asp:LinkButton></ItemTemplate></asp:TemplateField>
                  <asp:TemplateField HeaderText="Style No"><ItemTemplate><asp:Label ID="StyleNo" runat="server" Text='<%#Eval("StyleNo") %>'></asp:Label></ItemTemplate></asp:TemplateField>
                       <asp:TemplateField HeaderText="Attention"><ItemTemplate><asp:Label ID="Attention" runat="server" Text='<%#Eval("Attention") %>'></asp:Label></ItemTemplate></asp:TemplateField>
                     <asp:TemplateField HeaderText="Delivery Point"><ItemTemplate><asp:Label ID="DeliveryPoint" runat="server" Text='<%#Eval("DELIVERY_POINT") %>'></asp:Label></ItemTemplate></asp:TemplateField>
                     <asp:TemplateField HeaderText="Despatched By"><ItemTemplate><asp:Label ID="DespatchedBy" runat="server" Text='<%#Eval("DESPATCHED_BY") %>'></asp:Label></ItemTemplate></asp:TemplateField>
                    <asp:TemplateField HeaderText="Vehicle No"><ItemTemplate><asp:Label ID="VehicleNo" runat="server" Text='<%#Eval("VEHICLE_NO") %>'></asp:Label></ItemTemplate></asp:TemplateField>
                  
                   
                     <asp:TemplateField HeaderText="Comments"><ItemTemplate><asp:Label ID="ShipmentComments" runat="server" Text='<%#Eval("COMMENTS") %>'></asp:Label></ItemTemplate></asp:TemplateField>
                   
                    <asp:TemplateField HeaderText="Despatched Date" Visible="true"><ItemTemplate><asp:Label ID="ShipDate" runat="server" Text='<%#Eval("DES_DATE","{0:dd/MMM/yyyy}") %>'></asp:Label></ItemTemplate></asp:TemplateField>

                     <asp:TemplateField HeaderText="Location"><ItemTemplate><asp:Label ID="Location" runat="server" Text='<%#Eval("Location") %>'></asp:Label></ItemTemplate></asp:TemplateField>
                    
                </Columns>
                <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
               <%-- <HeaderStyle Wrap="true" BackColor="#333333" Font-Bold="True" ForeColor="White" />--%>
                <FooterStyle BackColor="#666666" Font-Bold="True" ForeColor="White"  CssClass="GVFixedFooter"/>
                <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" CssClass="GVFixedHeader" />

            </asp:GridView>
                                       </td></tr></table>
                 <br />
                            </asp:Panel>
   
                   </asp:View>
          </asp:MultiView>
        </td>
      </tr>
    </table>
  </form>
</body>
</html>



