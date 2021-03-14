<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Create.aspx.cs" Inherits="SignalRRealTimeSQL.Create" %>

<!DOCTYPE html>
<html lang="en">
    <head>
        <script src="Scripts/jquery-1.6.4.min.js"></script>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="">
        <meta name="author" content="">

        <title>Financial Stock Ticker</title>

        <!-- Bootstrap Core CSS -->
        <link href="../css/bootstrap.min.css" rel="stylesheet">

        <!-- MetisMenu CSS -->
        <link href="../css/metisMenu.min.css" rel="stylesheet">

        <!-- Custom CSS -->
        <link href="../css/startmin.css" rel="stylesheet">

        <!-- Custom Fonts -->
        <link href="../css/font-awesome.min.css" rel="stylesheet" type="text/css">

        <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/html5shiv/3.7.3/html5shiv.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/respond.js/1.4.2/respond.min.js"></script>
        <![endif]-->
    </head>
    <body>

        <div id="wrapper">

            <!-- Navigation -->
            <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
                <div class="navbar-header">
                    <a class="navbar-brand" href="#">Financial Stock Ticker</a>
                </div>

                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>

                <ul class="nav navbar-nav navbar-left navbar-top-links">
                    <li><a href="#"><i class="fa fa-home fa-fw"></i> </a></li>
                </ul>

                <ul class="nav navbar-right navbar-top-links">
                    <li class="dropdown navbar-inverse">
                        
                    </li>
                    <li class="dropdown">
                        <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                            <i class="fa fa-user fa-fw"></i> Login 
                        </a>
                        
                    </li>
                </ul>
             
            </nav>

            <!-- Page Content -->
            <div id="page-wrapper">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-lg-8">
                            <h1 class="page-header">Register Company</h1>
                             <form id="form1" runat="server">
                                  <script>
                                       $(document).ready(function () {
                                           $(".NonEditVal").attr("readonly", true);
                                           $(".StockPrice").each(function () {
                                              
                                               $(this).keyup(function () {
                                                   //alert("hi");
                                                   calculateSum();
                                               });
                                           });
                                       });
                                       function calculateSum() {
                                           
                                           //var sum = 0;
                                           var sum = $(".StockPrice").val();
                                            
                                           var NetChange = 0;
                                           $(".StockPrice").each(function () {
                                               if (!isNaN(this.value) && this.value.length != 0) {
                                                   //sum += parseFloat(this.value);
                                                   NetChange = sum;
                                                   //alert(NetChange);

                                               }
                                           });
                                           $("#PrevClose").val(NetChange);
                                           $("#Quantity").val(NetChange);
                                           $(".CompanyID").val(NetChange / 1000);
                                           
                                       }
                                   </script>
                                <div>
                                    <p/>
                                  <asp:Label ID="Label11" runat="server" Text=""></asp:Label> <br />
                                   
                                     <asp:Label ID="Label2" runat="server" Text="Company Name"></asp:Label>
                                    <asp:TextBox ID="Name" runat="server" CssClass="form-control input-lg"></asp:TextBox> <p/>
                                     <asp:Label ID="Label3" runat="server" Text="Stock Price"></asp:Label>
                                    <asp:TextBox ID="UnitPrice" runat="server" CssClass="form-control input-lg StockPrice"></asp:TextBox> <p/>
                                     <asp:Label ID="Label4" runat="server" Text="Opening price"></asp:Label>
                                    <asp:TextBox ID="Quantity" runat="server" CssClass="form-control input-lg NonEditVal Quantity"></asp:TextBox> <p/>
                                     <asp:Label ID="Label5" runat="server" Text="Symbol"></asp:Label>
                                    <asp:TextBox ID="Symbol" runat="server" CssClass="form-control input-lg"></asp:TextBox> <p/>
                                    <div class="hidden">
                                          <asp:Label ID="Label1" runat="server" Text="CompanyID"></asp:Label>
                                         <asp:TextBox ID="ProductID" runat="server" CssClass="form-control input-lg CompanyID" Text=""></asp:TextBox> <p/>
                                         <asp:Label ID="Label6" runat="server" Text="PrevClose"></asp:Label>
                                        <asp:TextBox ID="PrevClose" runat="server" CssClass="form-control input-lg  PrevClose" Text="0"></asp:TextBox> <p/>
                                         <asp:Label ID="Label7" runat="server" Text="Rating"></asp:Label>
                                        <asp:TextBox ID="Rating" runat="server" CssClass="form-control input-lg" Text="3"></asp:TextBox> <p/>
                                         <asp:Label ID="Label8" runat="server" Text="NetChange"></asp:Label>
                                        <asp:TextBox ID="NetChange" runat="server" CssClass="form-control input-lg " Text="0"></asp:TextBox> <p/>
                                        <asp:Label ID="Label9" runat="server" Text="PercentChange"></asp:Label>
                                        <asp:TextBox ID="PercentChange" runat="server" CssClass="form-control input-lg " Text="0"></asp:TextBox> <p/>
                                    </div>
                                   <p> <asp:Label ID="Label10" runat="server" Text="Password"></asp:Label>
                                    <asp:TextBox ID="Password" runat="server" TextMode="Password" CssClass="form-control input-lg"></asp:TextBox> <p/>
                                    <asp:Button ID="BtnSubmit" runat="server" Text="Submit" OnClick="BtnSubmit_Click" />
                                </div>
                            </form>
                        </div>
                        <div class="col-lg-4"></div>
                        <!-- /.col-lg-12 -->
                    </div>
                    <!-- /.row -->
                </div>
                <!-- /.container-fluid -->
            </div>
            <!-- /#page-wrapper -->

        </div>
        <!-- /#wrapper -->

        <!-- jQuery -->
        <script src="../js/jquery.min.js"></script>

        <!-- Bootstrap Core JavaScript -->
        <script src="../js/bootstrap.min.js"></script>

        <!-- Metis Menu Plugin JavaScript -->
        <script src="../js/metisMenu.min.js"></script>

        <!-- Custom Theme JavaScript -->
        <script src="../js/startmin.js"></script>

    </body>
</html>
