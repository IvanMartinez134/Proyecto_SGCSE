<%--
  Created by IntelliJ IDEA.
  User: death
  Date: 15/07/2024
  Time: 10:57 a. m.
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset='utf-8'>
    <meta http-equiv='X-UA-Compatible' content='IE=edge'>
    <title>Inicio de sesión | Registro</title>
    <link rel="stylesheet" href="bootstrap-5.2.3-dist/css/bootstrap.css">
    <meta name='viewport' content='width=device-width, initial-scale=1'>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-icons/1.5.0/font/bootstrap-icons.min.css">


    <link rel="stylesheet" href="css/Login.css">

</head>

<body class="d-flex justify-content-center align-items-center">

<div class="bg-white p-5 rounded-5 col-lg-4 col-md-8 col-sm-8 col-xs-8 mb-5 form">
    <div class="d-flex justify-content-center mb-2">
        <img src="img/utezlogo.png" alt="login" style="height: 6rem;">
    </div>
    <div class="text-center fw-bold fs-3">Inicio de sesión</div>
    <form id="loginForm">
        <div class="mt-2">
            <input class="form-control" type="text" name="usuario" placeholder="Tu usuario" required>
        </div>

        <div class="mt-3 form-group position-relative">
            <input type="password" class="form-control" id="inputPassword" placeholder="Tu contraseña" required>
            <span class="toggle-password" onclick="togglePassword()">
                    <img class="eye" src="img/eye.svg" alt="ojo">
                </span>
        </div>


        <div class="d-flex justify-content-around mt-1">
            <div class="d-flex align-items-center gap-1">
                <div class="pt-1" style="font-size: .9rem;">Contraseña de más de 8 caracteres</div>
            </div>
        </div>
        <div class="text-danger mt-1" id="error-message"></div>
        <button type="submit" class="iniciar_cta btn btn-success text-white w-100 mt-3">Iniciar</button>
    </form>

    <div class="d-flex gap-1 justify-content-center mt-2" style="font-size: .9rem;">
        <a href="#" class="text-decoration-none fw-semibold">¿Has olvidado tu contraseña?</a>
    </div>

    <div class="d-flex gap-1 justify-content-center mt-2" style="font-size: .9rem;">
        <div>No tienes una cuenta?</div>
        <a href="#" class="text-decoration-none fw-semibold">Registrarse</a>
    </div>


</div>

<footer class="fixed-bottom bg-dark text-center">
    <div class="container py-3">
        <p class="para">Si olvidaste tu contraseña o no puedes iniciar sesión, acude a las instalaciones de la UTEZ
            en un horario
            de lunes a viernes de 9:30 a 6:00 pm</p>
    </div>
</footer>

<script src="bootstrap-5.2.3-dist/js/bootstrap.bundle.min.js"></script>
<script src="js/login.js"></script>
</body>

</html>