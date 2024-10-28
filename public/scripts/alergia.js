function agregarFilaAlergia() {
    const nombreAlergia = document.getElementById('inputNombreAlergia').value;
    const fechaAlergia = document.getElementById('fechaAlergia').value;
    const importanciaAlergia = document.getElementById('selectImportancia').value;

    console.log(nombreAlergia, fechaAlergia, importanciaAlergia);

    if (!nombreAlergia || !fechaAlergia || !importanciaAlergia) {
        alert('Tiene que llenar todos los campos');
        return;
    }

    const fila = document.createElement('tr');  // Cambiado a 'tr'

    const columnaNombreAlergia = document.createElement('td');
    columnaNombreAlergia.textContent = nombreAlergia;

    const columnaFechaAlergia = document.createElement('td');
    columnaFechaAlergia.textContent = fechaAlergia;

    const columnaImportanciaAlergia = document.createElement('td');
    columnaImportanciaAlergia.textContent = importanciaAlergia;

    fila.appendChild(columnaNombreAlergia);
    fila.appendChild(columnaFechaAlergia);
    fila.appendChild(columnaImportanciaAlergia);

    document.getElementById('tablaAlergias').querySelector('tbody').appendChild(fila); 

    document.getElementById('inputNombreAlergia').value = '';
    document.getElementById('fechaAlergia').value = '';
    document.getElementById('selectImportancia').value = '';
}
