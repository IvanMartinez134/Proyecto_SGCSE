<%--
  Created by IntelliJ IDEA.
  User: death
  Date: 15/07/2024
  Time: 02:24 p. m.
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Subir Documentos</title>
    <link rel="stylesheet" href="bootstrap-5.2.3-dist/css/bootstrap.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-icons/1.5.0/font/bootstrap-icons.min.css">
    <link rel="stylesheet" href="css/subirDoc.css">

</head>

<body>


<nav class="navbar navbar-expand-lg navbar-expand-md navbar-expand-sm navbar-expand-xsm  bg-success col-xsm-12">
    <div class="navbar-logo-container">
        <a class="navbar-brand" href="#">
            <img src="img/utezlogo.png" alt="Logo" class="navbar-logo">
        </a>
    </div>
    <div class="navbar-title-container">
        <h1 class="title">Subir documentos</h1>
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






<div class="container col-lg-8 col-sm-10 ">
    <div class="documentacion">
        <h2>Documentación</h2>
        <p>Recuerda subir todos tus archivos escaneados y en formato PDF.</p>
        <ul>
            <li><strong>Constancia simple:</strong> Es el documento donde se observan…</li>
            <li><strong>Comprobante de domicilio:</strong> Es el documento donde se establece el estado, el
                municipio y la calle donde habitas.</li>
            <li><strong>Comprobante de pago:</strong> En este documento se debe de observar tu matrícula, nombre y
                fecha para ser validado.</li>
        </ul>
    </div>

    <div class="drag-drop" id="drag-drop-area">
        <p>Arrastra y suelta tus archivos aquí o haz clic para seleccionar archivos.</p>
        <input type="file" id="file-input" multiple>
        <ul class="file-list" id="file-list">
            <!-- Aquí se mostrarán los archivos seleccionados -->
        </ul>
    </div>
</div>

<!-- Script de Bootstrap -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="js/subirDoc.js"></script>
</body>

</html>