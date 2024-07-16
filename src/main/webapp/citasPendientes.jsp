<%--
  Created by IntelliJ IDEA.
  User: jonyo
  Date: 16/07/2024
  Time: 12:45 a. m.
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Citas Pendientes | Administrador</title>
    <link href="bootstrap-5.2.3-dist/css/bootstrap.css" rel="stylesheet">
    <link rel="stylesheet" href="css/citapen.css">

</head>

<body>

<nav class="navbar navbar-expand-lg navbar-expand-md navbar-expand-sm navbar-expand-xsm  bg-success col-xsm-12">
    <div class="navbar-logo-container">
        <a class="navbar-brand" href="#">
            <img src="img/utezlogo.png" alt="Logo" class="navbar-logo">
        </a>
    </div>
    <div class="navbar-title-container">
        <h1 class="title">Citas Pendientes</h1>
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





<div class="container">
    <div class="row mt-5">
        <div class="col-md-4 card_margin">
            <div class="card mb-3">
                <div class="card-header-custom">Estado: Pendiente</div>
                <div class="card-body-custom">
                    <p class="card-title">Nombre: Jonathan Ocampo</p>
                    <p class="card-text">Tipo de Documentación: Credencial</p>
                    <p class="card-text">Fecha: 23/06/2024</p>
                    <p class="card-text">Horario: 7:00 - 7:30</p>

                    <div class="buscador">
                        <input type="search" class="bus form-control mb-1"  name="bus" placeholder="Buscar..">
                        <div class="items">
                            <li class="names list-group-item">Bryan</li>
                            <li class="names list-group-item">Pulido</li>
                            <li class="names list-group-item">Emiliano</li>
                            <li class="names list-group-item">Ivan</li>
                        </div>
                        <div class="icon"><i class="bi bi-search"></i></div>
                    </div>


                    <div class="text-end mt-2">
                        <button class="btn btn-success">Asignar</button>
                    </div>
                </div>
            </div>
        </div>
        <!-- Repeat this card block for each pending appointment -->

        <div class="col-md-4 card_margin">
            <div class="card mb-3">
                <div class="card-header-custom">Estado: Pendiente</div>
                <div class="card-body-custom">
                    <p class="card-title">Nombre: Jonathan Ocampo</p>
                    <p class="card-text">Tipo de Documentación: Credencial</p>
                    <p class="card-text">Fecha: 23/06/2024</p>
                    <p class="card-text">Horario: 7:00 - 7:30</p>

                    <div class="buscador">
                        <input type="search" class="bus form-control mb-1"  name="bus" placeholder="Buscar..">
                        <div class="items">
                            <li class="names list-group-item">Bryan</li>
                            <li class="names list-group-item">Pulido</li>
                            <li class="names list-group-item">Emiliano</li>
                            <li class="names list-group-item">Ivan</li>
                        </div>
                        <div class="icon"><i class="bi bi-search"></i></div>
                    </div>



                    <div class="text-end mt-2">
                        <button class="btn btn-success">Asignar</button>
                    </div>
                </div>
            </div>
        </div>



        <div class="col-md-4 card_margin">
            <div class="card mb-3">
                <div class="card-header-custom">Estado: Pendiente</div>
                <div class="card-body-custom">
                    <p class="card-title">Nombre: Jonathan Ocampo</p>
                    <p class="card-text">Tipo de Documentación: Credencial</p>
                    <p class="card-text">Fecha: 23/06/2024</p>
                    <p class="card-text">Horario: 7:00 - 7:30</p>

                    <div class="buscador">
                        <input type="search" class="bus form-control mb-1"  name="bus" placeholder="Buscar..">
                        <div class="items">
                            <li class="names list-group-item">Bryan</li>
                            <li class="names list-group-item">Pulido</li>
                            <li class="names list-group-item">Emiliano</li>
                            <li class="names list-group-item">Ivan</li>
                        </div>
                        <div class="icon"><i class="bi bi-search"></i></div>
                    </div>




                    <div class="text-end mt-2">
                        <button class="btn btn-success">Asignar</button>
                    </div>
                </div>
            </div>
        </div>



        <div class="col-md-4 card_margin">
            <div class="card mb-3">
                <div class="card-header-custom">Estado: Pendiente</div>
                <div class="card-body-custom">
                    <p class="card-title">Nombre: Jonathan Ocampo</p>
                    <p class="card-text">Tipo de Documentación: Credencial</p>
                    <p class="card-text">Fecha: 23/06/2024</p>
                    <p class="card-text">Horario: 7:00 - 7:30</p>


                    <div class="buscador">
                        <input type="search" class="bus form-control mb-1"  name="bus" placeholder="Buscar..">
                        <div class="items">
                            <li class="names list-group-item">Bryan</li>
                            <li class="names list-group-item">Pulido</li>
                            <li class="names list-group-item">Emiliano</li>
                            <li class="names list-group-item">Ivan</li>
                        </div>
                        <div class="icon"><i class="bi bi-search"></i></div>
                    </div>


                    <div class="text-end mt-2">
                        <button class="btn btn-success">Asignar</button>
                    </div>
                </div>
            </div>
        </div>




        <div class="col-md-4 card_margin">
            <div class="card mb-3">
                <div class="card-header-custom">Estado: Pendiente</div>
                <div class="card-body-custom">
                    <p class="card-title">Nombre: Jonathan Ocampo</p>
                    <p class="card-text">Tipo de Documentación: Credencial</p>
                    <p class="card-text">Fecha: 23/06/2024</p>
                    <p class="card-text">Horario: 7:00 - 7:30</p>

                    <div class="buscador">
                        <input type="search" class="bus form-control mb-1"  name="bus" placeholder="Buscar..">
                        <div class="items">
                            <li class="names list-group-item">Bryan</li>
                            <li class="names list-group-item">Pulido</li>
                            <li class="names list-group-item">Emiliano</li>
                            <li class="names list-group-item">Ivan</li>
                        </div>
                        <div class="icon"><i class="bi bi-search"></i></div>
                    </div>



                    <div class="text-end mt-2">
                        <button class="btn btn-success">Asignar</button>
                    </div>
                </div>
            </div>
        </div>




        <div class="col-md-4 card_margin">
            <div class="card mb-3">
                <div class="card-header-custom">Estado: Pendiente</div>
                <div class="card-body-custom">
                    <p class="card-title">Nombre: Jonathan Ocampo</p>
                    <p class="card-text">Tipo de Documentación: Credencial</p>
                    <p class="card-text">Fecha: 23/06/2024</p>
                    <p class="card-text">Horario: 7:00 - 7:30</p>

                    <div class="buscador">
                        <input type="search" class="bus form-control mb-1"  placeholder="Buscar..">
                        <div class="items">
                            <li class="names list-group-item">Bryan</li>
                            <li class="names list-group-item">Pulido</li>
                            <li class="names list-group-item">Emiliano</li>
                            <li class="names list-group-item">Ivan</li>
                        </div>
                        <div class="icon"><i class="bi bi-search"></i></div>
                    </div>

                </div>

                <div class="text-end mt-2">
                    <button class="btn btn-success">Asignar</button>
                </div>
            </div>
        </div>
    </div>






</div>



<script src="bootstrap-5.2.3-dist/js/bootstrap.bundle.min.js"></script>
<script src="js/citap.js"></script>

</body>

</html>
