let alergias = [];

function agregarFilaAlergia() {
    // Obtiene el elemento select y el valor seleccionado
    const selectNombreAlergia = document.getElementById('selectNombreAlergia');
    const nombreCodigoAlergia = selectNombreAlergia.value;
    const fechaAlergia = document.getElementById('fechaAlergia').value;
    const importanciaAlergia = document.getElementById('selectImportancia').value;

    if (!nombreCodigoAlergia || !fechaAlergia || !importanciaAlergia) {
        alert('Tiene que llenar todos los campos');
        return;
    }

    const fila = document.createElement('tr'); 

    const columnaNombreAlergia = document.createElement('td');
    columnaNombreAlergia.textContent = nombreCodigoAlergia;

    const columnaFechaAlergia = document.createElement('td');
    columnaFechaAlergia.textContent = fechaAlergia;

    const columnaImportanciaAlergia = document.createElement('td');
    columnaImportanciaAlergia.textContent = importanciaAlergia;

    const columnaAcciones = document.createElement('td');

    // Crear botón de Editar
    const btnEditar = document.createElement('button');
    btnEditar.textContent = 'Editar';
    btnEditar.classList.add('btn', 'btn-warning', 'btn-sm', 'me-2');
    btnEditar.onclick = () => editarFila(fila, index);

    // Crear botón de Eliminar
    const btnEliminar = document.createElement('button');
    btnEliminar.textContent = 'Eliminar';
    btnEliminar.classList.add('btn', 'btn-danger', 'btn-sm');
    btnEliminar.onclick = () => eliminarAlergia(fila, index);

    columnaAcciones.appendChild(btnEditar);
    columnaAcciones.appendChild(btnEliminar);

    fila.appendChild(columnaNombreAlergia);
    fila.appendChild(columnaFechaAlergia);
    fila.appendChild(columnaImportanciaAlergia);
    fila.appendChild(columnaAcciones);

    // Ajuste: Usar 'nombreAlergia' en lugar de 'nombreCodigoAlergia'
    const index = alergias.push({ nombreAlergia: nombreCodigoAlergia, fechaAlergia, importanciaAlergia }) - 1;
    document.getElementById('tablaAlergias').querySelector('tbody').appendChild(fila); 

    // Restablecer los campos del formulario
    document.getElementById('selectNombreAlergia').value = '';
    document.getElementById('fechaAlergia').value = '';
    document.getElementById('selectImportancia').value = '';
}
