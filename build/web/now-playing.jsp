<%@include file="template/header.jsp" %>
    <%
        Integer current_page = 0, data_per_page = 0, maxpage = 0, maxdata = 0, flagPrevNext = 0;
        String syarat = " where DateStart <= NOW() AND DateEnd >= NOW() AND p.PlayingDate = CURDATE() AND ";
        if(null != request.getParameter("page")){
            current_page = Integer.parseInt(request.getParameter("page").toString());
        }
        else current_page = 1;
        if(null != request.getParameter("loc") && !"".equals(request.getParameter("loc").trim())){
            syarat += " l.LocationId = '" + request.getParameter("loc") + "' ";
        }
        else syarat += " 1 ";

        if(null != request.getParameter("txtSearch") && !"".equals(request.getParameter("txtSearch").trim())){
            syarat += " AND MovieName like '%" + request.getParameter("txtSearch") + "%' ";
        }
        else syarat += " AND 1 ";

        data_per_page = 5;
        q = "SELECT DISTINCT m. * FROM movies m JOIN playingdetail pd ON m.MovieId = pd.MovieId " +
            "JOIN playing p ON pd.PlayingId = p.PlayingId JOIN auditorium a ON p.AuditoriumId = a.AuditoriumId " +
            "JOIN location l ON a.LocationId = l.LocationId " + syarat;
        List<Movies> mov =  mc.getData(q, Movies.class);
        maxdata = mov.size();
        maxpage = maxdata / data_per_page;
        if(maxdata % data_per_page != 0) maxpage++;
        String queryresult = "SELECT DISTINCT m. * FROM movies m JOIN playingdetail pd ON m.MovieId = pd.MovieId " +
            "JOIN playing p ON pd.PlayingId = p.PlayingId JOIN auditorium a ON p.AuditoriumId = a.AuditoriumId " +
            "JOIN location l ON a.LocationId = l.LocationId  " + syarat + " limit " + ((current_page-1)*data_per_page) + "," + data_per_page;
        mov =  (List<Movies>) mc.getData(queryresult, Movies.class);
    %>

    <div class="wrapper container">
        <div class="wrapper-box">
            <h2>Now Playing</h2>
            <div class="row">
                <div class="span3">
                    <div class="well">
                        <ul class="nav nav-list">
                            <li class="nav-header">Jakarta</li>
                            <%
                                q = "SELECT * FROM location WHERE Address LIKE '%Jakarta%' ";
                                loc =  mc.getData(q, Location.class);
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
                                loc2 =  mc.getData(q, Location.class);
                                for(int i=0; i<loc2.size(); i++){
                            %>
                            <li>
                                <a href="now-playing.jsp?page=1&loc=<%=loc2.get(i).getLocationId() %>"><%=loc2.get(i).getLocationName() %></a>
                            </li>
                            <%
                                }
                            %>
                        </ul>
                    </div>
                </div>
                <div class="span7">
                    <%
                        if(maxpage != 1){
                    %>
                    <div class="row">
                        <div class="span4 offset2">
                            <div class="pagination pagination-top">
                                <ul>
                                   <%
                                    for(int i = 1 ; i <= maxpage; i++){
                                        String tempLoc = (request.getParameter("loc") != null) ? request.getParameter("loc") : ""; 
                                   %>
                                    <li>
                                        <a href="now-playing.jsp?page=<%=i%>&loc=<%=tempLoc %>"><%=i%></a>
                                    </li>
                                    <%
                                    }
                                  %>
                                </ul>
                            </div>
                        </div>
                    </div>
                                
                    <%
                        }
                    %>

                        <div class="row">
                        <%

                        if(request.getParameter("loc") != null){
                            q = "SELECT * FROM location WHERE LocationId = '"+request.getParameter("loc")+"' ";
                            List<Location> loc3 =  mc.getData(q, Location.class);
                            %>
                                <div class="span5"><h3>Location: <%=loc3.get(0).getLocationName() %></h3></div>
                            <%
                        } else {
                            %>
                                <div class="span5"><h3>Location: All</h3></div>
                            <%

                        }
                        %>
                        </div>  
                                                
                        <%
                        if(mov.size() == 0){
                        %>
                        <div class="row" style="text-align: center;">
                            <div class="span5"><h4>There is no movies available.</h4></div>
                        </div>    
                        <%
                        }

                        for(int i=0; i < mov.size(); i++){
                    %>
                    <section id="batman" class="movielist">
                        <div class="row">
                            <div class="span2" class="img-movie">
                                <img src="assets/img/movie-poster/<%=mov.get(i).getImage()%>" />
                            </div>
                            <div class="span5">
                                <div class="row">
                                    <h4 class="movie-title span5"><a href="view-movies.jsp?id=<%=mov.get(i).getMovieid()%>"><%=mov.get(i).getMoviename()%></a></h4>
                                </div>
                                <div class="row synopsis-movie">
                                    <p class="span5">
                                        <%=mov.get(i).getSynopsis()%>.&nbsp;<a href="view-movies.jsp?id=<%=mov.get(i).getMovieid()%>">Read more..</a>
                                    </p>
                                </div>
                                <div class="row">
                                    <div class="span4">
                                        <a href="view-movies.jsp?id=<%=mov.get(i).getMovieid()%>" class="btn btn-info">View Trailer</a>
                                        <%if(session.getAttribute("user")!=null){%>
                                        <a href="reservation.jsp?movieid=<%=mov.get(i).getMovieid()%>" class="btn btn-warning">Buy Ticket</a>
                                        <%} else {%>
                                        <a href="login.jsp" class="btn btn-warning">Buy Ticket</a>
                                        <%}%>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </section>
                    <%}%>
                    
                </div>
            </div>
        </div>

        <!-- /.wrapper-box -->
        <%@include file="../template/footer.jsp" %>