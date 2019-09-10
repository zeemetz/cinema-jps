/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlet;

import Bean.MsUser;
import Controller.HibernateUtil;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.hibernate.Hibernate;
import org.hibernate.Session;
import org.hibernate.Transaction;

/**
 *
 * @author prk
 */
public class Registration extends HttpServlet {

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
    
    boolean isValid(String username, String password, String fullname, String gender, String genre, String dob)
    {
        String pattern = "^(?=.*[0-9])(?=.*[a-z])(?=\\S+$).{10,}$";
        if( username.isEmpty() || password.isEmpty() || fullname.isEmpty() || gender.isEmpty() || genre.isEmpty() )
            return false;
        if(!gender.equals("male")&&gender.equals("female"))
            return false;
        if(fullname.contentEquals("admin"))
            return false;
        try
        {
            Date temp = new SimpleDateFormat("yyyy-mm-dd", Locale.ENGLISH).parse(dob);
        }catch(Exception e){return false;};
		
        return password.matches(pattern);
    }
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, ParseException {
        response.setContentType("text/html;charset=UTF-8");
        HttpSession session = request.getSession();
        PrintWriter out = response.getWriter();
        Session sess = HibernateUtil.getSessionFactory().openSession();
        Transaction tran = sess.beginTransaction();
        
        String username = session.getAttribute("username").toString();
        String password = session.getAttribute("password").toString();
        String fullname = session.getAttribute("fullname").toString();
        String gender = session.getAttribute("gender").toString();
        String genre = session.getAttribute("genre").toString();
        String dateOfBirth = session.getAttribute("dateofbirth").toString();
        
        
        if(isValid(username, password, fullname, gender, genre, dateOfBirth))
        {
             try{
                    tran.begin();
                    MsUser user = new MsUser( username,  password,  gender,  genre,  fullname,  dateOfBirth);
                    sess.save(user);
                    tran.commit();
                    response.sendRedirect("login.jsp");
             }catch(Exception e){ out.print(e);tran.rollback(); }
        }
        else
            response.sendRedirect("registration.jsp?err=Wrong Data on Registration Field");
        
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
        try {
            processRequest(request, response);
        } catch (ParseException ex) {
            Logger.getLogger(Registration.class.getName()).log(Level.SEVERE, null, ex);
        }
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
        try {
            processRequest(request, response);
        } catch (ParseException ex) {
            Logger.getLogger(Registration.class.getName()).log(Level.SEVERE, null, ex);
        }
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
