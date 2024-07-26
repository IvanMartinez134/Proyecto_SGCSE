<%--
  Created by IntelliJ IDEA.
  User: jonyo
  Date: 25/07/2024
  Time: 08:13 p. m.
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Estadísticas de Trámites</title>
    <link rel="stylesheet" href="bootstrap-5.2.3-dist/css/bootstrap.min.css">
    <script src="https://unpkg.com/lightweight-charts/dist/lightweight-charts.standalone.production.js"></script>
    <style>
        #chart {
            width: 60%; /* Ajusta el ancho según el diseño deseado */
            height: 400px; /* Ajusta la altura según el diseño deseado */
        }
        .container {
            text-align: center;
            margin-top: 20px; /* Ajusta el margen superior según sea necesario */
        }
        h1 {
            margin-bottom: 20px; /* Espacio entre el título y el gráfico */
        }
    </style>
    <link rel="stylesheet" href="css/estadisticas.css">
</head>
<body>


<nav class="navbar navbar-expand-lg  navbar-dark bg-success mb-4">

    <div class="container-fluid m-0 p-0">
        <div class="navbar-logo-container">

            <img src="img/utezlogo.png" alt="Logo" class="navbar-logo m-0 p-0">

        </div>




        <h3 class="text-white navbar-title  d-lg me-auto">
            Estadisticas
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
                        <a href="" class="nav-link  fs-6 d-lg "><i class="bi bi-person i"></i>Mi Perfil</a>
                    </li >
                    <li class="nav-item p-lg-2 p-2 px-4  py-md-3 c">
                        <a href="" class="nav-link  fs-6 d-lg  "><i class="bi bi-box-arrow-right i"></i>Cerrar sesion</a>
                    </li>
                </ul>

            </div>

        </section>



    </div>
</nav>



<div class="chart-container">
    <h3>Trámites por mes</h3>
    <div id="chart"></div>
    <div id="legend" class="chart-legend">
        <div class="legend-item">
            <span class="legend-color" style="background-color: rgba(75, 192, 192, 0.4);"></span>
            <span class="legend-text">Trámites</span>
        </div>
    </div>
</div>


<script>
    console.log('Script is running');

    fetch('/pruebaGit_war_exploded/obtenerTramites')
        .then(response => response.json())
        .then(data => {


            // Procesa los datos para el gráfico y lo del tiempo algo asi comprendi jaja

            const seriesData = data.map(item => ({
                time: new Date(2024, item.mes - 1).getTime() / 1000,
                value: item.cantidad
            }));

            // Como quiero que se vea de bonis ( configurarlo pues)

            const chart = LightweightCharts.createChart(document.getElementById('chart'), {
                width: document.getElementById('chart').clientWidth,
                height: document.getElementById('chart').clientHeight,
                crossHair: {
                    mode: 1
                }
            });

            // Mas estilos y datos que quieres que muestre de la libreria

            const areaSeries = chart.addAreaSeries({
                topColor: 'rgba(75, 192, 192, 0.4)',
                bottomColor: 'rgba(75, 192, 192, 0.1)',
                lineColor: 'rgb(75, 192, 192)',
                lineWidth: 10
            });

            areaSeries.setData(seriesData);




            chart.xAxis = chart.addAxis({
                tickPlacement: 'on',
                labelFormatter: (timestamp) => {
                    const date = new Date(timestamp * 1000);
                    const options = { month: 'short', year: 'numeric' };
                    return new Intl.DateTimeFormat('es-ES', options).format(date);
                }
            });

        })
        .catch(error => {
            console.error('Error al obtener los datos:', error);
        });
</script>
</body>
</html>

