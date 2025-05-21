<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Task.aspx.cs" Inherits="Task" %>

<%@ Register Assembly="BasicFrame.WebControls.BasicDatePicker" Namespace="BasicFrame.WebControls" TagPrefix="BDP" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
     <link rel="shortcut icon" type="image/ico" href="dist/img/roundlogo.ico" />
    <link rel="icon" type="image/ico" href="dist/img/roundlogo.ico" />
    <link rel="apple-touch-icon" type="image/ico" href="dist/img/roundlogo.ico" />
  <title>HOF | Bundle Create</title>

  <!-- Google Font: Source Sans Pro -->
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="../../plugins/fontawesome-free/css/all.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="../../dist/css/adminlte.min.css">
</head>
<body class="hold-transition sidebar-mini sidebar-collapse">
  <form id="form1" runat="server">
<!-- Site wrapper -->
<div class="wrapper">
  <!-- Navbar -->
  <nav class="main-header navbar navbar-expand navbar-white navbar-light">
    <!-- Left navbar links -->
    <ul class="navbar-nav">
      <li class="nav-item">
        <a class="nav-link" data-widget="pushmenu" href="#" role="button"><i class="fas fa-bars"></i></a>
      </li>
      <li class="nav-item d-none d-sm-inline-block">
        <a href="../../index3.html" class="nav-link">Home</a>
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
                <button class="btn btn-navbar" >
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
       <img src="dist/img/HOFSLLogos.png" alt="AdminLTE Logo" class="brand-image img-circle elevation-3" style="opacity: .8">
      <span class="brand-text font-weight-light">MY ERP</span>
    </a>

    <!-- Sidebar -->
    <div class="sidebar">
      <!-- Sidebar user (optional) -->
      <div class="user-panel mt-3 pb-3 mb-3 d-flex">
        <div class="image">
           <%--<img src="dist/img/UserImage.jpg" class="img-circle elevation-2" alt="User Image">--%>
        </div>
        <div class="info">
          <a href="#" class="d-block">Hi! <asp:Label ID="lblUserName" runat="server" Text=""></asp:Label></a>
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
              <li class="nav-item">
                <a href="ProductMaster.aspx" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Product Master</p>
                </a>
              </li>
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
                <a href="ItemStockReport.aspx" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Stock Report</p>
                </a>
              </li>
              </ul>
             
          </li>
          <li class="nav-item">
            <a href="#" class="nav-link">
              <i class="nav-icon fas fa-cogs"></i>
              <p>
                Admin Panel
                <i class="fas fa-angle-left right"></i>
              </p>
            </a>
             <ul class="nav nav-treeview">
               <li class="nav-item">
                <a href="UserManagement.aspx" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>User Management</p>
                </a>
              </li>
              </ul>
              <ul class="nav nav-treeview">
               <li class="nav-item">
                <a href="FormPriviledges.aspx" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Form Priviledges</p>
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
    <section class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h5>Gift Card - Bundle Create</h5>
          </div>
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="Home.aspx">Home</a></li>
                 <li class="breadcrumb-item"><a href="GCManagement.aspx">Gift Card Management</a></li>
              <li class="breadcrumb-item active">Bundle Create</li>
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
              <div class="form-horizontal">
                <div class="card-body">
                  <div class="form-group row">
                    <label for="inputEmail3" class="col-sm-1 col-form-label">Card No</label>
                    <div class="col-sm-2">
                         <asp:TextBox ID="txtCardNo" runat="server" placeholder="Voucher No"  class="form-control"></asp:TextBox>                     
                    </div>
                      <div class="col-sm-3">
                  <asp:ImageButton ID="ImageButton1" Visible="false" runat="server" ImageUrl="~/images/addCard.png" Width="50%"/>
                          </div>
                      <label for="inputEmail3" class="col-sm-1 col-form-label">Entry No</label>
                    <div class="col-sm-2">
                         <asp:TextBox ID="txtEntryNo" runat="server" placeholder="Entry No"  class="form-control"  ></asp:TextBox>                     
                    </div>
                        <div class="col-sm-1">
                             <asp:Button ID="btnFind" class="btn btn-primary start" runat="server" Width="120px"    Text="Find"/>    
                            </div>
                  </div>
                  <div class="form-group row">
                    <label for="inputPassword3" class="col-sm-1 col-form-label">Card Type</label>
                    <div class="col-sm-2">
                         <asp:DropDownList ID="DDLCardType" class="form-control"  placeholder="Card Type"    runat="server"   ></asp:DropDownList>                     
                    </div>
                        <label for="inputPassword3" class="col-sm-1 col-form-label">Card Value</label>
                    <div class="col-sm-2">
                     <asp:DropDownList ID="DDLCardValue" class="form-control"  placeholder="Card Value"    runat="server"   ></asp:DropDownList>
                    </div>
                        <label for="inputPassword3" class="col-sm-2 col-form-label">No of Cards</label>
                    <div class="col-sm-2">
                        <asp:Label ID="lblNoOfcards" runat="server" Text="-"></asp:Label>
                    </div>
                  </div>
                
                </div>
                <!-- /.card-body -->
                <div class="card-footer">
                  <asp:Button ID="btnSave" class="btn btn-success start" runat="server" Width="120px"    Text="Save"/>                       
         <asp:Button ID="btnClear" class="btn btn-warning start" runat="server" Width="120px" Text="Clear"/>
                        <asp:Button ID="btnPrint" class="btn btn-info start" runat="server" Width="120px" Text="Print" />
                     <asp:Button ID="btnAddNew" class="btn btn-danger start" runat="server" Width="120px" Text="Add New"/>
                 <%-- <button class="btn btn-default float-right">Cancel</button>--%>
                </div>
                <!-- /.card-footer -->
              </div>
            
            </div>
      
           
          </div>
      

           <section class="content">
      <div class="container-fluid">
        <div class="row">
         
            <div class="col-12">
            
                <asp:GridView ID="GVtempProducts" runat="server" AutoGenerateColumns="False" BackColor="White"
              BorderWidth="1px" CellPadding="4" EnableModelValidation="True" ForeColor="Black" Width="100%" Font-Size="Smaller">
                 <HeaderStyle BackColor="#333333" Font-Bold="True"  ForeColor="White"  />
                    <Columns>                               
                     <asp:TemplateField HeaderText="No" Visible="true" >
                            <ItemTemplate>                           
                                <asp:Label ID="lblNo" runat="server" Visible="true" Text='<%#Eval("No") %>'></asp:Label>
                            </ItemTemplate>                                     
                        </asp:TemplateField>
                                    <asp:TemplateField HeaderText="BarCode" Visible="true" >
                            <ItemTemplate>                           
                                <asp:Label ID="labBarCode" runat="server" Font-Bold="true" Visible="true" Text='<%#Eval("BarCode") %>'></asp:Label>
                            </ItemTemplate>                                         
                        </asp:TemplateField>                                 
                         
                         
                       <asp:TemplateField HeaderText="" Visible="true">
                                <ItemTemplate>
                            <asp:Button ID="lnkdelete" runat="server" CommandName="Delete" CssClass="btn btn-danger" Font-Size="Smaller" Text="Delete" Width="70px" Height="25px" />
                         
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
     <asp:Label ID="lblFIndStatus" Visible="false" runat="server" Text="Label"></asp:Label>
     <asp:Label ID="lblLastLineNo" Visible="false" runat="server" Text="0"></asp:Label>
     <asp:Label ID="lblcardCount" Visible="false" runat="server" Text="0"></asp:Label>
 <footer class="main-footer">
    <strong>Copyright &copy; 2022 <a href="https://houseoffashions.lk/">House of Fashion</a>.</strong>
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

