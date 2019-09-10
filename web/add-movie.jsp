<%
    if(!session.getAttribute("role").equals("Admin")){
        response.sendRedirect("index.jsp");
    }
%>

<%@include file="template/header.jsp" %>
    <!-- Carousel==================================================* -->
    <div class="wrapper container">
        <h2>Add Movie</h2>

        <div class="wrapper-box">
            <form class="bs-docs-example form-horizontal" method="post" action="./InsertMovies">
                <div class="control-group">
                    <label class="control-label" for="inputTitle">Title</label>
                    <div class="controls">
                        <input type="text" name="inputTitle" placeholder="Movie Title" class="span4">
                    </div>
                </div>
                <div class="control-group">
                    <label class="control-label" for="inputGenre">Genre</label>
                    <div class="controls">
                        <select name="inputGenre" class="span4">
                            <option value="Action">Action</option>
                            <option value="Animation">Animation</option>
                            <option value="Commedy">Comedy</option>
                            <option value="Horror">Horror</option>
                            <option value="Romance">Romance</option>
                            <option value="Thriller">Thriller</option>
                        </select>
                    </div>
                </div>
                <div class="control-group">
                    <label class="control-label" for="inputSutradara">Sutradara</label>
                    <div class="controls">
                        <input type="text" name="inputSutradara" placeholder="Sutradara" class="span4">
                    </div>
                </div>
                <div class="control-group">
                    <label class="control-label" for="inputCompany">Company</label>
                    <div class="controls">
                        <input type="text" name="inputCompany" placeholder="Company" class="span4">
                    </div>
                </div>
                <div class="control-group">
                    <label class="control-label" for="inputCategory">Category</label>
                    <div class="controls">
                        <select name="inputCategory" class="span4">
                            <option value="G">G - General Audience</option>
                            <option value="PG">PG - Parental Guidance Suggested</option>
                            <option value="PG13">PG13 - Parents Strongly Cautioned</option>
                            <option value="R">R - Restricted</option>
                            <option value="NC17">NC17 - No One Under 17 Admitted</option>
                        </select>
                    </div>
                </div>
                <div class="control-group">
                    <label class="control-label" for="inputRating">Rating</label>
                    <div class="controls">
                        <select name="inputRating" class="span4">
                            <option value="1">1</option>
                            <option value="2">2</option>
                            <option value="3">3</option>
                            <option value="4">4</option>
                            <option value="5">5</option>
                        </select>
                    </div>
                </div>
                <div class="control-group">
                    <label class="control-label" for="inputDateStart">Date Start</label>
                    <div class="controls">
                        <input type="date" name="inputDateStart" class="span4">
                    </div>
                </div>
                <div class="control-group">
                    <label class="control-label" for="inputDateEnd">Date End</label>
                    <div class="controls">
                        <input type="date" name="inputDateEnd" class="span4">
                    </div>
                </div>
                <div class="control-group">
                    <label class="control-label" for="inputDuration">Duration</label>
                    <div class="controls">
                        <input type="text" name="inputDuration" class="span4">
                    </div>
                </div>
                <div class="control-group">
                    <label class="control-label" for="inputDescription">Description</label>
                    <div class="controls">
                        <textarea class="span4" name="inputDescription"></textarea>
                    </div>
                </div>
                <div class="control-group">
                    <label class="control-label" for="inputImages">Poster</label>
                    <div class="controls">
                        <input type="file" name="inputImages" class="span4" />
                    </div>
                </div>
                <div class="control-group" style="color: #F00; margin-left: 100px;">
                    <%
                        if(null != request.getParameter("err") && !"".equals(request.getParameter("err"))){
                            String err = request.getParameter("err");
                            if("0".equals(err)) out.print("New Movies is successfully inserted");
                            else if("99".equals(err)) out.print("Upload poster error!");
                        }
                    %>
                </div><br />
                <div class="control-group">
                    <div class="controls">
                        <button type="submit" class="btn">Save</button>
                        <button type="reset" class="btn">Reset</button>
                    </div>
                </div>
            </form>
        </div><br /><br />

        <!-- /.wrapper-box -->
        <%@include file="template/footer.jsp" %>