<%--
  Created by IntelliJ IDEA.
  User: death
  Date: 17/07/2024
  Time: 06:01 p. m.
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset='utf-8'>
    <meta http-equiv='X-UA-Compatible' content='IE=edge'>
    <title>Database js</title>
    <meta name='viewport' content='width=device-width, initial-scale=1'>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css">

    <!-- Datatables -->
    <link rel="stylesheet" href="https://cdn.datatables.net/1.12.1/css/dataTables.bootstrap5.min.css">

    <link rel="stylesheet" href="css/consUsarios.css">

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css" integrity="sha512-xh6O/CkQoPOWDdYTDqeRdPCVd1SpvCA9XXcUnZS2FmJNp1coAFzvtCN9BmamE+4aHK8yyUHUSCcJHgXloTyT2A==" crossorigin="anonymous" referrerpolicy="no-referrer" />

</head>
<body>

<nav class="navbar navbar-expand-lg navbar-expand-md navbar-expand-sm navbar-expand-xsm  bg-success col-xsm-12">
    <div class="navbar-logo-container">
        <a class="navbar-brand" href="#">
            <img src="img/utezlogo.png" alt="Logo" class="navbar-logo">
        </a>
    </div>
    <div class="navbar-title-container">
        <h1 class="title">Gestion de alumnos</h1>
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
            <i class="bi bi-person "></i>
            <span class="a_span">Mi perfil</span>
        </div>
    </div>
    <div class="aside_c">
        <div class="aside_i">
            <i class="bi-box-arrow-right"></i>
            <span class="a_span">Cerrar sesion</span>
        </div>
    </div>
</aside>

<div class="container my-4">


    <div class="row">
        <div  class="col-sm-12 col-md-12 col-lg-12 col-xl-12">
            <table id="table_users" class="table table-striped table-hover">
                <caption>
                    Tabla de alumnos
                </caption>
                <thead class="table-primary">

                <tr class="table-active">
                    <th class="centered">ID</th>
                    <th class="centered">Nombre</th>
                    <th class="centered">Correo</th>
                    <th class="centered">Estado</th>
                    <th class="centered">Opciones</th>
                </tr>

                </thead>
                <tbody id="tableBody_users">

                </tbody>
            </table>
        </div>
    </div>
</div>

<!-- Bootstrap -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>

<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<!-- Data tables -->
<script src="https://cdn.datatables.net/1.12.1/js/jquery.dataTables.min.js"></script>
<script src="https://cdn.datatables.net/1.12.1/js/dataTables.bootstrap5.min.js"></script>
<script src="js/consUsuarios.js"></script>

</body>
</html>
