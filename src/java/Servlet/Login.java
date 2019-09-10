
package Servlet;

import Bean.MsUser;
import Controller.HibernateUtil;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.hibernate.Session;
import org.hibernate.criterion.Restrictions;

public class Login extends HttpServlet {
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException 
    {
        Md5 a = new Md5();
        
        String username = request.getParameter("usertxt");
        String password = request.getParameter("passtxt");

        Session sess = HibernateUtil.getSessionFactory().openSession();
        List users = sess.createCriteria(MsUser.class)
                .add(Restrictions.eq("username", username))
                .add(Restrictions.eq("password", a.getHash(password))).list();
        
        HttpSession session = request.getSession();
    
        if(users.size()!=0)
        {
            MsUser user = (MsUser) users.get(0);
            String name;
            if(user.getGender().equals("Male")) name = "Mr. ";
            else if(user.getGender().equals("Female")) name = "Mrs. ";
            else name="";
            
            name += user.getFullname();
            
            session.setAttribute("user", name);
            session.setAttribute("role", user.getRole());
            
            response.sendRedirect("index.jsp");
        }
        else
        {
            response.sendRedirect("./login.jsp?err=Wrong Username or Password");
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
