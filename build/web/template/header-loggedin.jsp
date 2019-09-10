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
                                <li class="dropdown">
                                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">Theaters
                                        <b class="caret"></b>
                                    </a>
                                    <ul class="dropdown-menu">
                                        <li class="nav-header">Jakarta</li>
                                        <li>
                                            <a href="#">Anggrek</a>
                                        </li>
                                        <li>
                                            <a href="#">Syahdan</a>
                                        </li>
                                        <li>
                                            <a href="#">Kijang</a>
                                        </li>
                                        <li>
                                            <a href="#">Simprug</a>
                                        </li>
                                        <li>
                                            <a href="#">JWC</a>
                                        </li>
                                        <li class="divider"></li>
                                        <li class="nav-header">Tangerang</li>
                                        <li>
                                            <a href="#">Serpong</a>
                                        </li>
                                        <li>
                                            <a href="#">Alam Sutera</a>
                                        </li>
                                    </ul>
                                </li>
                                <li>
                                    <a href="now-playing.jsp">Tickets</a>
                                </li>
                            </ul>
                            <ul class="nav pull-right">
                                <form class="navbar-search" action="">
                                    <input type="text" class="search-query" placeholder="Search">
                                </form>
                                <li class="divider-vertical"></li>
                                <li class="dropdown" id="menuLogin">
                                    <a class="dropdown-toggle" href="#" data-toggle="dropdown" id="navLogin">Logout</a>
                                    <div class="dropdown-menu" style="padding:17px;">
                                        <form class="form" id="formLogin">
                                            Welcome :<br/> <b><%=session.getAttribute("user")%></b>
                                            <br>
                                            <a href='Logout'>
                                            <button type="button" class="pull-right btn btn-primary" id="btnLogin" class="btn">Logout</button>
                                            </a>
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