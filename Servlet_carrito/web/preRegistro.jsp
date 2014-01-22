<%-- 
    Document   : postAcceso
    Created on : 22-ene-2014, 14:11:01
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
        <h1>
            <%
                if (Integer.parseInt(request.getParameter("edad").toString())<18) {
            %>
                    <jsp:forward page="menores.jsp" />
            <%                
                } else {
            %>
                    <jsp:forward page="mayores.jsp" />
            <%
                }
            %>
        </h1>
    </body>
</html>
