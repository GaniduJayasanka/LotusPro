<%@ page language="C#" autoeventwireup="true" inherits="PrintDespach, App_Web_34neb3g4" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <style type="text/css">
          
        .style1
        {
            width: 861px;
        }
        .style10
        {
            width: 108px;
        }
        .style13
        {
            width: 933px;
        }
        .style14
        {
            width: 5px;
        }
        .style15
        {
            width: 106px;
        }
        .style16
        {
            width: 270px;
        }
        .style17
        {
            width: 31px;
        }
        </style>
        
        <style type="text/css">
#watermark {
  color: #dddddd; /*#d0d0d0#d6d4d4*/
  font-size: 50pt;
  -webkit-transform: rotate(-45deg);
  -moz-transform: rotate(-45deg);
  position: absolute;
  width: 60%;
  height: 60%;
  margin: 0;
  z-index: -1;
  left:50px;
  top:0px;
}
            .style18
            {
                width: 93px;
            }
            .style19
            {
                width: 83px;
            }
            .style20
            {
                width: 199px;
            }
            .style21
            {
                width: 374px;
            }
            .style22
            {
                width: 41px;
            }
            .style24
            {
                width: 261px;
            }
            .style26
            {
                width: 261px;
                height: 23px;
            }
            .style27
            {
                width: 136px;
                height: 23px;
            }
            .style28
            {
                height: 23px;
            }
            .style29
            {
                width: 136px;
            }
            .style30
            {
                width: 25px;
            }
            .hideANDseek
            {
                display: none;
            }
        </style>
        
        <style type="text/css">
       .headerow
       {
           border: solid 1px #FFFFFF;
       }
       .footerrow
       {
           border: solid 1pxx #DCDCDC;
       }
            .auto-style183 {
                width: 100%;
            }
            .auto-style185 {
                font-size: 25px;
                width:100px;
            }
            .auto-style210 {
                font-size: 25px;
                width: 100px;
                text-decoration: underline;
            }
            .auto-style231 {
                font-size: 18px;
            }
            </style>
</head>
<body>
    <form id="form1" runat="server">    
    <div runat="server" id="conte">    
        
       
        <table class="auto-style183">
            <tr>
                <td>&nbsp;</td>
                <td colspan="10" style="text-align: center">
                                <img alt="" width="180px" longdesc="Images/Sumithra.jpg" src="Images/Sumithra.png"  /></td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td colspan="10" style="text-align: center">
                                <strong>
                                <asp:Label ID="LabelPLANT" runat="server" CssClass="auto-style185"></asp:Label>
                                            </strong></td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td colspan="10" style="text-align: center">
                                            <asp:Label ID="D1" runat="server"></asp:Label>
                                            <asp:Label ID="D2" runat="server"></asp:Label>
                                            <asp:Label ID="Label16" runat="server" Text="Fax :"></asp:Label>
                                            <asp:Label ID="D3" runat="server"></asp:Label>
                                            <asp:Label ID="Label15" runat="server" Text="Email :"></asp:Label>
                                            <asp:Label ID="D4" runat="server"></asp:Label>
                                        </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>
                                            &nbsp;</td>
                <td colspan="3" style="text-align: center">
                                            <asp:Label ID="Label13" runat="server" Text="Our VAT No: "></asp:Label>
                                                        <asp:Label ID="labVatNo" runat="server"></asp:Label>
                    &nbsp; &nbsp; &nbsp;
                                            <asp:Label ID="Label14" runat="server" Text="Our SVAT No."></asp:Label>
                                            <asp:Label ID="labSVatNo" runat="server"></asp:Label>
                                        </td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td colspan="10"> <hr style="border-width:3px; height: -15px; width: 1267px;"/></td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td colspan="10" style="text-align: center">
                                            <strong>
                                <asp:Label ID="Label12" runat="server" Text="SUSPENDED TAX INVOICE" CssClass="auto-style210"></asp:Label>
                                </strong>
                                        </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
        </table>
        <br />
          
        <table class="auto-style183">
            <tr>
                <td>&nbsp;</td>
                <td>INV.NO :</td>
                <td>
                                                        <asp:Label ID="LabInvNo" runat="server"></asp:Label>
                                                    </td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>Com.Name : </td>
                <td>
                    <asp:Label ID="LabCompany" runat="server"></asp:Label>
                                                    </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td>INV.Date :</td>
                <td>
                                                        <asp:Label ID="LabInvDate"  runat="server"></asp:Label>
                                                    </td>
                <td>&nbsp;</td>
                <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;</td>
                <td>&nbsp;</td>
                <td>Address : </td>
                <td>
                    <asp:Label ID="LabAddress1" runat="server"></asp:Label>
                                                    </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td>Currency :</td>
                <td>
                        <asp:Label ID="LabCurency" runat="server"></asp:Label>
                         </td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>
                    <asp:Label ID="LabAddress2" runat="server"></asp:Label>
                                                    </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td>VAT NO :</td>
                <td>
                    <asp:Label ID="LBLCVatNO" runat="server" Text=""></asp:Label>
                </td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>
                    <asp:Label ID="LabAddress3" runat="server"></asp:Label>
                                                    </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td>SVAT NO :</td>
                <td>
                    <asp:Label ID="lblCSVatNO" runat="server" Text=""></asp:Label>
                </td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>
                    <asp:Label ID="LabAddress4" runat="server"></asp:Label>
                                                    </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td>Attention :</td>
                <td>
                    <asp:Label ID="lblAtt" runat="server" Text=""></asp:Label>
                </td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>
                    <asp:Label ID="LabAddress5" runat="server"></asp:Label>
                                                    </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td colspan="7">




<asp:GridView ID="GridViewAdjustedBPO" runat="server" GridLines="Both" BorderStyle ="Solid" 
                    AutoGenerateColumns="False" ShowFooter="true"  Width="1213px" OnRowDataBound="GridViewAdjustedBPO_RowDataBound" CssClass="auto-style231">                    
                <Columns>                    

                     <asp:TemplateField HeaderText="DESCRIPTION" ItemStyle-HorizontalAlign="Left">
                                <ItemTemplate>
                                    <asp:Label ID="txtDESCRIPTION" runat="server" ItemStyle-HorizontalAlign="Right" Text='<%#Eval("Description") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                    
                  <%--  <asp:TemplateField HeaderText="Qty CTNS" FooterStyle-HorizontalAlign="Right" ItemStyle-HorizontalAlign="Right">
                                <ItemTemplate>
                                    <asp:Label  ID="txtQtyCTN"  runat="server" ItemStyle-HorizontalAlign="Right" Text='<%#Eval("QtyCTN") %>' Width="100">&gt;</asp:Label>
                                </ItemTemplate>
                          <FooterTemplate>
                                        <asp:Label ID="lbTotalCTNS" Font-Bold="true" runat="server" />
                                    </FooterTemplate>
                            </asp:TemplateField>--%>
                       <asp:TemplateField HeaderText="QTY PCS" FooterStyle-HorizontalAlign="Right" ItemStyle-HorizontalAlign="Right">
                                <ItemTemplate>
                                    <asp:Label ID="txtPcs" runat="server" ItemStyle-HorizontalAlign="Right" Text='<%#Eval("Pcs","{0:0}") %>' Width="100">&gt;</asp:Label>
                                </ItemTemplate>
                                <FooterTemplate>
                                        <asp:Label ID="lbTotalPCS" Font-Bold="true" runat="server" />
                                    </FooterTemplate>
                            </asp:TemplateField>
                      <asp:TemplateField HeaderText="UNIT PRICE USD" ItemStyle-HorizontalAlign="Right">
                                <ItemTemplate>
                                    <asp:Label ID="txtunitPrice" runat="server" ItemStyle-HorizontalAlign="Right" Text='<%#Eval("unitPrice","{0:0.000}") %>' Width="100">&gt;</asp:Label>
                             
                                </ItemTemplate>
                          <FooterTemplate>
                              
<asp:Label ID="fvv" Font-Bold="true" Text=" Invoice Value :" runat="server" />
                          </FooterTemplate>
                            </asp:TemplateField>

                    


                      <asp:TemplateField HeaderText="TOTAL USD" FooterStyle-HorizontalAlign="Right" ItemStyle-HorizontalAlign="Right">
                                <ItemTemplate>
                                    <asp:Label ID="labTotupric" runat="server" ItemStyle-HorizontalAlign="Right" Text='' Width="100"></asp:Label>
                             
                                </ItemTemplate>
                          <FooterTemplate >
                                        <asp:Label ID="lbTotalupric" Font-Bold="true" runat="server" />
                                    </FooterTemplate>
                            </asp:TemplateField>
                    
                    
                 
                </Columns>
                </asp:GridView>










                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td>Total Amount LKR:</td>
                <td>
                    <asp:Label ID="lblTotAmountLKR" runat="server" Text=""></asp:Label>
                </td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td>SVAT Value LKR 15.00% </td>
                <td>
                    <asp:Label ID="lblSvatValueLKR" runat="server" Text=""></asp:Label>
                </td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td>Excahnge Rate:</td>
                <td>
                    <asp:Label ID="lblExchangeRate" runat="server" Text=""></asp:Label>
                </td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td style="text-align: center">
                    <asp:Label ID="Label17" runat="server" Text="..............................................."></asp:Label>
                </td>
                <td style="text-align: center">
                    &nbsp;</td>
                <td style="text-align: center">
                    <asp:Label ID="Label18" runat="server" Text="..............................................."></asp:Label>
                </td>
                <td style="text-align: center">
                    &nbsp;</td>
                <td>
                    <asp:Label ID="Label19" runat="server" Text="..............................................."></asp:Label>
                </td>
                <td style="text-align: center">
                    &nbsp;</td>
                <td style="text-align: center">
                    <asp:Label ID="Label20" runat="server" Text="..............................................."></asp:Label>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td style="text-align: center">Prepared by</td>
                <td style="text-align: center">&nbsp;</td>
                <td style="text-align: center">Checked By</td>
                <td style="text-align: center">&nbsp;</td>
                <td style="text-align: center">Checked By</td>
                <td style="text-align: center"> &nbsp;</td>
                <td style="text-align: center">
                    Approved By</td>
                <td>&nbsp;</td>
            </tr>
        </table>             
           
                     
       
      
       

       


        </div>
           
    
 
             
    </form>
</body>
</html>
