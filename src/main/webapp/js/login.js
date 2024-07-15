document.getElementById('loginForm').addEventListener('submit', function(event) {
    event.preventDefault(); // Previene el envío del formulario

    var password = document.getElementById('password').value;
    var errorMessage = document.getElementById('error-message');

    if (password.length < 8) {
        errorMessage.textContent = 'La contraseña debe tener al menos 8 caracteres.';
    } else {
        errorMessage.textContent = '';
        alert('Formulario enviado');

    }
});


function togglePassword() {
    var passwordInput = document.getElementById('inputPassword');
    var passwordIcon = document.querySelector('.toggle-password img');

    if (passwordInput.type === 'password') {
        passwordInput.type = 'text';
        passwordIcon.src = 'img/eye-block.svg'; // Cambia el ícono
    } else {
        passwordInput.type = 'password';
        passwordIcon.src = 'img/eye.svg'; // Cambia el ícono de vuelta
    }
}
