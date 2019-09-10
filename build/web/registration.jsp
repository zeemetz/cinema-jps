<%
    if(session.getAttribute("user")!=null){
        response.sendRedirect("index.jsp");
    }
%>

<%@include file="template/header.jsp" %>
    <!-- Carousel==================================================* -->
    <div class="wrapper container">
        <h2>Registration</h2>

        <div class="wrapper-box">
            <form class="bs-docs-example form-horizontal" action="capcha.jsp" method="post">
                <div class="control-group">
                    <label class="control-label" for="inputEmail">Email</label>
                    <div class="controls">
                        <input name="email" type="email" id="inputEmail" placeholder="Your Email" class="span4">
                    </div>
                </div>
                <div class="control-group">
                    <label class="control-label" for="inputPassword">Password</label>
                    <div class="controls">
                        <input name="password" type="password" id="inputPassword" placeholder="Password must be alphanumeric" class="span4">
                    </div>
                </div>
                <div class="control-group">
                    <label class="control-label" for="inputConfirm">Confirm Password</label>
                    <div class="controls">
                        <input type="password" id="inputConfirm" placeholder="Password Confirmation" class="span4">
                    </div>
                </div>
                <div class="control-group">
                    <label class="control-label" for="inputName">Full Name</label>
                    <div class="controls">
                        <input name="fullname" type="text" id="inputName" placeholder="Your Full Name" class="span4">
                    </div>
                </div>
                <div class="control-group">
                    <label class="control-label" for="inputGender">Gender</label>
                    <div class="controls">
                        <input type="radio" name="gender" value="male" />&nbsp;Male
                        <input type="radio" name="gender" value="female" />&nbsp;Female
                    </div>
                </div>
                <div class="control-group">
                    <label class="control-label" for="inputDOB">Date of Birth</label>
                    <div class="controls">
                        <input name="dateofbirth" type="date" id="inputDOB" class="span4" />
                    </div>
                </div>
                <div class="control-group">
                    <label class="control-label" for="inputFavorite">Favorite Genre</label>
                    <div class="controls">
                        <select name="genre" id="inputPlayingAt" data-placeholder="Favorite Genre" class="chosen-select span4" multiple tabindex="6">
                            <option value=""></option>
                            <option>Action</option>
                            <option>Animation</option>
                            <option>Comedy</option>
                            <option>Horror</option>
                            <option>Romance</option>
                            <option>Thriller</option>
                        </select>
                    </div>
                </div><div class="control-group">
                   <img src="captcha" alt='captcha'/>
                        <input name="answer" />
                        </div>
                <div class="control-group">
                    <label class="control-label" for="inputFavorite" style="color: red">
                        <%if(request.getParameter("err")!=null)out.print(request.getParameter("err"));%>
                    </label>
                </div>
                    
                
                <div class="control-group">
                    <div class="controls">
                        <button type="submit" class="btn btn-primary">Register</button>
                    </div>
                </div>
            </form>
        </div>

        <!-- /.wrapper-box -->
        <%@include file="template/footer.jsp" %>