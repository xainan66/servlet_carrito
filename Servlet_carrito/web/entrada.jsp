<%-- 
    Document   : entrada
    Created on : 23-ene-2014, 9:26:30
    Author     : postal
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="usuario" scope="request" class="modelo.Usuario" />
<jsp:getProperty name="usuario" property="*" />
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            if((usuario.getNombre().equals("pepe")) && (usuario.getClave().equals("1234"))) { 
                out.println("Bienvenido "+usuario.getNombre());
            } else {
                out.println("Usuario o contraseña incorrectos");
            }
        }%>
        <%= usuario.getClave() %>
    </body>
</html>
