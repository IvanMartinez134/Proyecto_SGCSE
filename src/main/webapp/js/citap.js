



let sugerencia = [ "Bryan", "Emiliano" ,"Pulido", "Ivan"];


const buscador = document.querySelector(".buscador");
const inputB = buscador.querySelector("input");
const lista = buscador.querySelector(".items");

inputB.onkeyup = (e) =>{
    let userData = e.target.value;
    let vArray = [];

    if(userData){
        vArray = sugerencia.filter((data) =>{
            return data.toLocaleLowerCase().startsWith(userData.toLocaleLowerCase());

        });
        vArray = vArray.map((data)=>{
            return data = '<li>'+ data +'</li>';
        });

        console.log(vArray);
        buscador.classList.add("active");
        mostrarLista(vArray);
        let allList = lista.querySelectorAll("li");
        for (let i = 0; i < allList.length; i++) {
            allList[i].setAttribute("onclick", "select(this)");
        }
    }else{
        buscador.classList.remove("active");
    }

}


function select(element){
    let selectUser = element.textContent;
    inputB.value = selectUser;
}


function mostrarLista(list){
    let listDatos;
    if(!list.length){
        userValue = inputB.value;
        listDatos = '<li>'+ userValue +'</li>';

    }else{
        listDatos = list.join('');
    }

    lista.innerHTML = listDatos
}

const $openClose = document.getElementById("open_close"),
    $aside = document.getElementById("aside");

$openClose.addEventListener("click", () => {
    $aside.classList.toggle("abrir")
});

