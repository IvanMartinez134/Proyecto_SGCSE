<%--
  Created by IntelliJ IDEA.
  User: death
  Date: 15/07/2024
  Time: 12:36 p. m.
  To change this template use File | Settings | File Templates.
--%>



<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>




<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Formulario de Registro</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="bootstrap-5.2.3-dist/css/bootstrap.min.css">
    <link rel="icon" type="image/png" href="img/buscar.png">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

    <link rel="stylesheet" href="css/registroEst.css">


</head>

<body class="d-flex justify-content-center align-items-center m-4">
<div class="bg-white p-5 rounded-2 col-lg-8 col-md-8 col-sm-10 mb-4 con">

    <form id="registroForm" method="POST" action="registrarUsuario" >

        <legend class="bg-success rounded-2 p-2 text-white text-center mb-5">Registro de Usuario</legend>

        <fieldset>
            <div class="mb-3 row">
                <label for="nombre" class="col-sm-3 col-form-label">Nombre/s: </label>
                <div class="col-sm-9">
                    <input type="text" id="nombre" name="nombre" class="form-control" placeholder="Tu nombre" >
                </div>
            </div>

            <div class="mb-3 row">
                <label for="apellidoPaterno" class="col-sm-3 col-form-label">Apellido paterno: </label>
                <div class="col-sm-3">
                    <input type="text" id="apellidoPaterno" name="apellidoPaterno" class="form-control" placeholder="Tu apellido paterno" >
                </div>
                <label for="apellidoMaterno" class="col-sm-3 col-form-label">Apellido materno: </label>
                <div class="col-sm-3">
                    <input type="text" id="apellidoMaterno" name="apellidoMaterno" class="form-control" placeholder="Tu apellido materno" >
                </div>
            </div>

            <div class="mb-3 row">
                <label for="matricula" class="col-sm-3 col-form-label">Matrícula: </label>
                <div class="col-sm-9">
                    <input type="text" id="matricula" name="matricula" class="form-control" placeholder="Tu matrícula" required>
                </div>
            </div>


            <div class="mb-3 row">
                <label for="correo" class="col-sm-3 col-form-label">Correo electrónico: </label>
                <div class="col-sm-9">
                    <input type="email" id="correo" name="correo" class="form-control" placeholder="Tu email" required>
                </div>
            </div>

            <div class="mb-3 row">
                <label for="cuatri" class="col-sm-3 col-form-label">Cuatrimestre: </label>
                <div class="col-sm-3">
                    <input type="number" id="cuatri" name="cuatri" class="form-control" placeholder=" " >
                </div>
                <label for="grupo" class="col-sm-3 col-form-label">Grupo : </label>
                <div class="col-sm-3">
                    <input type="text" id="grupo" name="grupo" class="form-control" placeholder="A" >
                </div>
            </div>




            <div class="mb-3 row">
                <label for="division" class="col-sm-3 col-form-label">División Académica:</label>
                <div class="col-sm-3">
                    <select id="division" name="division" class="form-select">
                        <option value="" disabled selected>Selecciona una división</option>
                        <option value="DATID">DATID</option>
                        <option value="DATEFI">DATEFI</option>
                        <option value="DACEA">DACEA</option>
                        <option value="DAMI">DAMI</option>
                    </select>
                </div>


                <label for="carrera" class="col-sm-3 col-form-label">Carrera:</label>
                <div class="col-sm-3">
                    <select id="carrera" name="carrera" class="form-select">
                        <option value="" disabled selected>Selecciona una carrera</option>

                    </select>
                </div>
            </div>


            <div class="mb-3 row">
                <label for="contrasena" class="col-sm-3 col-form-label">Contraseña: </label>
                <div class="col-sm-9">
                    <input type="password" id="contrasena" name="contrasena" class="form-control" placeholder="Tu contraseña" required>
                </div>
            </div>
            <div class="mb-3 row">
                <label for="repetirContrasena" class="col-sm-3 col-form-label">Repite contraseña: </label>
                <div class="col-sm-9">
                    <input type="password" id="repetirContrasena" name="repetirContrasena" class="form-control" placeholder="Repite tu contraseña" required>
                </div>
            </div>

            <div class="b_alert">
                <p id="alerta" class="alerta"></p>
            </div>


            <div class="text-end">
                <button type="submit" class="btn btn-success">
                    Registrar
                </button>
            </div>
        </fieldset>
    </form>
</div>


<script type="text/javascript"  defer>
    $(document).ready(function() {
        $('#division').change(function() {
            var division = $(this).val();
            $.ajax({
                type: 'POST',
                url: 'obtenerCarreras',
                data: { 'division': division },
                dataType: 'json',
                success: function(data) {
                    $('#carrera').empty();
                    $('#carrera').append('<option value="">Seleccione una carrera</option>');
                    $.each(data, function(index, carrera) {
                        $('#carrera').append('<option value="' + carrera.id + '">' + carrera.nombre + '</option>');
                    });
                },
                error: function() {
                    alert('Error al obtener las carreras.');
                }
            });
        });
    });
</script>




<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>


<script>

    // Verificar si hay un mensaje de registro exitoso en la sesión
    <% if (session.getAttribute("registroExitoso") != null && (boolean) session.getAttribute("registroExitoso")) { %>
    swal({
        title: "Registro exitoso!",
        text: "",
        icon: "success",
        button: "Listo",
    }).then(function (){
        window.location.href = 'index.jsp';
    });
    <% session.removeAttribute("registroExitoso"); %>
    <% } %>


</script>

<script src="js/registroAdmintivo.js"></script>



</body>

</html>







