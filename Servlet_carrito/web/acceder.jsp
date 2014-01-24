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
        <h3>Escribe tu nombre y clave</h3>
        <form action="Servlet_entrada" name="form" method="POST">
            <span>Nombre </span><input type="text" name="nombre" /><br>
            <span>Clave </span><input type="password" name="clave" />
            <button>Enviar</button>
        </form>
    </body>
</html>