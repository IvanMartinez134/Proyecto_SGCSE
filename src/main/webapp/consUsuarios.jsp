<%--
  Created by IntelliJ IDEA.
  User: death
  Date: 17/07/2024
  Time: 06:01 p. m.
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="java.util.List" %>
<%@ page import="mx.edu.utez.proyecto_sgcse.model.User" %>
<%@ page import="mx.edu.utez.proyecto_sgcse.dao.UserDao" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Lista de Usuarios</title>

    <link rel="stylesheet" href="css/consUsarios.css">
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css">

    <!-- Datatables -->
    <link rel="stylesheet" href="https://cdn.datatables.net/1.12.1/css/dataTables.bootstrap5.min.css">

    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css" integrity="sha512-xh6O/CkQoPOWDdYTDqeRdPCVd1SpvCA9XXcUnZS2FmJNp1coAFzvtCN9BmamE+4aHK8yyUHUSCcJHgXloTyT2A==" crossorigin="anonymous" referrerpolicy="no-referrer" />

</head>
<body>

<nav class="navbar navbar-expand-lg navbar-expand-md navbar-expand-sm navbar-expand-xsm bg-success col-xsm-12">
    <div class="navbar-logo-container">
        <a class="navbar-brand" href="#">
            <img src="img/utezlogo.png" alt="Logo" class="navbar-logo">
        </a>
    </div>
    <div class="navbar-title-container">
        <h1 class="title">Gestion de alumnos</h1>
    </div>
    <div class="nav_menu" id="open_close">
        <button class="menu">
            <div class="menu_item"></div>
            <div class="menu_item"></div>
            <div class="menu_item"></div>
        </button>
    </div>
</nav>

<aside id="aside">
    <div class="lateral"></div>
    <div class="aside_con">
        <div class="aside_i">
            <i class="bi bi-person "></i>
            <span class="a_span">Mi perfil</span>
        </div>
    </div>
    <div class="aside_c">
        <div class="aside_i">
            <i class="bi-box-arrow-right"></i>
            <span class="a_span">Cerrar sesion</span>
        </div>
    </div>
</aside>

<div class="container my-4">

    <button class="btn btn-success m-3">
        <a href="registroEst.jsp" style="color: white; text-decoration: none;">Registrar Alumno</a>
    </button>


    <table id="table_users" class="display table table-striped table-hover">
        <thead class="table-primary">
        <tr class="table-active">
            <th class="centered">ID</th>
            <th class="centered">Nombre</th>
            <th class="centered">Apellido</th>
            <th class="centered">Email</th>
            <th class="centered">Status</th>
            <th class="centered">Editar</th>
            <th class="centered">Eliminar</th>
        </tr>
        </thead>
        <tbody>
        <% UserDao userDao = new UserDao();
            List<User> users = userDao.getAllUsers();
            for (User user : users) { %>
        <tr>
            <td><%= user.getId() %></td>
            <td><%= user.getNombre() %></td>
            <td><%= user.getApll_1() %> <%= user.getApll_2() %></td>
            <td><%= user.getEmail() %></td>
            <td><%= user.getStatus() %></td>
            <td>
                <a href="editarUsuario.jsp?id=<%= user.getId() %>">
                    <button class="btn btn-sm btn-primary"><i class="fas fa-edit"></i></button>
                </a>
            </td>
            <td>
                <a href="eliminarUsuario?email=<%= user.getEmail() %>" class="btn-delete" data-id="<%= user.getId() %>">
                    <button class="btn btn-sm btn-danger"><i class="fas fa-trash"></i></button>
                </a>
            </td>
        </tr>
        <% } %>
        </tbody>
    </table>
</div>

<!-- jQuery -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>

<!-- SweetAlert -->
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

<script>


    // .btn-delete

    $(document).ready(function() {
        $('.btn-delete').on('click', function(event) {
            event.preventDefault();

            var href = $(this).attr('href');
            var id = $(this).data('id');

            Swal.fire({
                title: "Estas seguro?",
                text: "Una vez eliminado, el status cambiara a inactivo!",
                icon: "warning",
                showCancelButton: true,
                confirmButtonColor: "#d33",
                cancelButtonColor: "#3085d6",
                confirmButtonText: "Si, eliminarlo",
                cancelButtonText: "Cancelar",
            }).then((result) => {
                if (result.isConfirmed) {

                    window.location.href = href;
                } else {

                    Swal.fire("Cancelado", "Tu usario sigue activo");
                }
            });
        });
    });
</script>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>

<!-- DataTables -->
<script src="https://cdn.datatables.net/1.12.1/js/jquery.dataTables.min.js"></script>
<script src="https://cdn.datatables.net/1.12.1/js/dataTables.bootstrap5.min.js"></script>


<script src="js/consUsuarios.js"></script>

</body>
</html>

