<%@ page import="mx.edu.utez.proyecto_sgcse.dao.DocumentoDao" %>
<%@ page import="mx.edu.utez.proyecto_sgcse.model.Documento" %>
<%@ page import="java.util.List" %>
<%@ page import="mx.edu.utez.proyecto_sgcse.dao.UserDao" %>
<%@ page import="mx.edu.utez.proyecto_sgcse.dao.CitaDao" %>
<%@ page import="mx.edu.utez.proyecto_sgcse.model.User" %>
<%@ page import="mx.edu.utez.proyecto_sgcse.model.Cita" %>
<%@ page import="mx.edu.utez.proyecto_sgcse.model.Comentario" %>
<%@ page import="mx.edu.utez.proyecto_sgcse.dao.ComentarioDao" %><%--
  Created by IntelliJ IDEA.
  User: jonyo
  Date: 16/07/2024
  Time: 12:51 a. m.
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<%
    CitaDao citaDao = new CitaDao();
    int usr_id = Integer.parseInt(request.getParameter("id"));
    Cita c = citaDao.getOneCita(usr_id);

    if (c != null){
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset='utf-8'>
    <meta http-equiv='X-UA-Compatible' content='IE=edge'>
    <title>Ver Comentarios</title>
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
            Ver Comentarios
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

<div class="d-flex">



    <div id="documentCarousel" class="carousel slide container mb-4  col-7" data-bs-ride="carousel">
        <div class="carousel-inner">
            <%

                ComentarioDao comDao = new ComentarioDao();
                DocumentoDao docDao = new DocumentoDao();


                Comentario com = comDao.getOneComentario(c.getId());
                List<Documento> docs = docDao.getAllDocumentos(c.getId());

                int index = 0;
                for (Documento d : docs) {
                    String pdfPath = d.getDireccion();
                    boolean isActive = (index == 0);
                    index++;

                    if (pdfPath != null) {
            %>
            <div class="carousel-item <%= isActive ? "active" : "" %>">
                <div class="embed-responsive embed-responsive-16by9 text-center justify-content-center mt-5">
                    <object class="embed-responsive-item" data="<%= request.getContextPath() + "/" + pdfPath %>" type="application/pdf" width="80%" height="600px">
                        <p>Puedes descargar el archivo <a href="<%= request.getContextPath() + "/" + pdfPath %>">aquí</a>.</p>
                    </object>
                </div>
            </div>
            <%
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
                <span class="carousel-control-prev-icon " aria-hidden="true"></span>
            </div>


        </button>
        <button class="carousel-control-next" type="button" data-bs-target="#documentCarousel" data-bs-slide="next">
            <div class="fle">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
            </div>





        </button>
    </div>








    <div class="container mt-5 d-lg col-3 ms-5 cd">
        <h3 class="text-center mb-4">Comentarios</h3>

            <div class="mb-3">
                <textarea class="areaCom rounded-3" rows="3" id="comen" name="comentario" readonly><%=com.getComentario()%></textarea>
            </div>

            <div class="text-center col-10 m-auto fs-6">
                <a href="resubirDoc.jsp?cta_id=<%=c.getId()%>" class="text-decoration-none">
                    <input class="btn btn-success" value="Reenviar Documentos ">
                </a>


            </div>


        <div class="container mt-4">
            <div class="mt-2 justify-content-center">

                <%
                    UserDao userDao = new UserDao();

                %>
                <div class="col-md-4 card_margin" style="width: 100%">
                    <div class="card mb-3">
                        <%User v = userDao.getOneVen(c.getVta_id());%>
                        <div class="card-header-custom">Estado: Incorrecta</div>
                        <div class="card-body-custom">
                            <p class="card-text">Tipo de Documentación: <%=c.getTipo_doc()%></p>
                            <p class="card-text">Fecha: <%=c.getFecha()%></p>
                            <p class="card-text">Horario: <%=c.getHora()%></p>
                            <p class="card-text">Encargado: <%=v.getNombre() + " " + v.getApll_1() + " " + v.getApll_2()%></p>

                        </div>
                    </div>
                </div>

            </div>



    </div>

</div>


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

<%
    }
%>