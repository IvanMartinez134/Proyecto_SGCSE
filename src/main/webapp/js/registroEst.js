document.addEventListener('DOMContentLoaded', function() {
    var correoInput = document.getElementById("correo");
    var contrasenaInput = document.getElementById("contrasena");
    var repetirContrasenaInput = document.getElementById("repetirContrasena");
    var alerta = document.getElementById("alerta");

    correoInput.addEventListener("input", function() {
        if (!correoInput.value.includes("@utez.edu.mx")) {
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

        if (!correo.includes("@utez.edu.mx")) {
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

        return;
    });
});
