<%@ page language="C#" autoeventwireup="true" inherits="ShipmentTemporyDespatch, App_Web_a2krn21a" %>
<%@ Register assembly="BasicFrame.WebControls.BasicDatePicker" namespace="BasicFrame.WebControls" tagprefix="BDP" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
     <link href="CSS/bootstrap.css" rel="stylesheet" />
    <%-- <link id="Link1" rel="stylesheet" href="~/CSS/bootstrap.min.css" runat="server" />--%>
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        .auto-style3 {
            width: 99%;
        }
        .auto-style4 {
            width: 1129px;
        }
        .auto-style5 {
            width: 134px;
        }
        .auto-style13 {
            width: 134px;
            height: 22px;
        }
        .auto-style16 {
            height: 22px;
        }
        .auto-style17 {
            margin-left: 5px;
        }
        .auto-style18 {
            width: 88px;
        }
        .auto-style96 {
            width: 116px;
        }
        .auto-style101 {
            width: 84px;
            height: 22px;
        }
        .auto-style102 {
            width: 84px;
        }
        .auto-style108 {
            width: 1178px;
        }
        .auto-style110 {
            width: 45px;
        }
        .auto-style111 {
            width: 118px;
        }
        .auto-style112 {
            width: 102px;
        }
        .auto-style118 {
            width: 49px;
        }
        .auto-style121 {
            width: 63px;
        }
        .auto-style123 {
            width: 48px;
        }
        .auto-style126 {
            width: 198px;
        }
        .auto-style127 {
            width: 227px;
        }
        .auto-style128 {
            width: 51px;
        }
        .auto-style129 {
            color: #FF3300;
        }
        .auto-style133 {
            width: 113px;
        }
        .auto-style134 {
            width: 90px;
        }
        .auto-style136 {
            width: 196px;
            height: 22px;
        }
        .auto-style137 {
            width: 196px;
        }
        .auto-style139 {
            width: 190px;
        }
        .auto-style140 {
            width: 125px;
        }
        .auto-style141 {
            width: 25px;
        }
        .auto-style161 {
            width: 101px;
        }
        .auto-style162 {
            width: 1129px;
            height: 40px;
        }
        .auto-style163 {
            height: 40px;
        }
        .auto-style164 {
            width: 84px;
            height: 44px;
        }
        .auto-style165 {
            width: 134px;
            height: 44px;
        }
        .auto-style166 {
            width: 196px;
            height: 44px;
        }
        .auto-style167 {
            height: 44px;
        }
        .auto-style168 {
            width: 125px;
            height: 44px;
        }
        .auto-style169 {
            width: 90px;
            height: 44px;
        }
        .auto-style170 {
            width: 116px;
            height: 44px;
        }
        .auto-style171 {
            font-size: 16px;
        }
        </style>
</head>
<body>
     <form id="form1" runat="server">
    <table class="auto-style1">
        <tr>
            <td>
                <table class="auto-style1">
                    <tr>
                        <td class="auto-style4">&nbsp;</td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td class="auto-style162">&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;<strong><asp:Label ID="Label20" runat="server" Text=" Shipment Release Note" CssClass="auto-style171"></asp:Label>
                            <asp:Label ID="LabMobNumber" runat="server" Visible="False"></asp:Label>
                            <asp:Label ID="LabFactoryError" runat="server" Visible="False"></asp:Label>
                            <asp:Label ID="LabFruntEnd" runat="server" Visible="False"></asp:Label>
                            <asp:Label ID="LabServisePro" runat="server" Visible="False"></asp:Label>
                            <asp:Label ID="delinolab" runat="server" Visible="False"></asp:Label>
                            <asp:Label ID="LabPlantName" runat="server" Visible="False"></asp:Label>
                            </strong>
                            <asp:Label ID="LabBuyercode" runat="server" Visible="False"></asp:Label>
                            <asp:Label ID="LabeCommit" runat="server" Visible="False"></asp:Label>
                            <asp:Label ID="LabPlantID" runat="server" Visible="False"></asp:Label>
                            <asp:Label ID="SHID" runat="server" Visible="False"></asp:Label>
                            <asp:Label ID="LabeMRSCONTACT" runat="server" Visible="False"></asp:Label>
                            <asp:Label ID="Labeshdate" runat="server" Visible="False"></asp:Label>
                            <asp:Label ID="LabelPartiol" runat="server" Visible="False"></asp:Label>
                        </td>
                        <td class="auto-style163">
                            <asp:DropDownList ID="DropCommand" Visible="false"  CssClass="form-control" runat="server" Height="27px" Width="193px" AutoPostBack="True" OnSelectedIndexChanged="DropCommand_SelectedIndexChanged">
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style4">

                            <div class="col-md-2">
                        <br />
                        <asp:ImageButton ID="btnHome" runat="server" ImageUrl="~/images/Tohome.png" Height="35px"
                            Width="35px" PostBackUrl="DataEntry.aspx" Visible="False" />
                       
                    </div>


                        </td>
                        <td>
                            &nbsp;</td>
                    </tr>
                </table>
    
    
   
            </td>
        </tr>
        <tr>
            <td>
   
    

            <asp:Panel ID="DetailPanele" runat="server" BorderColor="#FF6600" BorderStyle="Solid">
                
                <table class="auto-style3">
                    <tr>
                        <td class="auto-style102">&nbsp;</td>
                        <td class="auto-style5">
                            <asp:Label ID="ShipmentID" runat="server" Visible="False"></asp:Label>
                        </td>
                        <td class="auto-style137">
                            &nbsp;</td>
                        <td class="auto-style18">&nbsp;</td>
                        <td class="auto-style139">
                            <asp:TextBox ID="TextShipno" runat="server" Height="23px" Visible="False" Width="131px"></asp:TextBox>
                        </td>
                        <td class="auto-style140">&nbsp;</td>
                        <td class="auto-style134">
                            &nbsp;</td>
                        <td class="auto-style141">&nbsp;</td>
                        <td class="auto-style133">&nbsp;</td>
                        <td class="auto-style96">&nbsp;</td>
                    </tr>
                    <tr>
                        <td class="auto-style102">&nbsp;</td>
                        <td class="auto-style5">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <asp:Label ID="Label1" runat="server" Text="Shipment No :"></asp:Label>
                        </td>
                        <td class="auto-style137">
                            <strong>
                            <asp:Label ID="Labshipno" runat="server">Auto</asp:Label>
                            </strong>
                        </td>
                        <td class="auto-style18">&nbsp;&nbsp;&nbsp;
                            <asp:Label ID="lblAttention" runat="server" Text=" Attention :"></asp:Label>
                        </td>
                        <td class="auto-style139">
                            <asp:TextBox ID="txtAttention" runat="server" CssClass="auto-style17" Height="23px" Text="" Width="154px"></asp:TextBox>
                        </td>
                        <td class="auto-style140">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <asp:Label ID="Label21" runat="server" Text="Plant :"></asp:Label>
                        </td>
                        <td class="auto-style134">
                            <asp:DropDownList ID="DropPlantheader" runat="server" Height="24px" Width="98px" OnSelectedIndexChanged="DropPlantheader_SelectedIndexChanged">
                            </asp:DropDownList>
                        </td>
                        <td colspan="2">
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <asp:Label ID="Label2" runat="server" Text="Delivery Point :"></asp:Label>
                        </td>
                        <td class="auto-style96">
                            <asp:TextBox ID="txtDelipoint" runat="server" Height="23px" Text="" Width="154px"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style102">&nbsp;</td>
                        <td class="auto-style5">&nbsp;</td>
                        <td class="auto-style137">
                        </td>
                        <td class="auto-style18">&nbsp;</td>
                        <td class="auto-style139">&nbsp;</td>
                        <td class="auto-style140">
                            &nbsp;</td>
                        <td class="auto-style134">&nbsp;</td>
                        <td class="auto-style141">&nbsp;</td>
                        <td class="auto-style133">&nbsp;</td>
                        <td class="auto-style96">&nbsp;</td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td class="auto-style164"></td>
                        <td class="auto-style165">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="Label3" runat="server" Text="Despached By :"></asp:Label>
                        </td>
                        <td class="auto-style166">
                            <asp:TextBox ID="TextDespachby" runat="server" Height="23px" Width="132px"></asp:TextBox>
                        </td>
                        <td colspan="2" class="auto-style167">&nbsp;&nbsp;<asp:Label ID="lblVehicleNo" runat="server" Text="Vehicle No"></asp:Label>
                            &nbsp;:&nbsp;
                            <asp:TextBox ID="txtVehicleNo" ToolTip="This filed is required" runat="server" Height="23px" Width="156px"></asp:TextBox>
                        </td>
                        <td class="auto-style168">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Vehicle Type :</td>
                        <td class="auto-style169">
                            <asp:DropDownList ID="DropDownType" runat="server"  Height="19px" Width="116px">
                                <asp:ListItem Text="Select Type" Value="0"></asp:ListItem>
                                <asp:ListItem Text="Lorry" Value="L"></asp:ListItem>
                                <asp:ListItem Text="Container" Value="C"></asp:ListItem>
                            </asp:DropDownList>
                        </td>
                        <td colspan="2" class="auto-style167">&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:Label ID="Label22" runat="server" Text="Ship Date :"></asp:Label>
                        </td>
                        <td class="auto-style170"><BDP:BasicDatePicker ID="DatePickerPO" runat="server" Visible="false" />
                            <asp:Label ID="LabelShipdate" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style102">&nbsp;</td>
                        <td class="auto-style5">&nbsp;</td>
                        <td class="auto-style137">
                            &nbsp;</td>
                        <td class="auto-style18">&nbsp;</td>
                        <td class="auto-style139">&nbsp;</td>
                        <td class="auto-style140">&nbsp;</td>
                        <td class="auto-style134">&nbsp;</td>
                        <td class="auto-style141">&nbsp;</td>
                        <td class="auto-style133">&nbsp;</td>
                        <td class="auto-style96">
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td class="auto-style101">&nbsp;</td>
                        <td class="auto-style13">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <asp:Label ID="Label4" runat="server" Text="Transported by:"></asp:Label>
                        </td>
                        <td class="auto-style136">
                            <asp:TextBox ID="TextDTranseported" runat="server" Height="23px" Width="132px"></asp:TextBox>
                        </td>
                        <td class="auto-style16" colspan="7">&nbsp;&nbsp;<asp:Label ID="Label5" runat="server" Text="Shipment Comment :"></asp:Label>
                            &nbsp;<asp:TextBox ID="txtShipComments" runat="server" Height="37px" Width="387px" MaxLength="32"></asp:TextBox>
                            &nbsp;&nbsp;
                            <asp:Button ID="BunCreate" runat="server" CssClass="btn btn-primary" Text="Create" OnClick="BunCreate_Click" />
                            &nbsp;
                            <asp:Button ID="BtnEdit" runat="server" CssClass="btn btn-success" Text="Edit" Width="83px" OnClick="BtnEdit_Click" Visible="False" />
                            &nbsp;<asp:Button ID="Btnupdate" runat="server" CssClass="btn btn-info" Text="Update" Width="83px" OnClick="Btnupdate_Click" Visible="False" />
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style101">&nbsp;</td>
                        <td class="auto-style13">&nbsp;</td>
                        <td class="auto-style136">&nbsp;</td>
                        <td class="auto-style16" colspan="7">&nbsp;</td>
                    </tr>
                </table>



                </asp:Panel>
    
    
   
            </td>
        </tr>
        <tr>
            <td>
<asp:Panel ID="DetailPanele0" runat="server" BorderColor="#FF6600" BorderStyle="Solid">
    <table class="nav-justified">
        <tr>
            <td>&nbsp;</td>
            <td>
                <asp:Label ID="LabelPOQTY" runat="server" Visible="False"></asp:Label>
            </td>
            <td>
                <asp:Label ID="LabeDid" runat="server" Visible="False"></asp:Label>
            </td>
            <td>&nbsp;</td>
            <td>
                <asp:Label ID="LaPlantName" runat="server" Visible="False"></asp:Label>
            </td>
            <td>
                <asp:Label ID="PlantID" runat="server" Visible="False"></asp:Label>
            </td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>
                <asp:Label ID="Labeldelidate" runat="server" Visible="False"></asp:Label>
                <asp:Label ID="LabcommebtOS" runat="server" Visible="False"></asp:Label>
            </td>
            <td>
                <asp:Label ID="LabelSUMIQTY" runat="server" Visible="False"></asp:Label>
                <asp:Label ID="LabShipedqty" runat="server" Text="0" Visible="False"></asp:Label>
                <asp:Label ID="LabColourQty" runat="server" Text="0" Visible="False"></asp:Label>
                <asp:Label ID="LabDlqty" runat="server" Text="0" Visible="False"></asp:Label>
                <asp:Label ID="LabFc" runat="server" Text="0" Visible="False"></asp:Label>
            </td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td>
                <asp:Label ID="Label6" runat="server" Text="Style :"></asp:Label>
            </td>
            <td><strong>
                <asp:Label ID="LabStyle" runat="server"></asp:Label>
                </strong></td>
            <td>&nbsp;</td>
            <td>
                <asp:Label ID="Label8" runat="server" Text="Buyer Po :"></asp:Label>
            </td>
            <td><strong>
                <asp:Label ID="LabBPO" runat="server"></asp:Label>
                </strong></td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>
                <asp:Label ID="Label16" runat="server" Text="Over Short / Reason :"></asp:Label>
            </td>
            <td>
                <asp:CheckBox ID="Checkfactoryerror" runat="server" Text="Factory Errror" AutoPostBack="true" OnCheckedChanged="Checkfactoryerror_CheckedChanged" />
            </td>
            <td>
                <asp:TextBox ID="txtFactoryFailPercentage" runat="server" Width="50px" AutoPostBack="true" OnTextChanged="txtFactoryFailPercentage_TextChanged"></asp:TextBox>%
            </td>
            <td>
<%--                <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="txtFactoryFailPercentage" ErrorMessage="Numeric Only." ForeColor="Red" ValidationExpression="^[1-9]\d*(\.\d+)?$"></asp:RegularExpressionValidator>--%>
            </td>
            <td>
                <asp:Button ID="BunAddrec" runat="server" CssClass="btn btn-success" OnClick="BunAddrec_Click" Text="Add" />
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td>
                <asp:Label ID="Label12" runat="server" Text="Comitted Qty :"></asp:Label>
            </td>
            <td><strong>
                <asp:Label ID="Labdelqty" runat="server"></asp:Label>
                </strong></td>
            <td>&nbsp;</td>
            <td>
                <asp:Label ID="Label10" runat="server" Text="Colour :"></asp:Label>
            </td>
            <td><strong>
                <asp:Label ID="Labcolour" runat="server"></asp:Label>
                </strong></td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>
                <asp:CheckBox ID="Checkfruntend" AutoPostBack="true" runat="server" Text="Front End " OnCheckedChanged="Checkfruntend_CheckedChanged" />
            </td>
            <td>
                <asp:TextBox ID="txtFrontEndPercentage" AutoPostBack="true" runat="server" Width="50px" OnTextChanged="txtFrontEndPercentage_TextChanged"></asp:TextBox>
                %</td>
            <td>
<%--                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="txtFrontEndPercentage" ErrorMessage="Numeric Only." ForeColor="Red" ValidationExpression="^[1-9]\d*(\.\d+)?$"></asp:RegularExpressionValidator>--%>
            </td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td>
                <asp:Label ID="Label23" runat="server" Text="Shipped Qty :"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextShipedQty" AutoPostBack="true" runat="server" Width="107px" OnTextChanged="TextShipedQty_TextChanged"></asp:TextBox>
            </td>
            <td>&nbsp;</td>
            <td>
                <asp:Label ID="Label25" runat="server" Text="Partial Shipment :"></asp:Label>
            </td>
            <td>
                <asp:CheckBox ID="ChkPartialShipment" AutoPostBack="true" runat="server" OnCheckedChanged="ChkPartialShipment_CheckedChanged"  /> &nbsp;&nbsp;
                 <asp:TextBox ID="txtPshipmentPercentage" runat="server" Width="50px" AutoPostBack="true" OnTextChanged="txtPshipment_TextChanged"></asp:TextBox>%&nbsp; 
            </td>
            <td>&nbsp; </td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>
                <asp:CheckBox ID="Checkseviceprovi" AutoPostBack="true" runat="server" Text="Sevice Provider" OnCheckedChanged="Checkseviceprovi_CheckedChanged" />
            </td>
            <td>
                <asp:TextBox ID="txtSPFailPercentage" AutoPostBack="true" runat="server" Width="50px" OnTextChanged="txtSPFailPercentage_TextChanged"></asp:TextBox>
                %</td>
            <td>
<%--                <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ControlToValidate="txtSPFailPercentage" ErrorMessage="Numeric Only." ForeColor="Red" ValidationExpression="^[1-9]\d*(\.\d+)?$"></asp:RegularExpressionValidator>--%>
            </td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td>
                <asp:Label ID="Label26" runat="server" Text="Variance Qty :"></asp:Label>
            </td>
            <td><strong>
                <asp:Label ID="LabelVari" runat="server"></asp:Label>
                </strong></td>
            <td>&nbsp;</td>
            <td colspan="2">
                <label style="color:red">
                **Able to dispatch zero comitted quantities & this is only for M & S Buyer PO (Short Shipped)</label></td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>
                <asp:Label ID="Label24" runat="server" Text="Reasons For Failure / Remarks :"></asp:Label>
            </td>
            <td colspan="2">
                <asp:TextBox ID="txtShipComments0" runat="server" Width="198px" ></asp:TextBox>
            </td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
         <tr>
            <td>&nbsp;</td>
            <td colspan="3">
                <asp:Label ID="Label7" runat="server" Text="Physically Handed Over Date"></asp:Label> &nbsp;&nbsp;
                <BDP:BasicDatePicker ID="BBPHandedOverOn"  runat="server" Style="font-family: 'Times New Roman', Times, serif" AutoPostBack="true" OnSelectionChanged="BBPHandedOverOn_SelectionChanged" />
            </td>
             <td colspan="1">
                   
                 <asp:Label ID="Label27" runat="server" Text="Reason For Delayed update  :"></asp:Label>
                 </td>
             <td colspan="1">

                 <asp:TextBox ID="txtDelayedUpdateReason" runat="server" Width="198px"></asp:TextBox>

                 </td>
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
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
    </table>

    </asp:Panel>
           <%-- <asp:Panel ID="DetailPanele0" runat="server" BorderColor="#FF6600" BorderStyle="Solid">
                <table class="auto-style1">
                    <tr>
                        <td class="auto-style150">&nbsp;</td>
                        <td class="auto-style18">
                            &nbsp;</td>
                        <td class="auto-style172">
                            &nbsp;</td>
                        <td class="auto-style152">&nbsp;</td>
                        <td class="auto-style93">
                            &nbsp;</td>
                        <td class="auto-style149">
                            &nbsp;</td>
                        <td class="auto-style149">&nbsp;</td>
                        <td class="auto-style160">&nbsp;</td>
                        <td class="auto-style159">
                            &nbsp;</td>
                        <td class="auto-style153">&nbsp;</td>
                        <td class="auto-style157">
                            &nbsp;</td>
                        <td class="auto-style82">
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td class="auto-style150">&nbsp;</td>
                        <td class="auto-style18">&nbsp; &nbsp;&nbsp;&nbsp;
                        </td>
                        <td class="auto-style172">&nbsp;</td>
                        <td >&nbsp; </td>
                        <td >
                            &nbsp;</td>
                        <td >&nbsp;</td>
                        <td>&nbsp;</td>
                        <td class="auto-style160">
                            &nbsp;</td>
                        <td class="auto-style159">&nbsp;</td>
                        <td class="auto-style153">&nbsp;
                            </td>
                        <td class="auto-style157">
                            &nbsp;</td>
                        <td class="auto-style82" rowspan="3">
                            <table class="auto-style1">
                                <tr>
                                    <td>
                                        &nbsp;</td>
                                    <td>
                                        &nbsp;</td>
                                    <td class="auto-style95">&nbsp;</td>
                                    <td>&nbsp;</td>
                                </tr>
                                <tr>
                                    <td>
                                        &nbsp;</td>
                                    <td>
                                        &nbsp;</td>
                                    <td colspan="2">
                                        &nbsp;</td>
                                </tr>
                                <tr>
                                    <td>
                                        &nbsp;</td>
                                    <td>
                                        &nbsp;</td>
                                    <td class="auto-style95">&nbsp;</td>
                                    <td>&nbsp;</td>
                                </tr>
                                <tr>
                                    <td>
                                        &nbsp;</td>
                                    <td>&nbsp;</td>
                                    <td class="auto-style95">&nbsp;</td>
                                    <td>&nbsp;</td>
                                </tr>
                                <tr>
                                    <td>
                                        &nbsp;</td>
                                    <td>&nbsp;</td>
                                    <td class="auto-style95">&nbsp;</td>
                                    <td>&nbsp;</td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style150">&nbsp;</td>
                        <td class="auto-style18">
                            &nbsp;</td>
                        <td class="auto-style172">&nbsp;</td>
                        <td class="auto-style152">&nbsp;</td>
                        <td class="auto-style93">
                            &nbsp;</td>
                        <td class="auto-style149">
                            &nbsp;</td>
                        <td class="auto-style149">&nbsp;</td>
                        <td class="auto-style160">
                            &nbsp;</td>
                        <td class="auto-style159">
                            &nbsp;</td>
                        <td class="auto-style153"></td>
                        <td class="auto-style157">&nbsp;</td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td class="auto-style150">&nbsp;</td>
                        <td class="auto-style18">
                            &nbsp;</td>
                        <td class="auto-style172">
                            &nbsp;</td>
                        <td class="auto-style152">&nbsp;</td>
                        <td class="auto-style93">&nbsp;</td>
                        <td class="auto-style149">&nbsp;</td>
                        <td class="auto-style149">&nbsp;</td>
                        <td class="auto-style160">&nbsp;</td>
                        <td class="auto-style159">&nbsp;</td>
                        <td class="auto-style153">&nbsp;</td>
                        <td class="auto-style157">
                            &nbsp;</td>
                        <td>&nbsp;</td>
                    </tr>
                </table>



                </asp:Panel>--%>
    
            </td>
        </tr>
        <tr>
            <td>

            <asp:Panel ID="DetailPanele1" runat="server" BorderColor="#FF6600" BorderStyle="Solid">
                <table class="nav-justified">
                    <tr>
                        <td class="auto-style161">&nbsp;</td>
                        <td class="auto-style108">&nbsp;</td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td class="auto-style161">&nbsp;</td>
                        <td class="auto-style108">


                            <asp:GridView ID="gvDeliveryBD" runat="server" AutoGenerateColumns="False" BackColor="White" GridLines="Both"
                    BorderWidth="1px" CellPadding="4" ForeColor="Black" EnableModelValidation="True" Width="80%" OnRowCommand="gvDeliveryBD_RowCommand" OnRowDeleting="gvDeliveryBD_RowDeleting" >
                    <HeaderStyle Wrap="False" BackColor="#333333" Font-Bold="True" ForeColor="White" />
                    <Columns>
                     
                   
                          <asp:TemplateField HeaderText="DID" ItemStyle-Width="180px" Visible="false">
                            <ItemTemplate>
                              <%--    <%# Eval("DDID")%>--%>
                                <asp:Label ID="labDID" runat="server" Visible="true" Text='<%#Eval("DID") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                          <asp:TemplateField HeaderText="Style" ItemStyle-Width="180px" Visible="true">
                            <ItemTemplate>
                                <%--  <%# Eval("Style")%>--%>
                                <asp:Label ID="labStyle" runat="server" Visible="true" Text='<%#Eval("StyleNo") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                          <asp:TemplateField HeaderText="BPO Number" >
                            <ItemTemplate>
                                <%-- <%# Eval("BPO")%>--%>
                                <asp:Label ID="labBPO" runat="server" Visible="true" Text='<%#Eval("BuyerPONo") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                       <%-- <asp:TemplateField HeaderText="Buyer Name" >
                            <ItemTemplate>
                                <asp:Label ID="BuyerName" runat="server" Text='<%#Eval("BuyerName") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>--%>
                     
                        <asp:TemplateField HeaderText="Color">
                            <ItemTemplate>
                                <%--  <%# Eval("ColorName")%>--%>
                                <asp:Label ID="lbColorName" runat="server" Visible="true" Text='<%#Eval("Colour") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                             <asp:TemplateField HeaderText="Delivery Qty">
                            <ItemTemplate>
                                 <%-- <%# Eval("DeliveryQty")%>--%>
                                <asp:Label ID="lbDeliveryQty" runat="server" Visible="true" Text='<%#Eval("DeliveryQty") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Shiped QTY" >
                            <ItemTemplate>
                              <%-- <%# Eval("Shipedqty")%>--%>
                                <asp:Label ID="labShipedqty" runat="server" Visible="true" Text='<%#Eval("DespatchedQty") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                         <asp:TemplateField HeaderText="ShipmentID" Visible="false">
                            <ItemTemplate>
                            
                                <asp:Label ID="labShipmentID" runat="server" Visible="true" Text='<%#Eval("ShipmentID") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                          <asp:TemplateField HeaderText="Comment" >
                            <ItemTemplate>
                              <%-- <%# Eval("Shipedqty")%>--%>
                                <asp:Label ID="labShipmentComments" runat="server" Visible="true" Text='<%#Eval("ShipmentComments") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                  

                              <asp:CommandField ShowDeleteButton="true" ItemStyle-ForeColor="Red"/>

                      
               <asp:TemplateField HeaderText="PartialShipment" Visible="true">
                            <ItemTemplate>
                                <%--  <%# Eval("ColorName")%>--%>
                                <asp:Label ID="lblPartialShipment" runat="server" Visible="true" Text='<%#Eval("PartialShipment")%>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>

                     
                         <asp:TemplateField HeaderText="Senior Merchant" Visible="true">
                            <ItemTemplate>                            
                                <asp:Label ID="lblSeniorMerchant" runat="server" Visible="true" Text='<%#Eval("SeniorMerchant") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="ReportEmail" Visible="false">
                            <ItemTemplate>                            
                                <asp:Label ID="lblMerReportEmail" runat="server" Visible="true" Text='<%#Eval("ReportEmail") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                         <asp:TemplateField HeaderText="UserID" Visible="false">
                            <ItemTemplate>                            
                                <asp:Label ID="lblUserID" runat="server" Visible="true" Text='<%#Eval("UserID") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>


                        </td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td class="auto-style161">&nbsp;</td>
                        <td class="auto-style108">&nbsp;</td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td class="auto-style161">&nbsp;</td>
                        <td class="auto-style108">
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;
                            <asp:Button ID="BtnFandprint" runat="server" CssClass="btn btn-success" Text="Finish &amp; Print" Width="115px" OnClick="BtnFandprint_Click" />
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;
                            <asp:Button ID="BtnPrint" runat="server" CssClass="btn btn-success" Text="Print Preview" Width="114px" Height="36px" OnClick="BtnPrint_Click" />
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;
                            <asp:Button ID="BtnClear" runat="server" CssClass="btn btn-warning" Text="Clear" Width="83px" OnClick="BtnClear_Click" />
                        </td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td class="auto-style161">&nbsp;</td>
                        <td class="auto-style108">&nbsp;</td>
                        <td>&nbsp;</td>
                    </tr>
                </table>



                </asp:Panel>
    
            </td>
        </tr>
        <tr>
            <td>

            <asp:Panel ID="DetailPanele2" runat="server" BorderColor="#FF6600" BorderStyle="Solid">
                <table class="nav-justified">
                    <tr>
                        <td class="auto-style112">&nbsp;</td>
                        <td class="auto-style118">&nbsp;</td>
                        <td class="auto-style126">&nbsp;</td>
                        <td class="auto-style123">&nbsp;</td>
                        <td class="auto-style127">&nbsp;</td>
                        <td class="auto-style128">&nbsp;</td>
                        <td class="auto-style121">&nbsp;</td>
                        <td class="auto-style121">&nbsp;</td>
                        <td class="auto-style110">&nbsp;</td>
                        <td class="auto-style111">&nbsp;</td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td class="auto-style112">&nbsp;</td>
                        <td class="auto-style118">
                            <asp:Label ID="Label17" runat="server" Text="Plant :"></asp:Label>
                        </td>
                        <td class="auto-style126">
                            <asp:DropDownList ID="DropPlant" AutoPostBack="true" runat="server" OnSelectedIndexChanged="DropPlant_SelectedIndexChanged" Height="23px" Width="107px" Visible="False">
                            </asp:DropDownList>
                            <strong>
                            <asp:Label ID="LabelPlantName" runat="server"></asp:Label>
                            </strong>
                        </td>
                        <td class="auto-style123">
                            <asp:Label ID="Label18" runat="server" Text="Buyer :"></asp:Label>
                        </td>
                        <td class="auto-style127">
                            <asp:DropDownList ID="DropBuyer" runat="server" Height="25px" Width="153px" AutoPostBack="True" OnSelectedIndexChanged="DropBuyer_SelectedIndexChanged">
                            </asp:DropDownList>
                        </td>
                        <td class="auto-style128">
                            <asp:Label ID="Label19" runat="server" Text="Style :"></asp:Label>
                        </td>
                        <td class="auto-style121">
                            <asp:TextBox ID="TextStyle" runat="server" CssClass="col-xs-offset-0"></asp:TextBox>
                        </td>
                        <td class="auto-style121">&nbsp;</td>
                        <td class="auto-style110">
                            <asp:Button ID="BtnPrint0" runat="server" CssClass="btn btn-primary" Height="36px" Text="Search" Width="86px" OnClick="BtnPrint0_Click" />
                        </td>
                        <td class="auto-style111">
                            &nbsp;</td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td class="auto-style112">&nbsp;</td>
                        <td class="auto-style118">&nbsp;</td>
                        <td class="auto-style126">&nbsp;</td>
                        <td class="auto-style123">&nbsp;</td>
                        <td class="auto-style127">&nbsp;</td>
                        <td class="auto-style128">&nbsp;</td>
                        <td class="auto-style121">&nbsp;</td>
                        <td class="auto-style121">&nbsp;</td>
                        <td class="auto-style110">&nbsp;</td>
                        <td class="auto-style111">&nbsp;</td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td class="auto-style112">&nbsp;</td>
                        <td class="auto-style118">&nbsp;</td>
                        <td class="auto-style126">
                            <asp:Label ID="lblMsg" runat="server" CssClass="auto-style129" Visible="False"></asp:Label>
                        </td>
                        <td class="auto-style123">&nbsp;</td>
                        <td class="auto-style127">&nbsp;</td>
                        <td class="auto-style128">&nbsp;</td>
                        <td class="auto-style121">&nbsp;</td>
                        <td class="auto-style121">&nbsp;</td>
                        <td class="auto-style110">&nbsp;</td>
                        <td class="auto-style111">&nbsp;</td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td class="auto-style112">&nbsp;</td>
                        <td colspan="9">
                            <asp:GridView ID="GridDeliverydetails" runat="server" AutoGenerateColumns="False" BackColor="White" BorderWidth="1px" CellPadding="4" EnableModelValidation="True" ForeColor="Black" Width="95%" OnRowCommand="GridDeliverydetails_RowCommand" OnRowDataBound="GridDeliverydetails_RowDataBound">
                                <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" Wrap="False" />
                                <Columns>
                                    <asp:TemplateField HeaderStyle-BackColor="Olive" HeaderText="No" ItemStyle-BackColor="DarkGray">
                                        <ItemTemplate>
                                            <%# Container.DataItemIndex + 1 %>
                                        </ItemTemplate>
                                        <HeaderStyle BackColor="Olive" />
                                        <ItemStyle BackColor="DarkGray" />
                                    </asp:TemplateField>
                                 
                                        <asp:TemplateField HeaderText="DID" Visible="true">
                            <ItemTemplate>                           
                                <asp:Label ID="labDID" runat="server" Visible="true" Text='<%#Eval("DID") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                                      <asp:TemplateField HeaderText="Style" Visible="true">
                            <ItemTemplate>                           
                                <asp:Label ID="labStyleNo" runat="server" Visible="true" Text='<%#Eval("StyleNo") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                                       <asp:TemplateField HeaderText="Buyer PO" Visible="true">
                            <ItemTemplate>                           
                                <asp:Label ID="labBuyerPONo" runat="server" Visible="true" Text='<%#Eval("BuyerPONo") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                                      <asp:TemplateField HeaderText="Color" Visible="true">
                            <ItemTemplate>                           
                                <asp:Label ID="labColorName" runat="server" Visible="true" Text='<%#Eval("ColorName") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>

                                
                                      <asp:TemplateField HeaderText="Contract No" Visible="true">
                            <ItemTemplate>                           
                                <asp:Label ID="labContractNo" runat="server" Visible="true" Text='<%#Eval("ContractNo") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                                 
                               

                                               <asp:TemplateField HeaderText="OrderNo" Visible="false">
                            <ItemTemplate>                           
                                <asp:Label ID="labOrderNo" runat="server" Visible="true" Text='<%#Eval("OrderNo") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                              
                                               <asp:TemplateField HeaderText="BPOID" Visible="false">
                            <ItemTemplate>                           
                                <asp:Label ID="labBPOID" runat="server" Visible="true" Text='<%#Eval("BPOID") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>


                                        <asp:TemplateField HeaderText="ColorQty" Visible="true">
                            <ItemTemplate>                           
                                <asp:Label ID="labColorQty" runat="server" Visible="true" Text='<%#Eval("ColorQty") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>

                                    
                                               <asp:TemplateField HeaderText="Delivery Qty" Visible="true">
                            <ItemTemplate>                           
                                <asp:Label ID="labDeliveryQty" runat="server" Visible="true" Text='<%#Eval("DeliveryQty") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                                  
                                 
                                    <asp:TemplateField HeaderText="DeliveryDate" Visible="false">
                            <ItemTemplate>                           
                                <asp:Label ID="labDeliveryDate" runat="server" Visible="true" Text='<%#Eval("DeliveryDate") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                                   

                                        <asp:TemplateField HeaderText="DEL NO" Visible="false">
                            <ItemTemplate>                           
                                <asp:Label ID="labDELINO" runat="server" Visible="true" Text='<%#Eval("DELINO") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>

                                    <%-- <asp:BoundField DataField="PlantID" HeaderStyle-CssClass="Hide" HeaderText="PlantID"  ItemStyle-CssClass="Hide" />--%>


                                       <asp:TemplateField HeaderText="PlantID" Visible="false">
                            <ItemTemplate>                           
                                <asp:Label ID="labPlantID" runat="server" Visible="true" Text='<%#Eval("PlantID") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                                    <%-- <asp:BoundField DataField="PlantName" HeaderStyle-CssClass="Hide" HeaderText="PlantName" ItemStyle-CssClass="Hide" />--%>

                                    <asp:TemplateField HeaderText="Plant" Visible="false">
                            <ItemTemplate>                           
                                <asp:Label ID="labPlantName" runat="server" Visible="true" Text='<%#Eval("PlantName") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                                  
                                     <asp:TemplateField HeaderText="Buyer Code" Visible="false">
                            <ItemTemplate>                           
                                <asp:Label ID="labBuyerCode" runat="server" Visible="true" Text='<%#Eval("BuyerCode") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                                  

                                           
                                     <asp:TemplateField HeaderText="PO Qty" Visible="false">
                            <ItemTemplate>                           
                                <asp:Label ID="labPOQty" runat="server" Visible="true" Text='<%#Eval("POQty") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>


                                     <asp:TemplateField HeaderText="Sumithra PO Qty" Visible="true">
                            <ItemTemplate>                           
                                <asp:Label ID="labSumithraPOQty" runat="server" Visible="true" Text='<%#Eval("SumithraPOQty") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>

                                        <asp:TemplateField HeaderText="FC" Visible="false">
                            <ItemTemplate>                           
                                <asp:Label ID="labFC" runat="server" Visible="true" Text='<%#Eval("FC") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>

                                    
                                        <asp:TemplateField HeaderText="Cancel" Visible="false">
                            <ItemTemplate>                           
                                <asp:Label ID="labCancel" runat="server" Visible="true" Text='<%#Eval("Cancel") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                                      <asp:TemplateField HeaderText="Cancel"  Visible="true">
                            <ItemTemplate>                           
                                <asp:Label ID="labCancelRemarks" runat="server" Visible="true" Text='<%#Eval("CancelRe") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                           <asp:TemplateField HeaderText="SSBPO"  Visible="false">
                            <ItemTemplate>                           
                                <asp:Label ID="labSSBPO" runat="server" Visible="true" Text='<%#Eval("SSBPO") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                                     <asp:TemplateField HeaderText="" SortExpression="" >
                                <ItemTemplate>
                                    <asp:Button ID="Btnselect" runat="server" Text="Select" class="btn btn-success"  CommandArgument="select" OnClick="BtnSelect_Click" CssClass="btn btn-success" />
                                   
                                </ItemTemplate>
                            </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Laundry Wash Report"  Visible="true">
                            <ItemTemplate>                           
                                <asp:Label ID="LaundryWashReport" runat="server" Visible="true" Text='<%#Eval("LaundryWashReport") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>

                                                     
                                 

                                </Columns>
                            </asp:GridView>
                        </td>
                        <td>&nbsp;</td>
                    </tr>
                </table>



                </asp:Panel>

                <asp:Panel ID="Panel1" runat="server">
                      <asp:GridView ID="GVMSizeDetails" Visible="true"   FooterStyle-Font-Bold="true" runat="server" AllowSorting="True" 
                        AutoGenerateColumns="False" BackColor="White" BorderColor="#cccccc" BorderWidth="2px" CellPadding="4"
                         EnableModelValidation="True" Font-Size="Small" ForeColor="Black" Height="96px" ShowFooter="true" Width="866px" > 
                   
                        <Columns>
                             <asp:TemplateField HeaderText="OrderNo"  Visible="true">
                                <ItemTemplate>
                                    <asp:Label ID="OrderNo" runat="server" Text='<%#Eval("OrderNo") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Size"  Visible="true">
                                <ItemTemplate>
                                    <asp:Label ID="SizeDesc" runat="server" Text='<%#Eval("SizeDesc") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Qty" ItemStyle-HorizontalAlign="Right" Visible="true">
                        <ItemTemplate>
                            <asp:Label ID="Qty" runat="server"  Text='<%#Eval("Qty") %>' ></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                           <asp:TemplateField HeaderText="Average FOB" ItemStyle-HorizontalAlign="Right" Visible="true">
                        <ItemTemplate>
                            <asp:Label ID="FC" runat="server"  Text=' <%#Eval("FC","{0:n}")%>'    ></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>   
                        <asp:TemplateField HeaderText="Average Value" ItemStyle-HorizontalAlign="Right" Visible="true">
                        <ItemTemplate>
                            <asp:Label ID="AverageValue" runat="server"  Text=' <%#Eval("AverageValue","{0:n}")%>'    ></asp:Label>
                        </ItemTemplate>
                             <FooterTemplate >
                              <div>  <asp:Label ID="lblTTLAverageValue"    runat="server" /> </div> 
                                </FooterTemplate>
                    </asp:TemplateField>    
                             <asp:TemplateField HeaderText="Actual FOB" ItemStyle-HorizontalAlign="Right" Visible="true">
                        <ItemTemplate>
                            <asp:Label ID="ActualFOB" AutoPostBack="true"  runat="server"  Text='<%#Eval("FC") %>' ></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>    
                             <asp:TemplateField HeaderText="Actual Value" ItemStyle-HorizontalAlign="Right" Visible="true">
                        <ItemTemplate>
                            <asp:Label ID="ActualValue" runat="server" Text=' <%#Eval("AverageValue","{0:n}")%>'    ></asp:Label>
                        </ItemTemplate>
                                  <FooterTemplate>
                              <div >  <asp:Label ID="lblTTLActualValue"   runat="server" /> </div> 
                                </FooterTemplate>
                    </asp:TemplateField>      
                        </Columns>
                        <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
                        <%-- <HeaderStyle Wrap="true" BackColor="#333333" Font-Bold="True" ForeColor="White" />--%>
                        <FooterStyle HorizontalAlign="Right" BackColor="#333333" Font-Bold="True" ForeColor="White" CssClass="GVFixedFooter" />
                        <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" CssClass="GVFixedHeader" />
                    </asp:GridView>
                    <asp:Label ID="lblStyle" Visible="false" runat="server" Text=""></asp:Label>
                    <asp:Label ID="lblBuyerPO" Visible="false"  runat="server" Text=""></asp:Label>
                    <asp:Label ID="lblColor" Visible="false"  runat="server" Text=""></asp:Label>
                    <asp:Label ID="lblExtRecCount" Visible="false"  runat="server" Text=""></asp:Label>
                    <asp:Label ID="lblOrderNo" Visible="false"  runat="server" Text=""></asp:Label>
                    <asp:Label ID="lblBPOID" Visible="false"  runat="server" Text=""></asp:Label>

                    <asp:Label ID="lblBPOSEQ" Visible="false"  runat="server" Text=""></asp:Label>
                    <asp:Label ID="lblSDID" Visible="false"  runat="server" Text=""></asp:Label>
                    <asp:Label ID="lblSDSEQ" Visible="false"   runat="server" Text=""></asp:Label>
                    <asp:Label ID="LabShortShipBPO" Visible="false"   runat="server" Text=""></asp:Label>
                </asp:Panel>

            </td>
        </tr>
    </table>
     </form>
</body>
</html>
