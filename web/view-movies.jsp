<%@include file="template/header.jsp" %>
    <!-- Carousel==================================================* -->
    <div class="wrapper container">
        
        <%
            String par = request.getParameter("id");
            q = "SELECT * FROM movies";
            List<Movies> mov =  mc.getData(q, Movies.class);
        %>
        <h2><%=mov.get(0).getMoviename() %></h2>
        <!-- Three columns of text below the carousel -->

        <div class="wrapper-box">

            <div class="row">
                <div class="row_movies">
                    <div>
                        <div style="float: left; margin-left: 35px;">
                            <img src="assets/img/movie-poster/<%=mov.get(0).getImage()%>" width="257" height="400" class="img-thumbnail" /> 
                        </div>
                        <div style="float: left; margin-left: 150px;">
                            <embed width="507" height="380" src="http://www.youtube.com/v/<%=mov.get(0).getNote()%>" type="application/x-shockwave-flash">
                            </embed>
                        </div>
                    </div>
                    <div style="clear: both;"></div>
                    <table>
                        <tr>
                            <td class="column_name">Synopsis</td>
                            <td><%=mov.get(0).getSynopsis()%></td>
                        </tr>
                        <tr>
                            <td class="column_name">Genre</td>
                            <td><%=mov.get(0).getGenre()%></td>
                        </tr>
                        <tr>
                            <td class="column_name">Director</td>
                            <td><%=mov.get(0).getSutradara()%></td>
                        </tr>
                        <tr>
                            <td class="column_name">Company</td>
                            <td><%=mov.get(0).getCompany()%></td>
                        </tr>
                        <tr>
                            <td class="column_name">Category</td>
                            <td><%=mov.get(0).getCategory()%></td>
                        </tr>
                        <tr>
                            <td class="column_name">Rating</td>
                            <td><%=mov.get(0).getRating()%></td>
                        </tr>
                        <tr>
                            <td class="column_name">Starting Date</td>
                            <td><%=mov.get(0).getDataStart() %></td>
                        </tr>
                        <tr>
                            <td class="column_name">End Date</td>
                            <td><%=mov.get(0).getDateEnd()%></td>
                        </tr>
                        <tr>
                            <td class="column_name">Duration</td>
                            <td><%=mov.get(0).getDuration()%> mins</td>
                        </tr>
                    </table>
                    
                </div>
            </div>
            
        </div>

        <!-- /.wrapper-box -->
        <%@include file="template/footer.jsp" %>