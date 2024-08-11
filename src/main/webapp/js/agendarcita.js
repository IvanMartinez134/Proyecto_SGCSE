
const $openClose = document.getElementById("open_close"),
    $aside = document.getElementById("aside");

$openClose.addEventListener("click", () => {
    $aside.classList.toggle("abrir")
});