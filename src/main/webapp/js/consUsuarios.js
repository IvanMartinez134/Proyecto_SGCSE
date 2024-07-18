let dataTable;
let dataTableinitl = false;

const dataTableOptions = {
    //scrollX:"2000px",

    lengthMenu: [10, 25, 40, 55, 100, 200],

    columnDefs:[
        { className: "centered", targets:[0,1,2,3,4,5,6] },
        { orderable: false, targets: [5, 6] },
        { width: "10%" , targets: [0] },
        { searchable: false, targets: [3]},

    ],
    pageLength: 3,
    destroy: true,
    language: {
        "sProcessing":    "Procesando...",
        "sLengthMenu":    "Mostrar _MENU_ registros",
        "sZeroRecords":   "No se encontraron resultados",
        "sEmptyTable":    "Ningún dato disponible en esta tabla",
        "sInfo":          "Mostrando registros del _START_ al _END_ de un total de _TOTAL_ registros",
        "sInfoEmpty":     "Mostrando registros del 0 al 0 de un total de 0 registros",
        "sInfoFiltered":  "(filtrado de un total de _MAX_ registros)",
        "sInfoPostFix":   "",
        "sSearch":        "Buscar:",
        "searchPlaceholder": "Ingresa nombre del alumno",
        "sUrl":           "",
        "sInfoThousands":  ",",
        "sLoadingRecords": "Cargando...",
        "oPaginate": {
            "sFirst":    "Primero",
            "sLast":    "Último",
            "sNext":    "Siguiente",
            "sPrevious": "Anterior"
        },
        "oAria": {
            "sSortAscending":  ": Activar para ordenar la columna de manera ascendente",
            "sSortDescending": ": Activar para ordenar la columna de manera descendente"
        }
    }
}


const initData=async()=>{
    if (dataTableinitl){
        dataTable.destroy();
    }

    await listUsers();


    dataTable =$("#table_users").DataTable(dataTableOptions);

    dataTableinitl = true;
};


const listUsers = async()=>{
    try{
        const response = await fetch("https://jsonplaceholder.typicode.com/users");
        const users = await response.json();
        let content = ``;

        users.forEach((user, index) =>{



            content+= `
            <tr>
                <td>${index + 1}</td>
                <td>${user.name }</td>
                <td>${user.email }</td>
                <td>${user.address.city }</td>
                <td>${user.company.name }</td>
                <td><i class="fa-solid fa-user-check" style="color: green;"></i></td>
                <td>
                    <a href="registroUser.html">
                    <button class="btn btn-sm btn-primary"><i class="fa-solid fa-file-pen"></i></button>
                    </a>
                    <button class="btn btn-sm btn-danger"><i class="fa-solid fa-trash"></i></button>
                </td>

            </tr>`;



        });
        tableBody_users.innerHTML = content;


    }catch(ex){
        alert(ex);
    }
};

window.addEventListener("load", async () =>{
    await initData();

});

const $openClose = document.getElementById("open_close"),
    $aside = document.getElementById("aside");

$openClose.addEventListener("click", () => {
    $aside.classList.toggle("abrir")
});
