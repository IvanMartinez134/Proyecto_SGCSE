<%--
  Created by IntelliJ IDEA.
  User: death
  Date: 15/07/2024
  Time: 12:49 p. m.
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
    <link rel="stylesheet" href="css/email.css">
    <link rel="icon" type="img/png" href="img/buscar.png">

</head>

<body class="d-flex justify-content-center align-items-center m-4">
<div class="bg-white p-5 rounded-4 col-lg-8 col-md-8 col-sm-8 col-xs-7 mt-5 mb-4 shaw">
    <form id="registroForm" method="post" action="generarCody">
        <legend class="bg-success rounded-2 p-2 text-white text-center mb-5">Recibe codigo</legend>
        <fieldset>
            <div class="mb-3 row">
                <h4 class="text-center mb-4 aviso">Ingresa tu correo electronico para recibir un codigo para cambiar tu contraseña.</h4>
                <label for="correo" class="col-sm-3 col-form-label">Correo electrónico: </label>
                <div class="col-sm-9">
                    <input type="email" id="correo" name="correo" class="form-control" placeholder="Tu email:" required>
                </div>
            </div>
            <div class="b_alert">
                <p id="alerta" class="alerta"></p>
            </div>


            <div class="text-end">
                <button type="submit" class="register btn btn-success">
                    Enviar
                </button>
            </div>
        </fieldset>
    </form>
</div>

<%--<section class="modal">
    <div class="modal_contain">
        <h1 class="modal_title">Enviado</h1>
        <img src="img/message-received-2-76.svg" alt="check" class="modal_img">
        <h3>Revisa tu bandeja de entrada</h3>
        <a href="#" class="modal_close"></a>
    </div>
</section>--%>

<%--<script src="js/email.js" defer></script>--%>

</body>

</html>
