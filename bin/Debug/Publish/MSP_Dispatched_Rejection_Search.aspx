<%@ page language="C#" autoeventwireup="true" inherits="MSP_Dispatched_Rejection_Search, App_Web_10bhy3il" %>
<%@ Register Assembly="BasicFrame.WebControls.BasicDatePicker" Namespace="BasicFrame.WebControls" TagPrefix="BDP" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <link href="CSS/bootstrap.css" rel="stylesheet" />
    <link href="CSS/jquery.autocomplete.css" rel="stylesheet" type="text/css" />
    <script src="js/jquery-1.4.1.min.js" type="text/javascript"></script>
    <script src="js/jquery.autocomplete.js" type="text/javascript"></script>

   <%-- <script type="text/javascript">
        $(document).ready(function () {
            $("#<%=txtStyle.ClientID%>").autocomplete('SearchStyle.ashx');
    });
    </script>--%>

    <script type="text/javascript">
        var oldgridcolor;
        function SetMouseOver(element) {
            oldgridcolor = element.style.backgroundColor;
            element.style.backgroundColor = '#ADEBFF';
            //element.style.cursor = 'pointer';
        }
        function SetMouseOut(element) {
            element.style.backgroundColor = oldgridcolor;
            element.style.textDecoration = 'none';
        }
    </script> 

<style type="text/css">
        GridViewStyle
        {
            border-right: 2px solid #A7A6AA;
            border-bottom: 2px solid #A7A6AA;
            border-left: 2px solid white;
            border-top: 2px solid white;
            padding: 4px;
            font-size:smaller;
        }

        .GridViewStyle a
        {
            color: #FFFFFF;
        }

        .GridViewHeaderStyle th
        {
            border-left: 1px solid #EBE9ED;
            border-right: 1px solid #EBE9ED;
        }

        .GridViewHeaderStyle
        {
            background-color: #4d4d4d;
            font-weight: bold;
            color: White;
            font-size:smaller;
            font-family:Cambria;
        }

        .GridViewFooterStyle
        {
            background-color: #000000;
            font-weight: normal;
            color: White;
            font-size:xx-small;
        }

        .GridViewRowStyle
        {
            background-color: #F7F6F3;
            color: #333333;
            font-size:smaller;
            font-family:Cambria;
            font-weight: bold;
        }

        .GridViewAlternatingRowStyle 
        {
            background-color: #FFFFFF;
            color: #333333;
            font-size:smaller;
            font-family:Cambria;
            font-weight: bold;
        }

        .GridViewRowStyle td, .GridViewAlternatingRowStyle td
        {
            border: 1px solid #EBE9ED;
        }

        .GridViewSelectedRowStyle
        {
            background-color: #E2DED6;
            font-weight: bold;
            color: #333333;
        }

        .GridViewPagerStyle
        {
            background-color: #284775;
            color: #FFFFFF;
        }

        .GridViewPagerStyle table /* to center the paging links*/
        {
            margin: 0 auto 0 auto;
        }

.button {
      border-radius: 15px;
      background-color: Gray;
      border: none;
      color: #FFFFFF;
      text-align: center;
      font-size: 14px;     
      padding: 10px;
      width: 200px;
      transition: all 0.5s;
      cursor: pointer;
      margin: 5px;
    }

    .button span {
      cursor: pointer;
      display: inline-block;
      position: relative;
      transition: 0.5s;
    }

    .button span:after {
      content: '\00bb';
      position: absolute;
      opacity: 0;
      top: 0;
      right: -20px;
      transition: 0.5s;
    }

    .button:hover span {
      padding-right: 40px;
    }

    .button:hover span:after {
      opacity: 1;
      right: 0;
    }
    </style>
    <style type="text/css">
        .Gridtxt {
            width: 100px;
        }

        .gridHeader {
            text-align: right;
            font-weight: bold;
        }

        .panel {
            margin-bottom: 5px !important;
        }

        .form-group {
            margin-bottom: 5px !important;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>

        <div class="col-md-12">
            <div class="col-md-10">
                <div class="row">
                    <div class="col-md-1">
                        <br />
                        <asp:ImageButton ID="btnHome" runat="server" ImageUrl="~/images/Tohome.png" Height="25px" Width="25px" PostBackUrl="Home.aspx" />
                    </div>
                    <div class="col-md-11" style="font-family:Bahnschrift">
                        <center><h2>Dispatch Rejection Search</h2></center>
                    </div>
                </div>
            </div>

            <div class="col-md-12">
                <div class="panel panel-default">
                    <div class="panel-body">
                        <div class="box-body">
                            <div class="row">
                                <div class="form-group">
                                            <label class="col-md-2 control-label">Date   From<span style="color: red">*</span></label>
                                            <div class="col-md-3">
                                                <span class="auto-style1"></span>
                                                <BDP:BasicDatePicker ID="FromDate" runat="server" CssClass="form-control" />
                                            </div>

                                            <label class="col-md-1 control-label">To <span style="color: red">*</span></label>
                                            <div class="col-md-3">
                                                <span class="auto-style1"></span>
                                                <BDP:BasicDatePicker ID="ToDate" runat="server" CssClass="form-control" />
                                            </div>

                                        <div class="col-md-2 control-label">
                                            <asp:Button ID="btnSearch" CssClass="btn btn-Gray" runat="server" Text="SEARCH" Width="100px" Height="25px" Font-Names="cambria" Font-Size="X-Small" Font-Bold="true" OnClick="btnSearch_Click"  />
                                        </div>

                               </div>
                            </div>
                        </div>
                    </div>
                </div>
             </div>

            <div>
            <asp:GridView ID="GV_Rejections" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" 
                BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black"  GridLines="Both" AllowSorting="True"  Font-Size="Small"
                EnableModelValidation="True" >
                <FooterStyle CssClass="GridViewFooterStyle" />
                <RowStyle CssClass="GridViewRowStyle" />    
                <SelectedRowStyle CssClass="GridViewSelectedRowStyle" />
                <PagerStyle CssClass="GridViewPagerStyle" />
                <AlternatingRowStyle CssClass="GridViewAlternatingRowStyle" />
                <HeaderStyle CssClass="GridViewHeaderStyle" />                
                <Columns>
                     <asp:TemplateField HeaderText="DID NO." >
                        <ItemTemplate>                            
                            <asp:Label ID="DID" runat="server" Text='<%#Eval("DID") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="DATE DISPATCHED">
                        <ItemTemplate>
                            <asp:Label ID="DisDate" runat="server" Text='<%# Eval("DispatchedDate", "{0:dd/MMM/yyyy}") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                                          
                    <asp:TemplateField HeaderText="DISPATCHED USER">
                        <ItemTemplate>
                            <asp:Label ID="UserName" runat="server" Text='<%#Eval("DispatchedUser") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="COLOR">
                        <ItemTemplate>
                            <asp:Label ID="ColorName" runat="server" Text='<%#Eval("Color") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="SPO QTY."  ItemStyle-HorizontalAlign="Right">
                        <ItemTemplate>
                            <asp:Label ID="SPO_QTY" runat="server" Text='<%#Eval("SPOQty") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="COMMITTED QTY."  ItemStyle-HorizontalAlign="Right">
                        <ItemTemplate>
                            <asp:Label ID="COM_QTY" runat="server" Text='<%#Eval("ComQty") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="DISPATCHED QTY"  ItemStyle-HorizontalAlign="Right">
                        <ItemTemplate>
                            <asp:Label ID="DIS_QTY" runat="server" Text='<%#Eval("DisQty") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                              
                    <asp:TemplateField HeaderText="DISPATCHED REMOVAL REASON" >
                        <ItemTemplate>
                            <asp:Label ID="RemovalReason" runat="server" Text='<%#Eval("RemovalReason") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                   <asp:TemplateField HeaderText="DISPATCHED REMOVAL COMMENT">
                        <ItemTemplate>
                            <asp:Label ID="RemovalComment" runat="server" Text='<%#Eval("RemovalComment") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>     
                    
                   <asp:TemplateField HeaderText="DISPATCHED REMOVAL REQUEST BY">
                        <ItemTemplate>
                            <asp:Label ID="RejectUser" runat="server" Text='<%#Eval("RejectUser") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>  

                   <asp:TemplateField HeaderText="DISPATCHED REMOVAL DATE">
                        <ItemTemplate>
                            <asp:Label ID="RejectDate" runat="server" Text='<%#Eval("RejectDate") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                   <asp:TemplateField HeaderText="DISPATCHED APPROVED BY">
                        <ItemTemplate>
                            <asp:Label ID="ApprovedBy" runat="server" Text='<%#Eval("ApprovedBy") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField> 
                    
                   <asp:TemplateField HeaderText="DISPATCHED APPROVED DATE">
                        <ItemTemplate>
                            <asp:Label ID="ApprovedDate" runat="server" Text='<%#Eval("ApprovedDate") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>                     

                   <asp:TemplateField HeaderText="PLANT">
                        <ItemTemplate>
                            <asp:Label ID="Plant" runat="server" Text='<%#Eval("Plant") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>   
                                        
                </Columns>
                <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />

            </asp:GridView>

            </div>
        </div>
    </form>
</body>
</html>
