
document.addEventListener('DOMContentLoaded', function() {
    // Obtener todos los enlaces que deben abrir el modal
    const openModalLinks = document.querySelectorAll('.open-password-modal');

    // Agregar un evento de clic a cada enlace para mostrar el modal
    openModalLinks.forEach(link => {
        link.addEventListener('click', function(e) {
            e.preventDefault(); // Prevenir el comportamiento predeterminado del enlace

            // Mostrar el modal
            const modal = document.querySelector('.modal');
            modal.classList.add('modal--show');
        });
    });

    // Obtener el botón de cerrar dentro del modal
    const closeModal = document.querySelector('.modal-close');

    // Agregar un evento de clic para cerrar el modal
    closeModal.addEventListener('click', function(e) {
        e.preventDefault(); // Prevenir el comportamiento predeterminado del enlace

        // Ocultar el modal
        const modal = document.querySelector('.modal');
        modal.classList.remove('modal--show');
    });
});


function togglePassword() {
    const passwordInput = document.getElementById('inputPassword');
    const togglePasswordIcon = document.getElementById('togglePasswordIcon');

    if (passwordInput.type === 'password') {
        passwordInput.type = 'text';
        togglePasswordIcon.classList.remove('bi-eye');
        togglePasswordIcon.classList.add('bi-eye-slash');
    } else {
        passwordInput.type = 'password';
        togglePasswordIcon.classList.remove('bi-eye-slash');
        togglePasswordIcon.classList.add('bi-eye');
    }
}



document.addEventListener('click', function (event) {
    var target = event.target;
    if (!target.closest('#user-profile-link') && !target.closest('.user-profile-card')) {
        var userProfileCard = document.getElementById('user-profile');
        if (userProfileCard.classList.contains('show')) {
            userProfileCard.classList.remove('show');
        }
    }
});


const $openClose = document.getElementById("open_close"),
    $aside = document.getElementById("aside");

$openClose.addEventListener("click", () => {
    $aside.classList.toggle("abrir")
});




