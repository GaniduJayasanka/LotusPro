<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TGPReport.aspx.cs" Inherits="TGPReport" %>

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






<style>
    .section-header {
      background-color: #007bff;
      color: white;
      padding: 12px;
      font-size: 18px;
      font-weight: bold;
      border-radius: 5px 5px 0 0;
      text-align: center;
    }

    .filter-container {
      display: flex;
      flex-wrap: wrap;
      align-items: center;
      justify-content: space-between;
      gap: 15px;
      padding: 15px;
      background-color: #f8f9fa;
      border: 1px solid #ddd;
      border-radius: 5px;
      margin-bottom: 20px;
      width: 100%;
    }

    .filter-container label {
      font-weight: bold;
    }

    .filter-container input,
    .filter-container select {
      padding: 8px;
      border: 1px solid #ccc;
      border-radius: 5px;
      font-size: 14px;
      width: 200px;
    }

    .filter-container .btn-filter {
      background-color: #ffc107;
      color: white;
      border: none;
      padding: 10px 20px;
      border-radius: 5px;
      cursor: pointer;
      font-weight: bold;
    }

    .filter-container .btn-filter:hover {
      background-color: #e0a800;
    }

    .border-table {
      width: 100%;
      border-collapse: collapse;
      background-color: white;
      max-width: none;
    }

    .border-table th,
    .border-table td {
      padding: 12px;
      border: 1px solid #ddd;
      text-align: left;
    }

    .border-table th {
      background-color: #007bff;
      color: white;
    }

    .table-container {
      overflow-x: auto;
      max-height: 600px;
      width: 100%;
    }

    .btn-export-excell {
      padding: 10px 20px;
      border-radius: 5px;
      cursor: pointer;
      font-weight: bold;
      background-color: #28a745;
      color: white;
      border: none;
    }

    .btn-export-excell:hover {
      background-color: #218838;
    }

    .btn-export-pdf {
      padding: 10px 20px;
      border-radius: 5px;
      cursor: pointer;
      font-weight: bold;
      background-color: #d9534f;
      color: white;
      border: none;
    }

    .btn-export-pdf:hover {
      background-color: #c9302c;
    }

    .centered-container {
    width: 100%; /* Set width to control the size */
    margin: 0 auto; /* This centers the content */
    padding: 5px; /* Optional: Add some padding around the section */
}

.bg-white {
    width: 100%; /* Ensure section takes the full width of the container */
    padding: 10px;
}

    </style>

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
                <a href="TGMange.aspx" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Tour Guide Manage </p>
                </a>
              </li>
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
            <h5>Tour Guide Points Report</h5>
          </div><!-- /.col -->
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="Home.aspx">Home</a></li>
                 <li class="breadcrumb-item"><a href="TGMange.aspx">Tour Guide Management</a></li>
              <li class="breadcrumb-item active">Tour Guide Points Report</li>
            </ol>
          </div><!-- /.col -->
        </div><!-- /.row -->
      </div><!-- /.container-fluid -->
    </div>
    <!-- /.content-header -->
<!-- Tour Guide Points Report Section -->
<div class="centered-container">
    <section class="bg-white shadow-md rounded-lg">
        <div class="filter-container">
            <div>
                <label for="txtFromDate">From Date:</label><br />
                <asp:TextBox ID="txtFromDate" runat="server" TextMode="Date" CssClass="date-picker"></asp:TextBox>
            </div>

            <div>
                <label for="txtToDate">To Date:</label><br />
                <asp:TextBox ID="txtToDate" runat="server" TextMode="Date" CssClass="date-picker"></asp:TextBox>
            </div>
            <div>

            </div>

            <div>

            </div>

         

              <div>
                  <asp:Button ID="Button1" runat="server" Text="View" CssClass="btn-filter" OnClick="btnView_Click" />
              </div>
            
             <div>
                  <asp:Button ID="btnExportTGExcel" runat="server" Text="Export to Excel" CssClass="btn-export-excell" OnClick="btnExportTGExcel_Click" />
            </div>`
          
        </div>

        <div class="table-container">
            <asp:GridView ID="gvTGPReport" runat="server" AutoGenerateColumns="False" CssClass="border-table" ShowFooter="false">
                <Columns>
                    <asp:BoundField HeaderText="Guide ID" DataField="TGHid" />
                    <asp:BoundField HeaderText="TourGuide No" DataField="TourGuideNo" />
                    <asp:BoundField HeaderText="Guide Name" DataField="GuideName" />
                    <asp:BoundField HeaderText="NIC No" DataField="NICNo" />
                    <asp:BoundField HeaderText="Company Name" DataField="CompanyName" />
                    <asp:BoundField HeaderText="Account No" DataField="AccountNo" />
                    <asp:BoundField HeaderText="Bank Name" DataField="BankName" />
                    <asp:BoundField HeaderText="Branch Name" DataField="BranchName" />
                    <asp:BoundField HeaderText="Contact Numbers" DataField="ContactNumber" />
                    <asp:BoundField HeaderText="No of Tickets" DataField="NoOfTickets" />
                    <asp:BoundField HeaderText="Amount" DataField="TG_Points" />
                   <%-- <asp:BoundField HeaderText="Claimed Status" DataField="ClaimedStatus" />
                    <asp:BoundField HeaderText="Claimed Date" DataField="ClaimedDate" SortExpression="ClaimedDate" />
                    <asp:BoundField HeaderText="Claimed User" DataField="ClaimedUser" SortExpression="ClaimedUser" />--%>
                    <asp:BoundField HeaderText="Active Status" DataField="ActivityStatus" />
                </Columns>
            </asp:GridView>
        </div>

        <div class="export-buttons">
          

        </div>
    </section>
</div>


  <script src="plugins/jquery/jquery.min.js"></script>
  <script src="plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="dist/js/adminlte.min.js"></script>
  </div>
  <!-- /.content-wrapper -->
  <footer class="main-footer">
           <strong>Copyright &copy; 2025 <a href="https://colombolotustower.lk/">Colombo Lotus Tower</a>.</strong>
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
