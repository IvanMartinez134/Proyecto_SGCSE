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
  <!-- Enlace a Bootstrap CSS -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <style>
    body {
      background-color: #f8f9fa;
    }

    .container {
      margin-top: 110px;
    }

    form {
      background-color: #fff;
      padding: 20px;
      border-radius: 10px;
      box-shadow: 0 0 22px rgba(0, 0, 0, 0.26);
    }

    label {
      font-weight: bold;
    }

    button[type="submit"] {
      background-color: #0d6efd;
      border: none;
    }

    button[type="submit"]:hover {
      background-color: #0b5ed7;
    }
  </style>
</head>
<body>

<nav class="navbar fixed-top navbar-light bg-success">
  <div class="container-fluid">
    <!-- Agregamos el botón del menú hamburguesa -->
    <button class="navbar-toggler bg-white" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <!-- Aquí ponemos el título de la página centrado -->
    <a class="navbar-brand text-center text-white mx-auto" href="#">Agendar cita</a>
    <!-- Ahora vamos a agregar el menú -->
    <div class="collapse navbar-collapse" id="navbarNav">
      <ul class="navbar-nav ms-auto">

        <!-- Agregamos el elemento de lista para "Cerrar Sesión" -->
        <li class="nav-item">
          <a class="nav-link" href="#">Cerrar Sesión</a>
        </li>

      </ul>
    </div>
  </div>
</nav>






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
</body>
