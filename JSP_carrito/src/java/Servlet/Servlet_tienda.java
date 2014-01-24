/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package Servlet;

import dao.HibernateUtil;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import modelo.Producto;
import org.hibernate.Query;
import org.hibernate.Session;

/**
 *
 * @author postal
 */
public class Servlet_tienda extends HttpServlet {

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
            HttpSession session = request.getSession(false);
            List<Producto> carrito;
            if(session.getAttribute("carrito")!=null) {
                carrito = (List)session.getAttribute("carrito");
            } else {
                carrito = new ArrayList();
            }
            if(request.getParameter("productos")!=null) {
                String[] seleccionado;
                seleccionado = request.getParameterValues("productos");
                String prod = seleccionado[0];
                Session hbSession = HibernateUtil.getSFactory().openSession();
                hbSession.beginTransaction();
                Query query = hbSession.createQuery("from Producto where nombre = '"+prod+"' ");
                List<Producto> lista = query.list();
                hbSession.beginTransaction().commit();
                Producto producto = lista.get(0);
                carrito.add(producto);
            }
            session.setAttribute("carrito", carrito);
            Session hbSession = HibernateUtil.getSFactory().openSession();
            hbSession.beginTransaction();            
            Query query = hbSession.createQuery("from Producto");
            List<Producto> lista = query.list();
            hbSession.beginTransaction().commit();
            hbSession.close();
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet Servlet_tienda</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<form name='carrito' method='GET' action='Servlet_tienda'>");
            out.println("<select name='productos'>");
            Producto producto;
            for(int i=0;i<lista.size();i++) {
                producto = lista.get(i);
                out.println("<option value='"+producto.getNombre()+"'><span>"+producto.getNombre()+
                        "</span>&nbsp<span>Precio: "+producto.getPrecio()+"</span></option>");
            }
            out.println("</select>");
            out.println("<button>Añadir</button>");
            out.println("</form>");
            out.println("<form name='' method='GET' action='Servlet_finalizar'>");
            out.println("<button>Finalizar</button>");
            out.println("</form>");
            out.println("</body>");
            out.println("</html>");
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
