<%-- 
    Document   : index
    Created on : 16-ene-2014, 12:55:01
    Author     : postal
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            out.println("Escribe tu nombre y clave");
        %>
        <form action="Servlet_entrada" name="form" method="POST">
            <input type="text" name="nombre" /><br>
            <input type="password" name="clave" />
            <jsp:forward page="date.jsp" />
            <button>Enviar</button>
        </form>
    </body>
</html>