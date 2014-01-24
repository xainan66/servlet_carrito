<%-- 
    Document   : acceder_db
    Created on : 24-ene-2014, 9:20:54
    Author     : postal
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="usuario" scope="session" class="modelo.Usuario" />
<jsp:getProperty name="usuario" property="nombre" />
<jsp:getProperty name="usuario" property="clave" />
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <% if((usuario.getNombre().toString().equals("pepe")) && (usuario.getClave().equals("1234"))) { %>
        <jsp:forward page="tienda.jsp" />
        <% } else { %>
        <h3>Error: no existe el usuario o contraseña</h3>
        <% } %>
    </body>
</html>
