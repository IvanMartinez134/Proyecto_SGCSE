document.getElementById("loginForm").addEventListener("submit", function(event) {
    // event.preventDefault(); esto se quito para que funcionara el script
    const alerta = document.getElementById("alerta");
    alerta.textContent = "";
    alerta.style.color = "red";

    const correo = document.getElementById("email").value;
    const contrasena = document.getElementById("pwd").value;

    if (!correo.includes("@utez.edu.mx")) {
        alerta.textContent = "*Ingrese una dirección de correo electrónico válida";
        return;
    }
    if (contrasena.length < 8 || !/[A-Z]/.test(contrasena) || !/[a-z]/.test(contrasena) || !/[0-9]/.test(contrasena) || !/[!@#$%^&*(),.?":{}|<>]/.test(contrasena)) {
        alerta.textContent = "Tu contraseña es insegura. Te recordamos que tiene que tener mínimo 8 caracteres, debe contener al menos una letra mayúscula, una letra minúscula, un número y un carácter especial.";
        return;
    }

});


// Validaciones en tiempo real
const correoInput = document.getElementById("email");
const contrasenaInput = document.getElementById("pwd");


correoInput.addEventListener("input", function() {
    const alerta = document.getElementById("alerta");
    if (!correoInput.value.includes("@utez.edu.mx")) {
        alerta.textContent = "Ingrese una dirección de correo electrónico válida";
    } else {
        alerta.textContent = "";
    }
});

contrasenaInput.addEventListener("input", function() {
    const alerta = document.getElementById("alerta");
    if (contrasenaInput.value.length < 8 || !/[A-Z]/.test(contrasenaInput.value) || !/[a-z]/.test(contrasenaInput.value) || !/[0-9]/.test(contrasenaInput.value) || !/[!@#$%^&*(),.?":{}|<>]/.test(contrasenaInput.value)) {
        alerta.textContent = "Tu contraseña es insegura. Te recordamos que tiene que tener mínimo 8 caracteres";
    } else {
        alerta.textContent = "";
    }
});



function togglePassword() {
    var passwordInput = document.getElementById('pwd');
    var passwordIcon = document.querySelector('.toggle-password img');

    if (passwordInput.type === 'password') {
        passwordInput.type = 'text';
        passwordIcon.src = 'img/eye-block.svg'; // Cambia el ícono
    } else {
        passwordInput.type = 'password';
        passwordIcon.src = 'img/eye.svg';
    }
}



