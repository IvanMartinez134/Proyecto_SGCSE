$(document).ready(function() {
    $('#table_users').DataTable({
        lengthMenu: [10, 25, 40, 55, 100, 200],
        columnDefs: [
            { className: "centered", targets: [0, 1, 2, 3, 4, 5, 6] }, // Aplica la clase a todas las columnas
            { orderable: false, targets: [5] }// Desactiva el ordenamiento solo para la columna de acciones
            // Ajusta el ancho solo para la columna ID
             // Desactiva la búsqueda en la columna Email
        ],
        pageLength: 3,
        destroy: true,
        language: {
            "sProcessing": "Procesando...",
            "sLengthMenu": "Mostrar _MENU_ registros",
            "sZeroRecords": "No se encontraron resultados",
            "sEmptyTable": "Ningún dato disponible en esta tabla",
            "sInfo": "Mostrando registros del _START_ al _END_ de un total de _TOTAL_ registros",
            "sInfoEmpty": "Mostrando registros del 0 al 0 de un total de 0 registros",
            "sInfoFiltered": "(filtrado de un total de _MAX_ registros)",
            "sSearch": "Buscar:",
            "searchPlaceholder": "Ingresa nombre del alumno",
            "sLoadingRecords": "Cargando...",
            "oPaginate": {
                "sFirst": "Primero",
                "sLast": "Último",
                "sNext": "Siguiente",
                "sPrevious": "Anterior"
            },
            "oAria": {
                "sSortAscending": ": Activar para ordenar la columna de manera ascendente",
                "sSortDescending": ": Activar para ordenar la columna de manera descendente"
            }
        }
    });
});






const $openClose = document.getElementById("open_close"),
    $aside = document.getElementById("aside");

$openClose.addEventListener("click", () => {
    $aside.classList.toggle("abrir")
});
