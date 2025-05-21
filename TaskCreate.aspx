<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TaskCreate.aspx.cs" Inherits="TaskCreate" %>


<%@ Register Assembly="BasicFrame.WebControls.BasicDatePicker" Namespace="BasicFrame.WebControls" TagPrefix="BDP" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <link rel="shortcut icon" type="image/ico" href="dist/img/lotusProLog.ico" />
    <link rel="icon" type="image/ico" href="dist/img/lotusProLog.ico" />
    <link rel="apple-touch-icon" type="image/ico" href="dist/img/lotusProLog.ico" />

    <title>LotusPro | Help Desk Management</title>

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
                                <h5 class="m-0">Task Creation</h5>
                            </div>
                            <!-- /.col -->
                            <div class="col-sm-6">
                                <ol class="breadcrumb float-sm-right">
                                    <li class="breadcrumb-item"><a href="#">Home</a></li>
                                    <li class="breadcrumb-item"><a href="HelpDesk.aspx">Help Desk Management</a></li>
                                    <li class="breadcrumb-item active">Task Creation</li>
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
        <!-- SELECT2 EXAMPLE -->
        <div class="card card-default">
         
          <!-- /.card-header -->
          <div class="card-body">
                <div class="row">
              <div class="col-md-4">
                <div class="form-group">
                  <label>Main Task</label>
                 <asp:DropDownList ID="DDLMainTask" class="form-control"  runat="server" Height="30px" AutoPostBack="true" OnSelectedIndexChanged="DDLMainTask_SelectedIndexChanged"></asp:DropDownList>
                     
                </div>
                
              </div>

                     <div class="col-md-4">
                <div class="form-group">
                  <label>Sub Task</label>
                  <asp:DropDownList ID="DDLSubTask" class="form-control"  runat="server"  Height="30px"></asp:DropDownList>    
                </div>
               
              </div>
              <!-- /.col -->
              <div class="col-md-4">
                <div class="form-group">
                  <label>Create Date</label> <br />
                   <BDP:BasicDatePicker ID="BasicDatePicker" Height="30px" runat="server"/> 
                </div>
                <!-- /.form-group -->
              
                <!-- /.form-group -->
              </div>
              <!-- /.col -->
            </div>
                     <div class="row">
              <div class="col-md-4">
                <div class="form-group">
                  <label>Subject</label>
                  <asp:TextBox ID="txtSubject" runat="server" Height="30px" class="form-control" ></asp:TextBox>
                </div>
              
              </div>
                            <div class="col-md-4">
                <div class="form-group">
                  <label>Department</label>
                  <asp:DropDownList ID="DDlDepartment" class="form-control"  runat="server" Height="30px" AutoPostBack="true" ></asp:DropDownList>
                 
                </div>
              
              </div>
              <!-- /.col -->
              <div class="col-md-2">
                <div class="form-group">
                  <label>Status</label> <br /><asp:DropDownList ID="DDLStatus" runat="server"  Height="30px" class="form-control">
                                                                           <asp:ListItem Text=" " Value="0"></asp:ListItem>
                                                                           <asp:ListItem Text="Open" Value="1"></asp:ListItem>
                                                                           <asp:ListItem Text="Approved & Pending" Value="2"></asp:ListItem>
                                                                            <asp:ListItem Text="Inprogress" Value="3"></asp:ListItem>
                                                                           <asp:ListItem Text="Resolved" Value="4"></asp:ListItem>
                                                                         <asp:ListItem Text="Rejected" Value="5"></asp:ListItem>
                                                                        </asp:DropDownList>              
                </div>                
              </div>
                          <div class="col-md-2">
                <div class="form-group">
                  <label>Priority</label> <br />
                  <asp:DropDownList ID="DDLPriority" class="form-control" runat="server"  Height="30px" style="margin-right: 99px">
                                                                           <asp:ListItem Text=" " Value="0"></asp:ListItem>
                                                                           <asp:ListItem Text="Low" Value="1"></asp:ListItem>
                                                                           <asp:ListItem Text="Medium" Value="2"></asp:ListItem>
                                                                           <asp:ListItem Text="High" Value="3"></asp:ListItem>
                                                                           
                                                                        </asp:DropDownList>         
                </div>                
              </div>
              <!-- /.col -->
            </div>
            <!-- /.row -->
            <div class="row">
              <div class="col-md-8">
                <div class="form-group">
                  <label>Task Description</label>
                 <asp:TextBox ID="TextBox1" runat="server" class="form-control"  TextMode="MultiLine"  margin-left="50px" padding-left="30px"></asp:TextBox>
                </div>
              
              </div>
              <!-- /.col -->
              <div class="col-md-4">
                <div class="form-group">
                  <label>Due Date</label> <br />
                 <BDP:BasicDatePicker ID="CompletedDate" Height="30px" runat="server"/>                
                </div>
                
              </div>
              <!-- /.col -->
            </div>
            <!-- /.row -->

           
            <!-- /.row -->
          </div>
          <!-- /.card-body -->
          <div class="card-footer">
             <asp:Button ID="SaveBtn" class="btn btn-success start" Width="120px" runat="server" Text="Save" OnClick="SaveBtn_Click"/>
              <asp:Button ID="ResetBtn" class="btn btn-warning start" Width="120px"  runat="server" Text="Reset" OnClick="ResetBtn_Click" />
                <asp:Button ID="FindBtn" class="btn btn-primary start" Width="120px"  runat="server" Text="Find" OnClick="FindBtn_Click"/>

          </div>
        </div>
        <!-- /.card -->

     

      

    
        
      </div>
      <!-- /.container-fluid -->
    </section>

                <section class="content">
                    <div class="container-fluid">

                        <!--First Title-->
                        <!--<div class="title">
                            <h6 style="font-weight: 300">Task Details</h6>
                        </div>-->
                        <!--<hr />-->
                        <div class="row">


                            <section class="content">
                               
                                        <!-- /.col -->



                                       <div class="col-md-12" style="width: 100%">
                                           <div id="Div1" runat="server" class="card card-secondary">
                                            
                                           <%--GridView Panel--%>
                                                <div class="card-body">
                                                     <%--Grid View--%>
                                                    
                                                    <asp:GridView ID="GVTaskCreate" runat="server" AutoGenerateColumns="False" BackColor="White" BorderWidth="1px" CellPadding="4" EnableModelValidation="True" ForeColor="Black" Width="100%" Font-Size="Smaller">
                                                     <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
                                                        <Columns>
                                                         <asp:TemplateField HeaderText="Ticket ID" Visible="false">
                                                            <ItemTemplate>
                                                                <asp:Label ID="TID" runat="server" Font-Bold="true" Visible="true" Text='<%#Eval("TID") %>'></asp:Label>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                         <asp:TemplateField HeaderText="Ref No" Visible="true">
                                                             <ItemTemplate>
                                                                 <asp:Label ID="RefNo" runat="server" Font-Bold="true" Visible="false" Text='<%#Eval("Ref_No") %>'></asp:Label>
                                                                  <asp:LinkButton ID="LinkBtnRef_No" OnClick="LinkBtnRef_No_Click"  Font-Bold="true" runat="server" CssClass="paraGraphtext" Text='<%# Eval("Ref_No") %>' Font-Size="Small"  ></asp:LinkButton>
                                                              </ItemTemplate>
                                                         </asp:TemplateField>
                                                               <asp:TemplateField HeaderText="StatusID" Visible="false">
                                                            <ItemTemplate>
                                                                <asp:Label ID="StatusID"  runat="server" Font-Bold="true" Text='<%#Eval("StatusID") %>'></asp:Label>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                         <asp:TemplateField HeaderText="MainTask" Visible="true">
                                                             <ItemTemplate>
                                                               <asp:Label ID="labMainTask" runat="server" Font-Bold="true" Visible="true" Text='<%#Eval("MainTask") %>'></asp:Label>
                                                             </ItemTemplate>
                                                         </asp:TemplateField>
                                                         <asp:TemplateField HeaderText="SubTask" Visible="true">
                                                             <ItemTemplate>
                                                               <asp:Label ID="labSubTask" runat="server" Font-Bold="true" Visible="true" Text='<%#Eval("SubTask") %>'></asp:Label>
                                                             </ItemTemplate>
                                                         </asp:TemplateField>
                                                         <asp:TemplateField HeaderText="Subject" Visible="true">
                                                             <ItemTemplate>
                                                               <asp:Label ID="labSubject" runat="server" Font-Bold="true" Visible="true" Text='<%#Eval("Subject") %>'></asp:Label>
                                                             </ItemTemplate>
                                                         </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="Department" Visible="true">
                                                             <ItemTemplate>
                                                               <asp:Label ID="labDeptName" runat="server" Font-Bold="true" Visible="true" Text='<%#Eval("DeptName") %>'></asp:Label>
                                                             </ItemTemplate>
                                                         </asp:TemplateField>
                                                         <asp:TemplateField HeaderText="Task Description" Visible="true">
                                                             <ItemTemplate>
                                                               <asp:Label ID="labTaskDescription" runat="server" Font-Bold="true" Visible="true" Text='<%#Eval("TaskDescription") %>'></asp:Label>
                                                             </ItemTemplate>
                                                         </asp:TemplateField>
                                                         <asp:TemplateField HeaderText="Status" Visible="true">
                                                             <ItemTemplate>
                                                               <asp:Label ID="labSubTaskStatus" runat="server" Font-Bold="true" Visible="true" Text='<%#Eval("TktStatus") %>'></asp:Label>
                                                             </ItemTemplate>
                                                         </asp:TemplateField>
                                                         <asp:TemplateField HeaderText="Priority" Visible="true">
                                                             <ItemTemplate>
                                                               <asp:Label ID="labSubTaskPriority" runat="server" Font-Bold="true" Visible="true" Text='<%#Eval("Priority") %>'></asp:Label>
                                                             </ItemTemplate>
                                                         </asp:TemplateField>
                                                         <asp:TemplateField HeaderText="Complete Before" Visible="true">
                                                             <ItemTemplate>
                                                               <asp:Label ID="labSubTaskComplete" runat="server" Font-Bold="true" Visible="true" Text='<%#Eval("RequestCompletion","{0:dd/MMM/yyyy}") %>'></asp:Label>
                                                             </ItemTemplate>
                                                         </asp:TemplateField>
                                                         <asp:TemplateField HeaderText="Create User" Visible="true">
                                                             <ItemTemplate>
                                                               <asp:Label ID="labSubTaskCreate" runat="server" Font-Bold="true" Visible="true" Text='<%#Eval("CreateUser") %>'></asp:Label>
                                                             </ItemTemplate>
                                                         </asp:TemplateField>
                                                         <asp:TemplateField HeaderText="Create Date" Visible="true">
                                                             <ItemTemplate>
                                                               <asp:Label ID="labSubTaskCreateDate" runat="server" Font-Bold="true" Visible="true" Text='<%#Eval("CreateDate","{0:dd/MMM/yyyy}") %>'></asp:Label>
                                                             </ItemTemplate>
                                                         </asp:TemplateField>
                                                       </Columns>
                                                    </asp:GridView>
                                       </div>
                                       </div>


                                    </div>
                                    <!-- /.row -->
                           
                                <!-- /.container-fluid -->
                            </section>
                        </div>
          </div>
                    </section>
            </div>



             <asp:Label ID="lblUserID" runat="server" Text="0" Visible="false"></asp:Label>

            <!-- /.content-wrapper -->
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


