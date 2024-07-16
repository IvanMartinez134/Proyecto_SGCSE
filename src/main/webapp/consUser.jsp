<%--
  Created by IntelliJ IDEA.
  User: jonyo
  Date: 16/07/2024
  Time: 12:48 a. m.
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Consulta de usuarios | Administador</title>
    <link href="bootstrap-5.2.3-dist/css/bootstrap.css" rel="stylesheet">
    <link rel="stylesheet" href="css/consU.css">
</head>

<body >
<div class="container mt-3">
    <header class="card-header-custom mb-3 rounded-3">
        <div class="d-flex align-items-center">
            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="none" stroke="currentColor"
                 stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class=" m-3">
                <circle cx="11" cy="11" r="8"></circle>
                <path d="M21 21l-4.3-4.3"></path>
            </svg>
            <input type="text" id="searchInput" class="header-input" placeholder="Buscar usuarios...">
        </div>
    </header>
    <div class="row bg-light rounded-bottom p-3" id="userList">
        <!-- Aquí se generarán las cartas  -->
    </div>
</div>
<script src="js/consU.js" defer></script>
</body>

</html>

