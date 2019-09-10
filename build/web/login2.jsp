
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Hibernate Login</title>
    </head>
    <body>
        <h1>Hibernate Login</h1>
        <h2>Welcome, <%= session.getAttribute("user") %></h2>
        <h6><a href="Logout">Logout</a></h6>
        <h6><a href="reservation.jsp">Ticket Reservation</a></h6>
        <form action="./Login" method="post">
            <table>
                <tr>
                    <td>Username</td><td>:</td><td><input type='text' name='usertxt' /></td>
                </tr>
                
                <tr>
                    <td>Password</td><td>:</td><td><input type='password' name="passtxt" /></td>
                </tr>
                <tr>
                    <td colspan="3"><input type='submit' value="Login" /></td>
                </tr>
                <tr>
                    <td colspan="3"><%= request.getParameter("err") %></td>
                </tr>
            </table>
        </form>
    </body>
</html>
