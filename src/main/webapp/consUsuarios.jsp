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

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css">

    <!-- Datatables -->
    <link rel="stylesheet" href="https://cdn.datatables.net/1.12.1/css/dataTables.bootstrap5.min.css">

    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css" integrity="sha512-xh6O/CkQoPOWDdYTDqeRdPCVd1SpvCA9XXcUnZS2FmJNp1coAFzvtCN9BmamE+4aHK8yyUHUSCcJHgXloTyT2A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-icons/1.5.0/font/bootstrap-icons.min.css">


    <link rel="stylesheet" href="css/consUsarios.css">

</head>
<body>


<nav class=" navbar navbar-expand-lg  navbar-dark bg-success">

    <div class="container-fluid m-0 p-0">
        <div class="navbar-logo-container">

            <img src="img/utezlogo.png" alt="Logo" class="navbar-logo m-0 p-0">

        </div>




        <h3 class="text-white navbar-title  d-lg me-auto">
            Gestion Estudiantes
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



<div class="container my-4 justify-content-center">



    <table id="table_users" class="display table table-striped table-hover d-sm col-10" >
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

