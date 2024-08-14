
<%@ page import="mx.edu.utez.proyecto_sgcse.dao.UserDao" %>
<%@ page import="mx.edu.utez.proyecto_sgcse.model.User" %>
<%@ page import="mx.edu.utez.proyecto_sgcse.dao.CitaDao" %>
<%@ page import="mx.edu.utez.proyecto_sgcse.model.Cita" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: jonyo
  Date: 16/07/2024
  Time: 01:15 a. m.
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
  int usr_id = Integer.parseInt(request.getParameter("id"));
  CitaDao cta_dao= new CitaDao();
  Cita cita = cta_dao.getOneCita(usr_id);
  if(cita == null){

%>
<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Agendar Cita</title>
  <!-- Enlace a Bootstrap CSS -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-icons/1.5.0/font/bootstrap-icons.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

  <link rel="stylesheet" href="css/agendarcita.css">
  <style>
    body {
      background-color: #f8f9fa;
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

<nav class="navbar navbar-expand-lg  navbar-dark bg-success mb-4">

  <div class="container-fluid m-0 p-0">
    <div class="navbar-logo-container">

      <img src="img/utezlogo.png" alt="Logo" class="navbar-logo m-0 p-0">

    </div>




    <h3 class="text-white navbar-title  d-lg me-auto">
      Agendar cita
    </h3>



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


<div class="container col-lg-6 col-sm-8 col-xsm-8 mt-5 d-sm col-10">

  <form id="agendarCitaForm" action="procesarCita" method="POST">
    <div class="mb-3">
      <label for="tramite" class="form-label">Trámite:</label>
      <select name="tramite" id="tramite" class="form-select" onchange="actualizarDescripcion()">
        <option value="1">Constancia</option>
        <option value="2">Trámite 2</option>
        <option value="3">Trámite 3</option>

      </select>
    </div>
    <div class="mb-3">
      <label for="descripcion" class="form-label">Descripción:</label>
      <input type="text" name="descripcion" id="descripcion" class="form-control" readonly>
    </div>
    <div class="mb-3">
      <p>Seleccione una fecha para recoger tus documentos:</p>
        <input type="date" id="fecha_recoger" name="fecha_recoger" class="form-control" >
    </div>
    <div class="mb-3">
      <label for="horario" class="form-label">Seleccione el horario:</label>
      <select name="horario" id="horario" class="form-select" onchange="actualizarFechaHora()">
        <option value="" disabled selected>Seleccione su horario:</option>


      </select>
    </div>
    <div class="mb-3">
      <label for="fecha_hora" class="form-label">La fecha y hora es:</label>
      <input type="text" id="fecha_hora" name="fecha_hora" class="form-control" readonly>
    </div>
    <input type="hidden" id="usr_id" name="usr_id" value="${sessionScope.user.id}">

    <button type="submit" class="btn btn-primary">Agendar Cita</button>

  </form>
</div>


<!-- Script de Bootstrap -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

<script>



  function actualizarDescripcion() {
    var tramiteSeleccionado = document.getElementById("tramite").value;
    var descripcionInput = document.getElementById("descripcion");

    switch (tramiteSeleccionado) {
      case '1':
        descripcionInput.value = "Descripción para Constancia";
        break;
      case '2':
        descripcionInput.value = "Descripción para Inscripcion";
        break;
      case '3':
        descripcionInput.value = "Descripción para Reinscripcion";
        break;
      default:
        descripcionInput.value = "";
        break;
    }
  }

  function actualizarFechaHora() {
    var fechaRecoger = document.getElementById("fecha_recoger").value;
    var horarioSeleccionado = document.getElementById("horario").value;

    var fechaHora = fechaRecoger + " " + horarioSeleccionado;

    document.getElementById("fecha_hora").value = fechaHora;
  }
</script>


<script type="text/javascript"  defer>
  $(document).ready(function() {
    $('#fecha_recoger').change(function() {
      var fecha = $(this).val();
      $.ajax({
        type: 'POST',
        url: 'fechaServlet',
        data: { 'fecha_recoger': fecha },
        dataType: 'json',
        success: function(data) {
          $('#horario').empty();
          $('#horario').append('<option value="">Seleccione un horario</option>');
          $.each(data, function(index, hora) {
            $('#horario').append('<option value="' + hora + '">' + hora + '</option>');
          });
        },
        error: function() {
          alert('Error al obtener las carreras.');
        }
      });
    });
  });
</script>


</body>
</html>

<%
  }
%>