<%--
  Created by IntelliJ IDEA.
  User: death
  Date: 20/06/2024
  Time: 09:26 p. m.
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset='utf-8'>
    <meta http-equiv='X-UA-Compatible' content='IE=edge'>
    <title>Inicio de sesion | Registro</title>
    <link rel="stylesheet" href="bootstrap-5.2.3-dist/css/bootstrap.css">
    <meta name='viewport' content='width=device-width, initial-scale=1'>

</head>

<body class="bg-dark d-flex justify-content-center align-items-center vh-100 ">

<div class="bg-white p-5 rounded-5 col-lg-4 col-md-6 col-sm-8 col-xs-6 mb-4">
    <div class="d-flex justify-content-center mb-2">
        <img src="img/utezlogo.png" alt="login" style="height: 6rem;">
    </div>
    <div class="text-center fw-bold fs-3 ">Inicio de sesión</div>
    <form id="loginForm">
        <div class="mt-2">
            <input class="form-control" type="text" name="usuario" placeholder="Tu usuario" required>
        </div>
        <div class="mt-3">
            <input class="form-control" type="password" name="password" placeholder="Tu contraseña" required>
        </div>
        <div class="d-flex justify-content-around mt-1">
            <!-- -->
            <div class="d-flex align-items-center gap-1">
                <div class="pt-1" style="font-size: .9rem;">Contraseña de más de 8 caracteres</div>
            </div>
        </div>
        <button type="submit" class="iniciar_cta btn btn-success text-white w-100 mt-3 ">Iniciar</button>
    </form>
    <div class="d-flex gap-1 justify-content-center mt-2" style="font-size: .9rem;">
        <div>No tienes una cuenta?</div>
        <a href="#" class="text-decoration-none fw-semibold">Registrarse</a>
    </div>
</div>


<footer class="fixed-bottom bg-light text-center">
    <div class="container py-3">
        <p class="text-secondary">Si olvidaste tu contraseña o no puedes iniciar sesion, acude a las instalaciones de la UTEZ en un horario
            de lunes a viernes de 9:30 a 6:00 pm
        </p>
    </div>
</footer>


<script src="js/main.js"></script>
</body>

</html>
