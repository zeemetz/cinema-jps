/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package Servlet;

import Bean.Movies;
import Controller.MainClass;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Kelvin
 */
public class InsertMovies extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            String inputTitle = request.getParameter("inputTitle");
            String inputGenre = request.getParameter("inputGenre");
            String inputCategory = request.getParameter("inputCategory");
            String inputSutradara = request.getParameter("inputSutradara");
            String inputCompany = request.getParameter("inputCompany");
            String inputRating = request.getParameter("inputRating");
            String inputDateStart = request.getParameter("inputDateStart");
            String inputDateEnd = request.getParameter("inputDateEnd");
            String inputDuration = request.getParameter("inputDuration");
            String inputDescription = request.getParameter("inputDescription");
            String inputImages = request.getParameter("inputImages");
            
            /*String saveFile = "";
            String contentType = request.getContentType();
            if((contentType != null) && (contentType.indexOf("multipart/form-data") >= 0)){
                DataInputStream in = new DataInputStream(request.getInputStream());
                int formDataLength = request.getContentLength();
                byte dataBytes[] = new byte[formDataLength];
                int byteRead = 0;
                int totalBytesRead = 0;
                while(totalBytesRead < formDataLength){
                    byteRead = in.read(dataBytes, totalBytesRead, formDataLength);
                    totalBytesRead += byteRead;
                }
                try{
                    String file = new String(dataBytes);
                    saveFile = file.substring(file.indexOf("filename=\"") + 10);
                    saveFile = saveFile.substring(0, saveFile.indexOf("\n"));
                    saveFile = saveFile.substring(saveFile.lastIndexOf("\\") +1, saveFile.indexOf("\""));
                    if(!saveFile.equalsIgnoreCase("")){
                        int lastIndex = contentType.lastIndexOf("=");
                        String boundary = contentType.substring(lastIndex + 1,contentType.length());
                        int pos;
                        pos = file.indexOf("filename=\"");
                        pos = file.indexOf("\n", pos) + 1;
                        pos = file.indexOf("\n", pos) + 1;
                        pos = file.indexOf("\n", pos) + 1;
                        int boundaryLocation = file.indexOf(boundary, pos) - 4;
                        int startPos = ((file.substring(0, pos)).getBytes()).length;
                        int endPos = ((file.substring(0, boundaryLocation)).getBytes()).length;
                        String path = request.getSession().getServletContext().getRealPath(request.getServletPath());
                        String type = saveFile.substring(saveFile.lastIndexOf(".")+1);
                        path = path.substring(0, path.lastIndexOf("\\")) + "/assets/img/movie-poster/";
                        if(type.equalsIgnoreCase("jpeg") || type.equalsIgnoreCase("jpg") || type.equalsIgnoreCase("png") || type.equalsIgnoreCase("bmp")){
                            FileOutputStream fileOut = new FileOutputStream(path + saveFile);
                            HttpSession ses = request.getSession();
                            fileOut.write(dataBytes, startPos, (endPos - startPos));
                            fileOut.flush();
                            fileOut.close();*/
                            try {
                                MainClass mc = new MainClass();
                                Movies mov = new Movies(inputTitle, inputGenre, inputSutradara, inputCompany, inputCategory, inputDescription, inputImages, "-", inputDateStart, inputDateEnd, mc.toInt(inputRating), mc.toInt(inputDuration));
                                mc.insert(mov);
                                response.sendRedirect("add-movie.jsp?err=0");
                            } catch (Exception e) {
                                response.sendRedirect("add-movie.jsp?err=99");
                            }
                        /*}
                        else{
                            out.print("AAA2");
                            //response.sendRedirect("add-movie.jsp?err=99");
                        }
                    }
                    else{
                            out.print("AAA3");
                        //response.sendRedirect("add-movie.jsp?err=99");
                    }
                }catch(Exception e){
                    out.write(e.getMessage().toString());
                }
            }*/
        } finally {
            out.close();
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
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
     * Handles the HTTP <code>POST</code> method.
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
