<%@ page import="mx.edu.utez.proyecto_sgcse.dao.DocumentoDao" %>
<%@ page import="mx.edu.utez.proyecto_sgcse.model.Documento" %>
<%@ page import="java.util.List" %>
<%@ page import="mx.edu.utez.proyecto_sgcse.dao.UserDao" %>
<%@ page import="mx.edu.utez.proyecto_sgcse.dao.CitaDao" %>
<%@ page import="mx.edu.utez.proyecto_sgcse.model.User" %>
<%@ page import="mx.edu.utez.proyecto_sgcse.model.Cita" %>
<%@ page import="mx.edu.utez.proyecto_sgcse.model.Comentario" %>
<%@ page import="mx.edu.utez.proyecto_sgcse.dao.ComentarioDao" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    CitaDao citaDao = new CitaDao();
    int usr_id = Integer.parseInt(request.getParameter("id"));
    Cita c = citaDao.getOneCita(usr_id);

    if (c != null) {
%>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Ver Comentarios</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-icons/1.10.3/font/bootstrap-icons.min.css">
    <link rel="stylesheet" href="css/pdf.css">
    <link rel="stylesheet" href="css/vercoment.css">
</head>
<body>

<nav class="navbar navbar-expand-lg navbar-dark bg-success">
    <div class="container-fluid m-0 p-0">
        <div class="navbar-logo-container">
            <img src="img/utezlogo.png" alt="Logo" class="navbar-logo m-0 p-0">
        </div>
        <h3 class="text-white navbar-title d-lg me-auto">
            Ver Comentarios
        </h3>
        <button class="mr-4 navbar-toggler" type="button" data-bs-toggle="offcanvas" data-bs-target="#menu">
            <div></div>
            <div></div>
            <div></div>
        </button>
        <section class="offcanvas offcanvas-end bg-success" style="width: 18rem;" id="menu" tabindex="-1">
            <div class="offcanvas-header" data-bs-theme="success">
                <h5 class="offcanvas-title text-white px-4">Menu</h5>
                <button class="btn-close m-1" type="button" aria-label="Close" data-bs-dismiss="offcanvas"></button>
            </div>
            <div class="offcanvas-body d-flex flex-column justify-content-between px-0" data-bs-theme="success">
                <ul class="navbar-nav fs-5 justify-content-end">
                    <li class="nav-item p-lg-2 p-2 px-4 py-md-3">
                        <a href="perfil.jsp" class="nav-link fs-6 d-lg"><i class="bi bi-person i"></i>Mi Perfil</a>
                    </li>
                    <li class="nav-item p-lg-2 p-2 px-4 py-md-3">
                        <a href="index.jsp" class="nav-link fs-6 d-lg"><i class="bi bi-box-arrow-right i"></i>Cerrar sesión</a>
                    </li>
                </ul>
            </div>
        </section>
    </div>
</nav>

<div class="container mt-4">
    <div class="row">
        <div id="documentCarousel" class="carousel slide col-12 col-md-7 mb-4" data-bs-ride="carousel">
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
                    <div class="embed-responsive embed-responsive-16by9 text-center">
                        <object class="embed-responsive-item" data="<%= request.getContextPath() + "/" + pdfPath %>" type="application/pdf" width="100%" height="600px">
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


            <button class="carousel-control-prev fle" type="button" data-bs-target="#documentCarousel" data-bs-slide="prev">
                <div class="fle">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                </div>
            </button>
            <button class="carousel-control-next fle" type="button" data-bs-target="#documentCarousel" data-bs-slide="next">
                <div class="fle">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                </div>
            </button>


        </div>


        <div class="col-12 col-md-5 d-flex flex-column">
            <h3 class="text-center mb-2">Comentarios</h3>
            <div class="mb-3">
                <textarea class="form-control rounded-3 areaCom" rows="3" readonly><%=com.getComentario()%></textarea>
            </div>


            <div class="text-center mb-3">
                <a href="resubirDoc.jsp?cta_id=<%=c.getId()%>" class="btn btn-success">Reenviar Documentos</a>
            </div>


            <div class="card mb-4">
                <% UserDao userDao = new UserDao();
                    User v = userDao.getOneVen(c.getVta_id());
                %>
                <div class="card-header bg-warning text-white">Estado: Incorrecta</div>
                <div class="card-body">
                    <p class="card-text">Tipo de Documentación: <%=c.getTipo_doc()%></p>
                    <p class="card-text">Fecha: <%=c.getFecha()%></p>
                    <p class="card-text">Horario: <%=c.getHora()%></p>
                    <p class="card-text">Encargado: <%=v.getNombre() + " " + v.getApll_1() + " " + v.getApll_2()%></p>
                </div>
            </div>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script src="js/pdf.js"></script>

</body>
</html>

<%
    } else {
        response.sendRedirect("alertaC.jsp");
    }
%>
