 <%@ page import="nl.captcha.Captcha" %>
    ...
    <% // We're doing this in a JSP here, but in your own app you'll want to put
    // this logic in your MVC framework of choice.
    Captcha captcha = (Captcha) session.getAttribute(Captcha.NAME);
    // Or, for an AudioCaptcha:
    // AudioCaptcha captcha = (AudioCaptcha) session.getAttribute(Captcha.NAME);
    request.setCharacterEncoding("UTF-8"); // Do this so we can capture non-Latin chars
    String answer = request.getParameter("answer");
    if (captcha.isCorrect(answer)) { 
        
        session.setAttribute("username", request.getParameter("email"));
        session.setAttribute("password", request.getParameter("password"));
        session.setAttribute("fullname", request.getParameter("fullname"));
        session.setAttribute("gender", request.getParameter("gender"));
        session.setAttribute("genre", request.getParameter("genre"));
        session.setAttribute("dateofbirth", request.getParameter("dateofbirth"));
        
        session.invalidate();
        response.sendRedirect("Registration");
        
    }
    else{
        response.sendRedirect("registration.jsp?err=Wrong Captcha Input");
        
    }
    %>