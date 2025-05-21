<%@ page language="C#" autoeventwireup="true" inherits="LaundryWashSheet, App_Web_10bhy3il" %>

<%@ Register Assembly="BasicFrame.WebControls.BasicDatePicker" Namespace="BasicFrame.WebControls" TagPrefix="BDP" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Doc Uploader</title>

    
   
    <link href="CSS/bootstrap.css" rel="stylesheet" />

      <link href="CSS/jquery.autocomplete.css" rel="stylesheet" type="text/css" />
<link href="CSS/jquery.ui.all.css" rel="stylesheet" type="text/css" />
    <script src="js/jquery-1.4.1.min.js" type="text/javascript"></script>

    <script src="js/jquery-1.9.1.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/jquery.min.js"></script>

    <script src="js/jquery-1.4.1.min.js" type="text/javascript"></script>
    <script type="text/javascript" src="js/jQuery-1.8.3.js"></script>
    <script src="js/bootstrap.min.js" type="text/javascript"></script>

     <script src="js/jquery.autocomplete.js" type="text/javascript"></script>
    
     <script type="text/javascript">
         $(document).ready(function () {
             $("#<%=txtStyle.ClientID%>").autocomplete('SearchStyle.ashx');
         });
    </script>
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
                    <asp:ImageButton ID="btnhome"  OnClick="btnhome_Click" runat="server" ImageUrl="~/images/Tohome.png" Height="35px"
                        Width="35px"  />
                </div>
                <div class="col-md-11">
                    <center><h3>Document Uploader</h3></center>
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
                                             <label class="col-md-1 control-label">Style No</label>
                                              <div class="col-md-4">
                                                 <asp:TextBox ID="txtStyle" CssClass="form-control" Visible="true" runat="server"></asp:TextBox>
                                         

                                            </div>
                                                  <div class="col-md-4">        
                                                 <asp:Button ID="BtnSearch" runat="server" CssClass="btn btn-primary"  Text="Search" Width="100px" OnClick="BtnSearch_Click" />
                                                 <asp:Button ID="BtnReset" runat="server" CssClass="btn btn-warning"  Text="Reset" Width="100px" OnClick="BtnReSet_Click" />
                                           <asp:Button ID="BtnUpload" CssClass="btn btn-success" Width="100px" runat="server" Text="Upload" OnClick="BtnUpload_Click" />
                                                       </div>
                                           
                                            
                                        </div>
                                    </div>
                                </div>
                             <div class="row">
                                    <div class="box-body">
                                        <div class="form-group">

                                             <label class="col-md-2 control-label">Document Type</label>

                                             <div class="col-md-3">
                                                <asp:DropDownList ID="DDLDocType" AutoPostBack="true" runat="server" CssClass="form-control" OnSelectedIndexChanged="DDLDocType_SelectedIndexChanged">
                                                </asp:DropDownList>
                                            </div>

                                              <label class="col-md-2 control-label">
                                                  <asp:Label ID="lblBPO" runat="server" Text="Buyer PO"></asp:Label></label>

                                              <div class="col-md-3">
                                                <asp:DropDownList ID="DDLBPO" runat="server" CssClass="form-control">
                                                </asp:DropDownList>
                                            </div>

                                            </div>
                                        </div>
                                 </div>
                                  <div class="row">
                                    <div class="box-body">
                                        <div class="form-group">

                                             <label class="col-md-2 control-label">Document</label>
                                            <asp:FileUpload class="col-md-3" ID="FileUploadLaundrySheet" runat="server" />
                                              <div class="col-md-3">
                                                
                                                
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
        

        <div class="form-group row">
            <div class="col-md-1">
                </div>
                 <asp:GridView ID="GVDocUpload" Width="65%" runat="server" onrowdeleting="GVDocUpload_RowDeleting"  AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="2" ForeColor="Black"  >
                                        <Columns>
                                           <asp:TemplateField HeaderText="" SortExpression="n">
                                                <ItemTemplate>
                                                    <asp:Label ID="n" runat="server" Text='<%#Eval("n") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>  
                                            <asp:TemplateField HeaderText="LWSID" SortExpression="LWSID" Visible="false">
                                                <ItemTemplate>
                                                    <asp:Label ID="LWSID" runat="server" Text='<%#Eval("LWSID") %>' Visible="false"></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                             <asp:TemplateField HeaderText="OrderNo" SortExpression="LWSID" Visible="false">
                                                <ItemTemplate>
                                                    <asp:Label ID="OrderNo" runat="server" Text='<%#Eval("OrderNo") %>' Visible="false"></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                             <asp:TemplateField HeaderText="BuyerPONo" SortExpression="BuyerPONo" Visible="true">
                                                <ItemTemplate>
                                                    <asp:Label ID="BuyerPONo" runat="server" Text='<%#Eval("BuyerPONo") %>' Visible="true"></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="File Category" SortExpression="FileCategory">
                                                <ItemTemplate>
                                                    <asp:Label ID="FileCategory" runat="server" Text='<%#Eval("FileCategory") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="FileName" SortExpression="Name">
                                                <ItemTemplate>
                                                    <asp:LinkButton ID="FileName" runat="server" CssClass="paraGraphtext" CommandArgument='<%# Eval("LWSID") %>' OnClick="FileName_Click" Text='<%# Eval("FileName") %>'></asp:LinkButton>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                           <%-- <asp:CommandField ButtonType="Image" DeleteImageUrl="~/images/Remove.png" ShowDeleteButton="True" ShowHeader="True" />--%>
                                             <asp:TemplateField HeaderText="ContentType" SortExpression="ContentType">
                                                <ItemTemplate>
                                                    <asp:Label ID="ContentType" runat="server" Text='<%#Eval("ContentType") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                             <asp:TemplateField HeaderText="File Data" Visible="false" SortExpression="Data">
                                                <ItemTemplate>
                                                    <asp:Label ID="Data" runat="server" Text='<%#Eval("Data") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                             <asp:TemplateField HeaderText="Upload User" Visible="true" SortExpression="Data">
                                                <ItemTemplate>
                                                    <asp:Label ID="UserName" runat="server" Text='<%#Eval("UserName") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                             <asp:TemplateField HeaderText="Upload Date" SortExpression="" Visible="">
                        <ItemTemplate>
                            <asp:Label ID="UploadDate" runat="server" Text='<%#Eval("UploadDate","{0:dd/MMM/yyyy}") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                                        </Columns>
                                        <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
                                        <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
                                        <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
                                        <HeaderStyle BackColor="#0066FF" Font-Bold="True" ForeColor="White" />
                                    </asp:GridView>
                    </div>
        <asp:Label ID="lblSDHID" Visible="false" runat="server" Text=""></asp:Label>
  <asp:Label ID="lblOrderNo" Visible="false" runat="server" Text=""></asp:Label>
          <asp:Label ID="lblUserId" Visible="false" runat="server" Text=""></asp:Label>
    </form>
</body>
</html>
