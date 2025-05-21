<%@ page language="C#" autoeventwireup="true" inherits="EmbInvoice, App_Web_cjp5ygzm" %>
<%@ Register Assembly="BasicFrame.WebControls.BasicDatePicker" Namespace="BasicFrame.WebControls" TagPrefix="BDP" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Embroidery System</title>
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

      <link href="CSS/jquery.autocomplete.css" rel="stylesheet" type="text/css" />
    <script src="js/jquery-1.4.1.min.js" type="text/javascript"></script>
    <script src="js/jquery.autocomplete.js" type="text/javascript"></script>

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

</head>
<body>
       <form id="form2" runat="server">
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
                <div class="col-md-8">
                    <center><h3>Embroidery Invoice - Customer Invoice</h3></center>

                </div>
                 <div class="col-md-3">
                     <br />
                    <asp:Label ID="lblComName" runat="server" Font-Bold="True" Text=""></asp:Label>
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
                                            <label class="col-md-1 control-label">Company </label>
                                            <div class="col-md-2">
                                              <asp:DropDownList ID="DropDownCompany"  CssClass="form-control" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DropDownCompany_SelectedIndexChanged">
                        </asp:DropDownList>
                                                 </div>
                                             <label class="col-md-1 control-label">   </label>
                                            <label class="col-md-2 control-label">Our VAT NO:</label>
                                            <div class="col-md-2">
                                              <asp:Label ID="lblOurVat" runat="server" Font-Bold="True" Text=""></asp:Label>
                                            </div>
                                            <label class="col-md-1 control-label">SVAT NO:</label>
                                            <div class="col-md-2">
                                               <asp:Label ID="lblsVat" runat="server" Font-Bold="True" Text="VAT NO:"></asp:Label>
                                            </div>
                                            <div class="col-md-1">

                                               
                                                </div>
                                            
                                        </div>
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="box-body">
                                        <div class="form-group">
                                            <label class="col-md-2 control-label" runat="server" id="lblCLAIM" >Suspended Tax </label>
                                             <div class="col-md-2">
                                             <asp:RadioButton ID="RadioClaim" runat="server" GroupName="measurementSystem"  AutoPostBack="true" oncheckedchanged="RadioClaim_CheckedChanged1" ToolTip="SVAT" />
                                          </div>
                                             <label class="col-md-1 control-label" id="lblDEBIT" runat="server" >Tax </label>
                                             <div class="col-md-2">
                                                 <asp:RadioButton ID="RadioDebit" runat="server" GroupName="measurementSystem"  AutoPostBack="true" oncheckedchanged="RadioDebit_CheckedChanged1" ToolTip="VAT" />
                                                 </div>
                                                   </div>
                                        </div>
                                    </div>
                           <div class="row">
                                    <div class="box-body">
                                        <div class="form-group">
                                            <label class="col-md-1 control-label">Inv. Date </label>
                                            <div class="col-md-2">
                                                <BDP:BasicDatePicker ID="BasicDatePickerfromdate" CssClass="form-control" runat="server" Style="font-family: 'Times New Roman', Times, serif" />
                                                </div>
                                            </div>
                                         <label class="col-md-1 control-label">   </label>
                                          <label class="col-md-1 control-label">Attention  </label>
                                            <div class="col-md-2">
                                                <asp:TextBox ID="TxtAtt" CssClass="form-control" runat="server" Width="204px"></asp:TextBox>
                                                </div>
                                         <label class="col-md-1 control-label">Remarks  </label>
                                        <div class="col-md-2">
                                                <asp:TextBox ID="txtRemark" CssClass="form-control" runat="server" Width="204px"></asp:TextBox>
                                                </div>
                                        </div>
                               </div>
                            
                                
                                <div class="row">
                                    <div class="box-body">
                                        <div class="form-group">
                                            <label class="col-md-1 control-label">	Customer  </label>
                                            <div class="col-md-3">
                                              <asp:DropDownList ID="Dropcustomer"  CssClass="form-control" runat="server" AutoPostBack="True" OnSelectedIndexChanged="Dropcustomer_SelectedIndexChanged">
                        </asp:DropDownList>
                                                 </div>
                                            
                                            
                              
                                            <label class="col-md-1 control-label">Address</label>
                                           
                                            <div class="col-md-6">
                                                <asp:Label ID="LabelAddress1" runat="server" Text=""></asp:Label>
                                                 <asp:Label ID="LabelAddress2" runat="server" Text=""></asp:Label>
                                                <asp:Label ID="LabelAddress3" runat="server" Text=""></asp:Label>
                                                 <asp:Label ID="LabelAddress4" runat="server" Text=""></asp:Label>
                                                </div>
                                            
                                         </div>
                                        </div>
                               </div>
                                 <div class="row">
                                    <div class="box-body">
                                        <div class="form-group">
                                             <div class="col-md-6">
                                                   <asp:TextBox ID="TxtSecAdd5" runat="server" Width="260px" Visible="False"></asp:TextBox>
                                                 <asp:Label ID="LabelCustomer" runat="server" Text=""></asp:Label>
                                                    </div>
                                            </div>
                                        </div>
                                     </div>
                        </div>
                    </div>
                   
                </div>
            </div>
            </asp:Panel>

               <asp:Panel ID="Panel2" runat="server">
             <div class="col-md-12">
                <div class="row">
                    <div class="col-md-12">
                        <div class="panel panel-default">
                            <div class="panel-body">
                                 <asp:Label ID="LblNoteType" runat="server" Font-Bold="True" Font-Underline="True"
                        Text="INV No. SVAT/VAT0000000" Visible="False"></asp:Label>
                      <asp:Label ID="InVNo" runat="server" Font-Bold="True" Font-Underline="True"
                        Text="0"></asp:Label>
                                 <asp:Label ID="lblInvId" runat="server" Text="0" Visible="False"></asp:Label>
                               
                                
                                <div class="row">
                                    <div class="box-body">
                                        <div class="form-group">
                                            <label class="col-md-1 control-label">	Currency  </label>
                                            <div class="col-md-2">
                                              <asp:DropDownList ID="DropDownListCurrency"  CssClass="form-control" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DropDownListCurrency_SelectedIndexChanged">
                        </asp:DropDownList>
                                                </div>
                                         <label class="col-md-1 control-label">	       Ex.Rate </label>
                                                 <div class="col-md-2">
                                             <asp:TextBox ID="txtExcahnegeRate"  CssClass="form-control" runat="server" ></asp:TextBox>
                                                     <%-- <asp:RegularExpressionValidator ID="regexpName"      
                                    ErrorMessage="Incorrect Exchange rate."  runat="server"
                                    ControlToValidate="txtExcahnegeRate"     
                                    ValidationExpression="^[0-9]\d{0,9}(\.\d{1,3})?%?$" />--%>
                                            </div>
                                            <div class="col-md-5">
                                               <asp:Button ID="btnAddnewRow" Visible="false" CssClass="btn btn-primary" runat="server" Text="Add New Row" OnClick="Button1_Click" />
                                               
                <asp:Button ID="BtnCalVal" runat="server" CssClass="btn btn-primary" OnClick="BtnCalVal_Click" Visible="false" Text="Calculate Value" Width="150px" />
                    &nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Button ID="BtnClearGrid" Visible="false" runat="server" CssClass="btn btn-warning" OnClick="BtnClearGrid_Click" Text="Clear Item" Width="150px" />
                                                </div>
                                            
                                         </div>
                                        </div>
                               </div>

                                 <div class="row">
                                    <div class="box-body">
                                        <div class="form-group">
                                             <label class="col-md-1 control-label">	VAT NO:  </label>
                                             <div class="col-md-3">
                                              <asp:TextBox ID="txtComvat" CssClass="form-control" runat="server" MaxLength="250" Width="230px"></asp:TextBox>
                                            </div>
                                                  <label class="col-md-1 control-label">	SVAT NO:  </label>
                                             <div class="col-md-3">
                                             <asp:TextBox ID="txtComSvat" CssClass="form-control" runat="server" MaxLength="250" Width="230px"></asp:TextBox>
                                          <asp:TextBox ID="txtVAt" runat="server" MaxLength="250" Width="230px" Visible="False">15</asp:TextBox>
                                                  </div>
                                                   </div>
                                        </div>
                                     </div>
                                 <div class="row">
                                    <div class="box-body">
                                        <div class="form-group">
                                            <div class="col-md-10">
                                           <asp:GridView ID="GridLiabilityItems" OnRowDeleting="GridLiabilityItems_RowDeleting"  runat="server" AutoGenerateColumns="False"  ShowFooter="false" OnRowDataBound="GridLiabilityItems_RowDataBound">
                        <Columns>
                            <asp:BoundField DataField="RowNumber" HeaderText="SNo" />
                            <asp:TemplateField HeaderText="Description of Item">
                                <ItemTemplate>
                                    <asp:TextBox ID="txDes" Enabled="false" runat="server" Text='<%#Eval("Description") %>' Width="350">&gt;</asp:TextBox>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <%--  <asp:TemplateField HeaderText="PO#">
                           <ItemTemplate>                                
                               <asp:TextBox ID="txtPONO" Width ="100" runat="server" Text='<%#Eval("PONO") %>'>></asp:TextBox>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Style">
                           <ItemTemplate>                                
                               <asp:TextBox ID="txtStyle" Width ="150"  runat="server" Text='<%#Eval("Style") %>'>></asp:TextBox>
                            </ItemTemplate>
                        </asp:TemplateField>--%>
                            <asp:TemplateField HeaderText="UOM" Visible="false">
                                <ItemTemplate>
                                    <asp:TextBox ID="txtUOM" runat="server" onkeypress="return onlyNumbers(this);" Text='<%#Eval("UOM") %>' Width="100">PCS</asp:TextBox>
                                </ItemTemplate>
                            </asp:TemplateField>
                             <%-- <asp:TemplateField  HeaderText="QTY CTN">
                                <ItemTemplate>
                                    <asp:TextBox ID="txtSQTYCTN" runat="server" onkeypress="return onlyNumbers(this);" ItemStyle-HorizontalAlign="Right" Text='<%#Eval("QtyCTN") %>' Width="100">&gt;</asp:TextBox>
                                <asp:RegularExpressionValidator ID="regexpName"      
                                    ErrorMessage="Incorrect Cartoon Qty !"  Font-Size="Smaller" runat="server"
                                    ControlToValidate="txtSQTYCTN"     
                                    ValidationExpression="^[0-9]\d{0,9}(\.\d{1,3})?%?$" />
                                     </ItemTemplate>
                            </asp:TemplateField>--%>
                            <asp:TemplateField HeaderText="QTY">
                                <ItemTemplate>
                                    <asp:TextBox ID="txtSQTY" Enabled="true" runat="server" onkeypress="return onlyNumbers(this);" ItemStyle-HorizontalAlign="Right" Text='<%#Eval("Qty") %>' Width="100">&gt;</asp:TextBox>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="U.Price">
                                <ItemTemplate>
                                    <asp:TextBox ID="txtuprice" Enabled="true" runat="server" onkeypress="return isNumberKey(event)" ItemStyle-HorizontalAlign="Right" OnTextChanged="Amount" Text='<%#Eval("UnitPrice") %>' Width="150">&gt;</asp:TextBox>
                                </ItemTemplate>
                                  <FooterTemplate>
                                    <asp:Label ID="lblTTLAmount" runat="server" Font-Bold="True" Text=""></asp:Label>
                                </FooterTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Amount">
                                <ItemTemplate>
                                    <asp:Label ID="txtAmount" runat="server" ItemStyle-HorizontalAlign="Right" Text='<%#Eval("Amount") %>' Width="120">&gt;</asp:Label>
                                </ItemTemplate>
                                <FooterStyle HorizontalAlign="Right" />
                                 <FooterTemplate>
                                    <asp:Label ID="lblTTLAmo" runat="server" Font-Bold="True"></asp:Label>
                                </FooterTemplate>
                            </asp:TemplateField>
                              <asp:TemplateField HeaderText="Add" Visible="true">
                                <ItemTemplate>                            
                          <asp:ImageButton ID="ImgBtnAddrow"  runat="server" ImageUrl="~/images/AddVendor.png" Width="22px" OnClick="ImgBtnAddrow_Click" />
                                    </ItemTemplate>
                                 </asp:TemplateField>
                               <asp:TemplateField HeaderText="Remove" Visible="true">
                                <ItemTemplate>                          
                          <asp:ImageButton ID="ImgBtnSelect"  runat="server" ImageUrl="~/images/remove.gif" Width="20px" CommandName="Delete" />
                                    </ItemTemplate>
                                 </asp:TemplateField>
                             <asp:TemplateField HeaderText="Refresh" Visible="true">
                                <ItemTemplate>                            
                          <asp:ImageButton ID="ImgBtnRefresh" Tooltip="Calculate the Amount" runat="server" ImageUrl="~/images/refresh.png" Width="22px" OnClick="ImgBtnRefresh_Click" />
                                    </ItemTemplate>
                                 </asp:TemplateField>
                          <%--  <asp:CommandField HeaderText="Delete" ShowDeleteButton="True" />--%>
                        </Columns>
                    </asp:GridView>
                                                </div>
                                            </div>
                                        </div>
                                     </div>

                              <%--    <div class="row">
                                    <div class="box-body">
                                        <div class="form-group">
                                              <label class="col-md-3 control-label">  Total Invoice Amount </label>
                                                <div class="col-md-2"> 
                                                  <asp:Label ID="LabeTotInvAmount" runat="server">...............</asp:Label>
                                                    </div>
                                                 </div>
                                            </div>
                                        </div>
                                    
                                <div class="row">
                                    <div class="box-body">
                                        <div class="form-group">

                                                <label class="col-md-3 control-label"> Exchange Rate (LKR) </label>
                                                 <div class="col-md-2"> 
                                                  <asp:Label ID="LabeExchangeRate" runat="server">...............</asp:Label>
                                                    </div>
                                                 <div class="col-md-2"> 
                                                     </div>
                                                </div>
                                            </div>
                                        </div>
                                   
                               <div class="row">
                                    <div class="box-body">
                                        <div class="form-group">
                                           <label class="col-md-3 control-label">     Invoice value (LKR) </label>
                                                <div class="col-md-2"> 
                                                <asp:Label ID="LabInvValues" runat="server">...............</asp:Label>
                                                </div>
                                               </div>
                                            </div>
                                        </div>
                 
                                   <div class="row">
                                    <div class="box-body">
                                        <div class="form-group">
    <label class="col-md-3 control-label">     Finance Charge </label>
<div class="col-md-6">
     <asp:TextBox ID="TextFinanceCharge" onkeypress="return onlyNumbers(this);"  runat="server" Style="text-align:right" Width="84px"></asp:TextBox>
                          
     </div>
                        </div>
                    </div>
                   
                </div>
        
                                  <div class="row">
                                    <div class="box-body">
                                        <div class="form-group">
                                        <label class="col-md-3 control-label"> NBT %  </label>
                                            <div class="col-md-4">
                                                <asp:TextBox ID="TextFinanceCharge0" onkeypress="return onlyNumbers(this);" onchange="handleChange(this);" runat="server" Width="84px"></asp:TextBox>
                                               <asp:Label ID="LabNBT" runat="server" CssClass="auto-style41">...............</asp:Label>
                                               </div>
                                                  </div>
                                            </div>
                                        </div>
                               

                                  <div class="row">
                                    <div class="box-body">
                                        <div class="form-group">
                                        <label class="col-md-3 control-label"> Vat %  </label>
                                            <div class="col-md-4">
                                                <asp:TextBox ID="TextFinanceCharge1" onkeypress="return onlyNumbers(this);" onchange="handleChange(this);" runat="server" Width="84px"></asp:TextBox>
                                               <asp:Label ID="LabVatVal" runat="server" CssClass="auto-style41">...............</asp:Label>
                                               
                                                </div>  </div>
                                            </div>
                                        </div>
                                 

                                <div class="row">
                                    <div class="box-body">
                                        <div class="form-group">
                                            <label class="col-md-3 control-label">Custom Duty</label>
                                            <div class="col-md-6">
                                                                   
                                                <asp:TextBox ID="TextFinanceCharge2" onkeypress="return onlyNumbers(this);" Style="text-align:right" runat="server" Width="106px"></asp:TextBox>
                                                  </div>
                                            </div>
                                        </div>
                                    </div>
                                <div class="row">
                                    <div class="box-body">
                                        <div class="form-group">
                                            <label class="col-md-3 control-label"> Total Amount              :</label>
                                            <div class="col-md-6">
<asp:Label ID="LabTotalAmounts" Font-Bold="true" Font-Size="Large" Font-Overline="true" Font-Underline="true" runat="server" CssClass="auto-style41">...............</asp:Label>
 </div>
                                            </div>
                                        </div>
                                    </div> --%>
                                <div class="row">
                                    <div class="box-body">
                                        <div class="form-group">
                                            <%--<div class="col-md-6">
                                                    <asp:Label ID="Label7" runat="server" Text="Comment :"></asp:Label>
                                 <asp:TextBox ID="txtShipComments" runat="server" Height="53px" MaxLength="32" Width="710px"></asp:TextBox>
     </div>--%>
                                            <asp:Label ID="lblOrderNo" Visible="false" runat="server" Text=""></asp:Label>
                                            <asp:Label ID="lblStyleNo" Visible="false" runat="server" Text=""></asp:Label>
                                             <asp:Label ID="lblFC" Visible="false" runat="server" Text=""></asp:Label> 
                                             <asp:Label ID="LblUserID" Visible="false" runat="server" Text="0"></asp:Label>
                                            </div>
                                        </div>
                                    </div>

                                <div class="row">
                                    <div class="box-body">
                                        <div class="form-group">
                                            <div class="col-md-6">
                                <asp:Button ID="BtnSave" runat="server" CssClass="btn btn-success" OnClick="BtnSave_Click" Text="Save & Confirm" Width="162px" />
                                   
                                    <asp:Button ID="BtnConfirm" Visible="false" runat="server" CssClass="btn btn-primary" OnClick="BtnConfirm_Click" Text="Confirm" Width="102px" />
                                   
                                    <asp:Button ID="BtnPrint" runat="server" CssClass="btn btn-warning" OnClick="BtnPrint_Click" Text="Print" Width="102px" />
                                  
                                    <asp:Button ID="BtnClear" runat="server" class="btn btn-danger" Visible="false" OnClick="BtnClear_Click" Text="Clear" Width="102px" />
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

            <asp:Panel ID="Panel1" Visible="true" runat="server">
                <div>
                        <asp:GridView ID="GrVHidden" Caption="Summary View"  runat="server" AllowSorting="True" AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" EnableModelValidation="True" Font-Size="Small" ForeColor="Black" ShowFooter="false" Style="max-width: 100%; min-width: 40%">
                                                    <Columns>
                                                         
                                                        <asp:TemplateField HeaderText="rn"  SortExpression="" Visible="false">
                                                            <ItemTemplate>
                                                                <asp:Label ID="rn" runat="server" Text='<%#Eval("rn") %>'></asp:Label>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                         <asp:TemplateField HeaderText="ESID" SortExpression="" Visible="false">
                                                            <ItemTemplate>
                                                                <asp:Label ID="ESID" runat="server" Text='<%#Eval("ESID") %>'></asp:Label>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                         <asp:TemplateField HeaderText="Submissions" SortExpression="" Visible="true">
                                                            <ItemTemplate>
                                                                <asp:Label ID="Submissions" runat="server" Text='<%#Eval("Submissions") %>'></asp:Label>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                         <asp:TemplateField HeaderText="DispatchCount" SortExpression="" Visible="true">
                                                            <ItemTemplate>
                                                                <asp:Label ID="DispatchCount" runat="server" Text='<%#Eval("DispatchCount") %>'></asp:Label>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>

                                                        </Columns>
                            <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
                                                    <%-- <HeaderStyle Wrap="true" BackColor="#333333" Font-Bold="True" ForeColor="White" />--%>
                                                    <FooterStyle BackColor="#333333" CssClass="GVFixedFooter" Font-Bold="True" ForeColor="White" />
                                                    <HeaderStyle BackColor="#333333" CssClass="GVFixedHeader" Font-Bold="True" ForeColor="White" />
                                                
                            </asp:GridView>
                  </div>
            </asp:Panel>


             <asp:Panel ID="Panel3" Visible="true" runat="server">
                <div>
                        <asp:GridView ID="GVEmb_Despatch_Detail" Caption="Emb_Despatch_Detail"  runat="server" AllowSorting="True" AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" EnableModelValidation="True" Font-Size="Small" ForeColor="Black" ShowFooter="false" Style="max-width: 100%; min-width: 40%">
                                                    <Columns>
                                                         
                                                        <asp:TemplateField HeaderText="EDDOD"  SortExpression="" Visible="true">
                                                            <ItemTemplate>
                                                                <asp:Label ID="EDDOD" runat="server" Text='<%#Eval("EDDOD") %>'></asp:Label>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                         <asp:TemplateField HeaderText="DespatchQty" SortExpression="" Visible="true">
                                                            <ItemTemplate>
                                                                <asp:Label ID="DespatchQty" runat="server" Text='<%#Eval("DespatchQty") %>'></asp:Label>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                       

                                                        </Columns>
                            <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
                                                    <%-- <HeaderStyle Wrap="true" BackColor="#333333" Font-Bold="True" ForeColor="White" />--%>
                                                    <FooterStyle BackColor="#333333" CssClass="GVFixedFooter" Font-Bold="True" ForeColor="White" />
                                                    <HeaderStyle BackColor="#333333" CssClass="GVFixedHeader" Font-Bold="True" ForeColor="White" />
                                                
                            </asp:GridView>
                  </div>
            </asp:Panel>
            <asp:Label ID="lblESIDD" Visible="false" runat="server" Text=""></asp:Label>
    <div>
    
    </div>
    </form>
</body>
</html>
