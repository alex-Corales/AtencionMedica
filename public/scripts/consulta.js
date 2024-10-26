let contadorConsulta = 0;

function agregarFila() {
    const descripcion = document.getElementById('inputDescripcion').value;
    const estado = document.getElementById('selectEstado').value;

    if (!descripcion || !estado) {
        alert("Por favor, complete la descripción y seleccione un estado.");
        return;
    }

    contadorConsulta++;

    const fila = document.createElement('tr');
    const columnaNumero = document.createElement('td');
    columnaNumero.textContent = contadorConsulta;
    
    const columnaDescripcion = document.createElement('td');
    columnaDescripcion.textContent = descripcion;
    
    const columnaEstadoTipo = document.createElement('td');
    columnaEstadoTipo.textContent = estado;

    fila.appendChild(columnaNumero);
    fila.appendChild(columnaDescripcion);
    fila.appendChild(columnaEstadoTipo);

    document.getElementById('tablaDiagnosticos').querySelector('tbody').appendChild(fila);

    // Limpiar los campos después de agregar
    document.getElementById('inputDescripcion').value = '';
    document.getElementById('selectEstado').value = '';
}
