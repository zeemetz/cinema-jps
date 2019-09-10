<%@page import="org.hibernate.criterion.Restrictions"%>
<%@page import="com.sun.rowset.internal.Row"%>
<%@page import="org.hibernate.Query"%>
<%@page import="java.util.List"%>
<%@page import="Bean.Reservation"%>
<%@page import="Controller.HibernateUtil"%>
<%@page import="org.hibernate.Session"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<html>
    <%@include file="template/header-loggedin.jsp"%>
    <head>
        <%!
            List reservations;
            String temp;
            final char seperator=' ';
            String[] picked;
            int total=0;
            int counter=0;
            String movieid;
        %>
        
        <%
            temp="";
            movieid = request.getParameter("movieid");
            Session sess = HibernateUtil.getSessionFactory().openSession();
            reservations = sess.createCriteria(Reservation.class)
                    .add(Restrictions.eq("movieid", movieid)).list();
            //Query query = sess.createQuery("from Reservation");
            //reservations = query.list();
            
            temp+=request.getParameter("temp")==null?"":request.getParameter("temp");
            
            picked = temp.split("-");
        %>
        
        <%!
            boolean isFree(int row, int seat){
                for(int i = 0 ; i < reservations.size() ; i ++){
                    Reservation r = (Reservation) reservations.get(i);
                    if(row==r.getRow() && seat==r.getSeat()){
                        return false;
                    }
                }
                return true;
            }
            boolean isPicked(String s){
                
                int index=0;
                
                while(true){
                    try{
                        if(s.compareToIgnoreCase(picked[index])==0 && isFree(s.charAt(0), Integer.parseInt(s.substring(1, 2)))){
                            return true;
                        }
                        index++;
                    }catch(Exception e){
                        break;
                    }
                }
                return false;
            }
            boolean isInList(String seats){
                if(temp.contains(seats)){
                    return true;
                }
                return false;
            }
        %>
        <script>
            var temp="";
            function reserve(row,seat)
            {
                temp+=row+seat+" ";
                document.getElementById("info").innerHTML=<%=temp%>;
            }
        </script>
        <style>
            p
            {
                text-decoration: none;
                color:white;
            }
            .picked
            {
                background-color: blue;
            }
            .seat
            {
                text-align: center;
                width:50;
                height:50;
                border:2px red solid;
                display:inline-block;
                border-radius: 20%;
            }
            .seat:hover
            {
                border-radius: 50%;
            }
            .taken
            {
                background-color: red;
            }
            .free
            {
                background-color: green;
            }
        </style>
        
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Seat Reservation</title>
    </head>
    <body>
        
        <!--h2 id='info' >Pick Seat</h2-->
    <center>
        <div class="wrapper container centerbox">
        
            <%
                for(char i = 'A' ; i < 'J' ; i++)
                {
            %>

                    <%
                            for(int j = 0 ; j < 10; j++)
                            {
                    %>
                    <a href="reservation.jsp?movieid=<%=movieid%>&temp=<%if(isFree(i, j)&&!isInList(i+""+j)){%><%=temp+i+j+'-'%><%}%>">
                                    <div onclick="reserve('<%=i%>',<%=j%>)" 
                                         class="seat<%
                                         if(isPicked(i+""+j)) out.print(" picked");
                                         else {
                                            if(isFree(i, j)) out.print(" free");  
                                            else out.print(" taken"); 
                                        }%>">
                                        <p><%=i%>&CenterDot;<%=j%></p>
                                    </div>
                                </a>
                    <%
                            }
                    %>

                    <br/>
            <%
                }
            if(request.getParameter("err")!=null)out.print(request.getParameter("err"));
            %>
        </div>
            <a href='Reservation?movieid=<%=movieid%>&seat=<%=temp+'#'%>'><button class="btn btn-large btn-primary">Buy Tickets</button></a>
    </center>
        <%@include file="template/footer.jsp"%>
    </body>
</html>
