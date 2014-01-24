<%-- 
    Document   : tienda
    Created on : 24-ene-2014, 9:37:24
    Author     : postal
--%>

<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@ page import="modelo.Producto" %>
<%@ page import="dao.HibernateUtil" %>
<%@ page import="org.hibernate.Query" %>
<%@ page import="org.hibernate.Session" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%  session = request.getSession(true);
            List<Producto> carrito;
            if(session.getAttribute("carrito")!=null) {
                carrito = (List)session.getAttribute("carrito");
            } else {
                carrito = new ArrayList();
            }
        %>
        <%  if(request.getParameter("idProducto")!=null) {
                String prod = request.getParameter("idProducto");
                Session hbSession = HibernateUtil.getSFactory().openSession();
                hbSession.beginTransaction();
                Query query = hbSession.createQuery("from Producto where id = "+prod);
                List<Producto> lista = query.list();
                hbSession.beginTransaction().commit();
                Producto producto = lista.get(0);
                carrito.add(producto);
            }%>
            <%  session.setAttribute("carrito", carrito);
                Session hbSession = HibernateUtil.getSFactory().openSession();
                hbSession.beginTransaction();            
                Query query = hbSession.createQuery("from Producto");
                List<Producto> lista = query.list();
                hbSession.beginTransaction().commit();
                hbSession.close(); %>
                
        <form name="form_productos" action="tienda.jsp">
            <table border="1" width="100%">
                <tr>
                   <th>Nombre</th>
                   <th>Precio</th>
                </tr>
                
                <%  Producto producto;
                    for(int i=0;i<lista.size();i++) {
                    producto = lista.get(i);
                    %>
                <tr>
                   <td style="display:none"><input type="hidden" name="idProducto" value="<%= producto.getId() %>" /></td>
                   <td><%= producto.getNombre() %></td>
                   <td><%= producto.getPrecio() %></td>
                   <td width="50"><input type="submit" value="Agregar" name="agregar" /></td>
                </tr>
                <% } %>
                
            </table>
        </form>
        <form name="form_compra" action="compra.jsp">
            <input type="submit" value="Finalizar compra" name="finalizar_compra" />
        </form>
    </body>
</html>
