<%@ page language="C#" autoeventwireup="true" inherits="EMBDispatchNote, App_Web_b2ychy0x" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>EMB Dispatch Note</title>
        <style type="text/css">
        .auto-style1 {
            width: 100%;
        }

        .auto-style7 {
            width: 38px;
        }

        .auto-style8 {
            width: 100%;
            height: 31px;
        }

             .Watermark
{
    position:   absolute;
    left:       331px;
    top:        205px;
    z-index:    99;
}

            .auto-style10 {
                height: 23px;
                text-align: center;
            }
            .auto-style11 {
                height: 23px;
                text-align: center;
            }

            .auto-style12 {
                height: 23px;
                text-align: center;
                width: 118px;
            }

            html {
    height: 0;
}

            .auto-style14 {
                width: 158px;
            }
            .auto-style15 {
                width: 145px;
            }

    </style>
    <script language="javascript" type="text/javascript">



        function printpage() {
            window.print();
        }
    </script>

    
</head>
<body onload="printpage()">
    <form id="form1" runat="server">
 <div>
            <asp:Panel ID="PanelMain" runat="server" Font-Names="Tahoma" Font-Size="Small">
                <table class="auto-style1">
                    <tr>
                        <td>&nbsp;</td>
                        <td class="auto-style15">&nbsp;</td>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td colspan="7" style="text-align: center">
                            <asp:Label ID="Label1" runat="server" Text="Sumithra Garments (Pte) Ltd.," Style="font-weight: 700"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="7" style="text-align: center">
                            <asp:Label ID="Label2" runat="server" Text="Lot 12, Export Processing Zone,	Polgahawela."></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="7" style="text-align: center">

                            <asp:Label ID="Label3" runat="server" Style="font-weight: 700; font-size: x-large" Text="Embroidery Despatch Note"></asp:Label>

                        </td>
                    </tr>
                    <tr>
                        <td colspan="7" style="text-align: center">
                            <hr />
                        </td>
                    </tr>
                    <tr>
                        <td>&nbsp;</td>
                        <td class="auto-style15">
                            <asp:Label ID="Label4" runat="server" Text="DES. NUMBER:"></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="lblWDNNo" runat="server" Font-Bold="True"></asp:Label>
                            <asp:Label ID="lblWDNHID" runat="server" Visible="False" Font-Bold="True"></asp:Label>
                        </td>
                        <td>&nbsp;</td>
                        <td>
                            <asp:Label ID="Label16" runat="server" Text="DES BY:"></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="LabeDespachBy" runat="server" Font-Bold="True"></asp:Label>
                        </td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td>&nbsp;</td>
                        <td class="auto-style15">
                            <asp:Label ID="Label8" runat="server" Text="DES. DATE:"></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="LabelDesdate" runat="server" Font-Bold="True"></asp:Label>
                        </td>
                        <td>&nbsp;</td>
                        <td>
                            <asp:Label ID="Label14" runat="server" Text="Location :"></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="Labdelcompany" runat="server" Font-Bold="True"></asp:Label>
                        </td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td>&nbsp;</td>
                        <td class="auto-style15">
                            <asp:Label ID="Label6" runat="server" Text="ATTENTION :"></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="LabelAttention" runat="server" Font-Bold="True"></asp:Label>
                        </td>
                        <td>&nbsp;</td>
                        <td>
                            &nbsp;</td>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td>&nbsp;</td>
                        <td class="auto-style15">
                            <asp:Label ID="Label5" runat="server" Text="Despatched To:"></asp:Label>
                        </td>
                        <td colspan="4">
                            <asp:Label ID="lblDespatchedTo" runat="server" Font-Bold="True"></asp:Label>
                        </td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td>&nbsp;</td>
                        <td class="auto-style15">
                            <asp:Label ID="Label17" runat="server" Text="DES COMMENT:"></asp:Label>
                        </td>
                        <td colspan="3">
                            <asp:Label ID="LabeComment" runat="server" Font-Bold="True"></asp:Label>
                        </td>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td>&nbsp;</td>
                        <td class="auto-style15">
                            &nbsp;</td>
                        <td colspan="3">
                            &nbsp;</td>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td>&nbsp;</td>
                        <td class="auto-style15">&nbsp;</td>
                        <td>
                            <img alt="Preview Copy" runat="server" id="ImgWatermark" class="Watermark" mce_src="images/Duplicate.png" src="images/Duplicate.png" style="opacity:0.2;filter:alpha(opacity=20); height: 238px; width: 309px;"></img></td>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td>&nbsp;</td>
                        <td colspan="5" rowspan="2">
                            <table class="auto-style8" align="center">
                                <tr>
                                    <td class="auto-style7">&nbsp;</td>
                                    <td style="text-align: center">
                                        &nbsp;</td>
                                    <td colspan="5" style="text-align: center">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                        <asp:GridView ID="GVDispatchInfo" runat="server" AutoGenerateColumns="false" Font-Names="Tahoma" Font-Size="Medium" Width="746px">
                                            <Columns>
                                                <asp:TemplateField HeaderText="No" ItemStyle-Width="25px">
                                                    <ItemTemplate>
                                                        <%# Container.DataItemIndex + 1 %>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                               
                                               <asp:TemplateField HeaderText="Style No" ItemStyle-Height="30px" Visible="true">
                                                    <ItemTemplate>
                                                        <asp:Label ID="StyleNo" runat="server" Text='<%#Eval("StyleNo") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                 <asp:TemplateField HeaderText="Submission No" ItemStyle-Height="30px" Visible="true">
                                                    <ItemTemplate>
                                                        <asp:Label ID="Submissions" runat="server" Text='<%#Eval("Submissions") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Qty">
                                                    <ItemTemplate>
                                                        <asp:Label ID="DespatchedQty" runat="server" style="text-align:right" Text='<%# Eval("DespatchQty") %>' Width="150px" />
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Reason" Visible="true">
                                                    <ItemTemplate>
                                                        <asp:Label ID="Reason" runat="server" Text='<%# Eval("Reason") %>' />
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                  <asp:TemplateField HeaderText="Remarks" Visible="true">
                                                    <ItemTemplate>
                                                        <asp:Label ID="Remarks" runat="server" Text='<%# Eval("Remarks") %>' />
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                            </Columns>
                                        </asp:GridView>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="auto-style7">&nbsp;</td>
                                    <td>&nbsp;</td>
                                    <td colspan="4">&nbsp;</td>
                                    <td>&nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="auto-style7">&nbsp;</td>
                                    <td>&nbsp;</td>
                                    <td colspan="4">&nbsp;</td>
                                    <td>&nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="auto-style7">&nbsp;</td>
                                    <td>&nbsp;</td>
                                    <td colspan="4">&nbsp;</td>
                                    <td>&nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="auto-style7">&nbsp;</td>
                                    <td>&nbsp;</td>
                                    <td colspan="4">&nbsp;</td>
                                    <td>&nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="auto-style10" colspan="3">
                                        <asp:Label ID="Label18" runat="server" Text="AUTHORIZED BY :"></asp:Label>
                                    </td>
                                    <td class="auto-style10">&nbsp;</td>
                                    <td >
                                        <asp:Label ID="Label19" runat="server" Text=".................................."></asp:Label>
                                        
                                    </td>
                                     <td class="auto-style11">
                                         <asp:Label ID="Label20" runat="server" Text="TRANSPORTED BY :"></asp:Label>
                                         </td>
                                    <td class="auto-style11">
                                        <asp:Label ID="Label21" runat="server" Text=".................................."></asp:Label>
                                    </td>
                                    <td class="auto-style11">&nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="auto-style10">&nbsp;</td>
                                    <td class="auto-style12">&nbsp;</td>
                                    <td class="auto-style12">&nbsp;</td>
                                    <td class="auto-style12">&nbsp;</td>
                                    <td class="auto-style11">&nbsp;</td>
                                    <td class="auto-style11">&nbsp;</td>
                                    <td class="auto-style11">&nbsp;</td>
                                    <td class="auto-style11">&nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="auto-style10" colspan="8">
                                        <asp:Label ID="Label22" runat="server" Text="*** End Of Report ***"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="auto-style7">&nbsp;</td>
                                    <td>&nbsp;</td>
                                    <td colspan="4">&nbsp;
                                        <img></img><img></img>
                                        <asp:Label ID="lblPrintStatus" runat="server" Text="" Visible="false"></asp:Label>
                                        <asp:Label ID="LblPlantID" runat="server" Text="" Visible="false"></asp:Label>
                                        <asp:Label ID="lblPlantName" runat="server" Text="" Visible="false"></asp:Label>
                                    </td>
                                    <td>&nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="auto-style7">&nbsp;</td>
                                    <td>&nbsp;</td>
                                    <td colspan="4">&nbsp;</td>
                                    <td>&nbsp;</td>
                                </tr>
                            </table>
                        </td>
                        <td>&nbsp;</td>
                    </tr>
                </table>
            </asp:Panel>
        </div>
    </form>
</body>
</html>
