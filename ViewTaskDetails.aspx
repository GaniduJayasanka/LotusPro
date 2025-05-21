<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ViewTaskDetails.aspx.cs" Inherits="ViewTaskDetails" %>

<%@ Register Assembly="BasicFrame.WebControls.BasicDatePicker" Namespace="BasicFrame.WebControls" TagPrefix="BDP" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <link rel="shortcut icon" type="image/ico" href="dist/img/lotusProLog.ico" />
    <link rel="icon" type="image/ico" href="dist/img/lotusProLog.ico" />
    <link rel="apple-touch-icon" type="image/ico" href="dist/img/lotusProLog.ico" />

    <title>LotusPro | Task Details</title>

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
    <form id="form2" runat="server">

         <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1>Task Details</h1>
          </div>
         
        </div>
      </div><!-- /.container-fluid -->
    </section>

    <!-- Main content -->
    <section class="content">
      <div class="container-fluid">
        <div class="row">
          <!-- left column -->
          <div class="col-md-12">
            <!-- jquery validation -->
            <div class="card card-primary">
              <div class="card-header">
                <h3 class="card-title">Task Ref No : <strong>  <asp:Label ID="lblTaskRef" runat="server" Text=""></asp:Label>    </strong></h3>
              </div>
              <!-- /.card-header -->
              <!-- form start -->
              <form id="quickForm">
                <div class="card-body">
                     <form>

                          <div class="row">
                    <div class="col-sm-6">
                      <!-- checkbox -->
                      <div class="form-group">
                        <div class="form-check">
                          
                          <label class="col-sm-3 col-form-label">Main Task</label>
                            <asp:Label ID="lblMainTask" runat="server" Text="" class="col-sm-3 col-form-label"></asp:Label>
                        </div>
                        <div class="form-check">
                          <label class="col-sm-3 col-form-label">Status</label>
                            <asp:Label ID="lblStatus" runat="server" Text="" class="col-sm-3 col-form-label"></asp:Label>   
                        </div>
                        <div class="form-check">
                         <label class="col-sm-3 col-form-label">Req. Date</label>
                            <asp:Label ID="lblReqDate" runat="server" Text="" class="col-sm-3 col-form-label"></asp:Label>
                        </div>
                      </div>
                    </div>
                    <div class="col-sm-6">
                      <!-- radio -->
                      <div class="form-group">
                        <div class="form-check">
                          <label class="col-sm-3 col-form-label">Sub Task</label>
                            <asp:Label ID="lblSubTask" runat="server" Text="" class="col-sm-3 col-form-label"></asp:Label>
                        </div>
                        <div class="form-check">
                          <label class="col-sm-3 col-form-label">Priority</label>
                            <asp:Label ID="lblPriority" runat="server" Text="" class="col-sm-3 col-form-label"></asp:Label>
                        </div>
                        <div class="form-check">
                         <label class="col-sm-3 col-form-label">Req. User</label>
                            <asp:Label ID="lblReqUser" runat="server" Text="" class="col-sm-3 col-form-label"></asp:Label>
                        </div>
                      </div>
                    </div>
                  </div>
                      
                         <hr />
                     
                           <div class="row">
                    <div class="col-sm-12">
                      <!-- text input -->
                      <div class="form-group">
                        <label class="col-sm-3 col-form-label">Subject</label>
                       <asp:Label ID="lblSubject" runat="server" Text="" class="col-sm-4 col-form-label"></asp:Label>   
                      </div>
                    </div>
                        </div>

                         <div class="row">
                    <div class="col-sm-12">
                      <!-- text input -->
                      <div class="form-group">
                        <label class="col-sm-3 col-form-label">Task Description</label>
                       <asp:Label ID="lblTaskDescription" runat="server" Text=""></asp:Label> 
                      </div>
                    </div>
                        </div>
                         </form>
                 
                  <div class="form-group">
                    <label for="exampleInputPassword1">Assigned User</label>
                       <asp:DropDownList ID="DDLUser" class="form-control"  runat="server" Height="30px" AutoPostBack="true" ></asp:DropDownList>
                       
                  </div>
                 
                </div>
                <!-- /.card-body -->
                <div class="card-footer">
                    <asp:Button ID="BtnApprove" class="btn btn-success start" Width="120px" runat="server" Text="Approve" OnClick="BtnApprove_Click" />
                    <asp:Button ID="BtnDisapprove" class="btn btn-danger start" Width="120px"  runat="server" Text="Disapprove" OnClick="BtnDisapprove_Click"  />
                     <asp:Label ID="lblTID" runat="server" Text="" Visible="false"></asp:Label> 
                </div>
              </form>
            </div>
            <!-- /.card -->
            </div>
          <!--/.col (left) -->
          <!-- right column -->
          <div class="col-md-6">

          </div>
          <!--/.col (right) -->
        </div>
        <!-- /.row -->
      </div><!-- /.container-fluid -->
    </section>
    <!-- /.content -->
  </div>
       

             <asp:Label ID="lblUserID" runat="server" Text="0" Visible="false"></asp:Label>
        <asp:Label ID="lblStatusID" runat="server" Text="0" Visible="false"></asp:Label>

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





