<%--
  Created by IntelliJ IDEA.
  User: jonyo
  Date: 06/08/2024
  Time: 04:09 a. m.
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Error 500 - Internal Server Error</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
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
            title: 'Se repetieron datos',
            text: '<%= mensaje %>'
        }).then(function() {
            window.location.href = 'pageEst.jsp';
        });
        <%
            session.removeAttribute("mensaje");
        }
    %>
    });
</script>



</body>
</html>