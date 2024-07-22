document.getElementById("registroForm").addEventListener("submit", function(event) {
    //event.preventDefault();
    const alerta = document.getElementById("alerta");
    alerta.textContent = "";
    alerta.style.color = "red";

    const correo = document.getElementById("correo").value;


    if (!correo.includes("@utez.edu.mx")) {
        alerta.textContent = "*Ingrese una dirección de correo electrónico válida";
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
    //e.preventDefault();
    const modal = document.querySelector('.modal');
    modal.classList.remove('modal--show');
});

// Validaciones en tiempo real
const correoInput = document.getElementById("correo");


correoInput.addEventListener("input", function() {
    const alerta = document.getElementById("alerta");
    if (!correoInput.value.includes("@utez.edu.mx")) {
        alerta.textContent = "*Ingrese una dirección de correo electrónico válida";
    } else {
        alerta.textContent = "";
    }
});


