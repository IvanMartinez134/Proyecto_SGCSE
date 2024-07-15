document.getElementById("registroForm").addEventListener("submit", function(event) {
    event.preventDefault();
    const alerta = document.getElementById("alerta");
    alerta.textContent = "";
    alerta.style.color = "red";

    const contrasena = document.getElementById("contrasena").value;
    const repetirContrasena = document.getElementById("repetirContrasena").value;

    if (contrasena.length < 8 || !/[A-Z]/.test(contrasena) || !/[a-z]/.test(contrasena) || !/[0-9]/.test(contrasena) || !/[!@#$%^&*(),.?":{}|<>]/.test(contrasena)) {
        alerta.textContent = "Tu contraseña es insegura. Te recordamos que tiene que tener mínimo 8 caracteres, debe contener al menos una letra mayúscula, una letra minúscula, un número y un carácter especial.";
        return;
    }
    if (contrasena !== repetirContrasena) {
        alerta.textContent = "*Las contraseñas no coinciden";
        return;
    }


    const modal = document.querySelector('.modal');
    modal.classList.add('modal--show');

    // Cierra el modal automáticamente después de 2 segundos
    setTimeout(() => {
        modal.classList.remove('modal--show');
    }, 3000);
});

const closeModal = document.querySelector('.modal_close');
closeModal.addEventListener('click', (e) => {
    e.preventDefault();
    const modal = document.querySelector('.modal');
    modal.classList.remove('modal--show');
});

// Validaciones en tiempo real
const contrasenaInput = document.getElementById("contrasena");
const repetirContrasenaInput = document.getElementById("repetirContrasena");


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
