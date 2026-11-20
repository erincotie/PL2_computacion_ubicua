
/*NAVEGACIÓN DEL MENÚ LATERAL*/
/*Seleccionamos todos los enlaces del menú*/
const enlacesMenu = document.querySelectorAll(
    ".menu-lateral nav a"
);

/*Seleccionamos todas las secciones de la página*/
const secciones = document.querySelectorAll(".pagina");


/*Recorremos todos los enlaces del menú*/
enlacesMenu.forEach(function(enlace) {

    /*Detectamos cuándo el usuario pulsa un enlace*/
    enlace.addEventListener("click", function(event) {

        /*Evitamos que la página salte automáticamente*/
        event.preventDefault();

        /*Obtenemos el nombre de la sección seleccionada*/
        const seccionSeleccionada = enlace.dataset.section;


        /*Ocultamos todas las secciones*/
        secciones.forEach(function(seccion) {
            seccion.hidden = true;
        });

        /*Mostramos únicamente la sección seleccionada*/
        document.getElementById(seccionSeleccionada).hidden = false;

        /*Quitamos la clase activo de todos los enlaces*/
        enlacesMenu.forEach(function(item) {
            item.classList.remove("activo");
        });

        /*Añadimos activo al enlace seleccionado*/
        enlace.classList.add("activo");

    });

});
