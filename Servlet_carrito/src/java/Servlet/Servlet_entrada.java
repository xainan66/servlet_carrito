/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package Servlet;

import dao.HibernateUtil;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import modelo.*;
import org.hibernate.Query;
import org.hibernate.Session;

/**
 *
 * @author postal
 */
public class Servlet_entrada extends HttpServlet {

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
        try (PrintWriter out = response.getWriter()) {
            /*** request dispatcher ***/
            RequestDispatcher rd;
            String nombre = request.getParameter("nombre");
            String clave = request.getParameter("clave");
            Session hbSession = HibernateUtil.getSFactory().openSession();
            hbSession.beginTransaction();            
            Query query = hbSession.createQuery("from Usuario where clave = '"+clave+
                    "' and nombre = '"+nombre+"'");
            hbSession.beginTransaction().commit();
            List<Usuario> lista = query.list();
            hbSession.close();
            if(lista.size()==1) {
                Usuario usuario;
                HttpSession session=request.getSession(true);
                session.setAttribute("nombre", nombre);
                usuario = lista.get(0);
                rd = getServletContext().getRequestDispatcher("/Servlet_tienda");
                rd.forward(request, response);
            } else {
                rd = getServletContext().getRequestDispatcher("/Servlet_error");
                request.setAttribute("No se encuentra el usuario", rd);
                rd.forward(request, response);
            }
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
