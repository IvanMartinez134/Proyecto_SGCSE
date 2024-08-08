<%--
  Created by IntelliJ IDEA.
  User: jonyo
  Date: 15/07/2024
  Time: 09:53 p. m.
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<jsp:useBean id="user" scope="request" class="mx.edu.utez.proyecto_sgcse.model.User" />


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Profile Page</title>
    <link href="bootstrap-5.2.3-dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-icons/1.5.0/font/bootstrap-icons.min.css">
    <link rel="stylesheet" href="css/perfil.css">

</head>
<body class="bg-light">

<nav class="navbar navbar-expand-lg navbar-expand-md navbar-expand-sm navbar-expand-xsm  bg-success col-xsm-12">
    <div class="navbar-logo-container">
        <a class="navbar-brand" href="#">
            <img src="img/utezlogo.png" alt="Logo" class="navbar-logo">
        </a>
    </div>
    <div class="navbar-title-container">
        <h1 class="title">Mi perfil</h1>
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
    <div class="aside_c">
        <div class="aside_i">
            <i class="bi-box-arrow-right"></i>
            <a href="index.jsp" class="text-decoration-none">
            <span class="a_span">Cerrar sesion</span>
            </a>
        </div>
    </div>
</aside>

<div class="m-5 py-5 mt-3">
    <div class="row">
        <div class="col-lg-4 col-md-4">
            <div class="bg-custom rounded-4 shadow p-4 text-center perfil">
                <img src="img/profile-round-1342-svgrepo-com.svg" alt="Profile Picture" class="profile-img mb-3">
                <h2 class="h5">${sessionScope.user.nombre}</h2>
                <hr>
                <p class="text-muted-custom mb-1">${sessionScope.user.email}</p>
            </div>
        </div>
        <div class="col-md-8">
            <div class="bg-custom rounded shadow ">
                <div class="bg-primary d-flex align-items-center p-3 mb-2 tit">
                    <h2 class="h5 mb-0">Información personal</h2>
                </div>

                <div class="row p-4">
                    <div class="col-md-6 mb-3">
                        <h3 class="h6 text-muted-custom">Email</h3>
                        <p>${sessionScope.user.email}</p>
                    </div>



                    <div class="col-md-6 mb-3">
                        <h3 class="h6 text-muted-custom">Nombre:</h3>
                        <p>${sessionScope.user.nombre}</p>
                    </div>

                    <div class="col-md-6 mb-3">
                        <h3 class="h6 text-muted-custom">Apellido paterno:</h3>
                        <p>${sessionScope.user.apll_1}</p>
                    </div>

                    <div class="col-md-6 mb-3">
                        <h3 class="h6 text-muted-custom">Apellido materno</h3>
                        <p>${sessionScope.user.apll_2}</p>
                    </div>

                    <a href="editarPerfil.jsp?id=${sessionScope.user.id}">
                        <div class="cont_b mb-3">
                            <button class="btn bg-primary btn_p" type="button">
                                Editar perfil
                            </button>
                        </div>
                    </a>


                </div>
            </div>
        </div>
    </div>
</div>


<script src="bootstrap-5.2.3-dist/js/bootstrap.bundle.min.js"></script>
<script src="js/perfil.js"></script>
</body>
</html>

