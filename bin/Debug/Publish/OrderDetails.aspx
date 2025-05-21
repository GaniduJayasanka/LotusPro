<%@ page language="C#" autoeventwireup="true" inherits="OrderDetails, App_Web_b2ychy0x" enableeventvalidation="false" %>

<%@ Register Assembly="BasicFrame.WebControls.BasicDatePicker" Namespace="BasicFrame.WebControls" TagPrefix="BDP" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Order Details</title>
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

   <%-- <script language="javascript" type="text/javascript">
        function MakeStaticHeader(gridId, height, width, headerHeight, isFooter) {
            var tbl = document.getElementById(gridId);
            if (tbl) {
                var DivHR = document.getElementById('DivHeaderRow');
                var DivMC = document.getElementById('DivMainContent');
                var DivFR = document.getElementById('DivFooterRow');

                //*** Set divheaderRow Properties ****
                DivHR.style.height = headerHeight + 'px';
                DivHR.style.width = (parseInt(width) - 16) + 'px';
                DivHR.style.position = 'relative';
                DivHR.style.top = '0px';
                DivHR.style.zIndex = '10';
                DivHR.style.verticalAlign = 'top';

                //*** Set divMainContent Properties ****
                DivMC.style.width = width + 'px';
                DivMC.style.height = height + 'px';
                DivMC.style.position = 'relative';
                DivMC.style.top = -headerHeight + 'px';
                DivMC.style.zIndex = '1';

                //*** Set divFooterRow Properties ****
                DivFR.style.width = (parseInt(width) - 16) + 'px';
                DivFR.style.position = 'relative';
                DivFR.style.top = -headerHeight + 'px';
                DivFR.style.verticalAlign = 'top';
                DivFR.style.paddingtop = '2px';

                if (isFooter) {
                    var tblfr = tbl.cloneNode(true);
                    tblfr.removeChild(tblfr.getElementsByTagName('tbody')[0]);
                    var tblBody = document.createElement('tbody');
                    tblfr.style.width = '100%';
                    tblfr.cellSpacing = "0";
                    tblfr.border = "0px";
                    tblfr.rules = "none";
                    //*****In the case of Footer Row *******
                    tblBody.appendChild(tbl.rows[tbl.rows.length - 1]);
                    tblfr.appendChild(tblBody);
                    DivFR.appendChild(tblfr);
                }
                //****Copy Header in divHeaderRow****
                DivHR.appendChild(tbl.cloneNode(true));
            }
        }

</script>

--%>


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
        
       
        <div class="col-md-12">
            <div class="row">
                <div class="col-md-1">
                    <br />
                    
                </div>
                <div class="col-md-11">
                    <center><h3> <asp:Label ID="Label6" runat="server" Text="Order Details - Exceptions" Font-Bold="true"></asp:Label></h3></center>
           
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
                                          
                                            
                                          
                                          
                                            <div class="col-md-3">
                                                <asp:Label ID="Label2" runat="server" Text="OurRefNo : " Font-Bold="true"></asp:Label>
                                              &nbsp;&nbsp;&nbsp;   <asp:Label ID="lblOurRefNo" runat="server" Text="Label"></asp:Label>
                                            </div>

                                            <div class="col-md-4">
                                                <asp:Label ID="Label3" runat="server" Text="Season : " Font-Bold="true"></asp:Label>
                                              &nbsp;&nbsp;&nbsp;   <asp:Label ID="lblSeason" runat="server" Text="Label"></asp:Label>
                                              &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;   <asp:Label ID="Label4" runat="server" Text="Style Year : " Font-Bold="true"></asp:Label>
                                                &nbsp;&nbsp;&nbsp;   <asp:Label ID="lblYear" runat="server" Text="Label"></asp:Label>
                                            </div>

                                            

                                            <div class="col-md-2">
                                                <asp:Label ID="Label5" runat="server" Text="Pieces : " Font-Bold="true"></asp:Label>
                                              &nbsp;&nbsp;&nbsp;   <asp:Label ID="lblPieces" runat="server" Text="Label"></asp:Label>
                                            </div>
                                            

                                        </div>
                                        </div>
                                    </div>
                               
                             <div class="row">
                                    <div class="box-body">
                                        <div class="form-group">
                                            
                                              <div class="col-md-3">
                                                <asp:Label ID="Label1" runat="server" Text="Style :  " Font-Bold="true"></asp:Label>
                                             &nbsp;&nbsp;&nbsp;  <asp:Label ID="lblStyleNo" runat="server" Text="Label"></asp:Label>
                                            </div>

                                           <div class="col-md-3">
                                                <asp:Label ID="Label7" runat="server" Text="Buyer :  " Font-Bold="true"></asp:Label>
                                             &nbsp;&nbsp;&nbsp;  <asp:Label ID="lblBuyer" runat="server" Text="Label"></asp:Label>
                                            </div>

                                              <div class="col-md-3">
                                                <asp:Label ID="Label9" runat="server" Text="RTD :  " Font-Bold="true"></asp:Label>
                                             &nbsp;&nbsp;&nbsp;  <asp:Label ID="lblRTD" runat="server" Text="Label"></asp:Label>
                                           
                                             &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp    <asp:Label ID="Label11" runat="server" Text="PCD :  " Font-Bold="true"></asp:Label>
                                             &nbsp;&nbsp;&nbsp;  <asp:Label ID="lblPCD" runat="server" Text="Label"></asp:Label>
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


         <div class="col-md-2">
                                             <asp:Button ID="BtnExportExcel" runat="server" CssClass="btn btn-success" Height="25px" OnClick="BtnExportExcel_Click" Style="background-position: right; font-size: smaller; font-weight: 700; text-align: left; background-image: url('Images/exel.png'); background-size:contain; background-repeat: no-repeat;" Text="Export to Excel" Width="130px" />
                                               </div>   
        
        
        <div class="col-md-12">

              <asp:GridView ID="gvBPODetails" Visible="true"   FooterStyle-Font-Bold="true" runat="server" AllowSorting="True" 
                        AutoGenerateColumns="False" BackColor="White" BorderColor="#cccccc" BorderWidth="2px" CellPadding="4"
                         EnableModelValidation="True" Font-Size="X-Small" ForeColor="Black" Height="96px"  Width="70%" > 
                   
                        <Columns>
                             
                            <asp:TemplateField HeaderText="Buyer PO No"  Visible="true">
                                <ItemTemplate>
                                    <asp:Label ID="BuyerPONo" runat="server" Text='<%#Eval("BuyerPONo") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Country"  Visible="true">
                        <ItemTemplate>
                            <asp:Label ID="Country" runat="server"  Text='<%#Eval("Country") %>' ></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                        <asp:TemplateField HeaderText="POQty"  Visible="true">
                        <ItemTemplate>
                            <asp:Label ID="POQty" runat="server"  Text='<%#Eval("POQty") %>' ></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>  
                              <asp:TemplateField HeaderText="Prod.Qty"  Visible="true">
                        <ItemTemplate>
                            <asp:Label ID="ReqQty" runat="server"  Text='<%#Eval("ReqQty") %>' ></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>  

                      
                           <asp:TemplateField HeaderText="RTD" ItemStyle-Width="100" Visible="true">
                                    <ItemTemplate>
                                        <asp:Label ID="RTD" runat="server" Text='<%#Eval("RTD","{0:dd/MMM/yyyy}") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField> 
                          <asp:TemplateField HeaderText="Extended Ship Date" ItemStyle-Width="100" Visible="true">
                                    <ItemTemplate>
                                        <asp:Label ID="ExtendedShipDate" runat="server" Text='<%#Eval("ExtendedShipDate","{0:dd/MMM/yyyy}") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                             
                        </Columns>
                        <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
                        <%-- <HeaderStyle Wrap="true" BackColor="#333333" Font-Bold="True" ForeColor="White" />--%>
                        <FooterStyle HorizontalAlign="Right" BackColor="#333333" Font-Bold="True" ForeColor="White" CssClass="GVFixedFooter" />
                        <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" CssClass="GVFixedHeader" />
                    </asp:GridView>
               <br />
        </div>
         
       
        <div class="col-md-12">

              <asp:GridView ID="GridViewPlanDetails" Visible="true"   FooterStyle-Font-Bold="true" runat="server" AllowSorting="True" 
                        AutoGenerateColumns="False" BackColor="White" BorderColor="#cccccc" BorderWidth="2px" CellPadding="4"
                         EnableModelValidation="True" Font-Size="X-Small" ForeColor="Black" Height="96px"  Width="70%" > 
                   
                        <Columns>
                             
                            <asp:TemplateField HeaderText="Company Name"  Visible="true">
                                <ItemTemplate>
                                    <asp:Label ID="CompanyName" runat="server" Text='<%#Eval("CompanyName") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Team Name"  Visible="true">
                        <ItemTemplate>
                            <asp:Label ID="TeamName" runat="server"  Text='<%#Eval("TeamName") %>' ></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                        <asp:TemplateField HeaderText="SMV"  Visible="true">
                        <ItemTemplate>
                            <asp:Label ID="SMV" runat="server"  Text='<%#Eval("SMV") %>' ></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>  
                              <asp:TemplateField HeaderText="TargetDays"  Visible="true">
                        <ItemTemplate>
                            <asp:Label ID="TargetDays" runat="server"  Text='<%#Eval("TargetDays") %>' ></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>  

                       <asp:TemplateField HeaderText="PlanQty"  Visible="true">
                        <ItemTemplate>
                            <asp:Label ID="PlanQty" runat="server"  Text='<%#Eval("PlanQty") %>' ></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>    
                           <asp:TemplateField HeaderText="PlanDate" ItemStyle-Width="100" Visible="true">
                                    <ItemTemplate>
                                        <asp:Label ID="PlanDate" runat="server" Text='<%#Eval("PlanDate","{0:dd/MMM/yyyy}") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField> 
                          <asp:TemplateField HeaderText="CompleteDate" ItemStyle-Width="100" Visible="true">
                                    <ItemTemplate>
                                        <asp:Label ID="CompleteDate" runat="server" Text='<%#Eval("CompleteDate","{0:dd/MMM/yyyy}") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                             
                        </Columns>
                        <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
                        <%-- <HeaderStyle Wrap="true" BackColor="#333333" Font-Bold="True" ForeColor="White" />--%>
                        <FooterStyle HorizontalAlign="Right" BackColor="#333333" Font-Bold="True" ForeColor="White" CssClass="GVFixedFooter" />
                        <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" CssClass="GVFixedHeader" />
                    </asp:GridView>
               <br />
        </div>
        <br />
      
        <div class="col-md-12">

              <asp:GridView ID="GVItemDetails"  OnRowDataBound="GVItemDetails_RowDataBound" Visible="true"   FooterStyle-Font-Bold="true" runat="server" AllowSorting="True" 
                        AutoGenerateColumns="False" BackColor="White" BorderColor="#cccccc" BorderWidth="2px" CellPadding="4"
                         EnableModelValidation="True" Font-Size="X-Small" ForeColor="Black" Height="96px"  Width="95%" 
                > 
                   
                        <Columns>
                             
                            <asp:TemplateField HeaderText="Main Category Name"  Visible="true">
                                <ItemTemplate>
                                    <asp:Label ID="SCatName" runat="server" Text='<%#Eval("SCatName") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Sub Category Name"  Visible="true">
                        <ItemTemplate>
                            <asp:Label ID="MCatName" runat="server"  Text='<%#Eval("MCatName") %>' ></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                        <asp:TemplateField HeaderText="Item Description"  Visible="true">
                        <ItemTemplate>
                            <asp:Label ID="ItemDescription" runat="server"  Text='<%#Eval("ItemDescription") %>' ></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>  
                              <asp:TemplateField HeaderText="Long Item Description"  Visible="true">
                        <ItemTemplate>
                            <asp:Label ID="LongItemDescription" runat="server"  Text='<%#Eval("LongItemDescription") %>' ></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>  

                       <asp:TemplateField HeaderText="PONumber"  Visible="true">
                        <ItemTemplate>
                            <asp:Label ID="PONumber" runat="server"  Text='<%#Eval("PONumber") %>' ></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>    
                            <asp:TemplateField HeaderText="GRNLOC"  Visible="true">
                        <ItemTemplate>
                            <asp:Label ID="GRNLOC" runat="server"  Text='<%#Eval("GRNLOC") %>' ></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>    
                          <asp:TemplateField HeaderText="VendorName"  Visible="true">
                        <ItemTemplate>
                            <asp:Label ID="VendorName" runat="server"  Text='<%#Eval("VendorName") %>' ></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField> 
                            
                            <asp:TemplateField HeaderText="PO QTY"  ItemStyle-HorizontalAlign="Right" Visible="true">
                        <ItemTemplate>
                            <asp:Label ID="ReqQty" runat="server"  Text='<%#Eval("ReqQty","{0:#,##0.00}") %>' ></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>  
                            <asp:TemplateField HeaderText="Rec Qty"  ItemStyle-HorizontalAlign="Right" Visible="true">
                        <ItemTemplate>
                            <asp:Label ID="RecQty" runat="server"  Text='<%#Eval("RecQty","{0:#,##0.00}") %>' ></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>  
                            <asp:TemplateField HeaderText="Bal Qty"  ItemStyle-HorizontalAlign="Right" Visible="true">
                        <ItemTemplate>
                            <asp:Label ID="BalQty" runat="server"  Text='<%#Eval("BalQty","{0:#,##0.00}") %>' ></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>  

                            <asp:TemplateField HeaderText="Cost_Consumption"  ItemStyle-HorizontalAlign="Right" Visible="true">
                        <ItemTemplate>
                            <asp:Label ID="PRE_Consumption" runat="server"  Text='<%#Eval("PRE_Consumption","{0:#,##0.0000}") %>' ></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>    
                             
                        </Columns>
                        <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
                        <%-- <HeaderStyle Wrap="true" BackColor="#333333" Font-Bold="True" ForeColor="White" />--%>
                        <FooterStyle HorizontalAlign="Right" BackColor="#333333" Font-Bold="True" ForeColor="White" CssClass="GVFixedFooter" />
                        <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" CssClass="GVFixedHeader" />
                    </asp:GridView>
        </div>

        <br />
        
      
    </form>
</body>
</html>
