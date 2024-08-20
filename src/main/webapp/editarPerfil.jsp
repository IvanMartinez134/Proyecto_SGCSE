<%--
  Created by IntelliJ IDEA.
  User: death
  Date: 05/08/2024
  Time: 11:24 p. m.
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ page import="mx.edu.utez.proyecto_sgcse.dao.UserDao" %>
<%@ page import="mx.edu.utez.proyecto_sgcse.model.User" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Editar Usuario</title>
    <link rel="stylesheet" href="bootstrap-5.2.3-dist/css/bootstrap.min.css">
</head>
<body>
<div class="container mt-5">
    <h2>Editar Datos:</h2>
    <%
        int id = Integer.parseInt(request.getParameter("id"));
        UserDao userDao = new UserDao();
        User user = userDao.consUser(id);
        if (user == null) {
            System.out.println("<p>Usuario no encontrado</p>");
            return;
        }
    %>
    <form action="actualizarPerfil" method="post">
        <input type="hidden" name="id" value="<%= user.getId() %>">
        <div class="mb-3">
            <label for="nombre" class="form-label">Nombre:</label>
            <input type="text" class="form-control" id="nombre" name="nombre" value="<%= user.getNombre() %>">
        </div>

        <div class="mb-3">
            <label for="apll_1" class="form-label">Apellido paterno:</label>
            <input type="text" class="form-control" id="apll_1" name="apll_1" value="<%= user.getApll_1() %>">
        </div>

        <div class="mb-3">
            <label for="apll_2" class="form-label">Apellido materno:</label>
            <input type="text" class="form-control" id="apll_2" name="apll_2" value="<%= user.getApll_2() %>">
        </div>


        <div class="mb-3">
            <label for="email" class="form-label">Correo electronico:</label>
            <input type="email" class="form-control" id="email" name="email" value="<%= user.getEmail() %>">

        </div>









        <button type="submit" class="btn btn-primary">Actualizar</button>
        <a href="perfil.jsp" class="btn btn-secondary">Cancelar</a>
    </form>
</div>
<script src="bootstrap-5.2.3-dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>