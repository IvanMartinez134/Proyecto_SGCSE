document.addEventListener('DOMContentLoaded', function() {
    // Función para llenar el selector de carreras según la división académica seleccionada


    function llenarCarreras(divisionId) {
        var carreraSelect = document.getElementById('carrera');



        carreraSelect.innerHTML = '<option value="" disabled selected>Selecciona una carrera</option>';

        // Realizar solicitud AJAX al servlet para obtener las carreras
        var xhr = new XMLHttpRequest();
        xhr.open('GET', 'ObtenerCarrerasServlet?divisionId=' + encodeURIComponent(divisionId), true);
        xhr.onreadystatechange = function() {
            if (xhr.readyState === XMLHttpRequest.DONE) {
                if (xhr.status === 200) {
                    var carreras = JSON.parse(xhr.responseText);



                    // Llenar el selector de carreras con las opciones recibidas


                    carreras.forEach(function(carrera) {
                        var option = document.createElement('option');
                        option.value = carrera.id;
                        option.textContent = carrera.nombre;
                        carreraSelect.appendChild(option);
                    });
                } else {
                    console.error('Error al obtener las carreras:', xhr.status, xhr.statusText);
                }
            }
        };
        xhr.send();
    }

    // Evento para manejar el cambio en el selector de división académica


    var divisionAcademicaSelect = document.getElementById('divisionAcademica');
    divisionAcademicaSelect.addEventListener('change', function() {
        var divisionSeleccionada = this.value;
        llenarCarreras(divisionSeleccionada);
    });

    // Validaciones en tiempo real



    var correoInput = document.getElementById("correo");
    var contrasenaInput = document.getElementById("contrasena");
    var repetirContrasenaInput = document.getElementById("repetirContrasena");
    var alerta = document.getElementById("alerta");

    correoInput.addEventListener("input", function() {
        if (!correoInput.value.includes("@")) {
            alerta.textContent = "*Ingrese una dirección de correo electrónico válida";
        } else {
            alerta.textContent = "";
        }
    });

    contrasenaInput.addEventListener("input", function() {
        if (contrasenaInput.value.length < 8 || !/[A-Z]/.test(contrasenaInput.value) || !/[a-z]/.test(contrasenaInput.value) || !/[0-9]/.test(contrasenaInput.value) || !/[!@#$%^&*(),.?":{}|<>]/.test(contrasenaInput.value)) {
            alerta.textContent = "Tu contraseña es insegura. Te recordamos que tiene que tener mínimo 8 caracteres, debe contener al menos una letra mayúscula, una letra minúscula, un número y un carácter especial.";
        } else {
            alerta.textContent = "";
        }
    });

    repetirContrasenaInput.addEventListener("input", function() {
        if (contrasenaInput.value !== repetirContrasenaInput.value) {
            alerta.textContent = "*Las contraseñas no coinciden";
        } else {
            alerta.textContent = "";
        }
    });




    var registroForm = document.getElementById("registroForm");
    registroForm.addEventListener("submit", function(event) {
        event.preventDefault();
        alerta.textContent = "";
        alerta.style.color = "red";

        var correo = correoInput.value;
        var contrasena = contrasenaInput.value;
        var repetirContrasena = repetirContrasenaInput.value;

        if (!correo.includes("@")) {
            alerta.textContent = "*Ingrese una dirección de correo electrónico válida";
            return;
        }
        if (contrasena.length < 8 || !/[A-Z]/.test(contrasena) || !/[a-z]/.test(contrasena) || !/[0-9]/.test(contrasena) || !/[!@#$%^&*(),.?":{}|<>]/.test(contrasena)) {
            alerta.textContent = "Tu contraseña es insegura. Te recordamos que tiene que tener mínimo 8 caracteres, debe contener al menos una letra mayúscula, una letra minúscula, un número y un carácter especial.";
            return;
        }
        if (contrasena !== repetirContrasena) {
            alerta.textContent = "*Las contraseñas no coinciden";
            return;
        }

        this.submit();
    });
});



