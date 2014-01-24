<%-- 
    Document   : compra
    Created on : 24-ene-2014, 10:30:23
    Author     : postal
--%>

<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="modelo.Producto" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<jsp:useBean id="usuario" scope="session" class="modelo.Usuario" />
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%  //String nombre = session.getAttribute("nombre").toString();
            List<Producto> carrito = (ArrayList)session.getAttribute("carrito");
            double total = 0.0;
            %>
        <h3>Gracias <%= usuario.getNombre() %> por comprar:</h3>
        <ul>
        <%  for(int i=0;i<carrito.size();i++) { %>
                <li><%= carrito.get(i).getNombre() %></li>
                <% total += carrito.get(i).getPrecio(); %>
           <% } %>
        </ul>
        <div>Importe: <%= total %></div>
    </body>
</html>
