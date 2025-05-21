<%@ page language="C#" autoeventwireup="true" inherits="PrintDespach, App_Web_10bhy3il" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
         <link href="CSS/bootstrap.css" rel="stylesheet" />
        <style type="text/css">
        .auto-style1 {
            width: 100%;
        }

             .Watermark
{
    position:   absolute;
    left:       331px;
    top:        205px;
    z-index:    99;
}

            html {
    height: 0;
}

            .auto-style16 {
                height: 20px;
            }

            Panel {
  font-size-adjust: 0.58;
}

            .auto-style18 {
                width: 197px;
            }
            .auto-style20 {
                width: 203px;
            }
            .auto-style21 {
                width: 206px;
            }
            .auto-style22 {
                width: 17px;
            }

            .auto-style23 {
                width: 165px;
            }
            .auto-style24 {
                width: 15px;
            }

    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
       
            <asp:Panel ID="PanelMain" runat="server">
              
        <table class="auto-style1">
             <tr>
                        <td colspan="2" style="text-align: center" class="auto-style16">
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                           &nbsp;&nbsp; <asp:Label ID="Label5" runat="server" Text="Sumithra Garments (Pte) Ltd.," Style="font-weight: 700"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" style="text-align: center">
                           &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                             <asp:Label ID="Label6" runat="server" Text="No. 33, Thelangapatha Road, Wattala."></asp:Label>
                        </td>
                    </tr>
                  
            <tr>
                <td class="auto-style50">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;<strong><asp:Label ID="Label25" Style="font-weight: 700; font-size: 37px; " runat="server"  Text="Shipment Release Note "></asp:Label>
                    </strong></td>
                <td>&nbsp;</td>
            </tr>

         
           
            <tr>
                <td class="auto-style50">
                    <table class="auto-style1" style="width:130%">
                        <tr>
                            <td class="auto-style24">&nbsp;</td>
                            <td class="auto-style18">&nbsp;</td>
                            <td class="auto-style18">&nbsp;</td>
                            <td class="auto-style181">&nbsp;</td>
                            <td class="auto-style23">&nbsp;</td>
                            <td class="auto-style21">&nbsp;</td>
                            <td class="auto-style22">&nbsp;</td>
                            <td class="auto-style20">&nbsp;</td>
                            <td class="auto-style67">&nbsp;</td>
                            <td class="auto-style68">&nbsp;</td>
                            <td class="auto-style98">&nbsp;</td>
                            <td class="auto-style99">&nbsp;</td>
                            <td class="auto-style100">&nbsp;</td>
                            <td class="auto-style84">&nbsp;</td>
                            <td class="auto-style93">&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                         <tr>
                        <td colspan="12" style="text-align: center">
                            <hr />
                        </td>
                    </tr>
                        <tr>
                            <td class="auto-style24">
                                &nbsp;</td>
                            <td class="auto-style18"><strong>
                                <asp:Label ID="Label1" runat="server" Style="font-weight: 600; font-size: 24px;" Text="Shipment No :"></asp:Label>
                                </strong>&nbsp;&nbsp;&nbsp;</td>
                            <td class="auto-style18">
                                <asp:Label ID="LabShipmentNo" Style="font-size: 24px;" runat="server"></asp:Label>
                            </td>
                            <td class="auto-style181">&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp; </td>
                            <td class="auto-style23">
                                <strong>
                                <asp:Label ID="Label21" runat="server" Style="font-weight:700; font-size: 24px;"  Text="Plant :"></asp:Label>
                                </strong>
                            </td>
                            <td class="auto-style21">
                                <asp:Label ID="Labplant" runat="server" Style="font-size: 24px;"></asp:Label>
                            </td>
                            <td class="auto-style22">&nbsp;</td>
                            <td class="auto-style20">
                                <strong>
                                <asp:Label ID="lblAttention" runat="server" Style="font-weight: 600; font-size: 24px;"  Text=" Attention :"></asp:Label>
                                </strong></td>
                            <td class="auto-style67">
                                <asp:Label ID="LabAttendance" runat="server" Style="font-size: 24px;"></asp:Label>
                            </td>
                            <td class="auto-style68">&nbsp;</td>
                            <td class="auto-style98">
                                &nbsp;</td>
                            <td class="auto-style99">
                                &nbsp;</td>
                            <td class="auto-style100">&nbsp;</td>
                            <td class="auto-style84">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            </td>
                            <td colspan="3">&nbsp;&nbsp;</td>
                        </tr>
                        <tr>
                            <td class="auto-style24"></td>
                            <td class="auto-style18"></td>
                            <td class="auto-style18"></td>
                            <td class="auto-style173"></td>
                            <td class="auto-style23"></td>
                            <td class="auto-style21"></td>
                            <td class="auto-style22"></td>
                            <td class="auto-style20"></td>
                            <td class="auto-style135"></td>
                            <td class="auto-style132"></td>
                            <td class="auto-style136"></td>
                            <td class="auto-style137"></td>
                            <td class="auto-style138"></td>
                            <td class="auto-style139"></td>
                            <td class="auto-style140"></td>
                            <td class="auto-style141"></td>
                            <td class="auto-style141"></td>
                        </tr>
                        <tr>
                            <td class="auto-style24">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                            <td class="auto-style18"><strong>
                                <asp:Label ID="Label2" runat="server" Style="font-weight: 700; font-size: 24px;" Text="Delivery Point :"></asp:Label>
                                </strong></td>
                            <td class="auto-style18">
                                <asp:Label ID="Labdelipoint" Style="font-size: 24px;" runat="server"></asp:Label>
                            </td>
                            <td class="auto-style181">&nbsp;</td>
                            <td class="auto-style23"><strong>
                                <asp:Label ID="Label3" runat="server" Style="font-weight: 700; font-size: 24px;" Text="Des. By :"></asp:Label>
                                </strong></td>
                            <td class="auto-style21">
                                <asp:Label ID="Labdespachby" Style="font-size: 24px;" runat="server"></asp:Label>
                            </td>
                            <td class="auto-style22">&nbsp;</td>
                            <td class="auto-style20"><strong>
                                <asp:Label ID="lblVehicleNo" runat="server" Style="font-weight: 700; font-size: 24px;" Text="Vehicle No"></asp:Label>
                                </strong></td>
                            <td class="auto-style67">
                                <asp:Label ID="Labvehicleno" Style="font-size: 24px;" runat="server"></asp:Label>
                            </td>
                            <td class="auto-style68">&nbsp;</td>
                            <td class="auto-style98">&nbsp;</td>
                            <td class="auto-style99">&nbsp;</td>
                            <td class="auto-style100">&nbsp;</td>
                            <td class="auto-style84">&nbsp;</td>
                            <td class="auto-style93">&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td class="auto-style24"></td>
                            <td class="auto-style18"></td>
                            <td class="auto-style18"></td>
                            <td class="auto-style174"></td>
                            <td class="auto-style23"></td>
                            <td class="auto-style21"></td>
                            <td class="auto-style22"></td>
                            <td class="auto-style20"></td>
                            <td class="auto-style120"></td>
                            <td class="auto-style117"></td>
                            <td class="auto-style121"></td>
                            <td class="auto-style122"></td>
                            <td class="auto-style123"></td>
                            <td class="auto-style124"></td>
                            <td class="auto-style125"></td>
                            <td class="auto-style126"></td>
                            <td class="auto-style126"></td>
                        </tr>
                        <tr>
                            <td class="auto-style24"> &nbsp;</td>
                            <td class="auto-style18"><strong>
                                <asp:Label ID="Label22" runat="server" Style="font-weight: 700; font-size: 24px;" Text="Vehicle Type :"></asp:Label>
                                </strong>
                                <br />
                            </td>
                            <td class="auto-style18">
                                <asp:Label ID="Labvehitype" Style="font-size: 24px;" runat="server"></asp:Label>
                            </td>
                            <td class="auto-style181">&nbsp;</td>
                            <td class="auto-style23">
                                <strong>
                                <asp:Label ID="Label23" runat="server" Style="font-weight: 700; font-size: 24px;" Text="Ship Date :"></asp:Label>
                                </strong>
                            </td>
                            <td class="auto-style21">
                                <asp:Label ID="Labshipeddate" Style="font-size: 24px;" runat="server"></asp:Label>
                            </td>
                            <td class="auto-style22">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;</td>
                            <td class="auto-style20"> <strong>
                                <asp:Label ID="Label4" runat="server" Style="font-weight: 700; font-size: 24px;" Text="Transported by:"></asp:Label>
                                </strong></td>
                            <td class="auto-style67">
                                <asp:Label ID="Labetrance" Style="font-size: 24px;" runat="server"></asp:Label>
                            </td>
                            <td class="auto-style68">&nbsp;</td>
                            <td class="auto-style98">
                                &nbsp;</td>
                            <td class="auto-style99">
                                &nbsp;</td>
                            <td class="auto-style100">&nbsp;</td>
                            <td class="auto-style84">
                                &nbsp;&nbsp;&nbsp;&nbsp;
                            </td>
                            <td colspan="3">
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td class="auto-style24"></td>
                            <td class="auto-style18"></td>
                            <td class="auto-style18"></td>
                            <td class="auto-style175"></td>
                            <td class="auto-style23"></td>
                            <td class="auto-style21"></td>
                            <td class="auto-style22"></td>
                            <td class="auto-style20"></td>
                            <td class="auto-style150"></td>
                            <td class="auto-style147"></td>
                            <td class="auto-style151"></td>
                            <td class="auto-style152"></td>
                            <td class="auto-style153"></td>
                            <td class="auto-style154"></td>
                            <td class="auto-style155"></td>
                            <td class="auto-style156"></td>
                            <td class="auto-style156"></td>
                        </tr>
                        <tr>
                            <td class="auto-style24">&nbsp;</td>
                            <td class="auto-style18"><strong>
                                <asp:Label ID="Label24" runat="server" Style="font-weight: 700; font-size: 24px;" Text="Comment : "></asp:Label>
                                </strong></td>
                            <td class="auto-style18">
                                <asp:Label ID="Labcomment" Style="font-size: 24px;" runat="server"></asp:Label>
                            </td>
                            <td class="auto-style181">&nbsp;</td>
                            <td class="auto-style23">&nbsp;</td>
                            <td class="auto-style21">&nbsp;</td>
                            <td class="auto-style22">&nbsp;</td>
                            <td class="auto-style20">&nbsp;</td>
                            <td class="auto-style67">&nbsp;</td>
                            <td class="auto-style68">&nbsp;</td>
                            <td class="auto-style98">&nbsp;</td>
                            <td class="auto-style99">&nbsp;</td>
                            <td class="auto-style100">&nbsp;</td>
                            <td class="auto-style84">&nbsp;</td>
                            <td class="auto-style93">&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                    </table>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style50">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style50">
                    <br />
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style50">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style50">
                    <table class="nav-justified">
                        <tr>
                            <td class="auto-style168">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                            <td>
                                <asp:GridView ID="GridViewAdded" runat="server" AutoGenerateColumns="False"  CellPadding="4" CssClass="auto-style72" ForeColor="#333333" style="margin-left: 40px;font-size:27px" Width="1118px" >
                                    <AlternatingRowStyle BackColor="White" />
                                    <rowstyle cssclass="RowStyle" />
                                    <Columns>
                                        <asp:BoundField DataField="StyleNo" ItemStyle-Width="4000px" HeaderText="Style No" />
                                        <asp:BoundField DataField="BuyerPONo" ItemStyle-Height="63px" HeaderText="Buyer PO No" />
                                        <asp:BoundField DataField="Colour" ItemStyle-Width="2500px" HeaderText="Colour" />
                                        <asp:BoundField DataField="DeliveryQty" ItemStyle-HorizontalAlign="Right" HeaderText="Delivery Qty" />
                                        <asp:BoundField DataField="DespatchedQty" ItemStyle-HorizontalAlign="Right" HeaderText="Despatched Qty" />
                                        <asp:BoundField DataField="Remarks" ItemStyle-Width="1500px" HeaderText="Comment" />
                                    </Columns>
                                </asp:GridView>
                            </td>
                            <td>&nbsp;</td>
                        </tr>
                    </table>
                    
                </td>
                <td>&nbsp;</td>
            </tr>
          


           

        </table>
    
    </div>
      </asp:Panel>
    </form>
</body>
</html>
