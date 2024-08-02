document.getElementById("registroForm").addEventListener("submit", function(event) {

    const alerta = document.getElementById("alerta");
    alerta.textContent = "";
    alerta.style.color = "red";

    const correo = document.getElementById("correo").value;
    const contrasena = document.getElementById("contrasena").value;
    const repetirContrasena = document.getElementById("repetirContrasena").value;

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

});

// Validaciones en tiempo real
const correoInput = document.getElementById("correo");
const contrasenaInput = document.getElementById("contrasena");
const repetirContrasenaInput = document.getElementById("repetirContrasena");

correoInput.addEventListener("input", function() {
    const alerta = document.getElementById("alerta");
    if (!correoInput.value.includes("@utez.edu.mx")) {
        alerta.textContent = "*Ingrese una dirección de correo electrónico válida";
    } else {
        alerta.textContent = "";
    }
});

contrasenaInput.addEventListener("input", function() {
    const alerta = document.getElementById("alerta");
    if (contrasenaInput.value.length < 8 || !/[A-Z]/.test(contrasenaInput.value) || !/[a-z]/.test(contrasenaInput.value) || !/[0-9]/.test(contrasenaInput.value) || !/[!@#$%^&*(),.?":{}|<>]/.test(contrasenaInput.value)) {
        alerta.textContent = "Tu contraseña es insegura. Te recordamos que tiene que tener mínimo 8 caracteres, debe contener al menos una letra mayúscula, una letra minúscula, un número y un carácter especial.";
    } else {
        alerta.textContent = "";
    }
});

repetirContrasenaInput.addEventListener("input", function() {
    const alerta = document.getElementById("alerta");
    if (contrasenaInput.value !== repetirContrasenaInput.value) {
        alerta.textContent = "*Las contraseñas no coinciden";
    } else {
        alerta.textContent = "";
    }
});
