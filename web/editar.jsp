<%-- 
    Document   : editar
    Created on : 19/10/2022, 11:35:57 a. m.
    Author     : fepip
--%>

<%@page import="java.sql.*"%>
<%@page import="java.sql.Connection"%>
<%@page import="org.apache.tomcat.dbcp.dbcp2.PoolingConnection.StatementType"%>
<%@page import="sun.tools.jconsole.ConnectDialog"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
        <title>Editar Usuario</title>
    </head>
    <body>
        <%
            String id = request.getParameter("id");
            String nombre = request.getParameter("nombre");
            String apellido = request.getParameter("apellido");
            String telefono = request.getParameter("telefono");
            String marcab = request.getParameter("marcab");
            String colorb = request.getParameter("colorb");

        %>
        <div class="container mt-5">
            <div class="row">
                <div class="col-sm">
                    <form action="editar.jsp" method="get">
                        <div class="form-group">
                            <label for="nombre">Nombre</label>
                            <input type="text" class=form-control" id="nombre" value="<%= nombre %>" name="nombre" placeholder="Nombre" required="required">
                        </div>
                        <div class="form-group">
                            <label for="apellido">Apellido</label>
                            <input type="text" class=form-control" id="apellido" value="<%= apellido %>" name="apellido" placeholder="Apellido" required="required">
                        </div>
                        <div class="form-group">
                            <label for="telefono">Telefono</label>
                            <input type="text" class=form-control" id="telefono" value="<%= telefono %>" name="telefono" placeholder="Telefono" required="required">
                        </div>
                        <div class="form-group">
                            <label for="marcab">Marca Bicicleta</label>
                            <input type="text" class=form-control" id="marcab" value="<%= marcab %>" name="marcab" placeholder="Marca Bicicleta" required="required">
                        </div>
                        <div class="form-group">
                            <label for="colorB">Color Bicicleta</label>
                            <input type="text" class=form-control" id="colorb" value="<%= colorb %>" name="colorb" placeholder="Color Bicicleta" required="required">
                        </div>
                        <a href="index.jsp" class="btn btn-danger">Cancelar <i class="fa fa-ban" aria-hidden="true"></i></a>
                        <button type="submit" name="enviar" class="btn btn-primary">GUARDAR <i class="fa fa-floppy-o" aria-hidden="true"></i></button>
                        <input type="hidden" name="id" value="<%= id%>">
                    </form>
                </div>  
            </div>    
        </div> 
        <%            if (request.getParameter("enviar") != null) {

                try {
                    Connection con = null;
                    Statement st = null;
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    con = DriverManager.getConnection("jdbc:mysql://localhost:3306/datos?user=root&password=");
                    st = con.createStatement();
                    st.executeUpdate("update usuarios set nombre='" + nombre + "',apellido='" + apellido + "',telefono='" + telefono + "',marcab='" + marcab + "',colorb='" + colorb + "' where id='" + id + "';");
                    //redirecciona index request.getRequestDispatcher("index.jsp").forward(request, response);
                } catch (Exception e) {
                    out.print(e);
                }
            }
        %>
    </body>
</html>