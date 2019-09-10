<%@ include file="template/header.jsp" %>

    <div class="wrapper container centerbox">
        <div class="wrapper-box">
            <form class="form-signin" action="Login">
                <h2 class="form-signin-heading">Please sign in</h2>
                <input name="usertxt"type="text" class="input-block-level" placeholder="Email address">
                <input name="passtxt"type="password" class="input-block-level" placeholder="Password">
                <label class="checkbox">
                    <input type="checkbox" value="remember-me">Remember me
                </label>
                <label style="color:red">
                    <%if(request.getParameter("err")!=null)out.print(request.getParameter("err"));%>
                </label>
                <button class="btn btn-large btn-primary" type="submit">Sign in</button>

            </form>

        </div>
<%@ include file="template/footer.jsp" %>
