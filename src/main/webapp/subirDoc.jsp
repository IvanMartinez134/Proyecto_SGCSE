
<%--
  Created by IntelliJ IDEA.
  User: death
  Date: 15/07/2024
  Time: 02:24 p. m.
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Subir Documentos</title>
    <link rel="stylesheet" href="bootstrap-5.2.3-dist/css/bootstrap.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-icons/1.5.0/font/bootstrap-icons.min.css">
    <link rel="stylesheet" href="css/subirDoc.css">

    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@10/dist/sweetalert2.all.min.js"></script>



</head>

<body>


<nav class=" navbar navbar-expand-lg  navbar-dark bg-success">

    <div class="container-fluid m-0 p-0">
        <div class="navbar-logo-container">

            <img src="img/utezlogo.png" alt="Logo" class="navbar-logo m-0 p-0">

        </div>




        <h3 class="text-white navbar-title  d-lg  me-auto">
            Subir Doc
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



<div class="container col-lg-8 col-sm-10 d-sm mt-5">
    <div class="justify-content-between align-items-center">


        <div id="timer" class=" fs-3 timer">5:00</div>



        <div class="documentacion mt-3">

            <h2>Documentación</h2>
            <p>Recuerda subir todos tus archivos escaneados y en formato PDF.</p>
            <ul>
                <li><strong>Constancia simple:</strong> Es el documento donde se observan…</li>
                <li><strong>Comprobante de domicilio:</strong> Es el documento donde se establece el estado, el
                    municipio y la calle donde habitas.</li>
                <li><strong>Comprobante de pago:</strong> En este documento se debe de observar tu matrícula, nombre y
                    fecha para ser validado.</li>
            </ul>
        </div>

    </div>




    <!-- subirDoc.jsp -->

    <%-- <div class="drag-drop" id="drag-drop-area">
            <p>Arrastra y suelta tus archivos aquí o haz clic para seleccionar archivos.</p>
            <input type="file" id="file-input" name="file" multiple>
            <ul class="file-list" id="file-list">
                <!-- Aquí se mostrarán los archivos seleccionados -->
            </ul>
        </div>  --%>



    <form id="form" action="subirArchivosJS" method="post" enctype="multipart/form-data">


            <div class="drag-drop" id="drag-drop-area">
                <p>Haz clic para seleccionar archivos.</p>
                <input class="mt-2" type="file" id="file-input"  accept=".pdf" name="file" multiple>
                <ul class="file-list" id="file-list">
                    <!-- Aquí se mostrarán los archivos seleccionados -->
                </ul>
            </div>

            <input type="hidden" name="cta_id" value="<%=request.getParameter("cta_id")%>">


        <div class="text-center">
            <input type="submit" class="btn btn-success mt-3" value="Subir Archivos">
        </div>


   </form>

   <div id="msg" class="alert alert-success alert-dismissible fade show" role="alert" hidden></div>

</div>




<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>





<script>

    document.addEventListener("DOMContentLoaded", function() {
        let timeLeft = 300;
        const ele = document.getElementById('timer');

        function updateTimer() {
            const minutes = Math.floor(timeLeft / 60);
            const seconds = timeLeft % 60;
            ele.innerHTML = minutes + ':' + (seconds.toString().padStart(2, '0'));


            if (timeLeft <= 0) {
                clearInterval(timerInterval);
                window.location.href = 'eliminarCita?cta_id=<%=request.getParameter("cta_id")%> ';
            }

            timeLeft--;
        }

        const timerInterval = setInterval(updateTimer, 1000);
    });


</script>


<script>
    document.addEventListener("DOMContentLoaded", function() {
        <%
            String mensaje = (String) session.getAttribute("mensaje");
            if (mensaje != null) {
        %>
        Swal.fire({
            icon: 'success',
            title: 'Éxito',
            text: '<%= mensaje %>'
        }).then(function(){
            window.location.href = 'pageEst.jsp';
        });
        <%
            session.removeAttribute("mensaje");
        }
    %>
    });

</script>

<script src="js/subirDoc.js"></script>

</body>

</html>