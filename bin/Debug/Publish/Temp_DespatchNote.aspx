<%@ page language="C#" autoeventwireup="true" inherits="Temp_DespatchNote, App_Web_10bhy3il" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Dispatch Note</title>
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
    left:       0px;
    top:        0px;
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

            .auto-style13 {
                width: 124px;
            }

            .auto-style14 {
                height: 20px;
            }
            .auto-style15 {
                width: 124px;
                height: 20px;
            }

    </style>
    <script language="javascript" type="text/javascript">



        function printpage() {
            window.print();
        }
    </script>

    <script type="text/javascript" >
        function preventBack() { window.history.forward(); }
        setTimeout("preventBack()", 0);
        window.onunload = function () { null };
</script>
</head>
<body onload="printpage()">
    <form id="form1" runat="server">
 <div>
            <asp:Panel ID="PanelMain" runat="server" Font-Names="Tahoma" Font-Size="Small">
                <table class="auto-style1">
                    <tr>
                        <td>&nbsp;</td>
                        <td class="auto-style13">&nbsp;</td>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td colspan="7" style="text-align: center">
                            <asp:Label ID="LabelHeaderAddress1"  runat="server" Text="Sumithra Garments (Pte) Ltd.," Style="font-weight: 700"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="7" style="text-align: center">
                            <asp:Label ID="LabelHeaderAddress2" runat="server" Text="No. 33, Thelangapatha Road, Wattala."></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="7" style="text-align: center">

                            <asp:Label ID="Label3" runat="server" Style="font-weight: 700; font-size: x-large" Text="Shipment Release Note"></asp:Label>

                        </td>
                    </tr>
                    <tr>
                        <td colspan="7" style="text-align: center">
                            <hr />
                        </td>
                    </tr>
                    <tr>
                        <td>&nbsp;</td>
                        <td class="auto-style13">
                            <asp:Label ID="Label4" runat="server" Text="SHIPMENT NO :"></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="LabShipmentNo" runat="server" Font-Bold="True"></asp:Label>
                            <asp:Label ID="lblWDNHID" runat="server" Visible="False" Font-Bold="True"></asp:Label>
                        </td>
                        <td>&nbsp;</td>
                        <td>
                            <asp:Label ID="Label16" runat="server" Text="PLANT:"></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="Labplant" runat="server" Font-Bold="True"></asp:Label>
                        </td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td>&nbsp;</td>
                        <td class="auto-style13">
                            <asp:Label ID="Label8" runat="server" Text="DES. DATE:"></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="Labshipeddate" runat="server" Font-Bold="True"></asp:Label>
                        </td>
                        <td>&nbsp;</td>
                        <td>
                            <asp:Label ID="Label14" runat="server" Text="DELIVERY COMPANY:"></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="Labdelipoint" runat="server" Font-Bold="True"></asp:Label>
                        </td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td>&nbsp;</td>
                        <td class="auto-style13">
                            <asp:Label ID="Label6" runat="server" Text="ATTENTION :"></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="LabAttendance" runat="server" Font-Bold="True"></asp:Label>
                        </td>
                        <td>&nbsp;</td>
                        <td>
                            <asp:Label ID="Label7" runat="server" Text="VEHICLE NO:"></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="Labvehicleno" runat="server" Font-Bold="True"></asp:Label>
                        </td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td class="auto-style14"></td>
                        <td class="auto-style15">
                            </td>
                        <td class="auto-style14">
                            <asp:Label ID="lblAddress0" runat="server" Font-Bold="True"></asp:Label>
                        </td>
                        <td class="auto-style14"></td>
                        <td class="auto-style14">
                            <asp:Label ID="Label24" runat="server" Text="VEHICLE TYPE:"></asp:Label>
                        </td>
                        <td class="auto-style14">
                            <asp:Label ID="Labvehitype" runat="server" Font-Bold="True"></asp:Label>
                        </td>
                        <td class="auto-style14"></td>
                    </tr>
                    <tr>
                        <td>&nbsp;</td>
                        <td class="auto-style13">
                            &nbsp;</td>
                        <td>
                            <asp:Label ID="lblAddress1" runat="server" Font-Bold="True"></asp:Label>
                        </td>
                        <td>&nbsp;</td>
                        <td>
                            <asp:Label ID="Label5" runat="server" Text="DISPATCHED BY:"></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="Labdespachby" runat="server" Font-Bold="True"></asp:Label>
                        </td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td>&nbsp;</td>
                        <td class="auto-style13">&nbsp;</td>
                        <td>
                            <asp:Label ID="lblAddress2" runat="server" Font-Bold="True"></asp:Label>
                        </td>
                        <td>&nbsp;</td>
                        <td>
                            <asp:Label ID="Label25" runat="server" Text="NO OF CTN:"></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="lblCTN" runat="server" Font-Bold="True"></asp:Label>
                        </td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td>&nbsp;</td>
                        <td class="auto-style13">
                            <asp:Label ID="Label17" runat="server" Text="DES COMMENT:"></asp:Label>
                        </td>
                        <td colspan="3">
                            <asp:Label ID="Labcomment" runat="server" Font-Bold="True"></asp:Label>
                        </td>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td>&nbsp;</td>
                        <td class="auto-style13">
                            &nbsp;</td>
                        <td colspan="3">
                            &nbsp;</td>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td>&nbsp;</td>
                        <td class="auto-style13">&nbsp;</td>
                        <td>
                           <%-- <img alt="Preview Copy" runat="server" id="ImgWatermark" class="Watermark" mce_src="images/Duplicate.png" src="images/Duplicate.png" style="opacity:0.2;filter:alpha(opacity=20); height: 238px; width: 309px;"></img>--%></td>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td>&nbsp;</td>
                        <td colspan="5" rowspan="2">
                            <table class="auto-style8">
                                <tr>
                                    <td class="auto-style7">&nbsp;</td>
                                    <td colspan="3">
                                        <asp:GridView ID="GVDispatchInfo" runat="server" AutoGenerateColumns="false" Font-Names="Tahoma" Font-Size="Medium" Width="746px">
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
                                </tr>
                                <tr>
                                    <td class="auto-style7">&nbsp;</td>
                                    <td colspan="3">&nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="auto-style7">&nbsp;</td>
                                    <td colspan="3">&nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="auto-style7">&nbsp;</td>
                                    <td colspan="3">&nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="auto-style7">&nbsp;</td>
                                    <td colspan="3">&nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="auto-style7">&nbsp;</td>
                                    <td colspan="3">&nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="auto-style10" colspan="2">
                                        <asp:Label ID="Label18" runat="server" Text="AUTHORIZED BY :"></asp:Label>
                                    </td>
                                    <td >
                                        <asp:Label ID="Label19" runat="server" Text=".................................."></asp:Label>
                                        
                                    </td>
                                     <td class="auto-style11">
                                         <asp:Label ID="Label20" runat="server" Text="TRANSPORTED BY :"></asp:Label>
                                         </td>
                                    <td class="auto-style11">
                                        <asp:Label ID="Label21" runat="server" Text=".................................."></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="auto-style10">&nbsp;</td>
                                    <td class="auto-style12">&nbsp;</td>
                                    <td class="auto-style11">&nbsp;</td>
                                    <td class="auto-style11">&nbsp;</td>
                                    <td class="auto-style11">&nbsp;</td>
                                </tr>
                                <tr>
                                    <td  colspan="5" style="text-align: center" >
                                        <asp:Label ID="Label22" runat="server" Text="*** End Of Report ***"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="auto-style7">&nbsp;</td>
                                    <td colspan="3">&nbsp;
                                        <img></img><img></img>
                                        <asp:Label ID="lblPrintStatus" runat="server" Text="" Visible="false"></asp:Label>
                                         <asp:Label ID="LblPlantID" runat="server" Text="" Visible="false"></asp:Label>
                                          <asp:Label ID="lblPlantName" runat="server" Text="" Visible="false"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="auto-style7">&nbsp;</td>
                                    <td colspan="3">&nbsp;</td>
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
