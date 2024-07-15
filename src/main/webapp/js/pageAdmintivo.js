document.addEventListener('DOMContentLoaded', function() {
    // Obtener todos los enlaces que deben abrir el modal
    const openModalLinks = document.querySelectorAll('.open-password-modal');


    openModalLinks.forEach(link => {
        link.addEventListener('click', function(e) {
            e.preventDefault();

            // Mostrar el modal
            const modal = document.querySelector('.modal');
            modal.classList.add('modal--show');
        });
    });


    const closeModal = document.querySelector('.modal-close');

    // Agregar un evento de clic para cerrar el modal
    closeModal.addEventListener('click', function(e) {
        e.preventDefault();

        // Ocultar el modal
        const modal = document.querySelector('.modal');
        modal.classList.remove('modal--show');
    });
});



function togglePassword() {
    const passwordField = document.getElementById('inputPassword');
    const passwordFieldType = passwordField.getAttribute('type');
    const newType = passwordFieldType === 'password' ? 'text' : 'password';
    passwordField.setAttribute('type', newType);
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



const $openClose = document.getElementById("open_close");
const $aside = document.getElementById("aside");

$openClose.addEventListener("click", () => {
    $aside.classList.toggle("abrir");
});




