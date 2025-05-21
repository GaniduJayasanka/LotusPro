<%@ Page Language="C#" AutoEventWireup="true" CodeFile="UserPasswordChange.aspx.cs" Inherits="UserPasswordChange" %>

<%@ Register Assembly="BasicFrame.WebControls.BasicDatePicker" Namespace="BasicFrame.WebControls" TagPrefix="BDP" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <link rel="shortcut icon" type="image/ico" href="dist/img/lotusProLog.ico" />
    <link rel="icon" type="image/ico" href="dist/img/lotusProLog.ico" />
    <link rel="apple-touch-icon" type="image/ico" href="dist/img/lotusProLog.ico" />

    <title>LotusPro | User Password Change</title>

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
                            <a href="#" class="d-block">Hi!
                                <asp:Label ID="lblUser" runat="server" Text=""></asp:Label></a>
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
                                    <!--<li class="nav-item">
                <a href="ProductMaster.aspx" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Product Master</p>
                </a>
              </li>-->
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
                                    <!--<li class="nav-item">
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
              </li>-->

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
                                    <!--<li class="nav-item">
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
              </li>-->

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
                    </nav>
                    <!-- /.sidebar-menu -->
                </div>
                <!-- /.sidebar -->
            </aside>


  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h5>User Password Change</h5>
          </div>
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="Home.aspx">Home</a></li>
                 <li class="breadcrumb-item"><a href="AdminPanel.aspx">Admin Panel</a></li>
              <li class="breadcrumb-item active">User Password Change</li>
            </ol>
          </div>
        </div>
      </div><!-- /.container-fluid -->
    </section>

      <section class="content">
      <div class="container-fluid">
        <div class="row">
          <!-- left column -->
         
          <div class="col-md-12">
          
            <!-- general form elements disabled -->
            <div class="card card-secondary">
              
              <!-- /.card-header -->
              <div class="card-body">
            
                  <div class="row">
                    <div class="col-sm-3">
                      <!-- text input -->
                      <div class="form-group">
                        <label>User Name</label>
                        <br />
                       <asp:TextBox ID="txtUserName" runat="server" Height="30px" class="form-control" ></asp:TextBox>  
                      </div>
                    </div>                    
                    <div class="col-sm-3">
                      <div class="form-group">
                        <label>Email Address</label>
                      <asp:TextBox ID="txtemailAddress"  runat="server" Height="30px" class="form-control" ></asp:TextBox>                      
                      </div>
                    </div>    
                     
                  </div>
                 
                  <div class="row">
                    <div class="col-sm-3">
                      <!-- text input -->
                      <div class="form-group">
                        <label>Old Password</label>
                        <br />
                        <asp:TextBox ID="txtOldPassword" TextMode="Password" runat="server" Height="30px" class="form-control" ></asp:TextBox>  
                      </div>
                    </div>  
                  </div>
                  <div class="row">
                    <div class="col-sm-3">
                      <!-- text input -->
                      <div class="form-group">
                        <label>New Password</label>
                        <br />
                        <asp:TextBox ID="txtNewPassword" TextMode="Password" runat="server" Height="30px" class="form-control" ></asp:TextBox>  
                      </div>
                    </div>  
                  </div>

                 <div class="row">
                    <div class="col-sm-3">
                      <!-- text input -->
                      <div class="form-group">
                        <label>Confirm Password</label>
                        <br />
                        <asp:TextBox ID="txtConfirmPassword" TextMode="Password" runat="server" Height="30px" class="form-control" ></asp:TextBox>  
                      </div>
                    </div>
                     
                    
                  </div>
               
              </div>
              <!-- /.card-body -->
                <div class="card-footer">

               <div class="col-auto d-flex align-items-center">
                      <div class="btn-group">
      <asp:Button ID="BtnChange" class="btn btn-success start" runat="server" Width="120px"    Text="Change" OnClick="BtnChange_Click" />
                       
         <asp:Button ID="BtnCancel" class="btn btn-warning start" runat="server" Width="120px" Text="Cancel" OnClick="BtnCancel_Click"  />

                       
                        <asp:Label ID="lblUserID" runat="server" Text="0" Visible="false"></asp:Label>
                      </div>
                    </div>

                 
              </div>
            </div>
            <!-- /.card -->
           
          </div>
          <!--/.col (right) -->
           <div class="col-md-12">
          
          </div>

           <section class="content">
      <div class="container-fluid">
        <div class="row">
          <div class="col-12">
                <asp:GridView ID="GVUser" runat="server" AutoGenerateColumns="False" BackColor="White"
              BorderWidth="1px" CellPadding="4" EnableModelValidation="True" ForeColor="Black" Width="100%" Font-Size="Smaller"  >
                 <HeaderStyle BackColor="#333333" Font-Bold="True"  ForeColor="White"  />
                    <Columns>                               
                     <asp:TemplateField HeaderText="User Name" Visible="true" >
                            <ItemTemplate>                           
                                <asp:Label ID="lblUserName" runat="server" Visible="true" Text='<%#Eval("UserName") %>'></asp:Label>
                            </ItemTemplate>                                     
                        </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Report Email" Visible="true" >
                            <ItemTemplate>                           
                                <asp:Label ID="lblReportEmail" runat="server" Font-Bold="true" Visible="true" Text='<%#Eval("ReportEmail") %>'></asp:Label>
                            </ItemTemplate>                                         
                        </asp:TemplateField>                                 
                            <asp:TemplateField HeaderText="Comment" Visible="true" >
                            <ItemTemplate>                           
                                <asp:Label ID="lblComment" runat="server" Visible="true" Text='<%#Eval("Comment") %>'></asp:Label>
                            </ItemTemplate>                                     
                        </asp:TemplateField>
                          
                                   <asp:TemplateField HeaderText="Active Status" Visible="true" >
                            <ItemTemplate>                           
                                <asp:Label ID="lblActive" runat="server" Visible="true" Text='<%#Eval("Active") %>'></asp:Label>
                            </ItemTemplate>                                     
                        </asp:TemplateField>
                     
                                </Columns>
                            </asp:GridView>
              </div>

        
            </div>
          </div>
           </section>

        </div>
        <!-- /.row -->
      </div><!-- /.container-fluid -->
    </section>
  </div>
  <!-- /.content-wrapper -->
  <asp:Label ID="lblBarcode" Visible="false" runat="server" Text="Label"></asp:Label>
  <asp:Label ID="lblProductDescription" Visible="false" runat="server" Text="Label"></asp:Label>
  <asp:Label ID="lblStyleNo" Visible="false" runat="server" Text="Label"></asp:Label>
  <asp:Label ID="lblRetailPrice" Visible="false" runat="server" Text="Label"></asp:Label>
  <asp:Label ID="lblCountryName" Visible="false" runat="server" Text="Label"></asp:Label>
    <asp:Label ID="lblRequestNo" Visible="false" runat="server" Text="Label"></asp:Label>

 <footer class="main-footer">
        <strong>Copyright &copy; 2023 <a href="https://colombolotustower.lk/">Colombo Lotus Tower</a>.</strong>
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
<script src="../../plugins/jquery/jquery.min.js"></script>
<!-- Bootstrap 4 -->
<script src="../../plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- AdminLTE App -->
<script src="../../dist/js/adminlte.min.js"></script>

</body>
</html>

