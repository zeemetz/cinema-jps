
<%@page import="org.hibernate.criterion.Restrictions"%>
<%@page import="Bean.MsUser"%>
<%@page import="Controller.HibernateUtil"%>
<%@page import="org.hibernate.Session"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*" %>

<%
    String username = request.getParameter("usertxt");
    String password = request.getParameter("passtxt");
    
    Session sess = HibernateUtil.getSessionFactory().openSession();
    List users = sess.createCriteria(MsUser.class)
            .add(Restrictions.eq("username", username))
            .add(Restrictions.eq("password", password)).list();
    
    for(int i = 0 ; i<users.size() ; i++){
        MsUser user = (MsUser)users.get(i);
        out.print(user.getUsername() + " " + user.getPassword());
    }
%>
