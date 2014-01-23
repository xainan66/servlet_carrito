<%-- 
    Document   : entrada
    Created on : 23-ene-2014, 9:26:30
    Author     : postal
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="usuario" scope="request" class="modelo.Usuario" />
<jsp:setProperty name="usuario" property="nombre" value='<% request.getParameter("nombre") %>' />
<jsp:setProperty name="usuario" property="clave" value='<% request.getParameter("clave") %>' />
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            if((usuario.getNombre().equals("pepe")) && (usuario.getClave().equals("1234"))) { 
                %>
                <jsp:forward page="entrada2" />
        <%    } else {
                %>
                <h2>Usuario o contraseña incorrectos</h2>
            <%}
        %>
        <%= usuario.getClave() %>
    </body>
</html>
