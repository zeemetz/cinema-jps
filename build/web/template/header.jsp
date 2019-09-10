<%@page import="Controller.MainClass"%>
<%@page import="Bean.Location"%>
<%@page import="Bean.Movies"%>
<%@page import="java.util.List"%>

<!DOCTYPE html>
<html lang="en">
    
    <head>
        <meta charset="utf-8">
        <title>B I N E M A X</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="">
        <meta name="author" content="">
        <!-- Le styles -->
        <link href="assets/css/bootstrap.css" rel="stylesheet">
        <link href="assets/css/bootstrap-responsive.css" rel="stylesheet">
        <link href="assets/css/screen.css" rel="stylesheet">
        <link rel="stylesheet" href="assets/css/chosen.min.css">
        <link href="assets/css/mystyle.css" rel="stylesheet">
            
        <!-- HTML5 shim, for IE6-8 support of HTML5 elements -->
        <!--[if lt IE 9]>
            <script src="assets/js/html5shiv.js"></script>
        <![endif]-->
        <!-- Fav and touch icons -->
        <link rel="apple-touch-icon-precomposed" sizes="144x144" href="assets/ico/apple-touch-icon-144-precomposed.png">
        <link rel="apple-touch-icon-precomposed" sizes="114x114" href="assets/ico/apple-touch-icon-114-precomposed.png">
        <link rel="apple-touch-icon-precomposed" sizes="72x72" href="assets/ico/apple-touch-icon-72-precomposed.png">
        <link rel="apple-touch-icon-precomposed" href="assets/ico/apple-touch-icon-57-precomposed.png">
        <link rel="shortcut icon" href="assets/ico/favicon.png">
    </head>
    
    <body>
        <%
            MainClass mc = new MainClass();
            String q;
        %>
        <!-- NAVBAR==================================================* -->
        <div class="navbar-wrapper">
            <!-- Wrap the .navbar in .container to center it within the absolutely positioned parent. -->
            <div class="container">
                <div class="navbar navbar-inverse">
                    <div class="navbar-inner">
                        <!-- Responsive Navbar Part 1: Button for triggering responsive navbar (not covered in tutorial). Include responsive CSS to utilize. -->
                        <button type="button" class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                        </button>
                        <a class="brand" href="index.jsp">B I N E M A X</a>
                        <!-- Responsive Navbar Part 2: Place all navbar contents you want collapsed withing .navbar-collapse.collapse. -->
                        <div class="nav-collapse collapse">
                            <ul class="nav">
                                <li class="active">
                                    <a href="index.jsp">Home</a>
                                </li>
                                <%
                                    if(session.getAttribute("user") == null){
                                %>
                                <li>
                                    <a href="registration.jsp">Register</a>
                                </li>
                                <%
                                    }
                                %>
                                <li>
                                    <a href="now-playing.jsp">Now Playing</a>
                                </li>
                                <li>
                                    <a href="coming-soon.jsp">Coming Soon</a>
                                </li>
                                <!-- Read about Bootstrap dropdowns at http://twbs.github.com/bootstrap/javascript.html#dropdowns -->
                                <li class="dropdown">
                                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">Theaters
                                        <b class="caret"></b>
                                    </a>
                                    <ul class="dropdown-menu">
                                        <li class="nav-header">Jakarta</li>
                                        <%
                                            q = "SELECT * FROM location WHERE Address LIKE '%Jakarta%' ";
                                            List<Location> loc =  mc.getData(q, Location.class);
                                            for(int i=0; i<loc.size(); i++){
                                        %>
                                        <li>
                                            <a href="now-playing.jsp?page=1&loc=<%=loc.get(i).getLocationId() %>"><%=loc.get(i).getLocationName() %></a>
                                        </li>
                                        <%
                                            }
                                        %>
                                        <li class="nav-header">Tangerang</li>
                                        <%
                                            q = "SELECT * FROM location WHERE Address LIKE '%Tangerang%' ";
                                            List<Location> loc2 =  mc.getData(q, Location.class);
                                            for(int i=0; i<loc2.size(); i++){
                                        %>
                                        <li>
                                            <a href="now-playing.jsp?page=1&loc=<%=loc2.get(i).getLocationId() %>"><%=loc2.get(i).getLocationName() %></a>
                                        </li>
                                        <%
                                            }
                                        %>
                                    </ul>
                                </li>
                                <%
                                    if(session.getAttribute("user") == null){
                                %>
                                <li>
                                    <a href="login.jsp">Tickets</a>
                                </li>
                                <%
                                    }
                                %>
                            </ul>
                            <ul class="nav pull-right">
                                <form class="navbar-search" action="#" method="get">
                                    <%
                                        if(request.getParameter("loc") != null){
                                    %>
                                    <input type="hidden" value="<%=request.getParameter("loc")%>" name="loc" />
                                    <%
                                        }
                                        if(request.getParameter("page") != null){
                                    %>
                                    <input type="hidden" value="<%=request.getParameter("page")%>" name="page" />
                                    <%
                                        }
                                    %>
                                    <input type="text" class="search-query span2" placeholder="Search"  name="txtSearch">
                                </form>
                                <li class="divider-vertical"></li>
                                <li class="dropdown" id="menuLogin">
                                    <a class="dropdown-toggle" href="#" data-toggle="dropdown" id="navLogin">Login</a>
                                    <div class="dropdown-menu" style="padding:17px;">
                                        <form action="Login" method="post" class="form" id="formLogin">
                                            <input name="usertxt" id="username" type="text" placeholder="Username">
                                            <input name="passtxt" id="password" type="password" placeholder="Password">
                                            <br>
                                            <input type="submit" class="pull-right btn-primary btn" value="Login"/>
                                        </form>
                                    </div>
                                </li>
                            </ul>
                        </div>
                        <!--/.nav-collapse -->
                    </div>
                    <!-- /.navbar-inner -->
                </div>
                <!-- /.navbar -->
            </div>
            <!-- /.container -->
        </div>
        <!-- /.navbar-wrapper -->