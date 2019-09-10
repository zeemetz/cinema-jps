/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlet;

import Controller.HibernateUtil;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.Vector;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;


/**
 *
 * @author prk
 */

public class Reservation extends HttpServlet {

    /**
     * Processes requests for both HTTP
     * <code>GET</code> and
     * <code>POST</code> methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        Session sess = HibernateUtil.getSessionFactory().openSession();
        PrintWriter out = response.getWriter();
        Transaction tran = sess.beginTransaction();
        String status = request.getParameter("status");
        if(status!=null)
        {
            out.println("<html>");
            out.println("<head>");
            out.print("<meta http-equiv='refresh' content='2;now-playing.jsp' />");
            out.print("<style>");
            out.print("body{color:blue;font-size:50;align:center;}");
            out.print("</style>");
            out.println("<title>Confirmation</title>");            
            out.println("</head>");
            out.println("<body>");
            out.print("<center>");
                out.print("Thank For Your Purchasing");
            out.print("</center>");
            out.print("</body>");
            out.print("</html>");
            
        }
        else
        {
        
        String seats = request.getParameter("seat");
        
        int totalPrice=0;
        int index=0;
        String[] temp = seats.split("-");
        String movieid =request.getParameter("movieid");
        out.println("<html>");
        out.println("<head>");
        out.print("<style>");
        out.print("body{color:red;font-size:20;align:center;}");
        out.print("</style>");
        out.println("<title>Confirmation</title>");            
        out.println("</head>");
        out.println("<body>");
        out.print("<center>");
        out.print("Ticket Price : Rp. 20.000");
        out.print("<br/>");
        while(true)
        {
            try{
                char row = temp[index].charAt(0);
                int seat = Integer.parseInt(temp[index].substring(1, 2));
                out.print(row+""+seat+" ");
                index++;
                /*try{
                    tran.begin();
                    Bean.Reservation resevation = new Bean.Reservation(row+""+seat, row, seat);
                    sess.save(resevation);
                    tran.commit();
                }catch(Exception e){ out.print(e);tran.rollback(); }
                */
            }
            catch(Exception e)
            {
                break;
            }
        }
        session.setAttribute("movieid", movieid);
        out.print("<hr width=50% align='center'/>");
        out.print("Total Tickets : "+index);
        out.print("<br/>");
        out.print("Total Payment : "+(index*20000));
        out.print("<br/>");
        out.print("<hr width=50% align='center'/>");
        out.print("<a href='InsertReservation?seats="+seats+"&totalTickets="+index+"'><button>Ok</button></a>");
        out.print("</center>");
        out.println("</body>");
        out.println("</html>");
        //response.sendRedirect("reservation.jsp");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP
     * <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP
     * <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}
