



document.addEventListener('DOMContentLoaded', function() {
    // Menú de navegación
    const openCloseButton = document.getElementById("open_close");
    const aside = document.getElementById("aside");

    // Inicializar el aside cerrado al cargar la página
    aside.classList.remove("abrir");

    openCloseButton.addEventListener("click", (e) => {
        aside.classList.toggle("abrir");
        e.stopPropagation(); // Evitar que el evento se propague al documento
    });

    // Cerrar el aside al hacer clic fuera de él
    document.addEventListener("click", (e) => {
        if (!aside.contains(e.target) && !openCloseButton.contains(e.target)) {
            aside.classList.remove("abrir");
        }
    });

const dragDropArea = document.getElementById('drag-drop-area');
const fileList = document.getElementById('file-list');
const fileInput = document.getElementById('file-input');

// Evita que el navegador abra el archivo cuando se suelta en el área de arrastrar y soltar
dragDropArea.addEventListener('dragover', (e) => {
    e.preventDefault();
    dragDropArea.classList.add('active');
});

dragDropArea.addEventListener('dragleave', () => {
    dragDropArea.classList.remove('active');
});

dragDropArea.addEventListener('drop', (e) => {
    e.preventDefault();
    dragDropArea.classList.remove('active');
    const files = e.dataTransfer.files;
    handleFiles(files);
});


dragDropArea.addEventListener('click', () => {
    fileInput.click();
});

// Maneja los archivos seleccionados
fileInput.addEventListener('change', () => {
    const files = fileInput.files;
    handleFiles(files);
});


function handleFiles(files) {
    fileList.innerHTML = '';
    for (const file of files) {
        const listItem = document.createElement('li');
        listItem.textContent = file.name;
        fileList.appendChild(listItem);
    }
}




});
