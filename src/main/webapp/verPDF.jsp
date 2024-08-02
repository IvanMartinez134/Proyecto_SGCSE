<%@ page import="java.io.File" %><%--
  Created by IntelliJ IDEA.
  User: jonyo
  Date: 16/07/2024
  Time: 12:51 a. m.
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<!DOCTYPE html>
<html>
<head>
    <meta charset='utf-8'>
    <meta http-equiv='X-UA-Compatible' content='IE=edge'>
    <title>Page Title</title>
    <meta name='viewport' content='width=device-width, initial-scale=1'>
    <link rel="stylesheet" href="bootstrap-5.2.3-dist/css/bootstrap.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-icons/1.5.0/font/bootstrap-icons.min.css">
    <link rel="stylesheet" href="css/pdf.css">
</head>
<body>


<nav class=" navbar navbar-expand-lg  navbar-dark bg-success ">

    <div class="container-fluid m-0 p-0">
        <div class="navbar-logo-container">

            <img src="img/utezlogo.png" alt="Logo" class="navbar-logo m-0 p-0">

        </div>




        <h3 class="text-white navbar-title d-lg me-auto">
            Ver PDF
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


<div class="container">
    <%
        // Obtener la ruta del archivo desde la sesión
        String pdfPath = (String) session.getAttribute("pdfPath");
        if (pdfPath != null) {
    %>
    <div class="embed-responsive embed-responsive-16by9  text-center justify-content-center mt-5">
        <object class="embed-responsive-item" data="<%= request.getContextPath() + "/" + pdfPath %>" type="application/pdf" width="80%" height="600px">
            <p>Tu navegador no admite la visualización de archivos PDF. Puedes descargar el archivo <a href="<%= request.getContextPath() + "/" + pdfPath %>">aquí</a>.</p>
        </object>
    </div>
    <%
    } else {
    %>
    <p>No se ha encontrado el archivo.</p>
    <%
        }
    %>
</div>


<script>

    ocument.getElementById('form').addEventListener('submit', function (e) {
        e.preventDefault();
        const formData = new FormData(this);

        fetch('subirArchivosJS', {
            method: 'POST',
            body: formData
        })
            .then(response => response.json())
            .then(data => {
                if (data.mensaje === 'Archivo subido exitosamente') {
                    window.location.href = 'verpdf.jsp';
                } else {
                    alert('Error al subir el archivo');
                }
            })
            .catch(error => console.error('Error:', error));
    });

</script>

<script src="bootstrap-5.2.3-dist/js/bootstrap.bundle.min.js"></script>
<script src="js/pdf.js"></script>

</body>


</html>