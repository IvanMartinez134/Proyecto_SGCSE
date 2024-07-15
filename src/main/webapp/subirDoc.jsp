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



    <style>
        .container {
            margin-top: 50px;
        }

        .documentacion {
            background-color: #0d4ea2b9;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            margin-bottom: 30px;
            margin-top: 110px;
            color: #fff;
        }

        h2 {
            margin-bottom: 20px;
        }

        p {
            margin-bottom: 10px;
        }

        .drag-drop {
            border: 2px dashed #ccc;
            padding: 20px;
            border-radius: 10px;
            text-align: center;
            cursor: pointer;
            height: 160px;
        }

        .drag-drop:hover {
            background-color: #f0f0f0b5;
        }

        #file-input {
            display: none;
        }

        .file-list {
            list-style: none;
            padding: 0;
        }

        .file-list li {
            margin-bottom: 10px;
        }

        .documentacion{
            box-shadow: 0px 4px 20px rgba(0, 0, 0, 0.387);

        }


    </style>
</head>



<body>

<nav class="navbar fixed-top navbar-light bg-success">
    <div class="container-fluid">
        <!-- Agregamos el botón del menú hamburguesa -->
        <button class="navbar-toggler bg-white" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav"
                aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <!-- Aquí ponemos el título de la página centrado -->
        <a class="navbar-brand text-center text-white mx-auto" href="#">Agendar cita</a>
        <!-- Ahora vamos a agregar el menú -->
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav ms-auto">

                <!-- Agregamos el elemento de lista para "Cerrar Sesión" -->
                <li class="nav-item">
                    <a class="nav-link" href="#">Cerrar Sesión</a>
                </li>

            </ul>
        </div>
    </div>
</nav>




<div class="container col-lg-8">
    <div class="documentacion">
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

    <div class="drag-drop" id="drag-drop-area">
        <p>Arrastra y suelta tus archivos aquí o haz clic para seleccionar archivos.</p>
        <input type="file" id="file-input" multiple>
        <ul class="file-list" id="file-list">
            <!-- Aquí se mostrarán los archivos seleccionados -->
        </ul>
    </div>
</div>

<!-- Script de Bootstrap -->
<script src="bootstrap-5.2.3-dist/js/bootstrap.bundle.min.js"></script>
<script>
    const dragDropArea = document.getElementById('drag-drop-area');
    const fileList = document.getElementById('file-list');
    const fileInput = document.getElementById('file-input');

    // Evita que el navegador abra el archivo cuando se suelta en el área de arrastrar y soltar
    dragDropArea.addEventListener('dragover', (e) => {
        e.preventDefault();
        dragDropArea.classList.add('active');
    });

    dragDropArea.addEventListener('dragleave', () => {
        dragDropArea.classList.remove('active');
    });

    dragDropArea.addEventListener('drop', (e) => {
        e.preventDefault();
        dragDropArea.classList.remove('active');
        const files = e.dataTransfer.files;
        handleFiles(files);
    });

    // Abre el cuadro de diálogo de archivos al hacer clic en el área de arrastrar y soltar
    dragDropArea.addEventListener('click', () => {
        fileInput.click();
    });

    // Maneja los archivos seleccionados
    fileInput.addEventListener('change', () => {
        const files = fileInput.files;
        handleFiles(files);
    });

    // Muestra los archivos seleccionados
    function handleFiles(files) {
        fileList.innerHTML = '';
        for (const file of files) {
            const listItem = document.createElement('li');
            listItem.textContent = file.name;
            fileList.appendChild(listItem);
        }
    }
</script>
</body>

</html>

