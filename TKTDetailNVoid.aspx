<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TKTDetailNVoid.aspx.cs" Inherits="TKTDetailNVoid" %>

<%@ Register Assembly="BasicFrame.WebControls.BasicDatePicker" Namespace="BasicFrame.WebControls" TagPrefix="BDP" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <link rel="shortcut icon" type="image/ico" href="dist/img/lotusProLog.ico" />
    <link rel="icon" type="image/ico" href="dist/img/lotusProLog.ico" />
    <link rel="apple-touch-icon" type="image/ico" href="dist/img/lotusProLog.ico" />

    <title>LotusPro | Ticket Management</title>

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
                <a href="#" class="nav-link">
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
                                <h5 class="m-0">Ticket Details | Void </h5>
                            </div>
                            <!-- /.col -->
                            <div class="col-sm-6">
                                <ol class="breadcrumb float-sm-right">
                                    <li class="breadcrumb-item"><a href="#">Home</a></li>
                                     <li class="breadcrumb-item"><a href="TKTHome.aspx">Ticket Management</a></li>
                                    <li class="breadcrumb-item active">Ticket Details | Void </li>
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
        
          <!-- /.card-header -->
          <div class="card-body">
            <div class="row">
             
                <div class="col-md-4">
                <div class="form-group">
                  <label>Ticket No. : </label>      <asp:TextBox ID="txtTicketNo" runat="server"  class="form-control" ></asp:TextBox>                 
                </div>               
              </div>
             
             

                 <div class="col-md-4">
                <div class="form-group">
                  <label>Ticket Category :</label>            <asp:Label ID="lblTicketCategory" runat="server" Text="-"></asp:Label>          
                </div>               
              </div>
             
              <div class="col-md-4">
                <div class="form-group">
                  <label>Ticket Type :</label>            <asp:Label ID="lblTktType" runat="server" Text="-"></asp:Label>            
                </div>               
              </div>
              
                
            </div>
            <!-- /.row -->

         
          </div>
          <!-- /.card-body -->
          <div class="card-footer">
            <asp:Button ID="btnFind" class="btn btn-primary start" runat="server"  Width="200px" Text="Find" OnClick="btnFind_Click" />                                                    
              <asp:Button ID="BbtnClear" class="btn btn-warning start" runat="server" Width="200px" Text="Clear" OnClick="BbtnClear_Click" />
                
          </div>
        </div>
                      
                        </div>

                          <div class="row">
          <div class="col-md-6">

            <div class="card ">
              <div class="card-header">
                <h3 class="card-title">Ticket Usage History</h3>
              </div>
              <div class="card-body">
                <!-- Date dd/mm/yyyy -->
                <div class="form-group">

                </div>
                <!-- /.form group -->

           <asp:GridView ID="GVTktUsageHistory" runat="server" AutoGenerateColumns="False" class="table table-bordered">
                <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
               <Columns>
                                                        <asp:TemplateField HeaderText="TicketNo" Visible="true">
                                                            <ItemTemplate>
                                                                <asp:Label ID="TicketNo" runat="server" Font-Bold="true" Visible="true" Text='<%#Eval("TicketNo") %>'></asp:Label>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="LogDate" Visible="true">
                                                            <ItemTemplate>
                                                                <asp:Label ID="LogDate" runat="server" Font-Bold="true" Visible="true" Text='<%#Eval("LogDate") %>'></asp:Label>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                       
                                                       
               </Columns>

           </asp:GridView>

               

              </div>
              <!-- /.card-body -->
            </div>
            <!-- /.card -->

            <div class="card">
              <div class="card-header">
                <h3 class="card-title">Void Tickets</h3>
              </div>
              <div class="card-body">
                <!-- Color Picker -->
                <div class="form-group">
                  <label>Ticket No. :</label>
                      <asp:TextBox ID="txtTktNo" runat="server"  class="form-control my-colorpicker1"  Enabled="false"></asp:TextBox>               
                  
                </div>
                <!-- /.form group -->

                <!-- Color Picker -->
                <div class="form-group">
                   <label>Void Reason :</label>
                  <div class="input-group my-colorpicker2">
                    <asp:TextBox ID="txtVoidReason" runat="server"  class="form-control my-colorpicker1"  ></asp:TextBox>                     
                  </div>                 
                </div>
               
                  <div class="form-group">
                   <asp:Button ID="BtnVoid" class="btn btn-danger start" runat="server" Width="270px" Text="Void" OnClick="BtnVoid_Click" />
                      <asp:Button ID="BtnClear" class="btn btn-warning start" runat="server" Width="270px" Text="Cancel" OnClick="BbtnClear_Click" />
                               
                </div>

               
              </div>
              <!-- /.card-body -->
            </div>
            <!-- /.card -->

          </div>
          <!-- /.col (left) -->
          <div class="col-md-6">
          
            <div class="card">
              <div class="card-header">
                <h3 class="card-title">Bill Details</h3> <asp:Label ID="lblBillID" runat="server" Text="-" Visible="false"></asp:Label>
              </div>
              <div class="card-body">
                <!-- Minimal style -->
                <div class="row">
                  <div class="col-sm-6">
                   <label for="checkboxPrimary3">  Bill No : </label>
                          <asp:Label ID="lblBillNo" runat="server" Text="-"></asp:Label>
                      </div>


                    <div class="col-sm-6">                   
                   <label for="radioPrimary3">     Bill Date & Time :</label>
               <asp:Label ID="lblBillDateNTime" runat="server" Text="-"></asp:Label>
                      </div>
                    
                </div>

                   <div class="row">
                  <div class="col-sm-6">
                   <label for="checkboxPrimary3">  No Of Tickets : </label>
                          <asp:Label ID="lblNoOfTickets" runat="server" Text="-"></asp:Label>
                      </div>


                    <div class="col-sm-6">                   
                   <label for="radioPrimary3">     Billed User :</label>
               <asp:Label ID="lblBilledUser" runat="server" Text="-"></asp:Label>
                      </div>
                    
                </div>

                   <asp:GridView ID="GVBillDetail" runat="server" AutoGenerateColumns="False" class="table table-bordered">
                <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
               <Columns>
                                                        <asp:TemplateField HeaderText="TicketNo" Visible="true">
                                                            <ItemTemplate>
                                                                <asp:Label ID="TicketNo" runat="server" Font-Bold="true" Visible="true" Text='<%#Eval("TicketNo") %>'></asp:Label>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Amount" Visible="true">
                                                            <ItemTemplate>
                                                                <asp:Label ID="Amount" runat="server" Font-Bold="true" Visible="true" Text='<%#Eval("Amount") %>'></asp:Label>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                       
                                                       
               </Columns>

           </asp:GridView>
               </div>
              <!-- /.card-body -->
              <div class="card-footer">
                Total Bill Amount : <asp:Label ID="lblBillAmount" runat="server" Text="-"></asp:Label>
              </div>
            </div>
            <!-- /.card -->

           
          </div>
          <!-- /.col (right) -->
        </div>
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


