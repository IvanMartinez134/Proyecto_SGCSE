document.getElementById('loginForm').addEventListener('submit', function(event) {
    event.preventDefault();

    var password = document.getElementById('password').value;
    var errorMessage = document.getElementById('error-message');

    if (password.length < 8) {
        errorMessage.textContent = 'La contraseña debe tener al menos 8 caracteres.';
    } else {
        errorMessage.textContent = '';
        alert('Formulario enviado');

    }
});

