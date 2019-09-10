<%@include file="template/header.jsp" %>

    <div class="wrapper container" data-spy="scroll">
        <div class="wrapper-box">
            <h2>Coming Soon</h2>
            <div class="row">
                <div class="span3">
                    <div class="well">
                        <ul class="nav nav-list">
                        <%
                            String sideSyarat = "";
                            if(null != request.getParameter("txtSearch") && !"".equals(request.getParameter("txtSearch").trim())){
                                sideSyarat = " AND MovieName like '%" + request.getParameter("txtSearch") + "%' ";
                            }
                            else sideSyarat = " AND 1 ";
                            
                            String q2 = "SELECT * FROM movies WHERE DateStart > NOW() " + sideSyarat ;
                            List<Movies> mov2 =  mc.getData(q2, Movies.class);
                            for(int i=0; i<mov2.size(); i++){
                        %>
                                <li><a href="#<%=mov2.get(i).getMovieid()%>"><%=mov2.get(i).getMoviename() %></a></li>
                        <%
                            }

                            Integer current_page = 0, data_per_page = 0, maxpage = 0, maxdata = 0, flagPrevNext = 0;
                            String syarat = " where DateStart > NOW() AND ";
                            if(null != request.getParameter("page")){
                                current_page = Integer.parseInt(request.getParameter("page").toString());
                            }
                            else current_page = 1;
                            if(null != request.getParameter("txtSearch") && !"".equals(request.getParameter("txtSearch").trim())){
                                syarat += " MovieName like '%" + request.getParameter("txtSearch") + "%' ";
                            }
                            else syarat += " 1 ";

                            data_per_page = 5;
                            q = "SELECT * FROM movies " + syarat;
                            List<Movies> mov =  mc.getData(q, Movies.class);
                            maxdata = mov.size();
                            maxpage = maxdata / data_per_page;
                            if(maxdata % data_per_page != 0) maxpage++;
                            String queryresult = "SELECT * FROM movies " + syarat + " limit " + ((current_page-1)*data_per_page) + "," + data_per_page;
                            mov =  (List<Movies>) mc.getData(queryresult, Movies.class);
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
                                        

                                        if(maxpage > 2){
                                        %>
                                            <li><a href="comingsoon.jsp?page=<%=current_page-1%>#main">Prev</a></li>
                                        <%
                                        }

                                          for(int i=1; i<=maxpage; i++){
                                        %>
                                            <li><a href="comingsoon.jsp?page=<%=i%>#main"><%=i %></a></li>
                                        <% 
                                          }
                                              if(maxpage > 2){
                                        %>
                                            <li><a href="comingsoon.jsp?page=<%=current_page+1%>#main">Next</a></li>
                                        <%
                                              }
                                        %>
                                </ul>
                            </div>
                        </div>
                    </div>
                    
                <%
                    }
                    while(mov.size() > 0){
                %>

                    <section id="hungergames" class="movielist">
                        <div class="row" id="<%=mov.get(0).getMovieid()%>">
                            <div class="span2" class="img-movie">
                                <img src="assets/img/movie-poster/<%=mov.get(0).getImage()%>" />
                            </div>
                            <div class="span5">
                                <div class="row">
                                    <h4 class="movie-title span5"><a href="view-movies.jsp?id=<%=mov.get(0).getMovieid()%>"><%=mov.get(0).getMoviename()%></a></h4>
                                </div>
                                <div class="row synopsis-movie">
                                    <p class="span5">
                                        <%=mov.get(0).getSynopsis()%>
                                        <a href="view-movies.jsp?id=<%=mov.get(0).getMovieid()%>">Read more..</a>
                                    </p>
                                </div>
                                <div class="row">
                                    <div class="span4">
                                        <a href="view-movies.jsp?id=<%=mov.get(0).getMovieid()%>" class="btn btn-info">View Trailer</a>                                        
                                    </div>
                                </div>
                            </div>
                        </div>
                    </section>
                <%
                        mov.remove(0);
                    }
                %>
                </div>
              </div>
            </div>
        </div>
                <div style="text-align:  center !important;">
        <!-- /.wrapper-box -->
        <%@include file="template/footer.jsp" %>
        </div>