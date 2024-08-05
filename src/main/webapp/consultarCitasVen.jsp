<%--
  Created by IntelliJ IDEA.
  User: death
  Date: 03/08/2024
  Time: 06:50 p. m.
  To change this template use File | Settings | File Templates.
--%>
<%--
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
    <title>Consultar Citas | Administrador</title>

    <link rel="stylesheet" href="bootstrap-5.2.3-dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-icons/1.5.0/font/bootstrap-icons.min.css">

    <link rel="stylesheet" href="css/consCita.css">



</head>

<body>


<nav class="navbar navbar-expand-lg navbar-dark bg-success mb-4">
    <div class="container-fluid m-0 p-0">
        <div class="navbar-logo-container">
            <img src="img/utezlogo.png" alt="Logo" class="navbar-logo m-0 p-0">
        </div>
        <h3 class="text-white navbar-title d-lg me-auto">Consultar Citas</h3>
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
    <div class="row mt-5 justify-content-center">

        <%
            UserDao userDao = new UserDao();
            CitaDao citaDao = new CitaDao();
            int id = Integer.parseInt(request.getParameter("vta_id"));
            User u = userDao.consVen(id);

            List<Cita> citas = citaDao.getAllCitasVen(u.getVta_id());

            for (Cita c : citas) { %>
        <div class="col-md-4 card_margin d-sm col-10">
            <div class="card mb-3">
                <%if(c.getEtsado() == 0){%>
                <div class="card-header-custom" style="background-color: green">Estado: Concluida</div>
                <%} else if (c.getEtsado() == 1) {%>
                <div class="card-header-custom" style="background-color: red">Estado: Asignada</div>
                <%} else if (c.getEtsado() == 2) {%>
                <div class="card-header-custom" style="background-color: grey">Estado: Corregida</div>
                <%} else if (c.getEtsado() == 3) {%>
                <div class="card-header-custom" style="background-color: lightskyblue">Estado: Correcta</div>
                <%} else if (c.getEtsado() == 4) {%>
                <div class="card-header-custom" style="background-color: orange">Estado: Incorrecta</div>
                <%}%>
                <div class="card-body-custom">
                    <p class="card-title">Nombre: <%=c.getAlumno()%></p>
                    <p class="card-text">Tipo de Documentación: <%=c.getTipo_doc()%></p>
                    <p class="card-text">Fecha: <%=c.getFecha()%></p>
                    <p class="card-text">Horario: <%=c.getHora()%></p>


                </div>
                <div class="card-footer-custom">

                    <a href="verPDF.jsp?cta_id=<%=c.getId()%>">

                        <button class="btn-icon">
                            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="none"
                                 stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                                <path d="M12 22h6a2 2 0 0 0 2-2V7l-5-5H6a2 2 0 0 0-2 2v10"></path>
                                <path d="M14 2v4a2 2 0 0 0 2 2h4"></path>
                                <path d="M10.4 12.6a2 2 0 1 1 3 3L8 21l-4 1 1-4Z"></path>
                            </svg>
                        </button>
                    </a>
                </div>
            </div>
        </div>
        <% } %>


        <!-- Lo repito para generar la card -->
    </div>
</div>


<script src="bootstrap-5.2.3-dist/js/bootstrap.bundle.min.js"></script>
<script src="js/citap.js"></script>

</body>

</html>
