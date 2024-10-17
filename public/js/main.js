// Función para obtener la fecha actual en formato YYYY-MM-DD
function setTodayDate() {
    const today = new Date();
    const day = String(today.getDate()).padStart(2, '0');
    const month = String(today.getMonth() + 1).padStart(2, '0'); // Enero es 0
    const year = today.getFullYear();

    const todayDate = `${year}-${month}-${day}`;
    
    // Establecer el valor del input de tipo date con la fecha de hoy
    document.getElementById('fecha').value = todayDate;
}

// Ejecutar la función al cargar la página
window.onload = setTodayDate;
