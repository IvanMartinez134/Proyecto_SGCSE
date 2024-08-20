
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
  CitaDao cta_dao = new CitaDao();
  Cita cita = cta_dao.getOneCita(usr_id);

  if( cita == null || cita.getStatus() == 0 || cita.getStatus() == 7 ){
%>
<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Agendar Cita</title>

  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-icons/1.5.0/font/bootstrap-icons.min.css">


  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

  <link href="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/css/select2.min.css" rel="stylesheet" />
  <script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/js/select2.min.js"></script>

  <!-- SimpleBar CSS -->
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/simplebar@latest/dist/simplebar.css" />

  <!-- SimpleBar JS -->
  <script src="https://cdn.jsdelivr.net/npm/simplebar@latest/dist/simplebar.min.js"></script>


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


<div class="container col-lg-6 col-sm-8 col-xsm-8 mt-5 d-sm col-10 mb-4">

  <form id="agendarCitaForm" action="procesarCita" method="POST">
    <div class="mb-3">
      <label for="tramite" class="form-label">Trámite:</label>
      <select name="tramite" id="tramite" class="form-select" onchange="actualizarDescripcion()">
        <option value="default" selected>Elige un tramite...</option>
        <option value="1">Constancia simple</option>
        <option value="2">Constancia de trámite de titulación</option>
        <option value="3">Constancia con calificaciones</option>
        <option value="4">Constancia con número de seguridad social</option>
        <option value="5">Constancia de método de titulación</option>
        <option value="6">Certificado Parcial</option>
        <option value="7">Duplicado de certificado</option>
        <option value="8">Boletas</option>
        <option value="9">Reposición de credencial</option>
        <option value="10">Certificado de Estudios de Ing/Lic</option>
        <option value="11">Título</option>

      </select>
    </div>

    <div class="mb-3">
      <label for="descripcion" class="form-label">Descripcion:</label>
      <textarea id="descripcion" class="form-control" style="height: 100px; overflow-y: scroll;" readonly></textarea>

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
  $(document).ready(function() {
    $('#tramite').select2({
      width: '100%',
      dropdownAutoWidth: true,
      maximumSelectionLength: 3,
      placeholder: 'Selecciona un trámite'
    });
  });

</script>

<script>





  function actualizarDescripcion() {
    var tramiteSeleccionado = document.getElementById("tramite").value;
    var descripcionInput = document.getElementById("descripcion");

    switch (tramiteSeleccionado) {
      case '1':
        descripcionInput.value = "Contiene tu nombre, matrícula, carrera y el periodo que comprende el cuatrimestre en el que estás activo actualmente. Antes de sacar una cita para tramitar este documento deberás de pagar $100 en caja. Si estás dado de baja temporal, la documentación que puedes solicitar es un historial académico. Si estás dado de baja definitiva, la documentación que puedes solicitar es un historial académico y/o un certificado parcial.";
        break;
      case '2':
        descripcionInput.value = "Contiene tu nombre, matrícula y la explicación de que tu expediente se encuentra en revisión para obtener la cédula profesional. Antes de sacar una cita para tramitar este documento deberás de pagar $100 en caja. Si estás dado de baja temporal, la documentación que puedes solicitar es un historial académico. Si estás dado de baja definitiva, la documentación que puedes solicitar es un historial académico y/o un certificado parcial.";
        break;
      case '3':
        descripcionInput.value = "Contiene tu nombre, matrícula, carrera y las asignaturas con calificaciones del nivel que actualmente cursas (TSU o ING/LIC). Antes de sacar una cita para tramitar este documento deberás de pagar $100 en caja. Si estás dado de baja temporal, la documentación que puedes solicitar es un historial académico. Si estás dado de baja definitiva, la documentación que puedes solicitar es un historial académico y/o un certificado parcial.";
        break;
      case '4':
        descripcionInput.value = "Contiene tu nombre, matrícula, carrera, el periodo que comprende el cuatrimestre en el que estás activo actualmente, así como el número de Seguro Social con el que estás dado de alta ante dicha institución. Antes de sacar una cita para tramitar este documento deberás de pagar $200 en caja. Si estás dado de baja temporal, la documentación que puedes solicitar es un historial académico. Si estás dado de baja definitiva, la documentación que puedes solicitar es un historial académico y/o un certificado parcial.";
        break;

      case '5':
        descripcionInput.value = "Contiene tu nombre, matrícula, carrera y hace mención del método utilizado para la titulación. Antes de sacar una cita para tramitar este documento deberás de pagar $100 en caja. Si estás dado de baja temporal, la documentación que puedes solicitar es un historial académico. Si estás dado de baja definitiva, la documentación que puedes solicitar es un historial académico y/o un certificado parcial.";
        break;

      case '6':
        descripcionInput.value = "Contiene fotografía, nombre, matrícula, carrera, periodo y las calificaciones de los cuatrimestres acreditados. Antes de sacar una cita para tramitar este documento deberás de pagar $200 en caja. Si estás dado de baja temporal, la documentación que puedes solicitar es un historial académico. Si estás dado de baja definitiva, la documentación que puedes solicitar es un historial académico y/o un certificado parcial.";
        break;

      case '7':
        descripcionInput.value = "Contiene fotografía, nombre, matrícula, carrera, periodo de estudios, calificaciones completas de la carrera cursada, así como las competencias de la misma. Antes de sacar una cita para tramitar este documento deberás de pagar $200 en caja. Si estás dado de baja temporal, la documentación que puedes solicitar es un historial académico. Si estás dado de baja definitiva, la documentación que puedes solicitar es un historial académico y/o un certificado parcial.";
        break;

      case '8':
        descripcionInput.value = "Contiene las calificaciones de un cuatrimestre específico así como nombre y matrícula. Antes de sacar una cita para tramitar este documento deberás de pagar $55 en caja. Si estás dado de baja temporal, la documentación que puedes solicitar es un historial académico. Si estás dado de baja definitiva, la documentación que puedes solicitar es un historial académico y/o un certificado parcial.";
        break;


      case '9':
        descripcionInput.value = "Contiene fotografía, carrera, matrícula, vigencia, firma del alumno y número de seguridad social. Antes de sacar una cita para tramitar este documento deberás de pagar $120 en caja. Si estás dado de baja temporal, la documentación que puedes solicitar es un historial académico. Si estás dado de baja definitiva, la documentación que puedes solicitar es un historial académico y/o un certificado parcial.";
        break;


      case '10':
        descripcionInput.value = "RECUERDA: El cronómetro está en marcha, si necesitas leer esta informacion con detenimiento es mejor visitar: http://www.utez.edu.mx/images/2024/02/Tramite_certificado.png Un certificado de Estudios de Ing/Lic. Antes de sacar una cita para tramitar este documento deberás de pagar $1800 en caja, se deberá tener una copia de la cedula profesional de Ing/Lic al alcance y dos fotografías infantiles con los siguientes requisitos: Tamaño infantil en blanco y negro. Sin retoque. Fondo blanco. Papel mate. Mujeres: Saco obscuro, blusa o camisa blanca, cabello recogido, cara, frente y orejas descubiertas, aretes pequeños, sin collares y poco maquillaje. Hombres: Saco obscuro, corbata obscura y lisa, camisa blanca, cabello corto o recogido, cara y frente descubierta, sin barba, bigote recortado y sin collares o algún tipo de arete. IMPORTANTE: En caso de no cumplir con las especificaciones mencionadas, no se recibirán las fotografías. Para recoger este documento debe presentar una identificación oficial y el comprobante de pago.";
        break;

      case '11':
        descripcionInput.value = "RECUERDA: El cronómetro está en marcha, si necesitas leer esta informacion con detenimiento es mejor visitar: http://www.utez.edu.mx/images/2024/01/Solicitud_Titulos3.png. Antes de sacar una cita para tramitar este documento deberás de:Pagar $200 en caja, Redactar un texto de la siguiente manera: Por medio de este conducto me permito solicitar la impresión del título de nivel Mi nombre es ___________ de la generación _______ de la carrera ________ y con número de matrícula __________. Quedo a sus órdenes en los siguientes teléfonos: Tel Celular _______________ Tel Casa _______________TSU: INE por ambos lados y cédula profesional de TSU. Ing/Lic: INE por ambos lados, cédula profesional de TSU y cédula profesional de Ing/Lic. 2 fotografías tamaño título con los siguientes requisitos: Tamaño título en blanco y negro. Sin retoque. Fondo blanco. Papel mate. Mujeres: Saco obscuro, blusa o camisa blanca, cabello recogido, cara, frente y orejas descubiertas, aretes pequeños, sin collares y poco maquillaje. Hombres: Saco obscuro, corbata obscura y lisa, camisa blanca, cabello corto o recogido, cara y frente descubierta, sin barba, bigote recortado y sin collares o algún tipo de arete. IMPORTANTE: En caso de no cumplir con las especificaciones mencionadas, no se recibirán las fotografías y debes agendar una nueva cita.RECUERDE: El título solo se emite una sola vez. El título solo se emite si ya cuentas con la cédula profesional. El trámite del título es independiente del trámite de Certificación de Estudios. La Universidad no envía documentos por mensajería o paquetería, si el o la egresado lo requiere, deberá gestionar lo necesario. Para recoger este documento debe presentar el comprobante de pago y una identificación oficial.";
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


<script type="text/javascript" defer>
  $(document).ready(function() {

    $('#horario').select2({
      placeholder: "Selecciona un horario",
      allowClear: true,
      width: 'resolve',
      dropdownCssClass: 'custom-dropdown-width-hours'
    });

    // Función para obtener y actualizar las horas
    $('#fecha_recoger').change(function() {
      var fecha = $(this).val();
      $.ajax({
        type: 'POST',
        url: 'fechaServlet',
        data: { 'fecha_recoger': fecha },
        dataType: 'json',
        success: function(data) {
          $('#horario').empty().trigger('change');
          $('#horario').append('<option value="" disabled selected>Selecciona un horario</option>');
          $.each(data, function(index, hora) {
            var newOption = new Option(hora, hora, false, false);
            $('#horario').append(newOption).trigger('change');
          });
        },
        error: function() {
          alert('Error al obtener los horarios.');
        }
      });
    });
  });
</script>



</body>
</html>

<%
  } else {

    response.sendRedirect("alerta.jsp");
  }
%>