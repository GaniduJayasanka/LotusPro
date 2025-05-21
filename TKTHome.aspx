<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TKTHome.aspx.cs" Inherits="TKTHome" %>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">

 <link rel="shortcut icon" type="image/ico" href="dist/img/lotusProLog.ico" />
    <link rel="icon" type="image/ico" href="dist/img/lotusProLog.ico" />
    <link rel="apple-touch-icon" type="image/ico" href="dist/img/lotusProLog.ico" />

  <title>LotusPro | Ticket Management System</title>

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
          <a href="#" class="d-block">Hi! <asp:Label ID="lblUser" runat="server" Text=""></asp:Label></a>
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
            <h5 class="m-0">Ticket Management System</h5>
          </div><!-- /.col -->
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="#">Home</a></li>
              <li class="breadcrumb-item active">Ticket Management System</li>
            </ol>
          </div><!-- /.col -->
        </div><!-- /.row -->
      </div><!-- /.container-fluid -->
    </div>
    <!-- /.content-header -->

         <section class="content">
      <div class="container-fluid">

          <!--First Title-->
           <div class="title"> 
             <h6 style="font-weight:300">Master Details</h6>
          </div>
          <hr />
          <div class="row">


              <div class="col-md-3 col-sm-6 col-12">
                    <a class="col-md-4 col-sm-6 col-xs-4" href="">
                            <div class="info-box">
                                <span class="info-box-icon bg-lightblue">
                                    <img src="Images/TaskCategory.png" width="90%"/>
                                </span>
                                <div class="info-box-content cont_text_pading">
                                    <span class="info-box-text">Ticket Events & Types</span>
                                </div>
                            </div>
                        </a>
                       </div>

               <div class="col-md-3 col-sm-6 col-12">
                    <a class="col-md-4 col-sm-6 col-xs-4" href="">
                            <div class="info-box">
                                <span class="info-box-icon bg-yellow">
                                    <img src="Images/TaskCategory.png" width="90%"/>
                                </span>
                                <div class="info-box-content cont_text_pading">
                                    <span class="info-box-text">Ticket Activities</span>
                                </div>
                            </div>
                        </a>
                       </div>

                <div class="col-md-3 col-sm-6 col-12">
                    <a class="col-md-4 col-sm-6 col-xs-4" href="">
                            <div class="info-box">
                                <span class="info-box-icon bg-orange">
                                    <img src="Images/TaskAssign.png" width="90%"/>
                                </span>
                                <div class="info-box-content cont_text_pading">
                                    <span class="info-box-text">Ticket Prices</span>
                                </div>
                            </div>
                        </a>
                       </div>


          </div>

          <!--Second Title-->
          <div class="title"> 
             <h6 style="font-weight:300">Applications</h6>
          </div>
         <hr />
        <div class="row">
            
          <div class="col-md-3 col-sm-6 col-12">
                    <a class="col-md-4 col-sm-6 col-xs-4" href="TKTDetailNVoid.aspx">
                            <div class="info-box">
                                <span class="info-box-icon bg-green">
                                    <img src="Images/TaskCreate.png" width="60%"/>
                                </span>
                                <div class="info-box-content cont_text_pading">
                                    <span class="info-box-text">Ticket Details & Void</span>
                                </div>
                            </div>
                        </a>
                       </div>

       

          
          <!-- /.col -->

            <!-- Another Line -->
                     
          <!-- /.col -->


        </div>

          <!--Third Title-->
          <div class="secondTitle">
             <h6 style="font-weight:200">Reports</h6>
          </div>
            <hr />
           <div class="row">

                <div class="col-md-3 col-sm-6 col-12">
                    <a class="col-md-4 col-sm-6 col-xs-4" href="TKTDailySale.aspx">
                            <div class="info-box">
                                <span class="info-box-icon bg-orange">
                                    <img src="Images/TodoList.png" width="66%"/>
                                </span>
                                <div class="info-box-content cont_text_pading">
                                    <span class="info-box-text">Ticket Sale</span>
                                </div>
                            </div>
                        </a>
                       </div>

               <div class="col-md-3 col-sm-6 col-12">
                    <a class="col-md-4 col-sm-6 col-xs-4" href="TKTSaleSummary.aspx">
                            <div class="info-box">
                                <span class="info-box-icon bg-secondary">
                                    <img src="Images/InhandStock.png" width="90%"/>
                                </span>
                                <div class="info-box-content cont_text_pading">
                                    <span class="info-box-text">Ticket Sale Summary</span>
                                </div>
                            </div>
                        </a>
                       </div>


                <div class="col-md-3 col-sm-6 col-12">
                    <a class="col-md-4 col-sm-6 col-xs-4" href="TKTScanCount.aspx">
                            <div class="info-box">
                                <span class="info-box-icon bg-gradient-olive">
                                    <img src="Images/sanner.png" width="80%"/>
                                </span>
                                <div class="info-box-content cont_text_pading">
                                    <span class="info-box-text">Ticket Scan Summary</span>
                                </div>
                            </div>
                        </a>
                       </div>

                <div class="col-md-3 col-sm-6 col-12">
                    <a class="col-md-4 col-sm-6 col-xs-4" href="TKTPriceWiseSale.aspx">
                            <div class="info-box">
                                <span class="info-box-icon bg-cyan">
                                    <img src="Images/cardSell.png" width="90%"/>
                                </span>
                                <div class="info-box-content cont_text_pading">
                                    <span class="info-box-text">Ticket Sale (Value Wise)</span>
                                </div>
                            </div>
                        </a>
                       </div>

           </div>


          </div>
</section>
  
  </div>
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
