

document.addEventListener('DOMContentLoaded', function () {
    const userList = document.getElementById('userList');
    const searchInput = document.getElementById('searchInput');

    // Función para crear una carta de usuario
    function createUserCard(user) {
        const card = document.createElement('div');
        card.classList.add('col-md-4', 'mb-4');

        card.innerHTML = `
            <div class="card h-80">
                <div class="card-header-custom">
                    <input type="text" class="header-input" value="${user.name} (${user.role})" readonly>
                </div>
                <div class="card-body-custom">
                    <div class="flex items-center justify-between">
                        <div>
                            <p class="text-gray-600 dark:text-gray-400">Correo: ${user.email}</p>
                            <p class="text-gray-600 dark:text-gray-400">Teléfono: ${user.phone}</p>
                            <p class="text-gray-600 dark:text-gray-400">Matrícula: ${user.studentId}</p>
                            <p class="text-gray-600 dark:text-gray-400">División Académica: ${user.division}</p>
                            <p class="text-gray-600 dark:text-gray-400">Carrera: ${user.career}</p>
                        </div>
                        <span class="turno-indicador">Turno: ${user.shift}</span>
                    </div>
                </div>
                <div class="card-footer-custom">
                    <button class="btn-icon">
                        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="none"
                            stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                            <path d="M3 6h18"></path>
                            <path d="M19 6v14c0 1-1 2-2 2H7c-1 0-2-1-2-2V6"></path>
                            <path d="M8 6V4c0-1 1-2 2-2h4c1 0 2 1 2 2v2"></path>
                        </svg>
                    </button>
                    <button class="btn-icon">
                        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="none"
                            stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                            <path d="M12 22h6a2 2 0 0 0 2-2V7l-5-5H6a2 2 0 0 0-2 2v10"></path>
                            <path d="M14 2v4a2 2 0 0 0 2 2h4"></path>
                            <path d="M10.4 12.6a2 2 0 1 1 3 3L8 21l-4 1 1-4Z"></path>
                        </svg>
                    </button>
                </div>
            </div>
        `;
        return card;
    }


    const users = [
        { role: 'Usuario', name: 'Jonathan Ocampo', email: 'john@example.com', phone: '7771234567', shift: 'Matutino', studentId: '123456', division: 'DATID', career: 'DSM' },
        { role: 'Administrativo', name: 'Jonathan Ocampo', email: 'jony@example.com', phone: '7777654321', shift: 'Vespertino', studentId: '654321', division: 'DATEFI', career: 'Terapia' },
        { role: 'Usuario', name: 'Ximena Pulido', email: 'pulido@example.com', phone: '7779876543', shift: 'Matituno', studentId: '987654', division: 'DATID', career: 'Diseño grafico' },
        { role: 'Usuario', name: 'Ivan Martinez', email: 'ivan@example.com', phone: '7771234567', shift: 'Matutino', studentId: '123456', division: 'DATID', career: 'DSM' },
        { role: 'Administrativo', name: 'Ivan Martinez', email: 'ivam@example.com', phone: '7777654321', shift: 'Vespertino', studentId: '654321', division: 'DATEFI', career: 'Terapia' },
        { role: 'Usuario', name: 'Ximena Pulido', email: 'pul@example.com', phone: '7779876543', shift: 'Matituno', studentId: '987654', division: 'DATID', career: 'Diseño grafico' },


    ];

    function showAllUsers() {
        userList.innerHTML = '';
        users.forEach(user => {
            const card = createUserCard(user);
            userList.appendChild(card);
        });
    }


    showAllUsers();

    searchInput.addEventListener('input', function () {
        const searchTerm = searchInput.value.trim().toLowerCase();

        userList.innerHTML = '';
        users.forEach(user => {
            if (user.name.toLowerCase().includes(searchTerm) ||
                user.email.toLowerCase().includes(searchTerm) ||
                user.phone.includes(searchTerm) ||
                user.studentId.includes(searchTerm) ||
                user.division.toLowerCase().includes(searchTerm) ||
                user.career.toLowerCase().includes(searchTerm)) {
                const card = createUserCard(user);
                userList.appendChild(card);
            }
        });
    });
});

