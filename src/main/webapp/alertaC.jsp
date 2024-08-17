<%--
  Created by IntelliJ IDEA.
  User: jonyo
  Date: 17/08/2024
  Time: 09:37 a. m.
  To change this template use File | Settings | File Templates.
--%>


<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Alerta</title>



    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap" rel="stylesheet"> <!-- Importa la fuente Roboto -->
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <style>
        body{
            font-family: 'Roboto', sans-serif;
        }
    </style>

</head>
<body>
<script>
    Swal.fire({
        icon: 'info',
        title: 'Sin comentarios',
        text: 'Por el momento no tienes comentarios, espera.',
        confirmButtonText: 'Aceptar'
    }).then((result) => {
        if (result.isConfirmed) {
            window.location.href = 'pageEst.jsp';
        }
    });
</script>
</body>
</html>