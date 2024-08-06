<%--
  Created by IntelliJ IDEA.
  User: jonyo
  Date: 06/08/2024
  Time: 02:09 a. m.
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<!DOCTYPE html>
<html>
<head>
    <meta charset='utf-8'>
    <meta http-equiv='X-UA-Compatible' content='IE=edge'>
    <title>Esperando Codigo...</title>
    <link rel="stylesheet" href="bootstrap-5.2.3-dist/css/bootstrap.css">
    <meta name='viewport' content='width=device-width, initial-scale=1'>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-icons/1.5.0/font/bootstrap-icons.min.css">
    <link rel="stylesheet" href="css/Login.css">
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@10/dist/sweetalert2.all.min.js"></script>
</head>
<body>


<script>
    document.addEventListener("DOMContentLoaded", function() {
        <%
            String mensaje = (String) session.getAttribute("mensaje");
            if (mensaje != null) {
        %>
        Swal.fire({
            icon: 'info',
            title: 'Revisa tu correo',
            text: '<%= mensaje %>'
        }).then(function() {
            window.location.href = 'index.jsp';
        });
        <%
            session.removeAttribute("mensaje");
        }
    %>
    });
</script>
</body>
</html>
