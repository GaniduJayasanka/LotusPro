﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TGPClaimed.aspx.cs" Inherits="TGPClaimed" EnableEventValidation="true" %>

<%@ Register Assembly="BasicFrame.WebControls.BasicDatePicker" Namespace="BasicFrame.WebControls" TagPrefix="BDP" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <link rel="shortcut icon" type="image/ico" href="dist/img/lotusProLog.ico" />
    <link rel="icon" type="image/ico" href="dist/img/lotusProLog.ico" />
    <link rel="apple-touch-icon" type="image/ico" href="dist/img/lotusProLog.ico" />

    <title>LotusPro | Tour Guide Management</title>

   
    <!-- Google Font: Source Sans Pro -->
    <%-- <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">--%>
    <!-- Font Awesome -->
    <link rel="stylesheet" href="plugins/fontawesome-free/css/all.min.css">
    <!-- Ionicons -->
    <%-- <link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">--%>
    <!-- Tempusdominus Bootstrap 4 -->
    <link rel="stylesheet" href="plugins/tempusdominus-bootstrap-4/css/tempusdominus-bootstrap-4.min.css">
    <!-- iCheck -->
    <link rel="stylesheet" href="plugins/icheck-bootstrap/icheck-bootstrap.min.css">
    <!-- JQVMap -->
    <link rel="stylesheet" href="plugins/jqvmap/jqvmap.min.css">
    <!-- Theme style -->
    <link rel="stylesheet" href="dist/css/adminlte.min.css">
    <!-- overlayScrollbars -->
    <link rel="stylesheet" href="plugins/overlayScrollbars/css/OverlayScrollbars.min.css">
    <!-- Daterange picker -->
    <link rel="stylesheet" href="plugins/daterangepicker/daterangepicker.css">
    <!-- summernote -->
    <link rel="stylesheet" href="plugins/summernote/summernote-bs4.min.css">
</head>
<body class="hold-transition sidebar-mini layout-fixed">
    <form id="form1" runat="server">
        <div class="wrapper">

            <!-- Preloader -->
            <div class="preloader flex-column justify-content-center align-items-center">
                <%--<img class="animation__shake" src="dist/img/AdminLTELogo.png" alt="AdminLTELogo" height="60" width="60">--%>
            </div>

            <!-- Navbar -->
            <nav class="main-header navbar navbar-expand navbar-white navbar-light">
                <!-- Left navbar links -->
                <ul class="navbar-nav">
                    <li class="nav-item">
                        <a class="nav-link" data-widget="pushmenu" href="#" role="button"><i class="fas fa-bars"></i></a>
                    </li>
                    <li class="nav-item d-none d-sm-inline-block">
                        <a href="Home.aspx" class="nav-link">Home</a>
                    </li>

                </ul>

                <!-- Right navbar links -->
                <ul class="navbar-nav ml-auto">
                    <!-- Navbar Search -->
                    <li class="nav-item">
                        <a class="nav-link" data-widget="navbar-search" href="#" role="button">
                            <i class="fas fa-search"></i>
                        </a>
                        <div class="navbar-search-block">
                            <form class="form-inline">
                                <div class="input-group input-group-sm">
                                    <input class="form-control form-control-navbar" type="search" placeholder="Search" aria-label="Search">
                                    <div class="input-group-append">
                                        <button class="btn btn-navbar" type="submit">
                                            <i class="fas fa-search"></i>
                                        </button>
                                        <button class="btn btn-navbar" type="button" data-widget="navbar-search">
                                            <i class="fas fa-times"></i>
                                        </button>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </li>




                </ul>
            </nav>
            <!-- /.navbar -->

            <!-- Main Sidebar Container -->
            <aside class="main-sidebar sidebar-dark-primary elevation-4">
                <!-- Brand Logo -->
                <a href="Home.aspx" class="brand-link">
                    <img src="dist/img/LotusProLog.png" alt="AdminLTE Logo" class="brand-image-xl img-circle elevation-10" style="opacity: .8">
                    <span class="brand-text font-weight-light">LotusPro</span>
                </a>

                <!-- Sidebar -->
                <div class="sidebar">
                    <!-- Sidebar user panel (optional) -->
                    <div class="user-panel mt-3 pb-3 mb-3 d-flex">
                        <div class="image">
                            <%--  <img src="dist/img/UserImage.jpg" class="img-circle elevation-2" alt="User Image">--%>
                        </div>
                        <div class="info">
                            <a href="#" class="d-block">Hi
                                <asp:Label ID="lblUser" runat="server" Text=""> !</asp:Label></a>
                        </div>
                    </div>

                    <!-- SidebarSearch Form -->
                    <div class="form-inline">
                        <div class="input-group" data-widget="sidebar-search">
                            <input class="form-control form-control-sidebar" type="search" placeholder="Search" aria-label="Search">
                            <div class="input-group-append">
                                <button class="btn btn-sidebar">
                                    <i class="fas fa-search fa-fw"></i>
                                </button>
                            </div>
                        </div>
                    </div>

                    <!-- Sidebar Menu -->
                      <nav class="mt-2">
        <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="false">
          <!-- Add icons to the links using the .nav-icon class
               with font-awesome or any other icon font library -->
          <li class="nav-item menu-open">
            <a href="#" class="nav-link active">
              <i class="nav-icon fas fa-tachometer-alt"></i>
              <p>
                Dashboard
                <i class="right fas fa-angle-left"></i>
              </p>
            </a>
           
          </li>
          <li class="nav-item">
            <a href="#" class="nav-link">
              <i class="nav-icon fas fa-th"></i>
              <p>
                Master Pages
                    <i class="fas fa-angle-left right"></i>
              </p>
            </a>
            <ul class="nav nav-treeview">

         <!--
              <li class="nav-item">
                <a href="ProductMaster.aspx" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Product Master</p>
                </a>
              </li>
          -->

              </ul>
          </li>
         
      
         
          <li class="nav-item">
            <a href="#" class="nav-link">
              <i class="nav-icon fas fa-edit"></i>
              <p>
                Applications
                <i class="fas fa-angle-left right"></i>
              </p>
            </a>
         <ul class="nav nav-treeview">
             <li class="nav-item">
                <a href="TKTHome.aspx" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Ticket Management</p>
                </a>
              </li>
             <li class="nav-item">
                <a href="HelpDesk.aspx" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Help Desk</p>
                </a>
              </li>
             <li class="nav-item">
                <a href="#" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>File Management</p>
                </a>
              </li>
             <li class="nav-item">
                <a href="#" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Visitor Management</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="#" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>File Management</p>
                </a>
              </li>
             <!--
               <li class="nav-item">
                <a href="PCManagement.aspx" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Price Management</p>
                </a>
              </li>
                 <li class="nav-item">
                <a href="GCManagement.aspx" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Gift Card Management</p>
                </a>
              </li>
                 <li class="nav-item">
                <a href="LCHome.aspx" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Loyalty Card Mng.</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="TargetHome.aspx" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Monthly Target</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="IHome.aspx" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>HW Control System</p>
                </a>
              </li>
              -->


            </ul>
          </li>
           <li class="nav-item">
            <a href="#" class="nav-link">
              <i class="nav-icon fas fa-file"></i>
              <p>
                Reports
                <i class="fas fa-angle-left right"></i>
              </p>
            </a>
            <ul class="nav nav-treeview">

                 <li class="nav-item">
                <a href="CusReviewReport.aspx" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Customer Review</p>
                </a>
              </li>
           <!--
               <li class="nav-item">
                <a href="ItemStockReport.aspx" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Stock Report</p>
                </a>
              </li>
                <li class="nav-item">
                <a href="HomeSalesReport.aspx" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Sales Analysis Report</p>
                </a>
              </li>
           -->

              </ul>
             
          </li>
          <li class="nav-item">
            <a href="AdminPanel.aspx" class="nav-link">
              <i class="nav-icon fas fa-cogs"></i>
              <p>
                Admin Panel
                <i class="fas fa-angle-left right"></i>
              </p>
            </a>
            <ul class="nav nav-treeview">
             <li class="nav-item">
                <a href="AdminPanel.aspx" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p> Admin Panel</p>
                </a>
              </li>
           

             <!--
               <li class="nav-item">
                <a href="PCManagement.aspx" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Price Management</p>
                </a>
              </li>
                 <li class="nav-item">
                <a href="GCManagement.aspx" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Gift Card Management</p>
                </a>
              </li>
                 <li class="nav-item">
                <a href="LCHome.aspx" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Loyalty Card Mng.</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="TargetHome.aspx" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Monthly Target</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="IHome.aspx" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>HW Control System</p>
                </a>
              </li>
              -->


            </ul>

        
          </li>
          
         
          
       
         
        
         
         
       
         
          
          
        </ul>
      </nav>
                    <!-- /.sidebar-menu -->
                </div>
                <!-- /.sidebar -->
            </aside>

            <!-- Content Wrapper. Contains page content -->
            <div class="content-wrapper">
                <!-- Content Header (Page header) -->
                <div class="content-header">
                    <div class="container-fluid">
                        <div class="row mb-2">
                            <div class="col-sm-6">
                                <h5 class="m-0">Tour Guide Points Claimed Report</h5>
                            </div>
                            <!-- /.col -->
                            <div class="col-sm-6">
                                <ol class="breadcrumb float-sm-right">
                                   <li class="breadcrumb-item"><a href="Home.aspx">Home</a></li>
                 <li class="breadcrumb-item"><a href="TGMange.aspx">Tour Guide Management</a></li>
              <li class="breadcrumb-item active">Tour Guide Points Claimed Report</li>

                                </ol>
                            </div>
                            <!-- /.col -->
                        </div>
                        <!-- /.row -->
                    </div>
                    <!-- /.container-fluid -->
                </div>
                <!-- /.content-header -->

                <section class="content">
                    <div class="container-fluid">

                         <div class="card card-default">
          <div class="card-header">
            <h3 class="card-title">Search</h3>

          </div>
          <!-- /.card-header -->
          <div class="card-body">
            <div class="row">
                 <div class="col-md-6">
                <div class="form-group">
                  <label>Claimed Time Frame</label>
                  <asp:DropDownList ID="DDLClaimedTimeFrame" class="form-control" runat="server" Height="33px" >
                </asp:DropDownList>

                </div>
                </div>
                 
            </div>
            <!-- /.row -->

            <!-- /.row -->
          </div>
          <!-- /.card-body -->
          <div class="card-footer">
             <asp:Button ID="btnFind" class="btn btn-primary start" runat="server" Width="100px" Height="35px" Style="margin-left: 5px" Text="Find" OnClick="btnFind_Click" />                                                    
              <asp:Button ID="BbtnClear" class="btn btn-warning start" runat="server" Width="100px" Height="35px" Style="margin-left: 5px" Text="Clear" OnClick="BbtnClear_Click" />
               <asp:Button ID="ButtonExport" class="btn btn-success start" runat="server" Width="100px" Height="35px" Style="margin-left: 5px" Text="Export" OnClick="ButtonExport_Click"  />                                       
          </div>
        </div>
                        <div class="row">


                            <div class="col-12">
                                
                                <%--<h5>Started Tasks</h5>--%>
                                <asp:GridView ID="GVClaimedReport" runat="server" AutoGenerateColumns="False" Font-Size="Small"  Width="100%" ShowFooter="true" OnRowDataBound="GVClaimedReport_RowDataBound">
                                    <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
                                    <Columns>
                                        <asp:TemplateField  HeaderText="TGHid" Visible="true">
                                            <itemtemplate>
                                                <asp:Label ID="lblTGHid" runat="server" Font-Bold="true" Text='<%#Eval("TGHid") %>'></asp:Label>
                                            </itemtemplate>
                                        </asp:TemplateField>
                                                   
                                                         <asp:TemplateField HeaderText="TourGuideNo" Visible="true" FooterStyle-Font-Bold="true">
                                                             <ItemTemplate>
                                                               <asp:Label ID="labTourGuideNo" runat="server" Font-Bold="true" Visible="true" Text='<%#Eval("TourGuideNo") %>'></asp:Label>
                                                             </ItemTemplate>
                                                              <FooterTemplate>
                                                <div>
                                                    <asp:Label ID="lblTotal" runat="server" Text="Total"/>
                                                </div>
                                            </FooterTemplate>
                                                         </asp:TemplateField>

                                        <asp:TemplateField HeaderText="GuideName" Visible="true" FooterStyle-Font-Bold="true" ItemStyle-HorizontalAlign="Right" FooterStyle-HorizontalAlign="Right">
                                            <ItemTemplate>
                                                 <asp:Label ID="labGuideName" runat="server" Font-Bold="true" Visible="true" Text='<%#Eval("GuideName") %>'></asp:Label>
                                               </ItemTemplate>
                                             
                                                         </asp:TemplateField>
                                                         <asp:TemplateField HeaderText="NIC No" Visible="true">
                                                             <ItemTemplate>
                                                               <asp:Label ID="lblNICNo" runat="server" Font-Bold="true" Visible="true" Text='<%#Eval("NICNo") %>'></asp:Label>
                                                             </ItemTemplate>                                                            
                                                         </asp:TemplateField>

                                                         <asp:TemplateField HeaderText="Company Name" Visible="true" ItemStyle-HorizontalAlign="Left" FooterStyle-Font-Bold="true" FooterStyle-HorizontalAlign="Right">
                                                             <ItemTemplate>
                                                               <asp:Label ID="lblCompanyName" runat="server" Font-Bold="true" Visible="true" Text='<%#Eval("CompanyName","{0:N2}") %>'></asp:Label>
                                                             </ItemTemplate>                                                               
                                                         </asp:TemplateField>
                                                         
                                                           <asp:TemplateField HeaderText="BankName" Visible="true">
                                                             <ItemTemplate>
                                                               <asp:Label ID="labBankName" runat="server" Font-Bold="true" Visible="true" Text='<%#Eval("BankName") %>'></asp:Label>
                                                             </ItemTemplate>
                                                         </asp:TemplateField>
                                                             <asp:TemplateField HeaderText="AccountNo" Visible="true">
                                                             <ItemTemplate>
                                                               <asp:Label ID="lblAccountNo" runat="server" Font-Bold="true" Visible="true" Text='<%#Eval("AccountNo") %>'></asp:Label>
                                                             </ItemTemplate>
                                                         </asp:TemplateField> 
                                        
                                         <asp:TemplateField HeaderText="BranchName" Visible="true">
                                                             <ItemTemplate>
                                                               <asp:Label ID="lblBranchName" runat="server" Font-Bold="true" Visible="true" Text='<%#Eval("BranchName") %>'></asp:Label>
                                                             </ItemTemplate>
                                                         </asp:TemplateField> 
                                         <asp:TemplateField HeaderText="BAccountHolderName" Visible="true">
                                                             <ItemTemplate>
                                                               <asp:Label ID="BAccountHolderName" runat="server" Font-Bold="true" Visible="true" Text='<%#Eval("BAccountHolderName") %>'></asp:Label>
                                                             </ItemTemplate>
                                                         </asp:TemplateField> 
                                         <asp:TemplateField HeaderText="ContactNo 1" Visible="true">
                                                             <ItemTemplate>
                                                               <asp:Label ID="lblContactNo1" runat="server" Font-Bold="true" Visible="true" Text='<%#Eval("ContactNo1") %>'></asp:Label>
                                                             </ItemTemplate>
                                                         </asp:TemplateField> 
                                         <asp:TemplateField HeaderText="ContactNo 2" Visible="true">
                                                             <ItemTemplate>
                                                               <asp:Label ID="ContactNo2" runat="server" Font-Bold="true" Visible="true" Text='<%#Eval("ContactNo2") %>'></asp:Label>
                                                             </ItemTemplate>
                                                         </asp:TemplateField> 
                                        <asp:TemplateField HeaderText="No Of Tickets" Visible="true">
                                                             <ItemTemplate>
                                                               <asp:Label ID="NoOfTickets" runat="server" Font-Bold="true" Visible="true" Text='<%#Eval("NoOfTickets") %>'></asp:Label>
                                                             </ItemTemplate>
                                             <FooterTemplate>
        <asp:Label ID="lblTotalTickets" runat="server" Text=""></asp:Label>
    </FooterTemplate>
                                                         </asp:TemplateField> 
                                        <asp:TemplateField HeaderText="Amount Claimed" Visible="true" ItemStyle-HorizontalAlign="Right">
                                                             <ItemTemplate>
                                                               <asp:Label ID="AmountClaimed" runat="server" Font-Bold="true" Visible="true" Text='<%#Eval("AmountClaimed") %>'></asp:Label>
                                                             </ItemTemplate>
                                            <FooterTemplate >
        <asp:Label ID="lblTotalClaimedAmount" runat="server" Text="" ></asp:Label>
    </FooterTemplate>
                                                         </asp:TemplateField> 
                                        
                                    </Columns>
                                     <FooterStyle BackColor="#9f9b9b" Font-Bold="false" ForeColor="White" CssClass="GVFixedFooter" />
                                </asp:GridView>
                            </div>


                            <div class="col-12">
                                                               
                            </div>


                        </div>
                        <!-- /.row -->
                    </div>
                    <!-- /.container-fluid -->
                </section>
            </div>
            

        </div>




   <asp:Label ID="lblUserID" runat="server" Text="0" Visible="false"></asp:Label>
        <!-- /.content-wrapper -->
        <footer class="main-footer">
           <strong>Copyright &copy; 2024 <a href="https://colombolotustower.lk/">Colombo Lotus Tower</a>.</strong>
            All rights reserved.
    <div class="float-right d-none d-sm-inline-block">
        <b>Version</b> 1.0.0
    </div>
        </footer>

        <!-- Control Sidebar -->
        <aside class="control-sidebar control-sidebar-dark">
            <!-- Control sidebar content goes here -->
        </aside>
        <!-- /.control-sidebar -->
        </div>
        <!-- ./wrapper -->
    </form>
    <!-- jQuery -->
    <script src="plugins/jquery/jquery.min.js"></script>
    <!-- jQuery UI 1.11.4 -->
    <script src="plugins/jquery-ui/jquery-ui.min.js"></script>
    <!-- Resolve conflict in jQuery UI tooltip with Bootstrap tooltip -->
    <script>
        $.widget.bridge('uibutton', $.ui.button)
    </script>
    <!-- Bootstrap 4 -->
    <script src="plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
    <!-- ChartJS -->
    <script src="plugins/chart.js/Chart.min.js"></script>
    <!-- Sparkline -->
    <script src="plugins/sparklines/sparkline.js"></script>
    <!-- JQVMap -->
    <script src="plugins/jqvmap/jquery.vmap.min.js"></script>
    <script src="plugins/jqvmap/maps/jquery.vmap.usa.js"></script>
    <!-- jQuery Knob Chart -->
    <script src="plugins/jquery-knob/jquery.knob.min.js"></script>
    <!-- daterangepicker -->
    <script src="plugins/moment/moment.min.js"></script>
    <script src="plugins/daterangepicker/daterangepicker.js"></script>
    <!-- Tempusdominus Bootstrap 4 -->
    <script src="plugins/tempusdominus-bootstrap-4/js/tempusdominus-bootstrap-4.min.js"></script>
    <!-- Summernote -->
    <script src="plugins/summernote/summernote-bs4.min.js"></script>
    <!-- overlayScrollbars -->
    <script src="plugins/overlayScrollbars/js/jquery.overlayScrollbars.min.js"></script>
    <!-- AdminLTE App -->
    <script src="dist/js/adminlte.js"></script>
    <%--<!-- AdminLTE for demo purposes -->
<script src="dist/js/demo.js"></script>--%>
    <!-- AdminLTE dashboard demo (This is only for demo purposes) -->
    <script src="dist/js/pages/dashboard.js"></script>
</body>
</html>



