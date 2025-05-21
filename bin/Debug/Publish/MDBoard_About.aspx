<%@ page language="C#" autoeventwireup="true" inherits="MDBoard_About, App_Web_10bhy3il" %>



<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>

      <link href="CSS/bootstrap.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
      
    <div>

         <div class="col-md-12">
            <div class="row">
                
                <div class="col-md-12">
                    <center><h4>About - MSP Dashboard</h4></center>
           
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
                                          
                                           
                                            <label class="col-md-12 control-label">MSP Dashboart Report page was lastly modified on 11 th August as per the requiement specified by the Group Marketing Manager & Group Planning Maneger. Requirment as follows.</label>                                          
                                           
                                            
                                        </div>
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="box-body">
                                        <div class="form-group">
                                          
                                           
                                            <label class="col-md-1 control-label">1.</label>                                          
                                           

                                             <label class="col-md-11 control-label"> When Searching without plant,  </label>
                                            <label class="col-md-2 control-label"></label>         
                                             <label class="col-md-10 control-label" style="font-size:larger; "> Short/ Over Qty = {Shipped QTY – Buyer PO Qty}   </label>

                                            
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="box-body">
                                        <div class="form-group">
                                            <label class="col-md-1 control-label" >2.</label>
                                         
                                                   <label class="col-md-10 control-label"> When Searching with plant,  </label>
                                             <label class="col-md-2 control-label"></label>         
                                             <label class="col-md-10 control-label" style="font-size:larger; "> Short/ Over Qty = { Shipped QTY – Committed  Qty }   </label>
                                            
                                              </div>  
                                            
                                        
                                </div>
                                       </div>
                                   <div class="row">
                                    <div class="box-body">
                                        <div class="form-group">
                                            <label class="col-md-1 control-label" >3.</label>
                                         
                                                   <label class="col-md-10 control-label"> Committed Qty  is depend on the selected date range  </label>
                                         
                                             
                                             

                 
                                        
                                </div>
                                        </div>
                                    </div>
                                  <div class="row">
                                    <div class="box-body">
                                        <div class="form-group">
                                            <label class="col-md-1 control-label" >4.</label>
                                         
                                                   <label class="col-md-10 control-label"> Short / Over Value is depend on the costing FOB  </label>
                                         
                                             
                                             

                 
                                        
                                </div>
                                        </div>
                                    </div>
                                </div>             
                                           
                            </div>
                          
                                        </div>
                                    </div>
                                </div>
              </asp:Panel>
                                <br />
    
    </div>
    </form>
</body>
</html>
