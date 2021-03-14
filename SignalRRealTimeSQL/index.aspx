<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="SignalRRealTimeSQL.index" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style>
        table.test td{
            margin:5px 5px 5px 5px;
            padding:5px 5px 5px 5px;
        }
        table.test{
            border-collapse:separate;
            border-spacing:4px;
            
        }
    </style>

    <link href="../css/bootstrap.min.css" rel="stylesheet" />
    <link href="../css/metisMenu.min.css" rel="stylesheet" />
    <link href="../css/startmin.css" rel="stylesheet"/>
    <link href="../css/font-awesome.min.css" rel="stylesheet" type="text/css"/>

    <script src="Scripts/jquery-1.6.4.min.js"></script>
    <script src="Scripts/jquery.signalR-2.3.0.min.js"></script>
    <script src="/signalR/hubs"></script>
    <script type="text/javascript">
        $(function () {
            //proxy created on the fly
            var job = $.connection.myHub;
            //declare a function on the job hub so the server can invoke it
            job.client.displayStatus = function () {
                getData();
            };
            //start the connection
            $.connection.hub.start();
            getData();
        });
        function getData() {
            var $tbl = $('#tbl');
            $.ajax({
                url: 'index.aspx/GetData',
                contentType: "application/json;charset=utf-8",
                dataType: "json",
                type: "POST",
                success: function (data) {
                    debugger;
                    if (data.d.length > 0) {
                        var newdata = data.d;
                        $tbl.empty();
                        $tbl.append('<tr><th>ID</th><th>Name</th><th>Stock Price</th><th>Opening price</th><th>Symbol</th><th>PrevClose</th><th>Rating</th><th>NetChange</th><th>PercentChange</th></tr>');
                        var rows = [];
                        for (var i = 0; i < newdata.length; i++) {
                          rows.push('<tr><td>' + newdata[i].id + '</td><td>' + newdata[i].Name + '</td><td>' + newdata[i].PricDecimal + '</td><td>' + newdata[i].QuantDecimal + '</td><td>' + newdata[i].Symbol + '</td><td>' + newdata[i].PrevClose + '</td><td>' + newdata[i].Rating + '</td><td>' + newdata[i].NetChange + '</td><td>' + newdata[i].PercentChange + '</td></tr>');
                        }
                        $tbl.append(rows.join(''));
                    }
                }
            });
        }
    </script>
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
                   
                    <li class="dropdown">
                        <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                            <i class="fa fa-user fa-fw"></i> Register 
                        </a>
                       
                    </li>
                </ul>
                <!-- /.navbar-top-links -->

                <!-- /.navbar-static-side -->
            </nav>

            <!-- Page Content -->
            <div id="page-wrapper">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-lg-8">
                            <h1 class="page-header">Financial Stock Ticker </h1>
                               <form id="form1" runat="server">
                                    <div>
                                        <table id="tbl" class="test"></table>
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
    
</body>
</html>
