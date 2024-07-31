

document.addEventListener('DOMContentLoaded', function() {
    const openCloseButton = document.getElementById("open_close");
    const aside = document.getElementById("aside");

    // Initialize aside to be closed on page load
    aside.classList.remove("abrir");


    openCloseButton.addEventListener("click", (e) => {
        aside.classList.toggle("abrir");
        e.stopPropagation();
    });

    // Close aside when clicking outside of it
    document.addEventListener("click", (e) => {
        if (!aside.contains(e.target) && !openCloseButton.contains(e.target)) {
            aside.classList.remove("abrir");
        }
    });
});