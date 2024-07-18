<%--
  Created by IntelliJ IDEA.
  User: jonyo
  Date: 16/07/2024
  Time: 01:04 a. m.
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Página Principal</title>
    <link rel="stylesheet" href="bootstrap-5.2.3-dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-icons/1.5.0/font/bootstrap-icons.min.css">
    <link rel="stylesheet" href="css/pageAdmin.css">
</head>
<body>


<nav class="navbar navbar-expand-lg navbar-expand-md navbar-expand-sm navbar-expand-xsm  bg-success col-xsm-12">
    <div class="navbar-logo-container">
        <a class="navbar-brand" href="#">
            <img src="img/utezlogo.png" alt="Logo" class="navbar-logo">
        </a>
    </div>
    <div class="navbar-title-container">
        <h1 class="title">Usuarios</h1>
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
            <a class="a_link" href="perfilu.html">
                <i class="bi bi-person "></i>
                <span class="a_span">Mi perfil</span>
            </a>
        </div>
    </div>
    <div class="aside_c">
        <div class="aside_i">
            <i class="bi-box-arrow-right"></i>
            <span class="a_span">Cerrar sesion</span>
        </div>
    </div>
</aside>





<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-3 text-center mt-5 option-card blue ">
            <a href="agendar_citas.html" class="open-password-modal">
                <svg class="svg bi bi-people-fill" xmlns="http://www.w3.org/2000/svg" width="80" height="80" fill="currentColor" viewBox="0 0 16 16">
                    <path d="M7 14s-1 0-1-1 1-4 5-4 5 3 5 4-1 1-1 1zm4-6a3 3 0 1 0 0-6 3 3 0 0 0 0 6m-5.784 6A2.24 2.24 0 0 1 5 13c0-1.355.68-2.75 1.936-3.72A6.3 6.3 0 0 0 5 9c-4 0-5 3-5 4s1 1 1 1zM4.5 8a2.5 2.5 0 1 0 0-5 2.5 2.5 0 0 0 0 5"/>
                </svg>
            </a>

            <p class="des">Estudiantes</p>
        </div>


        <div class="col-md-3 text-center mt-5 option-card orange ">
            <a href="consVentanilla.jsp" >
                <?xml version="1.0" encoding="UTF-8"?>
                <svg class="svg bi bi-people-fill" xmlns="http://www.w3.org/2000/svg"width="70" height="70" fill="currentColor"   id="Layer_1" data-name="Layer 1" viewBox="0 0 24 24">
                    <path d="m9,12c-3.309,0-6-2.691-6-6S5.691,0,9,0s6,2.691,6,6-2.691,6-6,6Zm12.5,2h-6c-1.378,0-2.5,1.121-2.5,2.5v7.5h11v-7.5c0-1.379-1.122-2.5-2.5-2.5Zm-1.5,5h-3v-2h3v2Zm-9-3.255l-2,2.25-3.551-3.995h-.449c-2.757,0-5,2.243-5,5v5h11v-8.255Z"/>
                </svg>

            </a>

            <p class="des">Administrativos</p>
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
                    <span class="toggle-password" onclick="togglePassword()"> <i class="bi bi-eye password-toggle" id="togglePasswordIcon"></i></span>
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
<script src="js/pageAdmin.js"></script>
</body>
</html>
