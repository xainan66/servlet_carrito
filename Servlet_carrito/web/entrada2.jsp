<%-- 
    Document   : entrada2
    Created on : 23-ene-2014, 10:24:51
    Author     : postal
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="usuario" scope="request" class="modelo.Usuario" />
<jsp:setProperty name="usuario" property="nombre" value="<% request.getParameter('nombre') %>" />
<jsp:setProperty name="usuario" property="clave" value="<% request.getParameter('clave') %>" />
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        Bienvenido <%= usuario.getNombre() %>
    </body>
</html>
