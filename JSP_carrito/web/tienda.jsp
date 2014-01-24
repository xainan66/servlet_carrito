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
<%@ include file="js/javascript.js" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <sql:setDataSource var="snapshot" driver="org.apache.derby.jdbc.ClientDriver"
     url="jdbc:derby://localhost:1527/servlet_carrito"
     user="postal"  password="postal"/>

    <sql:query dataSource="${snapshot}" var="result">
        SELECT * from Productos
    </sql:query>
        <%  List<Producto> carrito;
            if(session.getAttribute("carrito")!=null) {
                carrito = (List)session.getAttribute("carrito");
            } else {
                carrito = new ArrayList();
            }
        %>
        <%  if(request.getParameter("productos")!=null) {
                String[] seleccionado;
                seleccionado = request.getParameterValues("productos");
                String prod = seleccionado[0];
                Session hbSession = HibernateUtil.getSFactory().openSession();
                hbSession.beginTransaction();
                Query query = hbSession.createQuery("from Producto where nombre = '"+prod+"' ");
                List<Producto> lista = query.list();
                hbSession.beginTransaction().commit();
                Producto producto = lista.get(0);
                carrito.add(producto);
            }%>
        <form name="form_productos" action="tienda.jsp">
            <table border="1" width="100%">
                <tr>
                   <th>Nombre</th>
                   <th>Precio</th>
                </tr>
                <c:forEach var="row" items="${result.rows}">
                <tr style="display:none">
                    <td><input type="hidden" name="id" value="${row.id}" /></td>
                </tr>
                <tr>
                   <td><c:out value="${row.nombre}"/></td>
                   <td><c:out value="${row.precio}"/></td>
                   <td width="50"><input type="submit" value="Agregar" name="agregar" /></td>
                </tr>
                </c:forEach>
            </table>
        </form>
        <form name="form_compra" action="compra.jsp">
            <input type="submit" value="Finalizar compra" name="finalizar_compra" />
        </form>
    </body>
</html>
