<%@ page import="java.io.File" %>
<%@ page import="mx.edu.utez.proyecto_sgcse.dao.DocumentoDao" %>
<%@ page import="mx.edu.utez.proyecto_sgcse.model.Documento" %>
<%@ page import="java.util.List" %><%--
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
        DocumentoDao docDao = new DocumentoDao();
        int cta_id = Integer.parseInt(request.getParameter("cta_id"));

        List<Documento> docs = docDao.getAllDocumentos(cta_id);

        for (Documento d : docs) {

        // Obtener la ruta del archivo desde la sesión
        String pdfPath = d.getDireccion();
        System.out.println( "Direccion" + pdfPath);

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
        }
    %>

    <div class="card-footer-custom">

        <a href="docIncorrecta?id=<%=cta_id%>" class="borrar"
           data-id="<%%>">
            <button class="btn-icon">
                <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="none"
                     stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                    <path d="M3 6h18"></path>
                    <path d="M19 6v14c0 1-1 2-2 2H7c-1 0-2-1-2-2V6"></path>
                    <path d="M8 6V4c0-1 1-2 2-2h4c1 0 2 1 2 2v2"></path>
                </svg>
            </button>
        </a>

        <a href="docCorrecta?id=<%=cta_id%>">

            <button class="btn-icon">
                <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="none"
                     stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                    <path d="M12 22h6a2 2 0 0 0 2-2V7l-5-5H6a2 2 0 0 0-2 2v10"></path>
                    <path d="M14 2v4a2 2 0 0 0 2 2h4"></path>
                    <path d="M10.4 12.6a2 2 0 1 1 3 3L8 21l-4 1 1-4Z"></path>
                </svg>
            </button>
        </a>
    </div>
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