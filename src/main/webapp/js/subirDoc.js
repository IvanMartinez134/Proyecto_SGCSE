
let timeLeft = 200; // en segundos
const timerElement = document.getElementById('timer');

function updateTimer() {

    const minutes = Math.floor(timeLeft / 60);
    const seconds = timeLeft % 60;
    timerElement.textContent = `${minutes}:${seconds < 10 ? '0' : ''}${seconds}`;
    if (timeLeft <= 0) {
        clearInterval(timerInterval);
        window.location.href = 'pageEst.jsp';
        window.location.href = 'borrarCita';
    }
    timeLeft--;
}

const timerInterval = setInterval(updateTimer, 1000);



const dragDropArea = document.getElementById('drag-drop-area');
const fileList = document.getElementById('file-list');
const fileInput = document.getElementById('file-input');


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

// los archivos seleccionados

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





