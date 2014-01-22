<%-- 
    Document   : registrar
    Created on : 20-ene-2014, 13:20:52
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
        <div>Introduce los datos de usuario</div>
        <form action="Servlet_registro" name="form" method="POST">
            <span>Nombre</span><input type="text" name="nombre" /><br>
            <span>Clave</span><input type="password" name="clave" />
            <button>Enviar</button>
        </form>
    </body>
</html>
