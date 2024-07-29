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
    <script src="https://unpkg.com/lightweight-charts@4.2.0/dist/lightweight-charts.standalone.production.js"></script>
    <style>
        #chart {
            width: 80%; /* Ajusta el ancho según el diseño deseado */
            height: 500px; /* Ajusta la altura según el diseño deseado */
        }
        .chart-container {
            text-align: center;
            margin-top: 20px;
        }
        h1 {
            margin-bottom: 20px;
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
            <span class="legend-color" style="background-color: rgba(75, 192, 192, 0.4) !important;"></span>
            Inscripcion
        </div>
        <div class="legend-item">
            <span class="legend-color" style="background-color: rgba(192, 75, 75, 0.4) !important;"></span>
            Reinscripcion
        </div>
        <div class="legend-item">
            <span class="legend-color" style="background-color: rgba(75, 75, 192, 0.4) !important;"></span>
            Certificado
        </div>
    </div>
</div>

<script>
    console.log('Vamos');

    fetch('/pruebaGit_war_exploded/obtenerTramites')
        .then(response => response.json())
        .then(data => {
            console.log('Datos recibidos:', data);

            if (!Array.isArray(data) || data.length === 0) {
                console.error('No se recibieron datos válidos');
                return;
            }

            // Procesa los datos para el gráfico
            const seriesData = {};
            data.forEach(item => {
                if (item.fecha && item.tipo_de_tramite && item.cantidad !== null) {

                    // Convertir la fecha de cadena a timestamp en segundos
                    const timestamp = new Date(item.fecha).getTime() / 1000;
                    console.log(`Procesando: ${item.fecha}, ${timestamp}, ${item.tipo_de_tramite}, ${item.cantidad}`);
                    if (!seriesData[item.tipo_de_tramite]) {
                        seriesData[item.tipo_de_tramite] = [];
                    }
                    seriesData[item.tipo_de_tramite].push({ time: timestamp, value: item.cantidad });
                } else {
                    console.error('Datos inválidos:', item);
                }
            });

            // Verifica los datos de las series antes de crear el gráfico
            console.log('Series de datos procesadas:', seriesData);

            // Configura el gráfico
            const chart = LightweightCharts.createChart(document.getElementById('chart'), {
                width: document.getElementById('chart').clientWidth,
                height: document.getElementById('chart').clientHeight,
                layout: {
                    textColor: '#d1d4dc',
                    backgroundColor: '#000000',
                },
                grid: {
                    vertLines: {
                        color: 'rgba(42, 46, 57, 0.5)',
                    },
                    horzLines: {
                        color: 'rgba(42, 46, 57, 0.5)',
                    },
                },
            });

            const colors = {
                'Inscripción': { topColor: 'rgba(75, 192, 192, 0.4)', bottomColor: 'rgba(75, 192, 192, 0.1)', lineColor: 'rgb(75, 192, 192)' },
                'Reinscripción': { topColor: 'rgba(192, 75, 75, 0.4)', bottomColor: 'rgba(192, 75, 75, 0.1)', lineColor: 'rgb(192, 75, 75)' },
                'Certificado': { topColor: 'rgba(75, 75, 192, 0.4)', bottomColor: 'rgba(75, 75, 192, 0.1)', lineColor: 'rgb(75, 75, 192)' }
            };

            // Agrega una serie para cada tipo de trámite
            Object.keys(seriesData).forEach(tipo => {
                const areaSeries = chart.addAreaSeries({
                    topColor: colors[tipo] ? colors[tipo].topColor : 'rgba(0, 0, 0, 0.4)',
                    bottomColor: colors[tipo] ? colors[tipo].bottomColor : 'rgba(0, 0, 0, 0.1)',
                    lineColor: colors[tipo] ? colors[tipo].lineColor : 'rgb(0, 0, 0)',
                    lineWidth: 2
                });
                areaSeries.setData(seriesData[tipo]);
            });

            // Configura el formateador del eje X para incluir la hora sin los segundos


            chart.timeScale().applyOptions({
                timeVisible: true,
                secondsVisible: false,
                tickMarkFormatter: (timestamp, tickMarkType, locale) => {
                    const date = new Date(timestamp * 1000);
                    const options = { day: '2-digit', month: 'short', year: 'numeric', hour: '2-digit', minute: '2-digit' };
                    return new Intl.DateTimeFormat('es-ES', options).format(date);
                },
            });

        })
        .catch(error => {
            console.error('Error al obtener los datos:', error);
        });
</script>
</body>
</html>





