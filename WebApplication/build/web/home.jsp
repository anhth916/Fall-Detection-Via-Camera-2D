<%-- 
    Document   : HomePage
    Created on : Feb 2, 2021, 20:26:30 PM
    Author     : Tran Hai Anh <Anhthhe141545>
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="entity.data"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Trang chủ</title>
    <link href="css/bootstrap.min_1.css" rel="stylesheet">
    <link href="css/style_1.css" rel="stylesheet">
    <link href="css/all.css" rel="stylesheet">
    <script>
        function confirmSOS() {
            confirm("Do you want send SOS message to the nearest hospital?");
          }
        
        function sorry(){
            alert("Sorry about this mistake. Our system will learn from this and it will improve accuracy in the future!");
        }
    </script>
    <%
        ArrayList<data> list = (ArrayList<data>) request.getAttribute("list");
        int index = 0;
    %>
</head>

<body>

    <nav class="navbar navbar-default">
        <div class="container">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
					<span class="sr-only">Toggle navigation</span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
				</button>
                <a class="navbar-brand" href="#">Fall Detection Record Video</a>
            </div>
            <div id="navbar" class="collapse navbar-collapse">
                <ul class="nav navbar-nav navbar-right">
                    <li><a href="#">Hi, Admin</a></li>
                    <li><a href="index.html">Logout</a></li>
                </ul>
            </div>
        </div>
    </nav>

    <header id="header">
        <div class="container">
            <div class="row">
                <div class="col-md-10">
                    <h1><span class="glyphicon glyphicon-cog" aria-hidden="true"></span> Manage <small>Warning Human Fall</small></h1>
                </div>
            </div>
        </div>
    </header>

    <section id="breadcrumb">
        <div class="container">
            <ol class="breadcrumb">
                <li class="active">Dashboard</li>
            </ol>
        </div>
    </section>

    <section id="main">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="panel panel-default">
                        <div class="panel-heading main-color-bg">
                            <h3 class="panel-title">Over View</h3>
                        </div>
                        <div class="panel-body">
                            <div class="col-md-4">
                                <div class="well dash-box">
                                    <h2><span class="glyphicon glyphicon-warning-sign" aria-hidden="true"></span> 1 </h2>
                                    <h4>New Alert</h4>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="well dash-box">
                                    <h2><span class="	glyphicon glyphicon-folder-open" aria-hidden="true"></span> 1</h2>
                                    <h4>Number of falls recorded</h4>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="well dash-box">
                                    <h2><span class="glyphicon glyphicon-facetime-video" aria-hidden="true"></span> 1</h2>
                                    <h4>Number of cameras registered</h4>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h3 class="panel-title">Alert History</h3>
                        </div>
                        <div class="panel-body">
                            <table class="table table-striped table-hover">
                                <tr>
                                    <th>Number</th>
                                    <th>Camera</th>
                                    <th>Time</th>
                                    <th>Video Record</th>
                                    <th>Confirm True</th>
                                    <th>Comfirm False</th>
                                </tr>
                                <%
                                    for (data obj : list) {%>
                                    <tr>
                                        <td><%=index%></td>
                                        <td>Camera 1</td>
                                        <td><%=obj.getDate()%></td>
                                        <td><a href="videoControl?path=<%=obj.getName()%>" target="_blank"><i class="fas fa-photo-video fa-3x"></i></a></td>
                                        <td><button onclick="confirmSOS()"><i class="fas fa-check fa-2x"></i></button></td>
                                        <td><button onclick="sorry()"><i class="fas fa-times fa-2x"></i></button></td>
                                    </tr>        
                                        <%}
                                %>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <footer id="footer">
        <p>@Power by Hope Team</p>
    </footer>

    <!-- Bootstrap core JavaScript
    	================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
</body>

</html>