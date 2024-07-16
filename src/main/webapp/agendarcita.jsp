<%--
  Created by IntelliJ IDEA.
  User: jonyo
  Date: 16/07/2024
  Time: 01:15 a. m.
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Agendar Cita</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <link rel="stylesheet" href="css/agendarcita.css">
</head>
<body>




<nav class="navbar navbar-expand-lg navbar-expand-md navbar-expand-sm navbar-expand-xsm  bg-success col-xsm-12">
  <div class="navbar-logo-container">
    <a class="navbar-brand" href="#">
      <img src="img/utezlogo.png" alt="Logo" class="navbar-logo">
    </a>
  </div>
  <div class="navbar-title-container">
    <h1 class="title">Agendar citas</h1>
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
      <i class="bi-box-arrow-right"></i>
      <span class="a_span">Cerrar sesion</span>
    </div>
  </div>
</aside>






<div class="container col-lg-6 col-sm-8 col-xsm-8">
  <form action="" method="POST">
    <div class="mb-3">
      <label for="tramite" class="form-label">Trámite:</label>
      <select name="tramite" id="tramite" class="form-select">
        <option value="1">Constancia</option>
        <option value="2">Trámite 2</option>
        <option value="3">Trámite 3</option>
        <!-- Agrega más opciones según tus necesidades -->
      </select>
    </div>
    <div class="mb-3">
      <label for="descripcion" class="form-label">Descripción:</label>
      <textarea name="descripcion" id="descripcion" rows="4" class="form-control" placeholder="Descripción del trámite">Es mucho texto</textarea>
    </div>
    <div class="mb-3">
      <p>Seleccione una fecha para recoger tus documentos:</p>
      <input type="date" id="fecha_recoger" name="fecha_recoger" class="form-control">
    </div>
    <div class="mb-3">
      <label for="horario" class="form-label">Seleccione el horario:</label>
      <select name="horario" id="horario" class="form-select">
        <option value="8:00">8:00 AM</option>
        <option value="9:00">9:00 AM</option>
        <option value="10:00">10:00 AM</option>
        <!-- Agrega más opciones según tus necesidades -->
      </select>
    </div>
    <div class="mb-3">
      <label for="fecha_hora" class="form-label">La fecha y hora es:</label>
      <input type="text" id="fecha_hora" name="fecha_hora" class="form-control" readonly>
    </div>
    <button type="submit" class="btn btn-primary">Agendar Cita</button>
  </form>
</div>

<!-- Script de Bootstrap -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="js/agendarcita.js"></script>

</body>
