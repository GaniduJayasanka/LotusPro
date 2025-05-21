<%@ Page Language="C#" AutoEventWireup="true" CodeFile="CustomerReview.aspx.cs" Inherits="CustomerReview" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
<style>
* {box-sizing: border-box;}

body { 
  margin: 0;
  font-family: Arial, Helvetica, sans-serif;
}

.header {
  overflow: hidden;
  background-color: #f1f1f1;
  padding: 10px 7px;
}

.header a {
  float: left;
  color: black;
  text-align: center;
  padding: 12px;
  text-decoration: none;
  font-size: 12px; 
  line-height: 5px;
  border-radius: 4px;
}

.header a.logo {
  float: left;
  font-size: 15px;
  font-weight: bold;
}

.header a:hover {
  background-color: #ddd;
  color: black;
}

.header a.active {
  background-color: dodgerblue;
  color: white;
}

.header-right {
  float: right;
}

@media screen and (max-width: 500px) {
  .header a {
    float: none;
    display: block;
    text-align: right;
  }
  
  .header-right {
    float: none;
  }
}
</style>

   <link rel="stylesheet" href="../../dist/css/adminlte.min.css">
</head>
<body>
    <form id="form1" runat="server">
        
          <div class="header">
 
    <asp:Image ID="Image1" runat="server" class="top-left" ImageUrl="~/images/CLTlogo-removebg-preview.PNG" Width="5%"  />
			   <a href="#default" class="logo"></a>
  <div class="header-right">
    <a class="active" href="https://colombolotustower.lk/">Home</a>
    <a href="https://colombolotustower.lk/contact-us/">Contact</a>
    <a href="#about">About</a>
  </div>
</div>
            <div>
<div style="padding-left:20px">
<h1>Leave a Review</h1>
  <br />
  <div class="card card-primary">
              <div class="card-header">
                <h3 class="card-title"> Provide Feedback or Suggestions<small> - Get in Touch with Us​</small></h3>
              </div>
              <!-- /.card-header -->
              <!-- form start -->
              <form id="quickForm">
                <div class="card-body">
                  <div class="form-group">
                    <label for="exampleInputEmail1">First Name</label>
                      <asp:TextBox ID="txtFirstName" class="form-control" runat="server" ></asp:TextBox>                   
                  </div>
                  <div class="form-group">
                    <label for="exampleInputEmail1">Last Name</label>
                   <asp:TextBox ID="txtLastName" class="form-control" runat="server"></asp:TextBox>  
                  </div>
                  <div class="form-group">
                    <label for="exampleInputEmail1">Email</label>
                     <asp:TextBox ID="txtEmail" class="form-control" runat="server"></asp:TextBox>
                  </div>
                   <div class="form-group">
                    <label for="exampleInputEmail1">Contact No</label>
                    <asp:TextBox ID="txtContactNo" class="form-control" runat="server"></asp:TextBox>
                  </div>
                     <div class="form-group">
                    <label for="exampleInputEmail1">Country</label>
                    <asp:TextBox ID="TextBox1" class="form-control" runat="server"></asp:TextBox>
                  </div>
                  <div class="form-group">
                    <label for="exampleInputPassword1">Reveiw*</label>
                    <asp:TextBox ID="txtInquiry" TextMode="MultiLine" class="form-control" runat="server"></asp:TextBox>
                  </div>
                 
                </div>
                <!-- /.card-body -->
                <div class="card-footer">
                <asp:Button ID="BtnSubmit" runat="server" Text="Submit" class="btn btn-primary" OnClick="BtnSubmit_Click" />
                     <asp:Button ID="Button1" runat="server" Text="Send Email" class="btn btn-primary" OnClick="Button1_Click" />
                </div>
              </form>
            </div>
    
</div>
        </div>
    </form>
</body>
</html>
