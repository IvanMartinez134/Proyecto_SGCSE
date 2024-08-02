<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ page import="java.util.List" %>
<%@ page import="mx.edu.utez.proyecto_sgcse.model.User" %>
<%@ page import="mx.edu.utez.proyecto_sgcse.dao.UserDao" %>

<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Consulta de Ventanillas</title>
    <link rel="stylesheet" href="bootstrap-5.2.3-dist/css/bootstrap.css">
    <link rel="stylesheet" href="css/consVen.css">
</head>

<body>
<div class="container mt-3">
    <header class="card-header-custom mb-3 rounded-3">
        <div class="d-flex align-items-center">
            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="none" stroke="currentColor"
                 stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="m-3">
                <circle cx="11" cy="11" r="8"></circle>
                <path d="M21 21l-4.3-4.3"></path>
            </svg>

            <div class="col-lg-4">
                <form method="get" action="mostrarVentanillas">
                    <input type="text" id="searchInput" name="searchText" class="header-input" placeholder="Buscar usuarios...">
                </form>
            </div>


            <div class="regis ms-auto">
                <a href="registroAdminitivo.jsp">
                    <button type="submit" class="btn btn-success t_regis">
                        Registrar administrativo
                    </button>
                </a>
            </div>
        </div>
    </header>
    <div class="row  rounded-bottom p-3" id="userList">
        <% UserDao userDao = new UserDao();
            List<User> vents = userDao.getAllVen();
            for (User user : vents) { %>


        <div class="col-lg-4 mb-4 col-md-6 mb-4 col-sm-10 mb-4 text-center m-auto">

            <div class="card h-80">

                <div class="card-header-custom">

                        <input type="text" class="header-input" value="<%= user.getNombre() %> <%= user.getApll_1() %> <%= user.getApll_2() %>"
                               readonly>

                </div>
                <div class="card-body-custom">
                    <div class="flex items-center justify-between">
                        <div>
                            <p class="text-gray-600 dark:text-gray-400">Correo: <%= user.getEmail() %></p>
                            <p class="text-gray-600 dark:text-gray-400">Teléfono: <%= user.getTel() %></p>

                            <button class="btn-success btn">Turno: <%= user.getTurno()%> </button>
                        </div>
                    </div>

                </div>

                <div class="card-footer-custom">

                    <a href="eliminarVen?email=<%= user.getEmail() %>" class="borrar"
                       data-id="<%= user.getId() %>">
                    <button class="btn-icon">
                        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="none"
                             stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                            <path d="M3 6h18"></path>
                            <path d="M19 6v14c0 1-1 2-2 2H7c-1 0-2-1-2-2V6"></path>
                            <path d="M8 6V4c0-1 1-2 2-2h4c1 0 2 1 2 2v2"></path>
                        </svg>
                    </button>
                    </a>

                    <a href="editarVentanilla.jsp?id=<%=user.getId()%>">

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

        </div>
        <% } %>
    </div>

</div>

<!-- Scripts al final del cuerpo -->

<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script>


    document.addEventListener("DOMContentLoaded", function () {
        const searchInput = document.getElementById('searchInput');
        const userList = document.getElementById('userList').getElementsByClassName('col-lg-4');

        searchInput.addEventListener('input', function () {
            const searchText = searchInput.value.toLowerCase().trim();

            Array.from(userList).forEach(function (card) {
                const name = card.querySelector('.header-input').value.toLowerCase();

                if (name.includes(searchText)) {
                    card.style.display = 'block';
                } else {
                    card.style.display = 'none';
                }
            });
        });

        // SweetAlert2

        $('.borrar').on('click', function (event) {
            event.preventDefault();

            var href = $(this).attr('href'); // Obtener el href del enlace

            Swal.fire({
                title: "¿Estás seguro?",
                text: "Una vez eliminado, el status cambiará a inactivo.",
                icon: "warning",
                showCancelButton: true,
                confirmButtonColor: "#d33",
                cancelButtonColor: "#3085d6",
                confirmButtonText: "Sí, eliminarlo",
                cancelButtonText: "Cancelar",
            }).then((result) => {
                if (result.isConfirmed) {
                    window.location.href = href;
                } else {
                    Swal.fire("Cancelado", "Tu usuario sigue activo.", "info");
                }
            });
        });

    });
</script>

</body>

</html>

