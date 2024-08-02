<%--
  Created by IntelliJ IDEA.
  User: death
  Date: 15/07/2024
  Time: 11:03 a. m.
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="user" scope="request" class="mx.edu.utez.proyecto_sgcse.model.User" />

<!DOCTYPE html>
<html>
<head>
    <meta charset='utf-8'>
    <meta http-equiv='X-UA-Compatible' content='IE=edge'>
    <title>Page Administrativo</title>
    <meta name='viewport' content='width=device-width, initial-scale=1'>
    <link rel="stylesheet" href="bootstrap-5.2.3-dist/css/bootstrap.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-icons/1.5.0/font/bootstrap-icons.min.css">
    <link rel="stylesheet" href="css/pageAdmin.css">

</head>
<body>

<nav class=" navbar navbar-expand-lg  navbar-dark bg-success">

    <div class="container-fluid m-0 p-0">
        <div class="navbar-logo-container">

            <img src="img/utezlogo.png" alt="Logo" class="navbar-logo m-0 p-0">

        </div>




        <h5 class="text-white navbar-title  d-lg me-auto">
            Hola, ${user.nombre}
        </h5>



        <button class=" mr-4 navbar-toggler" type="button"
                data-bs-toggle="offcanvas"
                data-bs-target="#menu">
            <div></div>
            <div></div>
            <div></div>
        </button>

        <!-- Paraa usar el oof canvas ( lateral )  -->
        <section class="offcanvas offcanvas-end bg-success" style="width: 18rem;"
                 id="menu" tabindex="-1">
            <div class="offcanvas-header" data-bs-theme="success">
                <h5 class="offcanvas-title text-white px-4">Menu</h5>

                <button class="btn-close m-1"
                        type="button"
                        aria-label="Close"
                        data-bs-dismiss="offcanvas">
                </button>
            </div>
            <div class="offcanvas-body d-flex flex-column
                justify-content-between px-0 " data-bs-theme="success">
                <ul class="navbar-nav fs-5 justify-content-end">
                    <li class="nav-item p-lg-2 p-2 px-4 py-md-3">
                        <a href="perfil.jsp" class="nav-link  fs-6 d-lg "><i class="bi bi-person i"></i>Mi Perfil</a>
                    </li >
                    <li class="nav-item p-lg-2 p-2 px-4  py-md-3 c">
                        <a href="index.jsp" class="nav-link  fs-6 d-lg  "><i class="bi bi-box-arrow-right i"></i>Cerrar sesion</a>
                    </li>
                </ul>

            </div>

        </section>



    </div>
</nav>


<%--

<nav class="navbar navbar-expand-lg navbar-expand-md navbar-expand-sm navbar-expand-xsm  bg-success col-xsm-12">
    <div class="navbar-logo-container">
        <a class="navbar-brand" href="#">
            <img src="img/utezlogo.png" alt="Logo" class="navbar-logo">
        </a>
    </div>
    <div class="navbar-title-container">
        <h1 class="title">Pagina principal (Administrativo)</h1>
    </div>
    <div class="nav_menu" id="open_close">
        <button class="menu">
            <div class="menu_item"></div>
            <div class="menu_item"></div>
            <div class="menu_item"></div>
        </button>
    </div>
</nav>



<aside id="aside">
    <div class="lateral"></div>
    <div class="aside_con">
        <div class="aside_i">
            <a class="a_link" href="perfil.jsp">
                <i class="bi bi-person "></i>
                <span class="a_span">Mi perfil</span>
            </a>
        </div>
    </div>
    <div class="aside_c">
        <div class="aside_i">
            <a class="a_link" href="index.jsp">
            <i class="bi-box-arrow-right"></i>
            <span class="a_span">Cerrar sesion</span>
        </div>
    </div>
</aside>

--%>

<!-- User Profile Card -->

<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-3 text-center mt-5 option-card red">
            <a href="#" class="open-password-modal">
                <svg class="svg bi bi-calendar-fill" xmlns="http://www.w3.org/2000/svg" width="80" height="80" fill="currentColor"  viewBox="0 0 16 16">
                    <path d="M3.5 0a.5.5 0 0 1 .5.5V1h8V.5a.5.5 0 0 1 1 0V1h1a2 2 0 0 1 2 2v11a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V5h16V4H0V3a2 2 0 0 1 2-2h1V.5a.5.5 0 0 1 .5-.5"/>
                </svg>
            </a>
            <p class="des">Citas pendientes</p>
        </div>
        <div class="col-md-3 text-center mt-5 option-card orange">
            <a href="#" class="open-password-modal">
                <svg class="svg bi bi-calendar-range" xmlns="http://www.w3.org/2000/svg" width="80" height="80" fill="currentColor"  viewBox="0 0 16 16">
                    <path d="M9 7a1 1 0 0 1 1-1h5v2h-5a1 1 0 0 1-1-1M1 9h4a1 1 0 0 1 0 2H1z"/>
                    <path d="M3.5 0a.5.5 0 0 1 .5.5V1h8V.5a.5.5 0 0 1 1 0V1h1a2 2 0 0 1 2 2v11a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V3a2 2 0 0 1 2-2h1V.5a.5.5 0 0 1 .5-.5M1 4v10a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1V4z"/>
                </svg>
            </a>
            <p class="des">Consultar citas</p>
        </div>

    </div>
</div>

<!-- Modal de contraseña -->
<div class="modal col-md-6" id="modalPassword">
    <div class="modal-dialog">
        <div class="modal-content col-lg-12 col-md-8 col-sm-6">
            <div class="modal-header">
                <h5 class="modal-title">Ingrese su contraseña para continuar</h5>
            </div>
            <div class="modal-body">
                <div class="form-group">
                    <input type="password" class="form-control" id="inputPassword" placeholder=" " required>
                    <label for="inputPassword" class="form-label">Contraseña</label>
                    <span class="toggle-password" onclick="togglePassword()"><img class="eye" src="img/icons8-visible-48.png" alt="ojo"></span>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-danger modal-close" data-bs-dismiss="modal">Cancelar</button>
                <button type="button" class="btn btn-success">Aceptar</button>
            </div>
        </div>
    </div>
</div>

<script src="bootstrap-5.2.3-dist/js/bootstrap.bundle.min.js"></script>
<script src="js/pageAdmintivo.js"></script>
</body>
</html>