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
    <title>Ver PDF</title>
    <meta name='viewport' content='width=device-width, initial-scale=1'>
    <link rel="stylesheet" href="bootstrap-5.2.3-dist/css/bootstrap.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-icons/1.5.0/font/bootstrap-icons.min.css">
    <link rel="stylesheet" href="css/pdf.css">
    <link rel="stylesheet" href="css/vercoment.css">
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
    <div class="row justify-content-center">

        <div id="documentCarousel" class="carousel slide col-lg-8 mb-4 mt-2" data-bs-ride="carousel">
            <div class="carousel-inner">
                <%
                    DocumentoDao docDao = new DocumentoDao();
                    int cta_id = Integer.parseInt(request.getParameter("cta_id"));

                    List<Documento> docs = docDao.getAllDocumentos(cta_id);
                    boolean isFirst = true;

                    for (Documento d : docs) {
                        String pdfPath = d.getDireccion();
                        if (pdfPath != null) {
                %>
                <div class="carousel-item <%= isFirst ? "active" : "" %>">
                    <div class="embed-responsive embed-responsive-16by9 text-center justify-content-center mt-5">
                        <object class="embed-responsive-item" data="<%= request.getContextPath() + "/" + pdfPath %>" type="application/pdf" width="80%" height="600px">
                            <p>Tu navegador no admite la visualización de archivos PDF. Puedes descargar el archivo <a href="<%= request.getContextPath() + "/" + pdfPath %>">aquí</a>.</p>
                        </object>
                    </div>
                </div>
                <%
                    isFirst = false;
                } else {
                %>
                <div class="carousel-item">
                    <p>No se ha encontrado el archivo.</p>
                </div>
                <%
                        }
                    }
                %>
            </div>

            <button class="carousel-control-prev" type="button" data-bs-target="#documentCarousel" data-bs-slide="prev">
                <div class="fle">
                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                </div>
            </button>
            <button class="carousel-control-next" type="button" data-bs-target="#documentCarousel" data-bs-slide="next">
                <div class="fle">
                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                </div>
            </button>
        </div>


        <div class="col-lg-4 col-12 mt-lg-5 mt-4 mb-5">
            <h3>Comentarios</h3>
            <form id="comentForm" method="post" action="docIncorrecta">
                <div class="mb-3">
                    <textarea class="form-control areaCom" rows="3" id="comen" name="comentario" placeholder="Escribe las observaciones ..."></textarea>
                </div>
                <div class="text-end">
                    <button class="btn btn-danger mt-2 me-3" id="canComent">Enviar comentario</button>

                    <input type="hidden" name="id" value="<%=cta_id%>">

                    <button class="btn btn-success mt-2 me-1" id="docCorrecta" type="button">Documentación correcta</button>
                </div>
            </form>
        </div>
    </div>
</div>



</div>

<script>
    document.getElementById('docCorrecta').addEventListener('click', function() {
        window.location.href = 'docCorrecta?id=<%=cta_id%>';
    });
</script>


<script>

    document.getElementById('form').addEventListener('submit', function (e) {
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



<script>
    $(document).ready(function() {
        $('#comentForm').on('submit', function() {
            $('#comen').val('');
        });
    });
</script>

<script src="bootstrap-5.2.3-dist/js/bootstrap.bundle.min.js"></script>
<script src="js/pdf.js"></script>

</body>


</html>