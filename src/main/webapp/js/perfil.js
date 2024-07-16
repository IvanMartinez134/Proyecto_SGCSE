

document.addEventListener('DOMContentLoaded', function() {
    const openCloseButton = document.getElementById("open_close");
    const aside = document.getElementById("aside");


    aside.classList.remove("abrir");

    openCloseButton.addEventListener("click", (e) => {
        aside.classList.toggle("abrir");
        e.stopPropagation();
    });

    document.addEventListener("click", (e) => {
        if (!aside.contains(e.target) && !openCloseButton.contains(e.target)) {
            aside.classList.remove("abrir");
        }
    });
});