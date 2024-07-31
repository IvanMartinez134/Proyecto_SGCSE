
<%--
  Created by IntelliJ IDEA.
  User: jonyo
  Date: 16/07/2024
  Time: 12:45 a. m.
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="mx.edu.utez.proyecto_sgcse.model.User" %>
<%@ page import="java.util.List" %>
<%@ page import="mx.edu.utez.proyecto_sgcse.dao.UserDao" %>
<%@ page import="mx.edu.utez.proyecto_sgcse.dao.CitaDao" %>
<%@ page import="mx.edu.utez.proyecto_sgcse.model.Cita" %>


<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Citas Pendientes | Administrador</title>

    <link rel="stylesheet" href="bootstrap-5.2.3-dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="css/citapen.css">



</head>

<body>


<nav class="navbar navbar-expand-lg navbar-dark bg-success mb-4">
    <div class="container-fluid m-0 p-0">
        <div class="navbar-logo-container">
            <img src="img/utezlogo.png" alt="Logo" class="navbar-logo m-0 p-0">
        </div>
        <h3 class="text-white navbar-title d-lg me-auto">Citas Pendientes</h3>
        <button class="mr-4 navbar-toggler" type="button" data-bs-toggle="offcanvas" data-bs-target="#menu">
            <div></div>
            <div></div>
            <div></div>
        </button>
        <section class="offcanvas offcanvas-end bg-success" style="width: 18rem;" id="menu" tabindex="-1">
            <div class="offcanvas-header" data-bs-theme="success">
                <h5 class="offcanvas-title text-white px-4">Menu</h5>
                <button class="btn-close m-1" type="button" aria-label="Close" data-bs-dismiss="offcanvas"></button>
            </div>
            <div class="offcanvas-body d-flex flex-column justify-content-between px-0" data-bs-theme="success">
                <ul class="navbar-nav fs-5 justify-content-end">
                    <li class="nav-item p-lg-2 p-2 px-4 py-md-3">
                        <a href="" class="nav-link fs-6 d-lg"><i class="bi bi-person i"></i>Mi Perfil</a>
                    </li>
                    <li class="nav-item p-lg-2 p-2 px-4 py-md-3 c">
                        <a href="" class="nav-link fs-6 d-lg"><i class="bi bi-box-arrow-right i"></i>Cerrar sesión</a>
                    </li>
                </ul>
            </div>
        </section>
    </div>
</nav>




<div class="container">
    <div class="row mt-5">
        <% UserDao userDao = new UserDao();
            CitaDao citaDao = new CitaDao();

            List<Cita> citas = citaDao.getAllCitasPendientes();
            int index = 0;
            for (Cita c : citas) { %>
        <div class="col-md-4 card_margin">
            <div class="card mb-3">
                <div class="card-header-custom">Estado: Pendiente</div>
                <div class="card-body-custom">
                    <p class="card-title">Nombre: <%=c.getAlumno()%></p>
                    <p class="card-text">Tipo de Documentación: <%=c.getTipo_doc()%></p>
                    <p class="card-text">Fecha: <%=c.getFecha()%></p>
                    <p class="card-text">Horario: <%=c.getHora()%></p>

                    <div class="form-group">
                        <label for="usuariosSelect">Selecciona un usuario:</label>
                        <select class="form-select" id="usuariosSelect" name="usuariosSelect">
                            <option selected>Selecciona un usuario...</option>
                            <%
                                List<User> usersv = userDao.getAllVen();
                                for (User u : usersv) {
                            %>
                            <option value="<%= u.getId() %>"><%= u.getNombre() %></option>
                            <% } %>
                        </select>
                    </div>

                    <div class="text-end mt-2">
                        <a href="#" onclick="asignarCita('<%=c.getId()%>', 'usuariosSelect<%= index %>')" >
                            <button class="btn btn-success" >Asignar</button>
                        </a>

                    </div>
                </div>
            </div>
        </div>
        <% index++;} %>


        <!-- Lo repito para generar la card -->
    </div>
</div>

<script type="text/javascript">
    function asignarCita(citaId, selectId) {
        var select = document.getElementById(selectId);
        var usuarioId = select.value;
        if (usuarioId !== "Selecciona un usuario...") {
            window.location.href = 'asignarCita?id=' + citaId + '&vta_id=' + usuarioId;
        } else {
            alert("Por favor, selecciona un usuario.");
        }
    }
</script>

<script src="bootstrap-5.2.3-dist/js/bootstrap.bundle.min.js"></script>
<script src="js/citap.js"></script>

</body>

</html>
