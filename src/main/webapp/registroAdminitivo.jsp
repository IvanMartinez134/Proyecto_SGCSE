<%--
  Created by IntelliJ IDEA.
  User: death
  Date: 15/07/2024
  Time: 12:42 p. m.
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Formulario</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="bootstrap-5.2.3-dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="css/registroAdmintivo.css">
    <link rel="icon" type="img/png" href="img/buscar.png">

</head>

<body class="d-flex justify-content-center align-items-center m-4">
<div class="bg-white p-5 rounded-4 col-lg-8 col-md-8 col-sm-8 col-xs-7 mb-4 shaw">


    <form id="registroForm" method="post" action="registroVetanilla">
        <legend class="bg-success rounded-2 p-2 text-white text-center mb-5">Registro Administrativo</legend>
        <fieldset>
            <div class="mb-3 row">
                <label for="nombre" class="col-sm-3 col-form-label">Nombre/s: </label>
                <div class="col-sm-9">
                    <input type="text" id="nombre" name="nombre" class="form-control" placeholder="Tu nombre:" required>
                </div>
            </div>
            <div class="mb-3 row">
                <label for="apellidoPaterno" class="col-sm-3 col-form-label">Apellido paterno: </label>
                <div class="col-sm-9">
                    <input type="text" id="apellidoPaterno" name="apellidoPaterno" class="form-control" placeholder="Tu apellido:" required>
                </div>
            </div>
            <div class="mb-3 row">
                <label for="apellidoMaterno" class="col-sm-3 col-form-label">Apellido materno: </label>
                <div class="col-sm-9">
                    <input type="text" id="apellidoMaterno" name="apellidoMaterno" class="form-control" placeholder="Tu apellido:" required>
                </div>
            </div>
            <div class="mb-3 row">
                <label for="correo" class="col-sm-3 col-form-label">Correo electrónico: </label>
                <div class="col-sm-9">
                    <input type="email" id="correo" name="correo" class="form-control" placeholder="Tu email:" required>
                </div>
            </div>

            <div class="mb-3 row">
                <label for="correo" class="col-sm-3 col-form-label">Correo electrónico: </label>
                <div class="form-group col-sm-9">
                    <select class="form-select" aria-label="Selecciona un trabajador" name="turno">
                        <option selected>Selecciona un turno...</option>
                        <option value="1">Matutino</option>
                        <option value="2">Vespertino</option>
                    </select>
                </div>
            </div>


            <div class="mb-3 row">
                <label for="tel" class="col-sm-3 col-form-label">Teléfono: </label>
                <div class="col-sm-9">
                    <input type="tel" id="tel" name="tel" class="form-control" pattern="[0-9]{3}[0-9]{3}[0-9]{4}" placeholder="Tu número:" required>
                </div>
            </div>


            <div class="mb-3 row">
                <label for="contrasena" class="col-sm-3 col-form-label">Contraseña: </label>
                <div class="col-sm-9">
                    <input type="password" id="contrasena" name="contrasena" class="form-control" placeholder="Tu contraseña:" required>
                </div>
            </div>
            <div class="mb-3 row">
                <label for="repetirContrasena" class="col-sm-3 col-form-label">Repite contraseña: </label>
                <div class="col-sm-9">
                    <input type="password" id="repetirContrasena" name="repetirContrasena" class="form-control" placeholder="Tu contraseña:" required>
                </div>
            </div>

            <div class="b_alert">
                <p id="alerta" class="alerta"></p>
            </div>


            <div class="text-end">
                <button type="submit" class="register btn btn-success">
                    Registrar
                </button>
            </div>
        </fieldset>
    </form>
</div>

<section class="modal">
    <div class="modal_contain">
        <h1 class="modal_title">Registro exitoso</h1>
        <img src="img/checklist-1-7.svg" alt="check" class="modal_img">
        <a href="#" class="modal_close"></a>
    </div>
</section>

<%--  <script src="js/registroAdmintivo.js" defer></script> --%>
</body>

</html>

