

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
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@fortawesome/fontawesome-free@6.2.0/css/fontawesome.min.css" integrity="sha384-z4tVnCr80ZcL0iufVdGQSUzNvJsKjEtqYZjiQrrYKlpGow+btDHDfQWkFjoaz/Zr" crossorigin="anonymous">
        <title>Crear Empleado</title>
    </head>
    <body>
        <div class="container mt-5">
            <div class="row">
                <div class="col-sm">
                    <form action="crear.jsp" method="post">
                        <div class="form-group">
                            <label for="nombre">Nombre</label>
                            <input type="text" class=form-control" id="nombre" name="nombre" placeholder="Nombre" required="required">
                        </div>
                        <div class="form-group">
                            <label for="apellido">Apellido</label>
                            <input type="text" class=form-control" id="apellido" name="apellido" placeholder="Apellido" required="required">
                        </div>
                        <div class="form-group">
                            <label for="telefono">Telefono</label>
                            <input type="text" class=form-control" id="telefono" name="telefono" placeholder="Telefono" required="required">
                        </div>
                         <div class="form-group">
                             <label for="marcab">Marca Bicicleta</label>
                            <input type="text" class=form-control" id="marcab" name="marcab" placeholder="Marca Bicicleta" required="required">
                        </div>
                         <div class="form-group">
                     <label for="colorB">Color Bicicleta</label>
                            <input type="text" class=form-control" id="colorb" name="colorb" placeholder="Color Bicicleta" required="required">
                        </div>
                        <button type="submit" name="enviar" class="btn btn-primary">GUARDAR <i class="fa fa-floppy-o" aria-hidden="true"></i></button>
                    </form>
                </div>  
            </div>    
        </div> 
        <%
            if (request.getParameter("enviar") != null) {
                String nombre = request.getParameter("nombre");
                String apellido = request.getParameter("apellido");
                String telefono = request.getParameter("telefono");
                String marcab = request.getParameter("marcab");
                String colorb = request.getParameter("colorb");

                try {
                    Connection con = null;
                    Statement st = null;
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    con = DriverManager.getConnection("jdbc:mysql://localhost:3306/datos?user=root&password=");
                    st = con.createStatement();
                    st.executeUpdate("insert into usuarios (nombre,apellido,telefono,marcab,colorb) values('"+nombre+"','"+apellido+"','"+telefono+"','"+marcab+"','"+colorb+"');");
                    request.getRequestDispatcher("index.jsp").forward(request,response);
                } catch (Exception e) {
                    out.print(e);
                }
            }
        %>
    </body>
</html>
